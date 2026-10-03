prompt --application/pages/page_10901
begin
--   Manifest
--     PAGE: 10901
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
 p_id=>10901
,p_name=>'Plant Maintenance Notification Details'
,p_alias=>'PLANT-MAINTENANCE-NOTIFICATION-DETAILS'
,p_page_mode=>'MODAL'
,p_step_title=>'Details'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#WORKSPACE_FILES#fontstylesheet.css'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function title(){',
'	    var type; ',
'      type = apex.item( "P10901_TYPE" ).getValue();',
'',
'     if ((type == ''EQ'' )){',
'      apex.util.getTopApex().jQuery(".ui-dialog.my-custom-dialog").find(".ui-dialog-content").dialog("option", "title", "Equipments Open");',
'      }',
'',
'      if ((type == ''WR'' )){',
'      apex.util.getTopApex().jQuery(".ui-dialog.my-custom-dialog").find(".ui-dialog-content").dialog("option", "title", "Work Request Open");',
'      } ',
'	  if ((type == ''PWR'' )){',
'      apex.util.getTopApex().jQuery(".ui-dialog.my-custom-dialog").find(".ui-dialog-content").dialog("option", "title", "Work Request Pending");',
'      } ',
'	  if ((type == ''WOO'' )){',
'      apex.util.getTopApex().jQuery(".ui-dialog.my-custom-dialog").find(".ui-dialog-content").dialog("option", "title", "Work Order Open");',
'      } ',
'	  if ((type == ''WOTCO'' )){',
'      apex.util.getTopApex().jQuery(".ui-dialog.my-custom-dialog").find(".ui-dialog-content").dialog("option", "title", "W.O. Task Completion Open");',
'      } ',
'	  if ((type == ''WOTCNH'' )){',
'      apex.util.getTopApex().jQuery(".ui-dialog.my-custom-dialog").find(".ui-dialog-content").dialog("option", "title", "W.O. Task Completion Not Handover");',
'      } ',
'}   '))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
' var button = parent.$(''.ui-dialog-titlebar-close''); ',
'button.hide();',
'title();'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
't-fht-thead{',
'      overflow: auto !important;',
'}',
' .a-IRR-table {',
'      border-collapse: collapse;',
'      table-layout: auto;',
'      border-spacing: 0;',
'      white-space: nowrap;',
'      word-wrap: break-word;',
'  }',
''))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'600'
,p_dialog_width=>'1300'
,p_dialog_css_classes=>'my-custom-dialog no-close'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5914644437898617543)
,p_plug_name=>'Equipment'
,p_static_id=>'equipment'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT EQPMT_BU,',
'       EQPMT_PLANT_LOC_ID,',
'       EQPMT_PLANT_ID,',
'       EQPMT_EQPMT_ID,',
'       EQPMT_DESC1,',
'       EQPMT_SUB_CAT_ID,',
'    (SELECT msc_sub_cat_desc',
'       FROM maint_sub_cat',
'      WHERE msc_bu = EQPMT_BU AND msc_sub_cat_id = EQPMT_SUB_CAT_ID)SUB_CAT_DESC,       ',
'       EQPMT_CAT_ID,',
'       EQPMT_DEPT_ID,',
' (SELECT dept_name1',
'    FROM departments',
'   WHERE dept_bu = EQPMT_BU AND dept_id = EQPMT_DEPT_ID)',
'    own_desc,       ',
'CASE WHEN eqpmt_ef_type = ''EQ'' THEN ''Equipment''',
'     WHEN eqpmt_ef_type = ''FL'' THEN ''Func. Location'' ',
'     WHEN eqpmt_ef_type = ''CO'' THEN ''Component'' ',
'END eqpmt_ef_type,',
'CASE WHEN eqpmt_status = ''N'' THEN ''Draft'' END EQPMT_STATUS,',
'CASE WHEN eqpmt_status = ''N'' THEN ''Blue'' END color',
' FROM equipments',
' where EQPMT_BU =:GLOBAL_BU',
' AND EQPMT_STATUS = ''N''',
' AND EQPMT_PLANT_ID IN(',
'          select AUBA_PLANT',
'          from appl_user_plant_access',
'          where AUBA_BU = :global_bu  and',
'          AUBA_USER_ID = :GLOBAL_user AND ',
'          trunc(sysdate) between AUBA_FROM and AUBA_TO);'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P10901_TYPE'
,p_plug_display_when_cond2=>'EQ'
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
 p_id=>wwv_flow_imp.id(5914644575993617544)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>432682740450006516
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5914645916788617557)
,p_db_column_name=>'COLOR'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5914644662045617545)
,p_db_column_name=>'EQPMT_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Eqpmt Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5914645381230617552)
,p_db_column_name=>'EQPMT_CAT_ID'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Eqpmt Cat Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5914645476989617553)
,p_db_column_name=>'EQPMT_DEPT_ID'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Eqpmt Dept Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5914645080881617549)
,p_db_column_name=>'EQPMT_DESC1'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Equipment Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5914645674689617555)
,p_db_column_name=>'EQPMT_EF_TYPE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5914644983718617548)
,p_db_column_name=>'EQPMT_EQPMT_ID'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Equipment'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5914644889785617547)
,p_db_column_name=>'EQPMT_PLANT_ID'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940221322497886849)
,p_db_column_name=>'EQPMT_PLANT_LOC_ID'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Loc. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5914645772218617556)
,p_db_column_name=>'EQPMT_STATUS'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Status'
,p_column_html_expression=>'<div style="color:#COLOR#;font-weight:bold;font-weight: bold; text-align: center; border-radius:12px;">#EQPMT_STATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5914645145819617550)
,p_db_column_name=>'EQPMT_SUB_CAT_ID'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Sub. Category'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5914645576340617554)
,p_db_column_name=>'OWN_DESC'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Own Dept. Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5914645328968617551)
,p_db_column_name=>'SUB_CAT_DESC'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Sub. Category Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5940244966501897484)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4582832'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'EQPMT_PLANT_LOC_ID:EQPMT_PLANT_ID:EQPMT_EQPMT_ID:EQPMT_DESC1:EQPMT_SUB_CAT_ID:SUB_CAT_DESC:OWN_DESC:EQPMT_EF_TYPE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5940219351036886830)
,p_plug_name=>'PARAMETER'
,p_static_id=>'parameter'
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5943189933054018529)
,p_plug_name=>'Pending Maintance Dues'
,p_static_id=>'pending-maintance-dues'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>60
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select EPMT_BU,',
'       EPMT_PLNT,',
'       EPMT_SUBDEPT_ID,',
'       EPMT_SUBDEPT_DESC,',
'      decode(MAINT_TYPE,''V'',''PV'',''P'',''PD'')MAINT_TYPE,',
'       EPMT_EQMPT_ID,',
'       EQMPT_DESC,',
'       EPMT_TASK_ID,',
'       EPMT_TASK_DESC,',
'       EPMT_TASK_TYPE,',
'       TO_CHAR(EPMT_LAST_MAINT_DATE,:GLOBAL_RPT_DATE_MASK) EPMT_LAST_MAINT_DATE,',
'       TO_CHAR(DUE_DATE,:GLOBAL_RPT_DATE_MASK) DUE_DATE,',
'       NEXT_MAINT_READING,',
'       EPMT_CUR_METER_READING,',
'       EPMT_LAST_MAINT_READING,',
'       EPMT_METER_TYPE,',
'       EPMT_ADVANCE_NOTICE_DAYS,',
'       EPMT_ADVANCE_METER_READING,',
'       DUE_DAYS,',
'       EPMT_DEFER_FLAG,',
'       EPMT_SEL_FLAG,',
'       func_find_maint_meter_desc(:GLOBAL_bu,EPMT_METER_TYPE,1)met_desc,',
'       (SELECT fp_long_desc',
'           FROM fin_periods',
'        WHERE fp_bu = :GLOBAL_BU',
'          AND DUE_DATE  BETWEEN fp_from_date AND fp_end_date)due_month,',
'       (NEXT_MAINT_READING - EPMT_CUR_METER_READING )Pending_Reading,',
'       TO_CHAR(EPMT_ACT_DUE_DATE,:GLOBAL_RPT_DATE_MASK) EPMT_ACT_DUE_DATE,',
'       EPMT_ACT_DUE_RDNG,''Details'',',
'       epmt_freq_basis,',
'       TO_CHAR(EPMT_CUR_DATE,:GLOBAL_RPT_DATE_MASK) EPMT_CUR_DATE',
'  from EQUIPMENTS_MAINT_DUES',
'  where EPMT_BU = :Global_bu  AND ',
'  EPMT_PLNT IN(',
'          select AUBA_PLANT',
'          from appl_user_plant_access',
'          where AUBA_BU = :global_bu  and',
'          AUBA_USER_ID = :GLOBAL_user AND ',
'          trunc(sysdate) between  AUBA_FROM and  AUBA_TO)',
'  '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P10901_TYPE'
,p_plug_display_when_cond2=>'PMD'
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
 p_id=>wwv_flow_imp.id(5943189951437018530)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>461228115893407502
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943192713832018557)
,p_db_column_name=>'''DETAILS'''
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'&#x27;details&#x27;'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943191189148018542)
,p_db_column_name=>'DUE_DATE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Due Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943191875256018549)
,p_db_column_name=>'DUE_DAYS'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Due Days'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943192331685018553)
,p_db_column_name=>'DUE_MONTH'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Due Month'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943192501269018555)
,p_db_column_name=>'EPMT_ACT_DUE_DATE'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Epmt Act Due Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943192544082018556)
,p_db_column_name=>'EPMT_ACT_DUE_RDNG'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Actual Due Reading'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943191773037018548)
,p_db_column_name=>'EPMT_ADVANCE_METER_READING'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Advance Notify Reading'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943191656751018547)
,p_db_column_name=>'EPMT_ADVANCE_NOTICE_DAYS'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Advance Notify Days'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943190055770018531)
,p_db_column_name=>'EPMT_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Epmt Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943192917445018559)
,p_db_column_name=>'EPMT_CUR_DATE'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Actual Due Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943191378838018544)
,p_db_column_name=>'EPMT_CUR_METER_READING'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Current Reading'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943191954234018550)
,p_db_column_name=>'EPMT_DEFER_FLAG'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Epmt Defer Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943190631118018536)
,p_db_column_name=>'EPMT_EQMPT_ID'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Equipment '
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943192834381018558)
,p_db_column_name=>'EPMT_FREQ_BASIS'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Epmt Freq Basis'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943191049519018541)
,p_db_column_name=>'EPMT_LAST_MAINT_DATE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Epmt Last Maint Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943191447975018545)
,p_db_column_name=>'EPMT_LAST_MAINT_READING'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Last Meter Reading'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943191593353018546)
,p_db_column_name=>'EPMT_METER_TYPE'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Epmt Meter Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943190209666018532)
,p_db_column_name=>'EPMT_PLNT'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943192036439018551)
,p_db_column_name=>'EPMT_SEL_FLAG'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Epmt Sel Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943190364399018534)
,p_db_column_name=>'EPMT_SUBDEPT_DESC'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Sub. Dept.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943190240844018533)
,p_db_column_name=>'EPMT_SUBDEPT_ID'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Epmt Subdept Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943190931407018539)
,p_db_column_name=>'EPMT_TASK_DESC'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Task'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943190748547018538)
,p_db_column_name=>'EPMT_TASK_ID'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Epmt Task Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943190987152018540)
,p_db_column_name=>'EPMT_TASK_TYPE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Epmt Task Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943190677351018537)
,p_db_column_name=>'EQMPT_DESC'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Equipment Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943190517667018535)
,p_db_column_name=>'MAINT_TYPE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943192233966018552)
,p_db_column_name=>'MET_DESC'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Met Desc'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943191294444018543)
,p_db_column_name=>'NEXT_MAINT_READING'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Next Reading'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943192337730018554)
,p_db_column_name=>'PENDING_READING'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Pending Reading'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5943231121638073299)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4612693'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'EPMT_PLNT:MAINT_TYPE:EPMT_EQMPT_ID:EQMPT_DESC:EPMT_TASK_DESC:DUE_DATE:NEXT_MAINT_READING:EPMT_CUR_METER_READING:EPMT_LAST_MAINT_READING:EPMT_ADVANCE_NOTICE_DAYS:EPMT_ADVANCE_METER_READING:DUE_DAYS:MET_DESC:DUE_MONTH:PENDING_READING:EPMT_ACT_DUE_RDNG:'
||'EPMT_CUR_DATE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5940221377129886850)
,p_plug_name=>'Pending Work Request'
,p_static_id=>'pending-work-request'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       MNTRQST_BU,',
'       MNTRQST_PLNT,',
'       MNTRQST_RQST_BY,',
'       MNTRQST_RQST_NAME,',
'       MNTRQST_RQST_POS_NAME,',
'       MNTRQST_RQST_DEPT_NAME,',
'       MNTRQST_APPR_BY,',
'       MNTRQST_APPR_NAME,',
'       MNTRQST_APPR_POS_NAME,',
'       MNTRQST_APPR_DEPT_NAME,',
'      (SELECT bup_name1',
'         FROM bus_unit_plants',
'         WHERE bup_bu = MNTRQST_BU ',
'         AND bup_plant_id = MNTRQST_PLNT) plnt_Desc,',
'       MNTRQST_EQPMT_ID,',
'       (SELECT eqpmt_desc1',
'            FROM equipments',
'            WHERE eqpmt_bu = MNTRQST_BU ',
'            AND eqpmt_eqpmt_id = MNTRQST_EQPMT_ID) eqpmt_Desc,',
'       MNTRQST_RQST_NO,',
'       MNTRQST_DESC1,',
'       MNTRQST_PRIORITY,',
'       CASE WHEN MNTRQST_PRIORITY = ''L'' THEN ''Low''',
'            WHEN MNTRQST_PRIORITY = ''M'' THEN ''Medium''',
'            WHEN MNTRQST_PRIORITY = ''H'' THEN ''High''',
'            WHEN MNTRQST_PRIORITY = ''C'' THEN ''Critical''',
'            WHEN MNTRQST_PRIORITY = ''E'' THEN ''Extreme''',
'       END PRIORITY_DESC,',
'       TO_CHAR(MNTRQST_RQRD_DATE,''DD-MM-YYYY'')MNTRQST_RQRD_DATE,',
'       MNTRQST_REMARKS,',
'      (SELECT dept_name1',
'         FROM departments',
'         WHERE dept_bu = MNTRQST_BU',
'         AND dept_id = (SELECT eqpmt_dept_id',
'         FROM equipments',
'         WHERE eqpmt_bu = dept_bu',
'         AND eqpmt_plant_id = dept_plnt',
'         AND eqpmt_eqpmt_id = MNTRQST_EQPMT_ID)) dept_desc,',
'       TO_CHAR(MNTRQST_DATE,''DD-MM-YYYY'')MNTRQST_DATE,',
'       ',
'       TO_CHAR(MNTRQST_STOP_DATE,''DD-MM-YYYY'') MNTRQST_STOP_DATE,',
'       MNTRQST_FAILURE_ID,',
'       (SELECT mntprob_desc1',
'            FROM maint_problems',
'            WHERE mntprob_bu = MNTRQST_BU',
'            AND mntprob_prob_id =MNTRQST_FAILURE_ID) FAILURE_DESC,',
'       CASE WHEN MNTRQST_CWIP_TYPE = ''B'' THEN ''Breakdown''',
'            WHEN MNTRQST_CWIP_TYPE = ''C'' THEN ''Capital WIP''',
'            WHEN MNTRQST_CWIP_TYPE = ''V'' THEN ''Preventive''',
'            WHEN MNTRQST_CWIP_TYPE = ''D'' THEN ''Predictive''',
'            WHEN MNTRQST_CWIP_TYPE = ''P'' THEN ''Project Work''',
'            WHEN MNTRQST_CWIP_TYPE = ''G'' THEN ''General Work''',
'       END MNTRQST_CWIP_TYPE,',
'       CASE WHEN MNTRQST_NAT_JOB = ''D'' THEN ''Daily Meeting Activity''',
'            WHEN MNTRQST_NAT_JOB = ''S'' THEN ''Safety Meeting Activity''',
'            WHEN MNTRQST_NAT_JOB = ''G'' THEN ''General Activity''',
'            WHEN MNTRQST_NAT_JOB = ''P'' THEN ''Project Activity''',
'       END MNTRQST_NAT_JOB',
' from MAINT_REQUEST',
' where MNTRQST_BU=:GLOBAL_BU',
'  AND MNTRQST_STATUS=''A'' AND mntrqst_wo_created = ''N'' AND NOT EXISTS',
'                  (SELECT 1',
'                     FROM maint_wo_task_comp',
'                    WHERE     mntwotc_bu = mntrqst_bu',
'                          AND mntwotc_plnt = mntrqst_plnt',
'                          AND mntwotc_req_no = mntrqst_rqst_no',
'                          AND mntwotc_eqpmt_id = mntrqst_eqpmt_id',
'                          AND mntwotc_comp_basis = ''WR''',
'                          AND mntwotc_status = ''N'')  ',
'  AND MNTRQST_PLNT IN(',
'          select AUBA_PLANT',
'          from appl_user_plant_access',
'          where AUBA_BU = :global_bu  and',
'          AUBA_USER_ID = :GLOBAL_user AND ',
'          trunc(sysdate) between AUBA_FROM and AUBA_TO)'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P10901_TYPE'
,p_plug_display_when_cond2=>'PWR'
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
 p_id=>wwv_flow_imp.id(5940221461334886851)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>458259625791275823
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940223605462886872)
,p_db_column_name=>'DEPT_DESC'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940222869125886865)
,p_db_column_name=>'EQPMT_DESC'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Equipment Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940223946547886876)
,p_db_column_name=>'FAILURE_DESC'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Failure'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940222271079886859)
,p_db_column_name=>'MNTRQST_APPR_BY'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Appr. By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940222599900886862)
,p_db_column_name=>'MNTRQST_APPR_DEPT_NAME'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Appr. Dept.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940222347696886860)
,p_db_column_name=>'MNTRQST_APPR_NAME'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Appr. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940222489750886861)
,p_db_column_name=>'MNTRQST_APPR_POS_NAME'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Appr. Position'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940221638061886853)
,p_db_column_name=>'MNTRQST_BU'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Mntrqst Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940224134877886877)
,p_db_column_name=>'MNTRQST_CWIP_TYPE'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Request Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940223636676886873)
,p_db_column_name=>'MNTRQST_DATE'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Request Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940223077508886867)
,p_db_column_name=>'MNTRQST_DESC1'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Request Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940222760621886864)
,p_db_column_name=>'MNTRQST_EQPMT_ID'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Equipment'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940223935184886875)
,p_db_column_name=>'MNTRQST_FAILURE_ID'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Mntrqst Failure Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940224159129886878)
,p_db_column_name=>'MNTRQST_NAT_JOB'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Nature of Job'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940221773438886854)
,p_db_column_name=>'MNTRQST_PLNT'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940223230025886868)
,p_db_column_name=>'MNTRQST_PRIORITY'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Mntrqst Priority'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940223535270886871)
,p_db_column_name=>'MNTRQST_REMARKS'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Mntrqst Remarks'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940223391841886870)
,p_db_column_name=>'MNTRQST_RQRD_DATE'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Rqrd. Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940221889761886855)
,p_db_column_name=>'MNTRQST_RQST_BY'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Requested By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940222136348886858)
,p_db_column_name=>'MNTRQST_RQST_DEPT_NAME'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Requestor Dept.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940222027683886856)
,p_db_column_name=>'MNTRQST_RQST_NAME'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Requestor Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940223022969886866)
,p_db_column_name=>'MNTRQST_RQST_NO'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Request No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940222092226886857)
,p_db_column_name=>'MNTRQST_RQST_POS_NAME'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Requestor Position'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940223774842886874)
,p_db_column_name=>'MNTRQST_STOP_DATE'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Stop Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940222649244886863)
,p_db_column_name=>'PLNT_DESC'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Plnt Desc'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940223250744886869)
,p_db_column_name=>'PRIORITY_DESC'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Priority'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940221618692886852)
,p_db_column_name=>'ROWID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Rowid'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5940790000303191240)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4588282'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'MNTRQST_PLNT:MNTRQST_EQPMT_ID:EQPMT_DESC:MNTRQST_RQST_NO:MNTRQST_DESC1:MNTRQST_RQRD_DATE:MNTRQST_DATE:MNTRQST_STOP_DATE:PRIORITY_DESC:DEPT_DESC:FAILURE_DESC:MNTRQST_CWIP_TYPE:MNTRQST_NAT_JOB:MNTRQST_RQST_BY:MNTRQST_RQST_NAME:MNTRQST_RQST_POS_NAME:MNT'
||'RQST_RQST_DEPT_NAME:MNTRQST_APPR_BY:MNTRQST_APPR_NAME:MNTRQST_APPR_POS_NAME:MNTRQST_APPR_DEPT_NAME'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5944642226151309950)
,p_plug_name=>'W.O. Task Completion Not Handover'
,p_static_id=>'w-o-task-completion-not-handover'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>90
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select MNTWOTC_BU,',
'       MNTWOTC_LOC_ID,',
'       MNTWOTC_PLNT,',
'       TO_CHAR(MNTWOTC_DOC_DATE,:GLOBAL_RPT_DATE_MASK)MNTWOTC_DOC_DATE,',
'       MNTWOTC_EQPMT_ID,',
'                (SELECT eqpmt_desc1',
'                   FROM equipments',
'                   WHERE eqpmt_bu = :GLOBAL_BU ',
'                     AND eqpmt_eqpmt_id = MNTWOTC_EQPMT_ID) MNTWOTC_EQPMT_ID_DESC,',
'       MNTWOTC_DOC_PFX,',
'       MNTWOTC_DOC_NO,',
'       MNTWOTC_COMP_BASIS,',
'       				CASE WHEN mntwotc_comp_basis = ''D'' THEN ''Direct WO Task Comp.'' ',
'					 WHEN mntwotc_comp_basis = ''WO'' THEN ''With Work Order.''',
'					 WHEN mntwotc_comp_basis = ''WR'' THEN ''With Work Request.'' END MNTWOTC_COMP_BASIS_1,',
'       MNTWOTC_DESC,',
'       MNTWOTC_FAILURE,',
'       func_find_maint_prblm_qry_desc(:GLOBAL_BU, MNTWOTC_FAILURE,:GLOBAL_LANG)MNTWOTC_FAILURE_DESC,',
'       MNTWOTC_TYPE,',
'                CASE WHEN MNTWOTC_TYPE = ''V'' THEN ''Preventive'' ',
'								 WHEN MNTWOTC_TYPE = ''P'' THEN ''Predictive'' ',
'								 WHEN MNTWOTC_TYPE = ''B'' THEN ''Breakdown''',
'								 WHEN MNTWOTC_TYPE = ''S'' THEN ''Shutdown'' ',
'								 WHEN MNTWOTC_TYPE = ''R'' THEN ''Rebuild''',
'								 WHEN MNTWOTC_TYPE = ''Capital WIP'' THEN ''Capital WIP''',
'								 WHEN MNTWOTC_TYPE = ''Project Work'' THEN ''Project Work'' ',
'								 WHEN MNTWOTC_TYPE = ''R'' THEN ''General Work'' END MNTWO_TYPE1,        ',
'       MNTWOTC_WO_NO,',
'       MNTWOTC_REASON,',
'       func_find_maint_cause_qry_desc(:GLOBAL_BU, MNTWOTC_REASON,:GLOBAL_LANG) MNTWOTC_REASON_DESC,',
'       MNTWOTC_STATUS,',
'       CASE WHEN mntwotc_status = ''N'' THEN ''Draft''',
'					 WHEN mntwotc_status = ''E'' THEN ''Entry Completed'' ',
'					 WHEN mntwotc_status = ''C'' THEN ''Cancelled''',
'					 WHEN mntwotc_status = ''P'' THEN ''Approved''',
'					 WHEN mntwotc_status = ''M'' THEN ''Completed''',
'					 WHEN mntwotc_status = ''H'' THEN ''Handed over'' END STATUS1,',
'       CASE WHEN MNTWOTC_STATUS = ''N'' THEN ''Blue''',
'            WHEN MNTWOTC_STATUS = ''E'' THEN ''Green''',
'            WHEN MNTWOTC_STATUS = ''M'' THEN ''Green''',
'            WHEN MNTWOTC_STATUS = ''A'' THEN ''Green''',
'            WHEN MNTWOTC_STATUS = ''C'' THEN ''Red''',
'       END COLOR,',
'       MNTWOTC_REQ_ID,',
'       func_find_employee_desc(:GLOBAL_BU,MNTWOTC_REQ_ID,:GLOBAL_LANG) MNTWOTC_REQ_ID_DESC,',
'       MNTWOTC_CRE_BY,',
'       MNTWOTC_CRE_IP_ADDR,',
'       MNTWOTC_CRE_OS_USER,',
'       MNTWOTC_CRE_DATE,',
'       to_char(MNTWOTC_CRE_DATE,:GLOBAL_RPT_DATE_MASK)CRE_DATE,',
'       MNTWOTC_UPD_BY,',
'       MNTWOTC_UPD_IP_ADDR,',
'       MNTWOTC_UPD_OS_USER,',
'       MNTWOTC_UPD_DATE,',
'       MNTWOTC_CRE_EMP_ID,',
'       MNTWOTC_UPD_EMP_ID',
'  from maint_wo_task_comp',
'WHERE  MNTWOTC_BU = :GLOBAL_BU',
'AND  MNTWOTC_STATUS=''M''',
'AND MNTWOTC_PLNT IN(',
'          select AUBA_PLANT',
'          from appl_user_plant_access',
'          where AUBA_BU = :global_bu  and',
'          AUBA_USER_ID = :GLOBAL_user AND ',
'          trunc(sysdate) between AUBA_FROM and AUBA_TO)'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P10901_TYPE'
,p_plug_display_when_cond2=>'WOTCNH'
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
 p_id=>wwv_flow_imp.id(5944642284184309951)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>462680448640698923
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5945245750899691429)
,p_db_column_name=>'COLOR'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5945245987758691431)
,p_db_column_name=>'CRE_DATE'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'Cre Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944642361206309952)
,p_db_column_name=>'MNTWOTC_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Mntwotc Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944642714873309955)
,p_db_column_name=>'MNTWOTC_COMP_BASIS'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Comp. Basis'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5945246325352691434)
,p_db_column_name=>'MNTWOTC_COMP_BASIS_1'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'Comp Basis'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944643483325309963)
,p_db_column_name=>'MNTWOTC_CRE_BY'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Cre. By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944643823679309966)
,p_db_column_name=>'MNTWOTC_CRE_DATE'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Mntwotc Cre Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944644238209309971)
,p_db_column_name=>'MNTWOTC_CRE_EMP_ID'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Cre. Emp. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944643539220309964)
,p_db_column_name=>'MNTWOTC_CRE_IP_ADDR'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Cre. IP Addr.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944643696752309965)
,p_db_column_name=>'MNTWOTC_CRE_OS_USER'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Cre. OS User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944643127703309959)
,p_db_column_name=>'MNTWOTC_DESC'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'W.O. Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944644801479309976)
,p_db_column_name=>'MNTWOTC_DOC_DATE'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Doc. Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944642578134309954)
,p_db_column_name=>'MNTWOTC_DOC_NO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944644675467309975)
,p_db_column_name=>'MNTWOTC_DOC_PFX'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Doc. Pfx.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944642941876309958)
,p_db_column_name=>'MNTWOTC_EQPMT_ID'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Equipment'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944644934914309977)
,p_db_column_name=>'MNTWOTC_EQPMT_ID_DESC'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Equipment Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944643291441309961)
,p_db_column_name=>'MNTWOTC_FAILURE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Mntwotc Failure'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5945246118397691432)
,p_db_column_name=>'MNTWOTC_FAILURE_DESC'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Failure'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944644547690309974)
,p_db_column_name=>'MNTWOTC_LOC_ID'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Loc. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944642481887309953)
,p_db_column_name=>'MNTWOTC_PLNT'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944643391388309962)
,p_db_column_name=>'MNTWOTC_REASON'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Mntwotc Reason'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5945246204833691433)
,p_db_column_name=>'MNTWOTC_REASON_DESC'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'Reason'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944644535401309973)
,p_db_column_name=>'MNTWOTC_REQ_ID'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Requestor'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5945245836381691430)
,p_db_column_name=>'MNTWOTC_REQ_ID_DESC'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Requestor Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944643176648309960)
,p_db_column_name=>'MNTWOTC_STATUS'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Mntwotc Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944642896749309957)
,p_db_column_name=>'MNTWOTC_TYPE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944643892517309967)
,p_db_column_name=>'MNTWOTC_UPD_BY'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Mntwotc Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944644220752309970)
,p_db_column_name=>'MNTWOTC_UPD_DATE'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Mntwotc Upd Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944644406685309972)
,p_db_column_name=>'MNTWOTC_UPD_EMP_ID'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Mntwotc Upd Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944643943316309968)
,p_db_column_name=>'MNTWOTC_UPD_IP_ADDR'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Mntwotc Upd Ip Addr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944644081104309969)
,p_db_column_name=>'MNTWOTC_UPD_OS_USER'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Mntwotc Upd Os User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944642775605309956)
,p_db_column_name=>'MNTWOTC_WO_NO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'W.O. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5945246527613691436)
,p_db_column_name=>'MNTWO_TYPE1'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944644968395309978)
,p_db_column_name=>'STATUS1'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5945272542502704954)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4633108'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'MNTWOTC_LOC_ID:MNTWOTC_PLNT:MNTWOTC_DOC_PFX:MNTWOTC_DOC_DATE:MNTWOTC_DOC_NO:MNTWOTC_COMP_BASIS:MNTWOTC_WO_NO:MNTWO_TYPE1:MNTWOTC_EQPMT_ID:MNTWOTC_EQPMT_ID_DESC:MNTWOTC_DESC:STATUS1:MNTWOTC_REQ_ID:MNTWOTC_REQ_ID_DESC:MNTWOTC_FAILURE_DESC:MNTWOTC_REASO'
||'N_DESC:MNTWOTC_CRE_BY:CRE_DATE:MNTWOTC_CRE_IP_ADDR:MNTWOTC_CRE_OS_USER:MNTWOTC_CRE_EMP_ID'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5932633957885552548)
,p_plug_name=>'W.O. Task Completion Open'
,p_static_id=>'w-o-task-completion-open'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>80
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select MNTWOTC_BU,',
'       MNTWOTC_LOC_ID,',
'       MNTWOTC_PLNT,',
'       TO_CHAR(MNTWOTC_DOC_DATE,:GLOBAL_RPT_DATE_MASK)MNTWOTC_DOC_DATE,',
'       MNTWOTC_EQPMT_ID,',
'                (SELECT eqpmt_desc1',
'                   FROM equipments',
'                   WHERE eqpmt_bu = :GLOBAL_BU ',
'                     AND eqpmt_eqpmt_id = MNTWOTC_EQPMT_ID) MNTWOTC_EQPMT_ID_DESC,',
'       MNTWOTC_DOC_PFX,',
'       MNTWOTC_DOC_NO,',
'       MNTWOTC_COMP_BASIS,',
'       				CASE WHEN mntwotc_comp_basis = ''D'' THEN ''Direct WO Task Comp.'' ',
'					 WHEN mntwotc_comp_basis = ''WO'' THEN ''With Work Order.''',
'					 WHEN mntwotc_comp_basis = ''WR'' THEN ''With Work Request.'' END MNTWOTC_COMP_BASIS_1,',
'       MNTWOTC_DESC,',
'       MNTWOTC_FAILURE,',
'       func_find_maint_prblm_qry_desc(:GLOBAL_BU, MNTWOTC_FAILURE,:GLOBAL_LANG)MNTWOTC_FAILURE_DESC,',
'       MNTWOTC_TYPE,',
'       				CASE WHEN mntwotc_type = ''V'' THEN ''Preventive'' ',
'					 WHEN mntwotc_type = ''P'' THEN ''Predictive''',
'					 WHEN mntwotc_type = ''B'' THEN ''Breakdown''',
'					 WHEN mntwotc_type = ''S'' THEN ''Shutdown''',
'					 WHEN mntwotc_type = ''R'' THEN ''Rebuild'' ',
'					 WHEN mntwotc_type = ''G'' THEN ''General Work''',
'                     WHEN mntwotc_type = ''C'' THEN ''Capital WIP'' END MNTWOTC_TYPE1,',
'       MNTWOTC_WO_NO,',
'       MNTWOTC_REASON,',
'       func_find_maint_cause_qry_desc(:GLOBAL_BU, MNTWOTC_REASON,:GLOBAL_LANG) MNTWOTC_REASON_DESC,',
'       MNTWOTC_STATUS,',
'       CASE WHEN mntwotc_status = ''N'' THEN ''Draft''',
'					 WHEN mntwotc_status = ''E'' THEN ''Entry Completed'' ',
'					 WHEN mntwotc_status = ''C'' THEN ''Cancelled''',
'					 WHEN mntwotc_status = ''P'' THEN ''Approved''',
'					 WHEN mntwotc_status = ''M'' THEN ''Completed''',
'					 WHEN mntwotc_status = ''H'' THEN ''Handed over'' END STATUS1,',
'       CASE WHEN MNTWOTC_STATUS = ''N'' THEN ''Blue''',
'            WHEN MNTWOTC_STATUS = ''E'' THEN ''Green''',
'            WHEN MNTWOTC_STATUS = ''M'' THEN ''Green''',
'            WHEN MNTWOTC_STATUS = ''A'' THEN ''Green''',
'            WHEN MNTWOTC_STATUS = ''C'' THEN ''Red''',
'       END COLOR,',
'       MNTWOTC_REQ_ID,',
'       func_find_employee_desc(:GLOBAL_BU,MNTWOTC_REQ_ID,:GLOBAL_LANG) MNTWOTC_REQ_ID_DESC,',
'       MNTWOTC_CRE_BY,',
'       MNTWOTC_CRE_IP_ADDR,',
'       MNTWOTC_CRE_OS_USER,',
'       MNTWOTC_CRE_DATE,',
'       to_char(MNTWOTC_CRE_DATE,:GLOBAL_RPT_DATE_MASK)CRE_DATE,',
'       MNTWOTC_UPD_BY,',
'       MNTWOTC_UPD_IP_ADDR,',
'       MNTWOTC_UPD_OS_USER,',
'       MNTWOTC_UPD_DATE,',
'       MNTWOTC_CRE_EMP_ID,',
'       MNTWOTC_UPD_EMP_ID',
'  from maint_wo_task_comp',
'WHERE  MNTWOTC_BU = :GLOBAL_BU',
'AND  MNTWOTC_STATUS=''N''',
'AND MNTWOTC_PLNT IN(',
'          select AUBA_PLANT',
'          from appl_user_plant_access',
'          where AUBA_BU = :global_bu  and',
'          AUBA_USER_ID = :GLOBAL_user AND ',
'          trunc(sysdate) between AUBA_FROM and AUBA_TO)'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P10901_TYPE'
,p_plug_display_when_cond2=>'WOTCO'
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
 p_id=>wwv_flow_imp.id(5932634041547552549)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>450672206003941521
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944641562630309944)
,p_db_column_name=>'COLOR'
,p_display_order=>940
,p_column_identifier=>'CN'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944641764253309946)
,p_db_column_name=>'CRE_DATE'
,p_display_order=>960
,p_column_identifier=>'CP'
,p_column_label=>'Cre Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5932634268416552551)
,p_db_column_name=>'MNTWOTC_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Mntwotc Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5932634636795552555)
,p_db_column_name=>'MNTWOTC_COMP_BASIS'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Comp. Basis'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944642064800309949)
,p_db_column_name=>'MNTWOTC_COMP_BASIS_1'
,p_display_order=>990
,p_column_identifier=>'CS'
,p_column_label=>'Comp Basis'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944636337677309842)
,p_db_column_name=>'MNTWOTC_CRE_BY'
,p_display_order=>420
,p_column_identifier=>'AP'
,p_column_label=>'Cre. By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944636716156309845)
,p_db_column_name=>'MNTWOTC_CRE_DATE'
,p_display_order=>450
,p_column_identifier=>'AS'
,p_column_label=>'Mntwotc Cre Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944637171795309850)
,p_db_column_name=>'MNTWOTC_CRE_EMP_ID'
,p_display_order=>500
,p_column_identifier=>'AX'
,p_column_label=>'Cre. Emp. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944636471314309843)
,p_db_column_name=>'MNTWOTC_CRE_IP_ADDR'
,p_display_order=>430
,p_column_identifier=>'AQ'
,p_column_label=>'Cre. IP Addr.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944636596216309844)
,p_db_column_name=>'MNTWOTC_CRE_OS_USER'
,p_display_order=>440
,p_column_identifier=>'AR'
,p_column_label=>'Cre. OS User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5932635062416552559)
,p_db_column_name=>'MNTWOTC_DESC'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'W.O. Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944641112253309939)
,p_db_column_name=>'MNTWOTC_DOC_DATE'
,p_display_order=>890
,p_column_identifier=>'CK'
,p_column_label=>'Doc. Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5932634535506552553)
,p_db_column_name=>'MNTWOTC_DOC_NO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944640962155309938)
,p_db_column_name=>'MNTWOTC_DOC_PFX'
,p_display_order=>880
,p_column_identifier=>'CJ'
,p_column_label=>'Doc. Pfx.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5932635029403552558)
,p_db_column_name=>'MNTWOTC_EQPMT_ID'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Equipment'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944641204071309940)
,p_db_column_name=>'MNTWOTC_EQPMT_ID_DESC'
,p_display_order=>900
,p_column_identifier=>'CL'
,p_column_label=>'Equipment Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944635627797309834)
,p_db_column_name=>'MNTWOTC_FAILURE'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'Mntwotc Failure'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944641902770309947)
,p_db_column_name=>'MNTWOTC_FAILURE_DESC'
,p_display_order=>970
,p_column_identifier=>'CQ'
,p_column_label=>'Failure'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944639659530309875)
,p_db_column_name=>'MNTWOTC_LOC_ID'
,p_display_order=>750
,p_column_identifier=>'BW'
,p_column_label=>'Loc. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5932634408759552552)
,p_db_column_name=>'MNTWOTC_PLNT'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944635643663309835)
,p_db_column_name=>'MNTWOTC_REASON'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'Mntwotc Reason'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944641972012309948)
,p_db_column_name=>'MNTWOTC_REASON_DESC'
,p_display_order=>980
,p_column_identifier=>'CR'
,p_column_label=>'Reason'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944638660499309865)
,p_db_column_name=>'MNTWOTC_REQ_ID'
,p_display_order=>650
,p_column_identifier=>'BM'
,p_column_label=>'Requestor'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944641693959309945)
,p_db_column_name=>'MNTWOTC_REQ_ID_DESC'
,p_display_order=>950
,p_column_identifier=>'CO'
,p_column_label=>'Requestor Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5932635282838552561)
,p_db_column_name=>'MNTWOTC_STATUS'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Mntwotc Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5932634895100552557)
,p_db_column_name=>'MNTWOTC_TYPE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5945246429915691435)
,p_db_column_name=>'MNTWOTC_TYPE1'
,p_display_order=>1000
,p_column_identifier=>'CT'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944636785907309846)
,p_db_column_name=>'MNTWOTC_UPD_BY'
,p_display_order=>460
,p_column_identifier=>'AT'
,p_column_label=>'Mntwotc Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944637085308309849)
,p_db_column_name=>'MNTWOTC_UPD_DATE'
,p_display_order=>490
,p_column_identifier=>'AW'
,p_column_label=>'Mntwotc Upd Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944637276003309851)
,p_db_column_name=>'MNTWOTC_UPD_EMP_ID'
,p_display_order=>510
,p_column_identifier=>'AY'
,p_column_label=>'Mntwotc Upd Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944636867007309847)
,p_db_column_name=>'MNTWOTC_UPD_IP_ADDR'
,p_display_order=>470
,p_column_identifier=>'AU'
,p_column_label=>'Mntwotc Upd Ip Addr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944636951506309848)
,p_db_column_name=>'MNTWOTC_UPD_OS_USER'
,p_display_order=>480
,p_column_identifier=>'AV'
,p_column_label=>'Mntwotc Upd Os User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5932634829454552556)
,p_db_column_name=>'MNTWOTC_WO_NO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'W.O. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944641492320309943)
,p_db_column_name=>'STATUS1'
,p_display_order=>930
,p_column_identifier=>'CM'
,p_column_label=>'Status1'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5944743631900367199)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4627818'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'MNTWOTC_LOC_ID:MNTWOTC_PLNT:MNTWOTC_DOC_DATE:MNTWOTC_DOC_PFX:MNTWOTC_DOC_NO:MNTWOTC_COMP_BASIS_1:MNTWOTC_TYPE1:MNTWOTC_WO_NO:MNTWOTC_EQPMT_ID:MNTWOTC_EQPMT_ID_DESC:MNTWOTC_DESC:MNTWOTC_REQ_ID:MNTWOTC_REQ_ID_DESC:MNTWOTC_FAILURE_DESC:MNTWOTC_REASON_DE'
||'SC:MNTWOTC_CRE_BY:CRE_DATE:MNTWOTC_CRE_IP_ADDR:MNTWOTC_CRE_OS_USER:MNTWOTC_CRE_EMP_ID'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5925640780354121764)
,p_plug_name=>'Work Order Open'
,p_static_id=>'work-order-open'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>70
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select MNTWO_BU,',
'         MNTWO_LOC_ID,',
'         MNTWO_PLNT,',
'         MNTWO_DESC,',
'         MNTWO_DATE,',
'         TO_CHAR(MNTWO_DATE,:GLOBAL_RPT_DATE_MASK)MNTWO_DATE1,',
'         MNTWO_ORD_PFX,',
'         MNTWO_WO_NO,',
'         MNTWO_EQPMT_ID,',
'         func_find_eqpmnt_qry_desc(:GLOBAL_BU, MNTWO_EQPMT_ID) MNTWO_EQPMT_ID_DESC,',
'         MNTWO_FAILURE,',
'         func_find_maint_prblm_qry_desc(:GLOBAL_BU, MNTWO_FAILURE , :global_lang) MNTWO_FAILURE_DESC ,',
'         MNTWO_REQ_NO,',
'         MNTWO_PAR_WO,',
'         MNTWO_PLNR_POS_ID,',
'         func_find_eqpmt_plnr_qry_desc(:GLOBAL_BU,MNTWO_PLNR_POS_ID,:GLOBAL_LANG) MNTWO_PLNR_POS_ID_DESC,',
'         MNTWO_REASON,',
'         func_find_maint_cause_qry_desc(:global_bu, MNTWO_REASON, :global_lang) MNTWO_REASON_desc,',
'         MNTWO_PRIORITY,',
'         CASE WHEN MNTWO_TYPE = ''V'' THEN ''Preventive'' ',
'								 WHEN MNTWO_TYPE = ''P'' THEN ''Predictive'' ',
'								 WHEN MNTWO_TYPE = ''B'' THEN ''Breakdown''',
'								 WHEN MNTWO_TYPE = ''S'' THEN ''Shutdown'' ',
'								 WHEN MNTWO_TYPE = ''R'' THEN ''Rebuild''',
'								 WHEN MNTWO_TYPE = ''Capital WIP'' THEN ''Capital WIP''',
'								 WHEN MNTWO_TYPE = ''Project Work'' THEN ''Project Work'' ',
'								 WHEN MNTWO_TYPE = ''R'' THEN ''General Work'' END MNTWO_TYPE,        ',
'         MNTWO_DEPT_ID,',
'         MNTWO_REMARKS,',
'         MNTWO_CRE_BY,',
'         MNTWO_CRE_IP_ADDR,',
'         MNTWO_CRE_OS_USER,',
'         MNTWO_CRE_DATE,',
'         MNTWO_CRE_EMP_ID,',
'         to_char(MNTWO_CRE_DATE,:GLOBAL_RPT_DATE_MASK) CRE_DATE',
'from MAINT_WO',
'where MNTWO_BU = :global_bu',
'AND MNTWO_STATUS =''E''',
'AND MNTWO_PLNT IN(',
'          select AUBA_PLANT',
'          from appl_user_plant_access',
'          where AUBA_BU = :global_bu  and',
'          AUBA_USER_ID = :GLOBAL_user AND ',
'          trunc(sysdate) between AUBA_FROM and AUBA_TO)',
'',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P10901_TYPE'
,p_plug_display_when_cond2=>'WOO'
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
 p_id=>wwv_flow_imp.id(5925640839686121765)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>443679004142510737
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943390356426405741)
,p_db_column_name=>'CRE_DATE'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Cre. Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5925640971963121766)
,p_db_column_name=>'MNTWO_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Mntwo Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943389916040405736)
,p_db_column_name=>'MNTWO_CRE_BY'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Cre. By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943390179482405739)
,p_db_column_name=>'MNTWO_CRE_DATE'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Cre Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943390301674405740)
,p_db_column_name=>'MNTWO_CRE_EMP_ID'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Cre. Emp. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943389974939405737)
,p_db_column_name=>'MNTWO_CRE_IP_ADDR'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Cre. IP Addr.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943390104530405738)
,p_db_column_name=>'MNTWO_CRE_OS_USER'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Cre. OS User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5925641380841121770)
,p_db_column_name=>'MNTWO_DATE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5925641524807121771)
,p_db_column_name=>'MNTWO_DATE1'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943389670326405734)
,p_db_column_name=>'MNTWO_DEPT_ID'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Dept. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5925641253510121769)
,p_db_column_name=>'MNTWO_DESC'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'W. O Description'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5925641834763121774)
,p_db_column_name=>'MNTWO_EQPMT_ID'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Equipment'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5932633604444552544)
,p_db_column_name=>'MNTWO_EQPMT_ID_DESC'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Equipment Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5925641905690121775)
,p_db_column_name=>'MNTWO_FAILURE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Failure'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5932633789070552546)
,p_db_column_name=>'MNTWO_FAILURE_DESC'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Failure'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5925641084042121767)
,p_db_column_name=>'MNTWO_LOC_ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Loc. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5925641567349121772)
,p_db_column_name=>'MNTWO_ORD_PFX'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'WO Pfx.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5925642076441121777)
,p_db_column_name=>'MNTWO_PAR_WO'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Mntwo Par Wo'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5925642182701121778)
,p_db_column_name=>'MNTWO_PLNR_POS_ID'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Maint. Inchr.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5932633690928552545)
,p_db_column_name=>'MNTWO_PLNR_POS_ID_DESC'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Maint. Inchr. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5925641165661121768)
,p_db_column_name=>'MNTWO_PLNT'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943389305643405730)
,p_db_column_name=>'MNTWO_PRIORITY'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Mntwo Priority'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943389176744405729)
,p_db_column_name=>'MNTWO_REASON'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Reason'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5932633922552552547)
,p_db_column_name=>'MNTWO_REASON_DESC'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'Reason'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5943389777858405735)
,p_db_column_name=>'MNTWO_REMARKS'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Remarks'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5925641986919121776)
,p_db_column_name=>'MNTWO_REQ_NO'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Work req. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5932634209126552550)
,p_db_column_name=>'MNTWO_TYPE'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5925641694982121773)
,p_db_column_name=>'MNTWO_WO_NO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Work Ord. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5943415079591529951)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4614533'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'MNTWO_LOC_ID:MNTWO_PLNT:MNTWO_DESC:MNTWO_DATE1:MNTWO_ORD_PFX:MNTWO_WO_NO:MNTWO_EQPMT_ID:MNTWO_EQPMT_ID_DESC:MNTWO_REQ_NO:MNTWO_FAILURE_DESC:MNTWO_REASON_DESC:MNTWO_PLNR_POS_ID:MNTWO_PLNR_POS_ID_DESC:MNTWO_REMARKS:MNTWO_CRE_BY:MNTWO_CRE_IP_ADDR:MNTWO_'
||'CRE_OS_USER:MNTWO_CRE_EMP_ID:CRE_DATE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5940219848070886835)
,p_plug_name=>'Work Request'
,p_static_id=>'work-request'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT MNTRQST_BU,',
'       MNTRQST_PLNT_LOC_ID,',
'       MNTRQST_PLNT,',
'       MNTRQST_RQST_NO,',
'       MNTRQST_DATE,',
'       TO_CHAR(MNTRQST_DATE,:GLOBAL_RPT_DATE_MASK) MNTRQST_DATE1,',
'       MNTRQST_EQPMT_ID,',
'    (SELECT eqpmt_desc1',
'       FROM equipments',
'      WHERE eqpmt_bu = MNTRQST_BU',
'        AND eqpmt_eqpmt_id = MNTRQST_EQPMT_ID) Equipment_DESC,',
'        MNTRQST_RQRD_DATE,',
'        TO_CHAR(MNTRQST_RQRD_DATE,:GLOBAL_RPT_DATE_MASK) MNTRQST_RQRD_DATE1,',
'        MNTRQST_DESC1,',
'        MNTRQST_RQST_NAME,',
'        DECODE(MNTRQST_STATUS,''E'',''Draft'')MNTRQST_STATUS,',
'        DECODE(MNTRQST_STATUS,''E'',''Blue'')Color',
' FROM MAINT_REQUEST',
' WHERE MNTRQST_BU=:GLOBAL_BU',
' AND MNTRQST_STATUS=''E''  ',
' AND MNTRQST_PLNT IN(',
'          select AUBA_PLANT',
'          from appl_user_plant_access',
'          where AUBA_BU = :global_bu  and',
'          AUBA_USER_ID = :GLOBAL_user AND ',
'          trunc(sysdate) between AUBA_FROM and AUBA_TO)'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P10901_TYPE'
,p_plug_display_when_cond2=>'WR'
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
 p_id=>wwv_flow_imp.id(5940220033439886836)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>458258197896275808
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940221228625886848)
,p_db_column_name=>'COLOR'
,p_display_order=>130
,p_column_identifier=>'L'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940220695017886843)
,p_db_column_name=>'EQUIPMENT_DESC'
,p_display_order=>90
,p_column_identifier=>'G'
,p_column_label=>'Equipment Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940220092329886837)
,p_db_column_name=>'MNTRQST_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Mntrqst Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940220460758886841)
,p_db_column_name=>'MNTRQST_DATE'
,p_display_order=>40
,p_column_identifier=>'E'
,p_column_label=>'Request Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5945246620289691437)
,p_db_column_name=>'MNTRQST_DATE1'
,p_display_order=>140
,p_column_identifier=>'M'
,p_column_label=>'Request Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940220901359886845)
,p_db_column_name=>'MNTRQST_DESC1'
,p_display_order=>60
,p_column_identifier=>'I'
,p_column_label=>'Request Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940220609722886842)
,p_db_column_name=>'MNTRQST_EQPMT_ID'
,p_display_order=>80
,p_column_identifier=>'F'
,p_column_label=>'Equipment ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940220326473886839)
,p_db_column_name=>'MNTRQST_PLNT'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940220147124886838)
,p_db_column_name=>'MNTRQST_PLNT_LOC_ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Loc ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940220786462886844)
,p_db_column_name=>'MNTRQST_RQRD_DATE'
,p_display_order=>100
,p_column_identifier=>'H'
,p_column_label=>'Required Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5945246663302691438)
,p_db_column_name=>'MNTRQST_RQRD_DATE1'
,p_display_order=>150
,p_column_identifier=>'N'
,p_column_label=>'Required Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940220954690886846)
,p_db_column_name=>'MNTRQST_RQST_NAME'
,p_display_order=>110
,p_column_identifier=>'J'
,p_column_label=>'Requested By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940220424898886840)
,p_db_column_name=>'MNTRQST_RQST_NO'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Request No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5940221048219886847)
,p_db_column_name=>'MNTRQST_STATUS'
,p_display_order=>120
,p_column_identifier=>'K'
,p_column_label=>'Status'
,p_column_html_expression=>'<div style="color:#COLOR#;font-weight:bold;font-weight: bold; text-align: center; border-radius:12px;">#MNTRQST_STATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5940537860930074612)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4585761'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'MNTRQST_PLNT_LOC_ID:MNTRQST_PLNT:MNTRQST_DATE1:MNTRQST_RQST_NO:MNTRQST_DESC1:MNTRQST_EQPMT_ID:EQUIPMENT_DESC:MNTRQST_RQRD_DATE1:MNTRQST_RQST_NAME'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5940219632466886832)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(5940219351036886830)
,p_button_name=>'Close'
,p_static_id=>'close'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--noUI:t-Button--gapLeft:t-Button--gapRight:t-Button--padTop'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5940219478419886831)
,p_name=>'P10901_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(5940219351036886830)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5940219699906886833)
,p_name=>'Close'
,p_static_id=>'close'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5940219632466886832)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5940219763701886834)
,p_event_id=>wwv_flow_imp.id(5940219699906886833)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-cancel'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp.component_end;
end;
/
