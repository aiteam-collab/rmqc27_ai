prompt --application/pages/page_3670539
begin
--   Manifest
--     PAGE: 3670539
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
 p_id=>3670539
,p_name=>'Mould/ Core Box (Steel Casting)'
,p_alias=>'MOULD-CORE-BOX-STEEL-CASTING'
,p_step_title=>'Mould/ Core Box (Steel Casting)'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
' .a-IRR-table {',
'      border-collapse: collapse;',
'      table-layout: auto;',
'      border-spacing: 0;',
'      white-space: nowrap;',
'      word-wrap: break-word;',
'  }',
'  .t-fht-thead {',
'    overflow: auto !important;',
'}',
''))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5889600449693500123)
,p_plug_name=>'Report 1'
,p_static_id=>'report'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       MFGRG_BU,',
'       MFGRG_PLNT,',
'       (SELECT bup_name1',
'        FROM bus_unit_plants',
'       WHERE bup_bu = MFGRG_BU AND bup_plant_id = MFGRG_PLNT) PLNT,',
'       MFGRG_GRP_ID,',
'       MFGRG_DESC1,',
'       MFGRG_DESC2,',
'       Decode(MFGRG_RES_TYPE,''L'',''Mould Box'',''R'',''Core Box'') MFGRG_RES_TYPE,',
'       MFGRG_COST_TYPE,',
'       MFGRG_HRLY_RATE,',
'       MFGRG_AC_LVL1,',
'       MFGRG_AC_LVL2,',
'       MFGRG_AC_LVL3,',
'       MFGRG_AC_LVL4,',
'       MFGRG_CURRENT_ACCT,',
'       MFGRG_UOM,',
'       MFGRG_TRACK_PVTY,',
'       MFGRG_SUB_ELEMENT,',
'      ( SELECT cse_elmnt_desc1',
'            FROM cost_elements,cost_sub_elements',
'            WHERE ce_bu = cse_bu',
'            AND ce_elmnt_id = cse_elmnt_id',
'            and cse_bu = :GLOBAL_bu',
'            AND ce_elmnt_type IN (''DL'',''DE'',''DM'')',
'            AND cse_sub_elmnt_id =MFGRG_SUB_ELEMENT) "Sub Element Desc.",',
'       MFGRG_CHARGE_FLAG,',
'       MFGRG_CHARGE_TYPE,',
'       MFGRG_NO_OF_UNITS,',
'       MFGRG_RES_GRP_TYPE,',
'       MFGRG_EFFICIENCY,',
'       MFGRG_UTILIZATION,',
'       MFGRG_ACCT_PLNT,',
'       MFGRG_RES_NEXT_ID,',
'       MFGRG_NEXT_ID_SOURCE,',
'       MFGRG_SPIND_FRAME,',
'       MFGRG_SPIND_SPEED,',
'       MFGRG_TOT_SPIND,',
'       MFGRG_AC_LVL_PRJ,',
'       MFGRG_NO_OF_UNITS_INUSE,',
'       MFGRG_CRE_BY,',
'       MFGRG_CRE_IP_ADDR,',
'       MFGRG_CRE_OS_USER,',
'       MFGRG_CRE_DATE,',
'       MFGRG_UPD_BY,',
'       MFGRG_UPD_IP_ADDR,',
'       MFGRG_UPD_OS_USER,',
'       MFGRG_UPD_DATE,',
'       MFGRG_CRE_EMP_ID,',
'       MFGRG_UPD_EMP_ID,',
'       MFGRG_AC_LVL5,',
'       MFGRG_AC_LVL6,',
'       MFGRG_LVL5,',
'       MFGRG_LVL6,',
'       MFGRG_CC_CODE,',
'       MFGRG_AC_PLNT_LOC_ID,',
'       MFGRG_LOC_ID,',
'       ''<span class="fa fa-circle-arrow-in-north" aria-hidden="true" style = "color:#e4677d; font-weight:bold"></span>'' "Overhead Rate",',
'        ''<span class="fa fa-file-arrow-up" aria-hidden="true" style = "color:#9C27B0; font-weight:bold"></span>'' "Cre. Resource",',
'         ''<span class="fa fa-terminal" aria-hidden="true" style = "color:#FF9800; font-weight:bold"></span>'' Availability',
'  from MFG_RES_GROUPS',
'  where MFGRG_BU= :global_bu'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Report 1'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(5889600915110500124)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:367053901:&SESSION.::&DEBUG.:RP:P367053901_ROWID:\#ROWID#\'
,p_detail_link_text=>'<span aria-label="Edit"><span class="fa fa-edit" aria-hidden="true" title="Edit"></span></span>'
,p_internal_uid=>407639079566889096
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889510397877411164)
,p_db_column_name=>'AVAILABILITY'
,p_display_order=>98
,p_column_identifier=>'BA'
,p_column_label=>'Availability'
,p_column_link=>'f?p=&APP_ID.:367053906:&SESSION.::&DEBUG.:::'
,p_column_linktext=>'#AVAILABILITY#'
,p_column_link_attr=>'Title= ''Availability'''
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889510259584411163)
,p_db_column_name=>'Cre. Resource'
,p_display_order=>88
,p_column_identifier=>'AZ'
,p_column_label=>'Cre. Resource'
,p_column_link=>'f?p=&APP_ID.:367053904:&SESSION.::&DEBUG.:::'
,p_column_linktext=>'#Cre. Resource#'
,p_column_link_attr=>'Title= ''Cre. Resource'''
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889610171131500140)
,p_db_column_name=>'MFGRG_ACCT_PLNT'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Mfgrg Acct Plnt'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889604599457500134)
,p_db_column_name=>'MFGRG_AC_LVL1'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Mfgrg Ac Lvl1'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889604998370500135)
,p_db_column_name=>'MFGRG_AC_LVL2'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Mfgrg Ac Lvl2'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889605422426500135)
,p_db_column_name=>'MFGRG_AC_LVL3'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Mfgrg Ac Lvl3'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889605815470500135)
,p_db_column_name=>'MFGRG_AC_LVL4'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Mfgrg Ac Lvl4'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889617325077500149)
,p_db_column_name=>'MFGRG_AC_LVL5'
,p_display_order=>42
,p_column_identifier=>'AP'
,p_column_label=>'Mfgrg Ac Lvl5'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889617732297500149)
,p_db_column_name=>'MFGRG_AC_LVL6'
,p_display_order=>43
,p_column_identifier=>'AQ'
,p_column_label=>'Mfgrg Ac Lvl6'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889612635118500143)
,p_db_column_name=>'MFGRG_AC_LVL_PRJ'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Mfgrg Ac Lvl Prj'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889619237893500153)
,p_db_column_name=>'MFGRG_AC_PLNT_LOC_ID'
,p_display_order=>47
,p_column_identifier=>'AU'
,p_column_label=>'Mfgrg Ac Plnt Loc Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889601354229500129)
,p_db_column_name=>'MFGRG_BU'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Mfgrg Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889618851354500151)
,p_db_column_name=>'MFGRG_CC_CODE'
,p_display_order=>46
,p_column_identifier=>'AT'
,p_column_label=>'Mfgrg Cc Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889607795268500138)
,p_db_column_name=>'MFGRG_CHARGE_FLAG'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Mfgrg Charge Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889608226926500138)
,p_db_column_name=>'MFGRG_CHARGE_TYPE'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Mfgrg Charge Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889603740208500134)
,p_db_column_name=>'MFGRG_COST_TYPE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Mfgrg Cost Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889613354691500145)
,p_db_column_name=>'MFGRG_CRE_BY'
,p_display_order=>32
,p_column_identifier=>'AF'
,p_column_label=>'Mfgrg Cre By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889614629329500146)
,p_db_column_name=>'MFGRG_CRE_DATE'
,p_display_order=>35
,p_column_identifier=>'AI'
,p_column_label=>'Mfgrg Cre Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889616521014500149)
,p_db_column_name=>'MFGRG_CRE_EMP_ID'
,p_display_order=>40
,p_column_identifier=>'AN'
,p_column_label=>'Mfgrg Cre Emp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889613782859500146)
,p_db_column_name=>'MFGRG_CRE_IP_ADDR'
,p_display_order=>33
,p_column_identifier=>'AG'
,p_column_label=>'Mfgrg Cre Ip Addr'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889614204286500146)
,p_db_column_name=>'MFGRG_CRE_OS_USER'
,p_display_order=>34
,p_column_identifier=>'AH'
,p_column_label=>'Mfgrg Cre Os User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889606226663500137)
,p_db_column_name=>'MFGRG_CURRENT_ACCT'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Mfgrg Current Acct'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889602569625500131)
,p_db_column_name=>'MFGRG_DESC1'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Resource Group'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889602940056500132)
,p_db_column_name=>'MFGRG_DESC2'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Mfgrg Desc2'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889609358830500140)
,p_db_column_name=>'MFGRG_EFFICIENCY'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Efficiency %'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889602151988500131)
,p_db_column_name=>'MFGRG_GRP_ID'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Mfgrg Grp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889604171780500134)
,p_db_column_name=>'MFGRG_HRLY_RATE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Unit Rate'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889619644000500153)
,p_db_column_name=>'MFGRG_LOC_ID'
,p_display_order=>48
,p_column_identifier=>'AV'
,p_column_label=>'Mfgrg Loc Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889618123947500151)
,p_db_column_name=>'MFGRG_LVL5'
,p_display_order=>44
,p_column_identifier=>'AR'
,p_column_label=>'Mfgrg Lvl5'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889618435656500151)
,p_db_column_name=>'MFGRG_LVL6'
,p_display_order=>45
,p_column_identifier=>'AS'
,p_column_label=>'Mfgrg Lvl6'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889610976592500142)
,p_db_column_name=>'MFGRG_NEXT_ID_SOURCE'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Mfgrg Next Id Source'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889608608384500138)
,p_db_column_name=>'MFGRG_NO_OF_UNITS'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'No. Of Units'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889613021566500145)
,p_db_column_name=>'MFGRG_NO_OF_UNITS_INUSE'
,p_display_order=>31
,p_column_identifier=>'AE'
,p_column_label=>'No. Of Units In use'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889601743863500129)
,p_db_column_name=>'MFGRG_PLNT'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Unit'
,p_column_html_expression=>'<span title="#PLNT#">#MFGRG_PLNT#</span>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889609022564500138)
,p_db_column_name=>'MFGRG_RES_GRP_TYPE'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Mfgrg Res Grp Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889610554434500142)
,p_db_column_name=>'MFGRG_RES_NEXT_ID'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Mfgrg Res Next Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889603413798500134)
,p_db_column_name=>'MFGRG_RES_TYPE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Resource Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889611387878500142)
,p_db_column_name=>'MFGRG_SPIND_FRAME'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Mfgrg Spind Frame'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889611810785500142)
,p_db_column_name=>'MFGRG_SPIND_SPEED'
,p_display_order=>28
,p_column_identifier=>'AB'
,p_column_label=>'Mfgrg Spind Speed'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889607394176500137)
,p_db_column_name=>'MFGRG_SUB_ELEMENT'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Cost Sub Elmnt.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889612194043500143)
,p_db_column_name=>'MFGRG_TOT_SPIND'
,p_display_order=>29
,p_column_identifier=>'AC'
,p_column_label=>'Mfgrg Tot Spind'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889606968945500137)
,p_db_column_name=>'MFGRG_TRACK_PVTY'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Mfgrg Track Pvty'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889606616344500137)
,p_db_column_name=>'MFGRG_UOM'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'UOM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889615004736500148)
,p_db_column_name=>'MFGRG_UPD_BY'
,p_display_order=>36
,p_column_identifier=>'AJ'
,p_column_label=>'Mfgrg Upd By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889616125673500148)
,p_db_column_name=>'MFGRG_UPD_DATE'
,p_display_order=>39
,p_column_identifier=>'AM'
,p_column_label=>'Mfgrg Upd Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889616866033500149)
,p_db_column_name=>'MFGRG_UPD_EMP_ID'
,p_display_order=>41
,p_column_identifier=>'AO'
,p_column_label=>'Mfgrg Upd Emp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889615286288500148)
,p_db_column_name=>'MFGRG_UPD_IP_ADDR'
,p_display_order=>37
,p_column_identifier=>'AK'
,p_column_label=>'Mfgrg Upd Ip Addr'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889615676118500148)
,p_db_column_name=>'MFGRG_UPD_OS_USER'
,p_display_order=>38
,p_column_identifier=>'AL'
,p_column_label=>'Mfgrg Upd Os User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889609834467500140)
,p_db_column_name=>'MFGRG_UTILIZATION'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Utilization %'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889510219546411162)
,p_db_column_name=>'Overhead Rate'
,p_display_order=>78
,p_column_identifier=>'AY'
,p_column_label=>'Overhead Rate'
,p_column_link=>'f?p=&APP_ID.:367053902:&SESSION.::&DEBUG.:::'
,p_column_linktext=>'#Overhead Rate#'
,p_column_link_attr=>'Title=''Overhead Rate'''
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889509954586411160)
,p_db_column_name=>'PLNT'
,p_display_order=>58
,p_column_identifier=>'AW'
,p_column_label=>'Plnt'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889600974082500126)
,p_db_column_name=>'ROWID'
,p_display_order=>0
,p_column_identifier=>'A'
,p_column_label=>'ROWID'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5889510075337411161)
,p_db_column_name=>'Sub Element Desc.'
,p_display_order=>68
,p_column_identifier=>'AX'
,p_column_label=>'Sub Elmt.Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5889681242324574193)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4077195'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'MFGRG_PLNT:MFGRG_DESC1:MFGRG_RES_TYPE:MFGRG_SUB_ELEMENT:Sub Element Desc.:MFGRG_HRLY_RATE:MFGRG_UOM:MFGRG_NO_OF_UNITS:MFGRG_NO_OF_UNITS_INUSE:MFGRG_EFFICIENCY:MFGRG_UTILIZATION:Overhead Rate:Cre. Resource:AVAILABILITY'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5889620212402500153)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(5889600449693500123)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Mould/Core Box'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:367053901:&SESSION.::&DEBUG.:367053901::'
,p_icon_css_classes=>'fa-plus-circle'
);
wwv_flow_imp.component_end;
end;
/
