prompt --application/pages/page_00172
begin
--   Manifest
--     PAGE: 00172
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
 p_id=>172
,p_name=>'Internal Messages'
,p_alias=>'INTERNAL-MESSAGES'
,p_step_title=>'Internal Messages'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.util.getTopApex().jQuery(".ui-dialog-content").dialog("option", "title", "&P30_TITLE.");',
'',
'function checkanduncheck(a, b) {',
'    var isChecked = document.getElementById("checkbox_" + a).checked;',
'    var checkflag;',
'    if (isChecked) { checkflag = ''Y''; } else { checkflag = ''N''; };',
'    apex.server.process(',
'        "CHECKANDUNCHECK",     //To call the ajax process name here',
'        {',
'            x01: a,',
'            x02: checkflag // Pass the input field value as a parameter',
'        },',
'        {',
'            dataType: ''text'',',
'            success: function (data) {',
'                if (data.trim() !== ''success'') {',
'                    apex.message.showErrors([{ type: "error", location: "page", message: data.replace(''sqlerrm:ORA-20999: '', ''''), unsafe: false }]);',
'                    document.getElementById("checkbox_" + a).checked = false;',
'                    overallcheck();',
'                } else {',
'                    console.log(''success'', data);',
'                    overallcheck();',
'                }',
'            }',
'        }',
'',
'    );',
'};',
'',
'',
'function selectall() {',
'    var isChecked = document.getElementById("check_all").checked;',
'    if (isChecked) {',
'        apex.server.process(',
'            "SELECTALL", // Replace with your AJAX callback name',
'            {},',
'            {',
'                dataType: ''text'',',
'                success: function (data) {',
'                    // Refresh the report region to display the updated data',
'                    console.log(''success'', data); ',
'                    overallcheck();',
'                    apex.region("Internal").refresh();',
'                },  ',
'                error: function (jqXHR, textStatus, errorThrown) {',
'                    console.error(errorThrown, jqXHR, textStatus);',
'                }',
'            }',
'        );',
'    }',
'    else ',
'       {',
'        apex.server.process(',
'            "UNSELECTALL", // Replace with your AJAX callback name',
'            {},',
'            {',
'                dataType: ''text'',',
'                success: function (data) ',
'                {',
'                    // Refresh the report region to display the updated data',
'                    console.log(''success'', data);',
'                    overallcheck();',
'                    apex.region("Internal").refresh();',
'                }',
'            }',
'        );',
'    }',
'};',
'',
'',
'function overallcheck() {',
'    var checkbox = document.getElementById("check_all");',
'    apex.server.process(',
'        "OVERALLCHECK",',
'        {},',
'        {  ',
'            dataType: ''text'',',
'            success: function (data) {',
'                console.log(data);',
'                let flag = data.split("-");',
'                ',
'                output.innerText = (flag[1]).toString();',
'',
'                if (flag[0] == ''Y'' && checkbox != null) {',
'                    checkbox.checked = true;',
'                } else if (flag[0] == ''N'' && checkbox != null) {',
'                    checkbox.checked = false;',
'                } else if (flag[0] == ''NY'' && checkbox != null) {',
'                    checkbox.checked = false;',
'                }',
'            }',
'        }',
'    );',
'}',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*    radio option    */',
'.apex-item-group--rc input+label {',
'    display: inline-block;',
'    margin-top: 15px;',
'    margin-left: 25px;',
'    margin-bottom: 4px;',
'    min-height: var(--a-checkbox-size, 16px);',
'}',
'',
'.apex-item-grid-row .apex-item-option {',
'    /* display: table-cell; */',
'    padding-left: 120px;',
'    /* vertical-align: top; */',
'}',
'',
'/* .t-Body-contentInner {',
'    margin-top: -25px;',
'    max-width: 100%;',
'} */',
'',
'',
'.a-CardView-header {',
'    -ms-flex-order: var(--a-cv-order-header,1);',
'    order: var(--a-cv-order-header,1);',
'    -ms-flex-align: center;',
'    align-items: center;',
'    display: grid;',
'    grid-template-columns: minmax(0,auto) minmax(0,1fr) minmax(0,auto);',
'    grid-template-areas: "icon-top icon-top icon-top icon-top" " icon body badge icon-end" "badge-bottom badge-bottom badge-bottom badge-bottom";',
'    padding-left: var(--a-cv-header-padding-x,16px);',
'    padding-right: var(--a-cv-header-padding-x,16px);',
'    padding-top: var(--a-cv-header-padding-y,16px);',
'    padding-bottom: var(--a-cv-header-padding-y,16px);',
'    background-color: var(--a-cv-header-background-color);',
'    color: var(--a-cv-header-text-color);',
'    /*background-color: #FF6347;*/',
'    background-image: linear-gradient(to top, #1de9b6 0%, #ffd180 100%); ',
'      border-bottom-width: var(--a-cv-header-border-width,1px);',
'    border-bottom-style: solid;',
'    border-bottom-color: var(--a-cv-header-border-color);',
'}',
'',
'#but {',
'    background-color: #26c6da ;;;',
'    color: #ffffff;',
'    width: 240px;',
'    height: 30px;',
'    font-size: 13px;',
'    text-align: left;',
'    /*margin-bottom: 2px;*/',
'    /*margin-left: auto;*/',
'',
'   /* border-radius: 22px;*/',
'}',
'',
'#in {',
'    background-color: #7aa669 ;;;',
'    color: #ffffff;',
'    width: 240px;',
'    height: 30px;',
'    font-size: 13px;',
'    text-align: left;',
'   /* border-radius: 22px;*/',
'}',
'',
'.t-Region-headerItems--title {',
'    flex-grow: 1;',
'    flex-shrink: 0;',
'    flex-basis: auto;',
'    text-align: left;',
'    padding: 0.3rem;',
'    display: flex;',
'    align-items: center;',
'}',
'',
'#co {',
'    background-color: var(--a-palette-info);',
'    color: #ffffff;',
'    width: 240px;',
'    height: 30px;',
'    font-size: 13px;',
'    text-align: left;',
'    /*border-radius: 22px;*/',
'}',
'',
'.a-IRR-table {',
'      border-collapse: collapse;',
'      table-layout: auto;',
'      border-spacing: 0;',
'      white-space: nowrap;',
'      word-wrap: break-word;',
'}',
'/* ',
' .t-fht-thead {',
'    overflow: auto !important;',
' } */',
'',
' #addbtn{',
'        color: blue;',
'        background-color: #ffffff;',
'}',
'',
' #send{',
'        color: blue;',
'        background-color: #ffffff;',
'}',
'',
'#savebtn{',
'                color: green;',
'                background-color: #ffffff;',
'}',
'#cancelbtn{',
'                color: rgb(214, 19, 29);',
'                background-color: #ffffff;',
'}'))
,p_step_template=>wwv_flow_imp.id(5639522199844485987)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6598068682534379895)
,p_plug_name=>'Archive'
,p_static_id=>'archive'
,p_parent_plug_id=>wwv_flow_imp.id(6598068397043379892)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rowid,',
'       IMSRCVR_BU,',
'       IMSRCVR_PLNT,',
'       IMSRCVR_MSG_ID,',
'       IMSRCVR_RCVR_TYPE,',
'       IMSRCVR_RCVR_ID,',
'       (SELECT INTMSE_SENDER_ID',
'          FROM INTERNAL_MESSAGE',
'         WHERE INTMSE_BU     = IMSRCVR_BU',
'           AND INTMSE_MSG_ID = IMSRCVR_MSG_ID ) Sender,',
'       (SELECT INTMSE_SUBJECT',
'          FROM INTERNAL_MESSAGE',
'         WHERE INTMSE_BU = IMSRCVR_BU',
'           AND INTMSE_MSG_ID = IMSRCVR_MSG_ID ) Subject,',
'       (SELECT to_char(INTMSE_SENT_DATE,''DD/MM/YYYY  HH:MI:SS PM'')',
'          FROM INTERNAL_MESSAGE',
'         WHERE INTMSE_BU = IMSRCVR_BU',
'           AND INTMSE_MSG_ID =IMSRCVR_MSG_ID) Send_Date,',
'       IMSRCVR_READ_FLAG,',
'       IMSRCVR_ARCH_FLAG,',
'       IMSRCVR_ACTVTY_FLAG,',
'       IMSRCVR_CRE_BY,',
'       IMSRCVR_CRE_IP_ADDR,',
'       IMSRCVR_CRE_OS_USER,',
'       IMSRCVR_CRE_DATE,',
'       IMSRCVR_UPD_BY,',
'       IMSRCVR_UPD_IP_ADDR,',
'       IMSRCVR_UPD_OS_USER,',
'       IMSRCVR_UPD_DATE,',
'       IMSRCVR_CRE_EMP_ID,',
'       IMSRCVR_UPD_EMP_ID,',
'       ''<span aria-hidden="true" class="fa fa-clipboard-edit" style = "color:green;"></span>'' read_msg',
'  from INT_MSG_RECEIVERS',
' where IMSRCVR_BU = :GLOBAL_BU',
'   and IMSRCVR_RCVR_ID = :GLOBAL_user',
'   and IMSRCVR_ARCH_FLAG =''Y''',
' order by IMSRCVR_MSG_ID desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(6598068789410379896)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_internal_uid=>1118547805625459694
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598069606057379904)
,p_db_column_name=>'IMSRCVR_ACTVTY_FLAG'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Imsrcvr Actvty Flag'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598069462509379903)
,p_db_column_name=>'IMSRCVR_ARCH_FLAG'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Imsrcvr Arch Flag'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598068826353379897)
,p_db_column_name=>'IMSRCVR_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Imsrcvr Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598069668975379905)
,p_db_column_name=>'IMSRCVR_CRE_BY'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Imsrcvr Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598069932928379908)
,p_db_column_name=>'IMSRCVR_CRE_DATE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Imsrcvr Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598070485813379913)
,p_db_column_name=>'IMSRCVR_CRE_EMP_ID'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Imsrcvr Cre Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598069725230379906)
,p_db_column_name=>'IMSRCVR_CRE_IP_ADDR'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Imsrcvr Cre Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598069911150379907)
,p_db_column_name=>'IMSRCVR_CRE_OS_USER'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Imsrcvr Cre Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598069104944379899)
,p_db_column_name=>'IMSRCVR_MSG_ID'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Imsrcvr Msg Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598068924418379898)
,p_db_column_name=>'IMSRCVR_PLNT'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Imsrcvr Plnt'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598069260049379901)
,p_db_column_name=>'IMSRCVR_RCVR_ID'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Imsrcvr Rcvr Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598069200056379900)
,p_db_column_name=>'IMSRCVR_RCVR_TYPE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Imsrcvr Rcvr Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598069318465379902)
,p_db_column_name=>'IMSRCVR_READ_FLAG'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Imsrcvr Read Flag'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598070047593379909)
,p_db_column_name=>'IMSRCVR_UPD_BY'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Imsrcvr Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598070392518379912)
,p_db_column_name=>'IMSRCVR_UPD_DATE'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Imsrcvr Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598070608393379914)
,p_db_column_name=>'IMSRCVR_UPD_EMP_ID'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Imsrcvr Upd Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598070137438379910)
,p_db_column_name=>'IMSRCVR_UPD_IP_ADDR'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Imsrcvr Upd Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598070221137379911)
,p_db_column_name=>'IMSRCVR_UPD_OS_USER'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Imsrcvr Upd Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598865850154838822)
,p_db_column_name=>'READ_MSG'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Read Msg.'
,p_column_link=>'f?p=&APP_ID.:127:&SESSION.::&DEBUG.::P127_IMSRCVR_MSG_ID:#IMSRCVR_MSG_ID#'
,p_column_linktext=>'#READ_MSG#'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598070970751379918)
,p_db_column_name=>'ROWID'
,p_display_order=>190
,p_column_identifier=>'V'
,p_column_label=>'Rowid'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598070708131379915)
,p_db_column_name=>'SENDER'
,p_display_order=>200
,p_column_identifier=>'S'
,p_column_label=>'Sender'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598070869292379917)
,p_db_column_name=>'SEND_DATE'
,p_display_order=>220
,p_column_identifier=>'U'
,p_column_label=>'Send Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598070764455379916)
,p_db_column_name=>'SUBJECT'
,p_display_order=>210
,p_column_identifier=>'T'
,p_column_label=>'Subject'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6598421057254466294)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2645631'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'SEND_DATE:SENDER:SUBJECT:READ_MSG'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6598068397043379892)
,p_plug_name=>'Archive Main'
,p_static_id=>'archive-main'
,p_region_name=>'Archive'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>60
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7174251046472268941)
,p_plug_name=>'Compose'
,p_static_id=>'compose'
,p_title=>'Compose Message'
,p_region_name=>'Compose'
,p_parent_plug_id=>wwv_flow_imp.id(6597105063829785040)
,p_region_template_options=>'#DEFAULT#:t-Region--accent14:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6597105063829785040)
,p_plug_name=>'Compose Main'
,p_static_id=>'compose-main'
,p_region_name=>'Compose'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7173756432070183024)
,p_plug_name=>'Inbox'
,p_static_id=>'inbox'
,p_parent_plug_id=>wwv_flow_imp.id(6597102025030785010)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select IMSRCVR_BU,',
'       IMSRCVR_PLNT,',
'       ''null'' card_title,',
'       ''fa-alert'' card_icon,',
'       IMSRCVR_MSG_ID,',
'           (SELECT INTMSE_SENDER_ID',
'              FROM INTERNAL_MESSAGE',
'             WHERE INTMSE_BU       =:GLOBAL_BU',
'               AND INTMSE_MSG_ID   = IMSRCVR_MSG_ID)Sender,',
'       IMSRCVR_RCVR_TYPE,',
'       IMSRCVR_RCVR_ID,',
'          (SELECT INTMSE_SUBJECT',
'             FROM INTERNAL_MESSAGE',
'            WHERE INTMSE_BU =:GLOBAL_BU',
'              AND INTMSE_MSG_ID = IMSRCVR_MSG_ID)Subject,   ',
'          (SELECT to_char(INTMSE_SENT_DATE,''DD/MM/YYYY  HH:MI:SS PM'')',
'              FROM INTERNAL_MESSAGE',
'             WHERE INTMSE_BU =:GLOBAL_BU',
'               AND INTMSE_MSG_ID =IMSRCVR_MSG_ID)"Date",  ',
'        --apex_util.prepare_url(''f?p=&APP_ID.:11:&SESSION.::&DEBUG.::''||''P11_MSG_ID:''||imsrcvr_msg_id)"Link",      ',
'       IMSRCVR_READ_FLAG,',
'       IMSRCVR_ARCH_FLAG,',
'       IMSRCVR_ACTVTY_FLAG,',
'       IMSRCVR_CRE_BY,',
'       IMSRCVR_CRE_IP_ADDR,',
'       IMSRCVR_CRE_OS_USER,',
'       IMSRCVR_CRE_DATE,',
'       IMSRCVR_UPD_BY,',
'       IMSRCVR_UPD_IP_ADDR,',
'       IMSRCVR_UPD_OS_USER,',
'       IMSRCVR_UPD_DATE,',
'       IMSRCVR_CRE_EMP_ID,',
'       IMSRCVR_UPD_EMP_ID',
'  from INT_MSG_RECEIVERS',
'  where IMSRCVR_BU=:global_bu',
'  and IMSRCVR_RCVR_ID=:global_user and IMSRCVR_ARCH_FLAG=''N''',
'  order by IMSRCVR_MSG_ID desc'))
,p_lazy_loading=>true
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows=>10
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>true
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(6331439392151923008)
,p_region_id=>wwv_flow_imp.id(7173756432070183024)
,p_layout_type=>'GRID'
,p_grid_column_count=>3
,p_title_adv_formatting=>false
,p_title_column_name=>'Date'
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>false
,p_body_column_name=>'SUBJECT'
,p_second_body_adv_formatting=>false
,p_icon_source_type=>'STATIC_CLASS'
,p_icon_css_classes=>'fa-alert'
,p_icon_position=>'START'
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(6331439927213923009)
,p_card_id=>wwv_flow_imp.id(6331439392151923008)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:31:&SESSION.::&DEBUG.::P31_MSG_ID,P31_MSG_TYPE,P31_ARCHIVE:&IMSRCVR_MSG_ID.,I,&IMSRCVR_ARCH_FLAG.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6597102025030785010)
,p_plug_name=>'Inbox Main'
,p_static_id=>'inbox-main'
,p_region_name=>'Inbox'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6597102132650785011)
,p_plug_name=>'Inbox Report'
,p_static_id=>'inbox-report'
,p_title=>'Inbox'
,p_parent_plug_id=>wwv_flow_imp.id(6597102025030785010)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       IMSRCVR_BU,',
'       IMSRCVR_PLNT,',
'       IMSRCVR_MSG_ID,',
'       (SELECT INTMSE_SENDER_ID',
'          FROM INTERNAL_MESSAGE',
'         WHERE INTMSE_BU     = :GLOBAL_BU',
'           AND INTMSE_MSG_ID = IMSRCVR_MSG_ID ) Sender,',
'       (SELECT INTMSE_SUBJECT',
'          FROM INTERNAL_MESSAGE',
'         WHERE INTMSE_BU = :GLOBAL_BU',
'           AND INTMSE_MSG_ID = IMSRCVR_MSG_ID ) Subject,',
'       (SELECT to_char(INTMSE_SENT_DATE,''DD/MM/YYYY  HH:MI:SS PM'')',
'          FROM INTERNAL_MESSAGE',
'         WHERE INTMSE_BU =:GLOBAL_BU',
'           AND INTMSE_MSG_ID =IMSRCVR_MSG_ID) Send_Date,',
'       IMSRCVR_RCVR_TYPE,',
'       IMSRCVR_RCVR_ID,',
'       IMSRCVR_READ_FLAG,',
'       IMSRCVR_ARCH_FLAG,',
'       IMSRCVR_ACTVTY_FLAG,',
'       IMSRCVR_CRE_BY,',
'       IMSRCVR_CRE_IP_ADDR,',
'       IMSRCVR_CRE_OS_USER,',
'       IMSRCVR_CRE_DATE,',
'       IMSRCVR_UPD_BY,',
'       IMSRCVR_UPD_IP_ADDR,',
'       IMSRCVR_UPD_OS_USER,',
'       IMSRCVR_UPD_DATE,',
'       IMSRCVR_CRE_EMP_ID,',
'       IMSRCVR_UPD_EMP_ID,',
'       ''<span aria-hidden="true" class="fa fa-clipboard-edit" style = "color:green;"></span>'' read_msg',
'  from INT_MSG_RECEIVERS',
' where IMSRCVR_BU = :global_bu',
'   and IMSRCVR_RCVR_ID = :global_user ',
'   and IMSRCVR_ARCH_FLAG=''N''',
' order by IMSRCVR_MSG_ID desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(6597102280969785012)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No Data Found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_internal_uid=>1117581297184864810
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597103105049785020)
,p_db_column_name=>'IMSRCVR_ACTVTY_FLAG'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Imsrcvr Actvty Flag'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597102982574785019)
,p_db_column_name=>'IMSRCVR_ARCH_FLAG'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Imsrcvr Arch Flag'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597102340945785013)
,p_db_column_name=>'IMSRCVR_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Imsrcvr Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597103150590785021)
,p_db_column_name=>'IMSRCVR_CRE_BY'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Imsrcvr Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597103426292785024)
,p_db_column_name=>'IMSRCVR_CRE_DATE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Imsrcvr Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597103999563785029)
,p_db_column_name=>'IMSRCVR_CRE_EMP_ID'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Imsrcvr Cre Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597103268568785022)
,p_db_column_name=>'IMSRCVR_CRE_IP_ADDR'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Imsrcvr Cre Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597103383361785023)
,p_db_column_name=>'IMSRCVR_CRE_OS_USER'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Imsrcvr Cre Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597102588007785015)
,p_db_column_name=>'IMSRCVR_MSG_ID'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Imsrcvr Msg Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597102464247785014)
,p_db_column_name=>'IMSRCVR_PLNT'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Imsrcvr Plnt'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597102761147785017)
,p_db_column_name=>'IMSRCVR_RCVR_ID'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Imsrcvr Rcvr Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597102636178785016)
,p_db_column_name=>'IMSRCVR_RCVR_TYPE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Imsrcvr Rcvr Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597102862526785018)
,p_db_column_name=>'IMSRCVR_READ_FLAG'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Imsrcvr Read Flag'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597103574691785025)
,p_db_column_name=>'IMSRCVR_UPD_BY'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Imsrcvr Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597103877357785028)
,p_db_column_name=>'IMSRCVR_UPD_DATE'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Imsrcvr Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597104088992785030)
,p_db_column_name=>'IMSRCVR_UPD_EMP_ID'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Imsrcvr Upd Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597103699901785026)
,p_db_column_name=>'IMSRCVR_UPD_IP_ADDR'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Imsrcvr Upd Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597103750212785027)
,p_db_column_name=>'IMSRCVR_UPD_OS_USER'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Imsrcvr Upd Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598866861415838832)
,p_db_column_name=>'READ_MSG'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Read Msg.'
,p_column_link=>'f?p=&APP_ID.:127:&SESSION.::&DEBUG.::P127_IMSRCVR_MSG_ID:#IMSRCVR_MSG_ID#'
,p_column_linktext=>'#READ_MSG#'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597104201979785031)
,p_db_column_name=>'ROWID'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Rowid'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597104240542785032)
,p_db_column_name=>'SENDER'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Sender'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597104500801785034)
,p_db_column_name=>'SEND_DATE'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Send Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597104363206785033)
,p_db_column_name=>'SUBJECT'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Subject'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6597590484014107282)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2637325'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'SEND_DATE:SENDER:SUBJECT:READ_MSG'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7173102462294674691)
,p_plug_name=>'Internal Message'
,p_static_id=>'internal-message'
,p_parent_plug_id=>wwv_flow_imp.id(6581858232705089535)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select IMSRCVR_BU,',
'       IMSRCVR_PLNT,',
'       ''null'' card_title,',
'       ''fa-alert'' card_icon,',
'       IMSRCVR_MSG_ID,',
'           (SELECT INTMSE_SENDER_ID',
'              FROM INTERNAL_MESSAGE',
'             WHERE INTMSE_BU       =:GLOBAL_BU',
'               AND INTMSE_MSG_ID   = IMSRCVR_MSG_ID)Sender,',
'       IMSRCVR_RCVR_TYPE,',
'       IMSRCVR_RCVR_ID,',
'          (SELECT INTMSE_SUBJECT',
'             FROM INTERNAL_MESSAGE',
'            WHERE INTMSE_BU =:GLOBAL_BU',
'              AND INTMSE_MSG_ID = IMSRCVR_MSG_ID)Subject,   ',
'          (SELECT to_char(INTMSE_SENT_DATE,''DD/MM/YYYY  HH:MI:SS PM'')',
'              FROM INTERNAL_MESSAGE',
'             WHERE INTMSE_BU =:GLOBAL_BU',
'               AND INTMSE_MSG_ID =IMSRCVR_MSG_ID)"Date",  ',
'        --apex_util.prepare_url(''f?p=&APP_ID.:11:&SESSION.::&DEBUG.::''||''P11_MSG_ID:''||imsrcvr_msg_id)"Link",      ',
'       IMSRCVR_READ_FLAG,',
'       IMSRCVR_ARCH_FLAG,',
'       IMSRCVR_ACTVTY_FLAG,',
'       IMSRCVR_CRE_BY,',
'       IMSRCVR_CRE_IP_ADDR,',
'       IMSRCVR_CRE_OS_USER,',
'       IMSRCVR_CRE_DATE,',
'       IMSRCVR_UPD_BY,',
'       IMSRCVR_UPD_IP_ADDR,',
'       IMSRCVR_UPD_OS_USER,',
'       IMSRCVR_UPD_DATE,',
'       IMSRCVR_CRE_EMP_ID,',
'       IMSRCVR_UPD_EMP_ID',
'  from INT_MSG_RECEIVERS',
'  where IMSRCVR_BU=:global_bu',
'  and IMSRCVR_RCVR_ID=:global_user and IMSRCVR_READ_FLAG = ''N''',
'  order by IMSRCVR_MSG_ID desc'))
,p_lazy_loading=>true
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows=>10
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>true
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(6331429714315922998)
,p_region_id=>wwv_flow_imp.id(7173102462294674691)
,p_layout_type=>'GRID'
,p_grid_column_count=>3
,p_title_adv_formatting=>false
,p_title_column_name=>'Date'
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>false
,p_body_column_name=>'SUBJECT'
,p_second_body_adv_formatting=>false
,p_icon_source_type=>'STATIC_CLASS'
,p_icon_css_classes=>'fa-alert'
,p_icon_position=>'START'
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(6331430174623923000)
,p_card_id=>wwv_flow_imp.id(6331429714315922998)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:31:&SESSION.::&DEBUG.::P31_MSG_ID,P31_MSG_TYPE,P31_ARCHIVE:&IMSRCVR_MSG_ID.,I,&IMSRCVR_ARCH_FLAG.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6581858232705089535)
,p_plug_name=>'Internal Message Main'
,p_static_id=>'internal-message-main'
,p_region_name=>'Unread'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6581858397946089536)
,p_plug_name=>'Internal Message Report'
,p_static_id=>'internal-message-report'
,p_title=>'Internal Message'
,p_region_name=>'Internal'
,p_parent_plug_id=>wwv_flow_imp.id(6581858232705089535)
,p_region_template_options=>'#DEFAULT#:margin-top-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       IMSRCVR_BU,',
'       IMSRCVR_PLNT,',
'       IMSRCVR_MSG_ID,',
'       (SELECT INTMSE_SENDER_ID',
'          FROM INTERNAL_MESSAGE',
'         WHERE INTMSE_BU     = :GLOBAL_BU',
'           AND INTMSE_MSG_ID = IMSRCVR_MSG_ID ) Sender,',
'       (SELECT INTMSE_SUBJECT',
'          FROM INTERNAL_MESSAGE',
'         WHERE INTMSE_BU = :GLOBAL_BU',
'           AND INTMSE_MSG_ID = IMSRCVR_MSG_ID ) Subject,',
'       (SELECT to_char(INTMSE_SENT_DATE,''DD/MM/YYYY  HH:MI:SS PM'')',
'          FROM INTERNAL_MESSAGE',
'         WHERE INTMSE_BU =:GLOBAL_BU',
'           AND INTMSE_MSG_ID =IMSRCVR_MSG_ID) Send_Date,',
'       IMSRCVR_RCVR_TYPE,',
'       IMSRCVR_RCVR_ID,',
'       IMSRCVR_READ_FLAG,',
'       IMSRCVR_ARCH_FLAG,',
'       IMSRCVR_ACTVTY_FLAG,',
'       IMSRCVR_CRE_BY,',
'       IMSRCVR_CRE_IP_ADDR,',
'       IMSRCVR_CRE_OS_USER,',
'       IMSRCVR_CRE_DATE,',
'       IMSRCVR_UPD_BY,',
'       IMSRCVR_UPD_IP_ADDR,',
'       IMSRCVR_UPD_OS_USER,',
'       IMSRCVR_UPD_DATE,',
'       IMSRCVR_CRE_EMP_ID,',
'       IMSRCVR_UPD_EMP_ID,',
'       CASE WHEN IMSRCVR_ARCH_FLAG = ''Y'' THEN',
'                ''<input type="checkbox" id="checkbox_''||IMSRCVR_MSG_ID||''" checked="checked" onChange="checkanduncheck(''||IMSRCVR_MSG_ID||'',''''N'''')"/>''',
'            ELSE',
'                ''<input type="checkbox" id="checkbox_''||IMSRCVR_MSG_ID||''" onChange="checkanduncheck(''||IMSRCVR_MSG_ID||'',''''Y'''')" />''',
'       END "Flag",',
'       CASE WHEN :P172_PROCEED1 = ''Y'' THEN ''<span aria-hidden="true" class="fa fa-check-square-o" style = "color:green;"></span>'' ',
'            WHEN :P172_PROCEED1 = ''N'' THEN ''<span aria-hidden="true" class="fa fa-stop" style = "color:#FFA500"></span>''',
'       END  PROCEED1,',
'       ''<span aria-hidden="true" class="fa fa-clipboard-edit" style = "color:bule;"></span>'' read_msg,',
'       ''<span aria-hidden="true" class="fa fa-badge-check" style = "color:green;"></span>'' btn_active,',
'       ''<span aria-hidden="true" class="fa fa-trash-o" style = "color:red;"></span>'' btn_delete',
'  from INT_MSG_RECEIVERS',
' where IMSRCVR_BU = :GLOBAL_BU',
'   and IMSRCVR_RCVR_ID = :GLOBAL_user ',
'   and IMSRCVR_READ_FLAG = ''N''',
' order by IMSRCVR_MSG_ID desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(6581858468445089537)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No Data Found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_internal_uid=>1102337484660169335
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598867038255838834)
,p_db_column_name=>'BTN_ACTIVE'
,p_display_order=>260
,p_column_identifier=>'AA'
,p_column_label=>'Archive'
,p_column_link=>'javascript:apex.confirm("Do you want to move the message? ",''ARCHIVE_INT'' );'
,p_column_linktext=>'#BTN_ACTIVE#'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598867172538838835)
,p_db_column_name=>'BTN_DELETE'
,p_display_order=>270
,p_column_identifier=>'AB'
,p_column_label=>'Delete'
,p_column_link=>'javascript:$s(''P30_ROWID_INT'',''#ROWID#'');apex.confirm("Do you want to delete the message? ",''DELETE_INT'' );'
,p_column_linktext=>'#BTN_DELETE#'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_display_condition_type=>'NEVER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598863251856838796)
,p_db_column_name=>'Flag'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'<input type="checkbox" id="check_all"  onChange="selectall()"/>'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597100559707784995)
,p_db_column_name=>'IMSRCVR_ACTVTY_FLAG'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Imsrcvr Actvty Flag'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597100415546784994)
,p_db_column_name=>'IMSRCVR_ARCH_FLAG'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Imsrcvr Arch Flag'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6581858599571089538)
,p_db_column_name=>'IMSRCVR_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Imsrcvr Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597100656578784996)
,p_db_column_name=>'IMSRCVR_CRE_BY'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Imsrcvr Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597100927779784999)
,p_db_column_name=>'IMSRCVR_CRE_DATE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Imsrcvr Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597101509386785004)
,p_db_column_name=>'IMSRCVR_CRE_EMP_ID'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Imsrcvr Cre Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597100776827784997)
,p_db_column_name=>'IMSRCVR_CRE_IP_ADDR'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Imsrcvr Cre Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597100907056784998)
,p_db_column_name=>'IMSRCVR_CRE_OS_USER'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Imsrcvr Cre Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6581858728347089540)
,p_db_column_name=>'IMSRCVR_MSG_ID'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Imsrcvr Msg Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6581858640901089539)
,p_db_column_name=>'IMSRCVR_PLNT'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Imsrcvr Plnt'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597100280188784992)
,p_db_column_name=>'IMSRCVR_RCVR_ID'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Imsrcvr Rcvr Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597100136750784991)
,p_db_column_name=>'IMSRCVR_RCVR_TYPE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Imsrcvr Rcvr Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597100313515784993)
,p_db_column_name=>'IMSRCVR_READ_FLAG'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Imsrcvr Read Flag'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597101095354785000)
,p_db_column_name=>'IMSRCVR_UPD_BY'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Imsrcvr Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597101332410785003)
,p_db_column_name=>'IMSRCVR_UPD_DATE'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Imsrcvr Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597101587252785005)
,p_db_column_name=>'IMSRCVR_UPD_EMP_ID'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Imsrcvr Upd Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597101146095785001)
,p_db_column_name=>'IMSRCVR_UPD_IP_ADDR'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Imsrcvr Upd Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597101221142785002)
,p_db_column_name=>'IMSRCVR_UPD_OS_USER'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Imsrcvr Upd Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598864082022838804)
,p_db_column_name=>'PROCEED1'
,p_display_order=>240
,p_column_identifier=>'Y'
,p_column_label=>'&nbsp;'
,p_column_link=>'javascript:$s(''P30_ROWID_INT'',''#ROWID#'');apex.submit(''WF'');'
,p_column_linktext=>'#PROCEED1#'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598866991650838833)
,p_db_column_name=>'READ_MSG'
,p_display_order=>250
,p_column_identifier=>'Z'
,p_column_label=>'Read Msg.'
,p_column_link=>'f?p=&APP_ID.:127:&SESSION.::&DEBUG.::P127_IMSRCVR_MSG_ID:#IMSRCVR_MSG_ID#'
,p_column_linktext=>'#READ_MSG#'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597101681873785006)
,p_db_column_name=>'ROWID'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Rowid'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597101803788785007)
,p_db_column_name=>'SENDER'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Sender'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597101916180785009)
,p_db_column_name=>'SEND_DATE'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Send Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597101904260785008)
,p_db_column_name=>'SUBJECT'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Subject'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6597114672836788932)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2632567'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'Flag:SEND_DATE:SENDER:SUBJECT:PROCEED1:BTN_DELETE:BTN_ACTIVE:READ_MSG'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6598864828651838812)
,p_plug_name=>'Read Message'
,p_static_id=>'read-message'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size600x400'
,p_plug_template=>wwv_flow_imp.id(10650510175351505351)
,p_plug_display_sequence=>70
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6598071046822379919)
,p_plug_name=>'Sent Items'
,p_static_id=>'sent-items'
,p_parent_plug_id=>wwv_flow_imp.id(6598068245369379791)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       INTMSE_BU,',
'       INTMSE_PLNT,',
'       INTMSE_MSG_ID,',
'       INTMSE_SENDER_ID,',
'       to_char(INTMSE_SENT_DATE,''DD/MM/YYYY  HH:MI:SS PM'')INTMSE_SENT_DATE,',
'       INTMSE_SUBJECT,',
'       INTMSE_MESSAGE,',
'       INTMSE_TO_USERS,',
'       INTMSE_CC_USERS,',
'       INTMSE_ATTACH_NO,',
'       INTMSE_WF_NO,',
'       INTMSE_CRE_BY,',
'       INTMSE_CRE_IP_ADDR,',
'       INTMSE_CRE_OS_USER,',
'       INTMSE_CRE_DATE,',
'       INTMSE_UPD_BY,',
'       INTMSE_UPD_IP_ADDR,',
'       INTMSE_UPD_OS_USER,',
'       INTMSE_UPD_DATE,',
'       INTMSE_CRE_EMP_ID,',
'       INTMSE_UPD_EMP_ID',
'  from INTERNAL_MESSAGE',
' where INTMSE_BU = :global_bu ',
'   and INTMSE_SENDER_ID = :global_user',
' order by INTMSE_SENT_DATE'))
,p_plug_source_type=>'NATIVE_IR'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(6598071116364379920)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_internal_uid=>1118550132579459718
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598072129312379930)
,p_db_column_name=>'INTMSE_ATTACH_NO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Intmse Attach No'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598071271816379921)
,p_db_column_name=>'INTMSE_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Intmse Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598072111398379929)
,p_db_column_name=>'INTMSE_CC_USERS'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Intmse Cc Users'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598072379100379932)
,p_db_column_name=>'INTMSE_CRE_BY'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Intmse Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598072688315379935)
,p_db_column_name=>'INTMSE_CRE_DATE'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Intmse Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598073156047379940)
,p_db_column_name=>'INTMSE_CRE_EMP_ID'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Intmse Cre Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598072425221379933)
,p_db_column_name=>'INTMSE_CRE_IP_ADDR'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Intmse Cre Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598072525412379934)
,p_db_column_name=>'INTMSE_CRE_OS_USER'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Intmse Cre Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598071838343379927)
,p_db_column_name=>'INTMSE_MESSAGE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Intmse Message'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598071443876379923)
,p_db_column_name=>'INTMSE_MSG_ID'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Intmse Msg Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598071328837379922)
,p_db_column_name=>'INTMSE_PLNT'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Intmse Plnt'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598071556843379924)
,p_db_column_name=>'INTMSE_SENDER_ID'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Intmse Sender Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598862962428838793)
,p_db_column_name=>'INTMSE_SENT_DATE'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Date'
,p_column_link=>'f?p=&APP_ID.:131:&SESSION.::&DEBUG.::P131_ROWID:#ROWID#'
,p_column_linktext=>'#INTMSE_SENT_DATE#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598071737215379926)
,p_db_column_name=>'INTMSE_SUBJECT'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Intmse Subject'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598071933059379928)
,p_db_column_name=>'INTMSE_TO_USERS'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'To'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598072729004379936)
,p_db_column_name=>'INTMSE_UPD_BY'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Intmse Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598073030493379939)
,p_db_column_name=>'INTMSE_UPD_DATE'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Intmse Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598862771760838791)
,p_db_column_name=>'INTMSE_UPD_EMP_ID'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Intmse Upd Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598072883926379937)
,p_db_column_name=>'INTMSE_UPD_IP_ADDR'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Intmse Upd Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598072974347379938)
,p_db_column_name=>'INTMSE_UPD_OS_USER'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Intmse Upd Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598072244675379931)
,p_db_column_name=>'INTMSE_WF_NO'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Intmse Wf No'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6598862893664838792)
,p_db_column_name=>'ROWID'
,p_display_order=>220
,p_is_primary_key=>'Y'
,p_column_identifier=>'V'
,p_column_label=>'Rowid'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6598901829509855224)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2650441'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'INTMSE_SENT_DATE:INTMSE_TO_USERS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6598068245369379791)
,p_plug_name=>'Sent Items Main'
,p_static_id=>'sent-items-main'
,p_region_name=>'Sent_Items'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7173519903814600769)
,p_plug_name=>'Static Content'
,p_static_id=>'static-content'
,p_title=>'TAB'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6331427366803922994)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(6581858397946089536)
,p_button_name=>'Archive_INT'
,p_static_id=>'archive-int'
,p_button_static_id=>'savebtn'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--success:t-Button--iconRight:t-Button--hoverIconPush'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Archive'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'javascript:apex.confirm("Do you want to move the message? ",''ARCHIVE_INT'' );'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-badge-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6331462462098923030)
,p_button_sequence=>30
,p_button_name=>'Back'
,p_static_id=>'back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_redirect_url=>'f?p=&APP_ID.:1925190004:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-left-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6331464974267923031)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(7173519903814600769)
,p_button_name=>'Compose'
,p_static_id=>'compose'
,p_button_static_id=>'co'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft:t-Button--stretch:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Compose'
,p_button_redirect_url=>'f?p=&APP_ID.:172:&SESSION.::&DEBUG.::P172_TYPE:CO'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-calendar-check-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6331426970732922992)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(6581858397946089536)
,p_button_name=>'Delete_INT'
,p_static_id=>'delete-int'
,p_button_static_id=>'cancelbtn'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--danger:t-Button--iconRight:t-Button--hoverIconPush'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Delete'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'javascript:apex.confirm("Do you want to delete the message? ",''DELETE_INT'' );'
,p_icon_css_classes=>'fa-trash-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6331464553846923031)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(7173519903814600769)
,p_button_name=>'Inbox'
,p_static_id=>'inbox'
,p_button_static_id=>'in'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--stretch:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Inbox'
,p_button_redirect_url=>'f?p=&APP_ID.:172:&SESSION.::&DEBUG.::P172_TYPE:IN'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-window-terminal'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6331427715696922994)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(6581858397946089536)
,p_button_name=>'Read_Msg_INT'
,p_static_id=>'read-msg-int'
,p_button_static_id=>'addbtn'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--iconRight:t-Button--hoverIconPush'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Read Msg.'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-clipboard-edit'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6331441369444923009)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7174251046472268941)
,p_button_name=>'Send'
,p_static_id=>'send'
,p_button_static_id=>'send'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--success:t-Button--iconRight:t-Button--hoverIconPush'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Send'
,p_button_position=>'EDIT'
,p_icon_css_classes=>'fa-paper-plane-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6331464117982923031)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(7173519903814600769)
,p_button_name=>'Unread'
,p_static_id=>'unread'
,p_button_static_id=>'but'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft:t-Button--stretch:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Unread'
,p_button_redirect_url=>'f?p=&APP_ID.:172:&SESSION.::&DEBUG.::P172_TYPE:UN'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-window-ban'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6331474605064923053)
,p_branch_name=>'Go to page WF (236131010)'
,p_branch_action=>'f?p=&APP_ID.:236131010:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'EXPRESSION'
,p_branch_condition=>':P172_PROCEED1 = ''Y'''
,p_branch_condition_text=>'PLSQL'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6331475063038923053)
,p_branch_name=>'Go to page (SMS) 19251900041'
,p_branch_action=>'f?p=&APP_ID.:19251900041:&SESSION.::&DEBUG.::P19251900041_TAB:SMS&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P172_TAB_LIST'
,p_branch_condition_text=>'SMS'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6331475439278923053)
,p_branch_name=>'Go to page (EMAIL) 19251900041'
,p_branch_action=>'f?p=&APP_ID.:19251900041:&SESSION.::&DEBUG.::P19251900041_TAB:EMAIL&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P172_TAB_LIST'
,p_branch_condition_text=>'EMAIL'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6331475796807923053)
,p_branch_name=>'Go to page (WHATSAPP) 19251900041'
,p_branch_action=>'f?p=&APP_ID.:19251900041:&SESSION.::&DEBUG.::P19251900041_TAB:WHATSAPP&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>40
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P172_TAB_LIST'
,p_branch_condition_text=>'WHATSAPP'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6331476238914923053)
,p_branch_name=>'Go to page (Internal Messages) 30'
,p_branch_action=>'f?p=&APP_ID.:172:&SESSION.::&DEBUG.::P172_TAB_LIST:I&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>50
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P172_TAB_LIST'
,p_branch_condition_text=>'I'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6598908398004838880)
,p_name=>'P172_ATH_FILE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6598864828651838812)
,p_prompt=>'Attachment'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7174276083251268990)
,p_name=>'P172_ATTACH'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(7174251046472268941)
,p_prompt=>'Attachment'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_tag_attributes=>'onKeyUP="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_copy_paste', 'N',
  'allow_multiple_files', 'N',
  'display_as', 'INLINE',
  'purge_file_at', 'SESSION',
  'storage_type', 'APEX_APPLICATION_TEMP_FILES')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7174276671024268996)
,p_name=>'P172_ATTACH_NO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(7174251046472268941)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7168353586759455951)
,p_name=>'P172_BACK'
,p_item_sequence=>40
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7174275908059268988)
,p_name=>'P172_CC'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7174251046472268941)
,p_prompt=>'Cc'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT msgusrb_id d,',
'       msgusrb_id r',
'  FROM msg_users_buffer',
' WHERE msgusrb_bu = :GLOBAL_bu'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_attributes=>'onKeyUP="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6598908232868838878)
,p_name=>'P172_CC1'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6598864828651838812)
,p_prompt=>'Cc'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6598908118799838877)
,p_name=>'P172_FROM1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6598864828651838812)
,p_prompt=>'From'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6598875788211838841)
,p_name=>'P172_IMSRCVR_ARCH_FLAG1'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6581858397946089536)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6598908477080838881)
,p_name=>'P172_INFO1'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6598864828651838812)
,p_prompt=>'&nbsp;'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_tag_attributes=>'readonly=readonly'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6597153021285785105)
,p_name=>'P172_MAIN_TAB'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7173519903814600769)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7174276195743268991)
,p_name=>'P172_MESSAGE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(7174251046472268941)
,p_prompt=>'Plain Text'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>10
,p_tag_attributes=>'onKeyUP="this.value=this.value.toUpperCase();"'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6598874550747838829)
,p_name=>'P172_MSG_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6581858397946089536)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6598874926621838833)
,p_name=>'P172_PROCEED1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6581858397946089536)
,p_item_default=>'N'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6598875177062838835)
,p_name=>'P172_ROWID_INT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6581858397946089536)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7174276019225268989)
,p_name=>'P172_SUBJECT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7174251046472268941)
,p_prompt=>'Subject'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onKeyUP="this.value=this.value.toUpperCase();"'
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
 p_id=>wwv_flow_imp.id(6598908289440838879)
,p_name=>'P172_SUBJECT1'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6598864828651838812)
,p_prompt=>'Subject'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6597152782898785102)
,p_name=>'P172_TAB'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7173519903814600769)
,p_item_default=>'NVL(:P172_MAIN_TAB,''U'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'&nbsp;'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Unread;U,Inbox;I,Compose;C,Sent Items;S,Archive;A'
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large:t-Form-fieldContainer--radioButtonGroup'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6607617656221912364)
,p_name=>'P172_TAB_LIST'
,p_item_sequence=>10
,p_item_default=>'I'
,p_prompt=>'Tab List'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Int. Messages;I,SMS;SMS,Email;EMAIL,Whatsapp;WHATSAPP'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#:margin-bottom-sm:margin-left-lg'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'execute_validations', 'Y',
  'number_of_columns', '4',
  'page_action_on_selection', 'SUBMIT')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6607618811832912375)
,p_name=>'P172_TITLE'
,p_item_sequence=>20
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7174275767810268987)
,p_name=>'P172_TO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7174251046472268941)
,p_prompt=>'To'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT msgusrb_id d,',
'       msgusrb_id r',
'  FROM msg_users_buffer',
' WHERE msgusrb_bu = :GLOBAL_bu'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_attributes=>'onKeyUP="this.value=this.value.toUpperCase();"'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6598908012957838876)
,p_name=>'P172_TO1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6598864828651838812)
,p_prompt=>'To'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7173568474070600840)
,p_name=>'P172_TYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(7173519903814600769)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when_type=>'NEVER'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6331473102273923050)
,p_name=>'Read_Msg'
,p_static_id=>'read-msg'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6331427715696922994)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6331473645025923052)
,p_event_id=>wwv_flow_imp.id(6331473102273923050)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SELECT :GLOBAL_user,',
    '       INTMSE_SENDER_ID, --:UNREAD.SENDER1,',
    '       INTMSE_CC_USERS,',
    '       INTMSE_SUBJECT,',
    '       INTMSE_MESSAGE',
    '  INTO :P172_TO1 ,',
    '       :P172_FROM1   ,',
    '       :P172_CC1     ,',
    '       :P172_SUBJECT1,',
    '       :P172_INFO1',
    '  FROM INTERNAL_MESSAGE,',
    '       INT_MSG_RECEIVERS UNREAD',
    ' WHERE INTMSE_BU     = imsrcvr_bu',
    '   AND INTMSE_BU     = :GLOBAL_BU',
    '   AND INTMSE_MSG_ID = IMSRCVR_MSG_ID',
    '   and UNREAD.rowid = :P172_ROWID_INT;',
    '',
    '-- IF :UNREAD.IMSRCVR_READ_FLAG1 = ''N'' THEN',
    '--     UPDATE int_msg_receivers',
    '--        SET imsrcvr_read_flag = ''Y''',
    '--      WHERE imsrcvr_bu = :global_bu',
    '--        AND imsrcvr_msg_id = :UNREAD.IMSRCVR_MSG_ID1',
    '--        AND imsrcvr_rcvr_id =:global_user;',
    '--     proc_commit;',
    '-- END IF;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6331474087419923052)
,p_event_id=>wwv_flow_imp.id(6331473102273923050)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-open-region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6598864828651838812)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6331471717963923048)
,p_name=>'Tab'
,p_static_id=>'tab'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P172_TAB'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6331472748897923050)
,p_event_id=>wwv_flow_imp.id(6331471717963923048)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_name=>'Main Tab'
,p_static_id=>'main-tab'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P172_TAB',
  'language', 'PLSQL',
  'plsql_code', ':P172_MAIN_TAB := :P172_TAB;',
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6331472204833923050)
,p_event_id=>wwv_flow_imp.id(6331471717963923048)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'Tab'
,p_static_id=>'tab'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'const tabMapping = {',
    '  ''U'': ''Unread'',',
    '  ''I'': ''Inbox'',',
    '  ''C'': ''Compose'',',
    '  ''S'': ''Sent_Items'',',
    '  ''A'': ''Archive''',
    '  };',
    '  ',
    'const selectedTab = $v("P172_TAB");',
    '',
    '// Hide all containers',
    'for (const container in tabMapping) {',
    '  apex.item(tabMapping[container]).hide();',
    '}',
    '',
    '// Show the selected container',
    'apex.item(tabMapping[selectedTab]).show();')))).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6331471353107923047)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Attachment No.'
,p_static_id=>'attachment-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(MAX(IMA_SEQ_NO),1)+1 ',
'	  INTO :P172_ATTACH_NO ',
'		FROM internal_message_attachment ',
'	 WHERE IMA_BU = :GLOBAL_BU;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6331441369444923009)
,p_internal_uid=>851950369323002845
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6331468084740923045)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CHECKANDUNCHECK'
,p_static_id=>'checkanduncheck'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    UPDATE int_msg_receivers',
'       SET imsrcvr_arch_flag = APEX_APPLICATION.G_X02,',
'           imsrcvr_upd_by    = :Global_user,',
'           imsrcvr_upd_date  = SYSDATE',
'     WHERE imsrcvr_bu        = :GLOBAL_BU',
'       AND IMSRCVR_MSG_ID    = APEX_APPLICATION.G_X01;',
'    COMMIT;',
'    HTP.P(''success'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>851947100956002843
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6331470556981923047)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Compose Send'
,p_static_id=>'compose-send'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF (:P172_TO IS NULL)OR ',
'   (:P172_SUBJECT IS NULL) OR',
'   (:P172_MESSAGE IS NULL) THEN',
'   raise_application_error(-20999,''Please enter to/subject/message to continue.'');',
'ELSE',
'    proc_sender_names_validation(:GLOBAL_BU,:P172_TO);',
'END IF;',
'',
'IF (:P172_CC IS NOT NULL)THEN',
'    proc_sender_names_validation(:GLOBAL_BU,:P172_CC); ',
'END IF;',
'',
'proc_int_msg_inserting (:global_bu,',
'                        :global_user,',
'                        SYSDATE,',
'                        :P172_TO,',
'                        :P172_CC,',
'                        :P172_SUBJECT,',
'                        :P172_MESSAGE,',
'                        :P172_ATTACH_NO );',
'',
'APEX_APPLICATION.g_print_success_message := ''<span style="color:white"> Your message has been sent. </span>'';'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6331441369444923009)
,p_internal_uid=>851949573197002845
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6331470179429923047)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DELETE_INT'
,p_static_id=>'delete-int'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'',
'    CURSOR c1',
'        IS',
'        SELECT *',
'          FROM int_msg_receivers',
'         WHERE imsrcvr_bu = :GLOBAL_BU',
'           AND imsrcvr_arch_flag = ''Y'';',
'',
'    cr1             c1%ROWTYPE;',
'',
'BEGIN',
'    OPEN c1;',
'    FETCH c1 INTO cr1;',
'        IF c1%FOUND THEN',
'      --   RAISE_APPLICATION_ERROR(-20999,cr1.imsrcvr_arch_flag);',
'            DELETE',
'              FROM int_msg_receivers',
'             WHERE imsrcvr_bu = :GLOBAL_BU',
'               AND imsrcvr_arch_flag = ''Y'';',
'            COMMIT;',
'        END IF;',
'    CLOSE c1;',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE_INT'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>851949195645002845
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6331469331046923047)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'OVERALLCHECK'
,p_static_id=>'overallcheck'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_flag              VARCHAR2(5);',
'    v_count             VARCHAR2(10);',
'BEGIN',
'    SELECT CASE WHEN imsrcvr_arch_flag  = ''N'' THEN ''N''',
'                WHEN imsrcvr_arch_flag  = ''Y'' THEN ''Y''',
'           ELSE ''NY''',
'           END flag ',
'      INTO v_flag',
'      FROM (SELECT LISTAGG(DISTINCT imsrcvr_arch_flag , '','') WITHIN GROUP( ORDER BY imsrcvr_arch_flag  ) imsrcvr_arch_flag ',
'              FROM int_msg_receivers',
'             WHERE imsrcvr_bu = :GLOBAL_BU',
'               AND imsrcvr_msg_id = APEX_APPLICATION.G_X01',
'           );',
'',
'    SELECT NVL(COUNT(imsrcvr_arch_flag ), 0 ) ',
'      INTO v_count',
'      FROM int_msg_receivers',
'     WHERE imsrcvr_bu     = :GLOBAL_BU',
'       AND imsrcvr_msg_id = APEX_APPLICATION.G_X01',
'       AND imsrcvr_arch_flag  = ''Y'';',
'',
'    HTP.P(v_flag ||''-'' ||v_count ||'' '' ||''row Selected'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>851948347262002845
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6331468564904923045)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SELECTALL'
,p_static_id=>'selectall'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_seq_no                varchar2(100);',
'    TYPE pyrl_ref_cursor IS REF CURSOR;',
'    pyrl_cursor             pyrl_ref_cursor;',
'BEGIN ',
'    OPEN pyrl_cursor FOR ''SELECT imsrcvr_msg_id FROM int_msg_receivers WHERE imsrcvr_bu  = ''''''||:Global_bu||''''''',
'                                                                         AND imsrcvr_msg_id  = ''''''||APEX_APPLICATION.G_X01||''''''AND ''',
'                                                                    ||FUNC_FIND_IR_CONDITION_EXP( 800, 30, ''Int. Messages'', :APP_SESSION);',
'    LOOP',
'        FETCH pyrl_cursor INTO v_seq_no;',
'        EXIT WHEN pyrl_cursor%NOTFOUND;',
'',
'            UPDATE int_msg_receivers',
'               SET imsrcvr_arch_flag = ''Y'',',
'                   imsrcvr_upd_by    = :Global_user,',
'                   imsrcvr_upd_date  = SYSDATE',
'             WHERE imsrcvr_bu        = :GLOBAL_BU',
'               and imsrcvr_msg_id    = v_seq_no;',
'            COMMIT;',
'            HTP.P(''success'');',
'',
'    END LOOP;',
'    CLOSE pyrl_cursor;',
'    COMMIT;',
'    HTP.P(''success'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>851947581120002843
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6331470886306923047)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Title'
,p_static_id=>'title'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P172_TAB_LIST IN (''I'') THEN',
'   :P172_TITLE := ''Int. Messages'';',
'ELSE',
'   null;',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>851949902522002845
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6331468975503923045)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'UNSELECTALL'
,p_static_id=>'unselectall'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    UPDATE int_msg_receivers',
'       SET imsrcvr_arch_flag = ''N'',',
'           imsrcvr_upd_by    = :GLOBAL_USER,',
'           imsrcvr_upd_date  = SYSDATE',
'     WHERE imsrcvr_bu        = :GLOBAL_BU',
'       AND imsrcvr_msg_id    = APEX_APPLICATION.G_X01;',
'    COMMIT;',
'END;',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>851947991719002843
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6331469764459923047)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'WF'
,p_static_id=>'wf'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P172_PROCEED1 = ''N'' THEN',
'   :P172_PROCEED1 := ''Y'';',
'ELSIF :P172_PROCEED1 = ''Y'' THEN',
'   :P172_PROCEED1 := ''N'';',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'WF'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>851948780675002845
);
wwv_flow_imp.component_end;
end;
/
