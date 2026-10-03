prompt --application/pages/page_00115
begin
--   Manifest
--     PAGE: 00115
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
 p_id=>115
,p_name=>'Waiting for Approval(Quotation)'
,p_alias=>'WAITING-FOR-APPROVAL-QUOTATION'
,p_page_mode=>'MODAL'
,p_step_title=>'Waiting for Approval(Quotation)'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
' .a-IRR-table {',
'           border-collapse: collapse;',
'           table-layout: auto;',
'           border-spacing: 0;',
'           white-space: nowrap;',
'           word-wrap: break-word;',
'       }',
''))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1300'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8229251797038153277)
,p_plug_name=>'Quotation'
,p_static_id=>'quotation'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'     SELECT  sqh_bu,',
'             sqh_plnt_loc_id,',
'             sqh_plant,',
'             sqh_quote_pfx,',
'             sqh_quote_no,',
'             sqh_quote_sfx,',
'             TO_CHAR (sqh_quote_date, :GLOBAL_RPT_DATE_MASK) quote_date,',
'             decode(sqh_cust_type,''C'',''Customer'',''L'',''Lead'')sqh_cust_type,',
'             sqh_cust_name,',
'             sqh_curcy_id,',
'             sqh_exchange_rate,',
'             sqh_sales_person,',
'                 (SELECT sp_person_name1',
'                    FROM sales_persons',
'                    WHERE sp_bu = :GLOBAL_bu AND sp_person = sqh_sales_person)sales_person,',
'             sqh_sales_area,',
'             func_find_sale_area_qry_desc(sqh_bu,sqh_sales_area,1)"Sales Area",',
'             sqh_shipvia_id,',
'                (SELECT sv_desc1',
'                   FROM ship_vias',
'                  WHERE sv_bu = sqh_bu AND sv_shipvia_id = sqh_shipvia_id)ship_via, ',
'             (SELECT fob_desc1',
'                FROM fobs',
'               WHERE fob_bu = sqh_bu AND fob_fob_id = sqh_fob_id)fob_desc,',
'             sqh_term_id,',
'             (SELECT term_desc1',
'                FROM terms_hd',
'                WHERE term_bu = sqh_bu AND term_term_id = sqh_term_id AND term_status = ''A'')payment_term,',
'             sqh_validity_days,',
'             TO_CHAR (sqh_validity_date, :GLOBAL_RPT_DATE_MASK) validity_date,',
'             sqh_sub_terr_id,',
'              func_find_sub_terr_qry_desc (sqh_bu,sqh_sub_terr_id,1)"Sub Terr.",',
'             sqh_terr_id,',
'             func_find_territory_qry_desc(sqh_bu,sqh_terr_id,1)Territory,',
'             sqh_quote_stage,',
'             sqh_div_id,',
'             sqh_sub_div_id,',
'             sqh_dealer_id,',
'                    DECODE (sqh_status,',
'               ''N'', ''Draft'',',
'               ''S'', ''Approved'',',
'               ''C'', ''Cancelled'',',
'               ''E'', ''Closed'' ,',
'               ''O'', ''Order'',',
'               ''R'', ''Reversed'',',
'               ''T'', ''Entry Completed'')',
'          Status,',
'       DECODE (sqh_status,',
'               ''N'', ''blue'',',
'               ''S'', ''green'',',
'               ''O'', ''cornflowerblue'',',
'               ''R'', ''brown'',',
'               ''A'', ''green'',',
'               ''C'', ''red'',',
'               ''E'', ''red'',',
'               ''L'', ''red'',',
'               ''T'', ''teal'')',
'          color,',
'             sql_seq_no,',
'             sql_prod_id,',
'             sql_prod_rev,',
'             sql_prod_desc1,',
'             sql_prod_uom,',
'             sql_quote_qty,',
'             sql_disc_pct,',
'             sql_cc_price,',
'             sql_tax_set_id,',
'             sql_grade_id,',
'             sql_size_id,',
'             sql_mat_spec,',
'             sqh_appr_by,',
'             sqh_appr_date,',
'            ''SQ'' GLOBAL_SUB_VOU',
'        FROM so_quote_hd, so_quote_ln',
'       WHERE sqh_bu = sql_bu',
'         AND sqh_quote_pfx = sql_quote_pfx',
'         AND sqh_quote_no = sql_quote_no',
'         AND sqh_quote_sfx = sql_quote_sfx',
'         AND sqh_bu = :global_bu',
'         AND sqh_status = ''T''',
'ORDER BY sqh_quote_date DESC ,sqh_quote_no Desc   ',
'',
''))
,p_plug_source_type=>'NATIVE_IR'
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
 p_id=>wwv_flow_imp.id(8229251849836153278)
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
,p_internal_uid=>2747290014292542250
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528402128567340852)
,p_db_column_name=>'COLOR'
,p_display_order=>1730
,p_column_identifier=>'AH'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528401437911340846)
,p_db_column_name=>'FOB_DESC'
,p_display_order=>1670
,p_column_identifier=>'AB'
,p_column_label=>'Fob Desc'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528403351782340865)
,p_db_column_name=>'GLOBAL_SUB_VOU'
,p_display_order=>1860
,p_column_identifier=>'AU'
,p_column_label=>'Global Sub Vou'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528401583006340847)
,p_db_column_name=>'PAYMENT_TERM'
,p_display_order=>1680
,p_column_identifier=>'AC'
,p_column_label=>'Payment Term'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528401098072340842)
,p_db_column_name=>'QUOTE_DATE'
,p_display_order=>1630
,p_column_identifier=>'X'
,p_column_label=>'Quote Date'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528401198074340843)
,p_db_column_name=>'SALES_PERSON'
,p_display_order=>1640
,p_column_identifier=>'Y'
,p_column_label=>'Sales Person'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528401433122340845)
,p_db_column_name=>'SHIP_VIA'
,p_display_order=>1660
,p_column_identifier=>'AA'
,p_column_label=>'Ship Via'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528400186848340833)
,p_db_column_name=>'SQH_APPR_BY'
,p_display_order=>1550
,p_column_identifier=>'U'
,p_column_label=>'Approved By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528400498432340836)
,p_db_column_name=>'SQH_APPR_DATE'
,p_display_order=>1580
,p_column_identifier=>'V'
,p_column_label=>'Approved Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528384818843340729)
,p_db_column_name=>'SQH_BU'
,p_display_order=>10
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Sqh Bu'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528386244357340744)
,p_db_column_name=>'SQH_CURCY_ID'
,p_display_order=>160
,p_column_identifier=>'G'
,p_column_label=>'Curcy.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528386191631340743)
,p_db_column_name=>'SQH_CUST_NAME'
,p_display_order=>150
,p_column_identifier=>'F'
,p_column_label=>'Customer'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528385987004340741)
,p_db_column_name=>'SQH_CUST_TYPE'
,p_display_order=>130
,p_column_identifier=>'E'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528392176945340753)
,p_db_column_name=>'SQH_DEALER_ID'
,p_display_order=>750
,p_column_identifier=>'T'
,p_column_label=>'Sqh Dealer Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528391737521340749)
,p_db_column_name=>'SQH_DIV_ID'
,p_display_order=>710
,p_column_identifier=>'R'
,p_column_label=>'Sqh Div Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528386398801340745)
,p_db_column_name=>'SQH_EXCHANGE_RATE'
,p_display_order=>170
,p_column_identifier=>'H'
,p_column_label=>'Ex. Rate'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528390691699340738)
,p_db_column_name=>'SQH_PLANT'
,p_display_order=>600
,p_column_identifier=>'Q'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528400860405340840)
,p_db_column_name=>'SQH_PLNT_LOC_ID'
,p_display_order=>1620
,p_column_identifier=>'W'
,p_column_label=>'Loc. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528385023395340731)
,p_db_column_name=>'SQH_QUOTE_NO'
,p_display_order=>30
,p_is_primary_key=>'Y'
,p_column_identifier=>'C'
,p_column_label=>'Quote No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528384842363340730)
,p_db_column_name=>'SQH_QUOTE_PFX'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Quote Pfx.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528385135209340732)
,p_db_column_name=>'SQH_QUOTE_SFX'
,p_display_order=>40
,p_is_primary_key=>'Y'
,p_column_identifier=>'D'
,p_column_label=>'Quote Sfx.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528388173047340763)
,p_db_column_name=>'SQH_QUOTE_STAGE'
,p_display_order=>350
,p_column_identifier=>'P'
,p_column_label=>'Sqh Quote Stage'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528386613614340747)
,p_db_column_name=>'SQH_SALES_AREA'
,p_display_order=>190
,p_column_identifier=>'J'
,p_column_label=>'Sales Area'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528386532238340746)
,p_db_column_name=>'SQH_SALES_PERSON'
,p_display_order=>180
,p_column_identifier=>'I'
,p_column_label=>'Sales Person'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528386693331340748)
,p_db_column_name=>'SQH_SHIPVIA_ID'
,p_display_order=>200
,p_column_identifier=>'K'
,p_column_label=>'Shipvia'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528391978894340751)
,p_db_column_name=>'SQH_SUB_DIV_ID'
,p_display_order=>730
,p_column_identifier=>'S'
,p_column_label=>'Sqh Sub Div Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528387625480340757)
,p_db_column_name=>'SQH_SUB_TERR_ID'
,p_display_order=>290
,p_column_identifier=>'N'
,p_column_label=>'Sub Terr.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528386849403340750)
,p_db_column_name=>'SQH_TERM_ID'
,p_display_order=>220
,p_column_identifier=>'L'
,p_column_label=>'Payment Term'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528387699555340758)
,p_db_column_name=>'SQH_TERR_ID'
,p_display_order=>300
,p_column_identifier=>'O'
,p_column_label=>'Territory'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528386958983340751)
,p_db_column_name=>'SQH_VALIDITY_DAYS'
,p_display_order=>230
,p_column_identifier=>'M'
,p_column_label=>'Validity Days'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528402922562340860)
,p_db_column_name=>'SQL_CC_PRICE'
,p_display_order=>1810
,p_column_identifier=>'AP'
,p_column_label=>'Price'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528402792136340859)
,p_db_column_name=>'SQL_DISC_PCT'
,p_display_order=>1800
,p_column_identifier=>'AO'
,p_column_label=>'Disc %'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528403096934340862)
,p_db_column_name=>'SQL_GRADE_ID'
,p_display_order=>1830
,p_column_identifier=>'AR'
,p_column_label=>'Sql Grade Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528403281746340864)
,p_db_column_name=>'SQL_MAT_SPEC'
,p_display_order=>1850
,p_column_identifier=>'AT'
,p_column_label=>'Sql Mat Spec'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528402522652340856)
,p_db_column_name=>'SQL_PROD_DESC1'
,p_display_order=>1770
,p_column_identifier=>'AL'
,p_column_label=>'Item Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528402242370340854)
,p_db_column_name=>'SQL_PROD_ID'
,p_display_order=>1750
,p_column_identifier=>'AJ'
,p_column_label=>'Item'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528402402783340855)
,p_db_column_name=>'SQL_PROD_REV'
,p_display_order=>1760
,p_column_identifier=>'AK'
,p_column_label=>'Rev.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528402608823340857)
,p_db_column_name=>'SQL_PROD_UOM'
,p_display_order=>1780
,p_column_identifier=>'AM'
,p_column_label=>'UOM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528402696074340858)
,p_db_column_name=>'SQL_QUOTE_QTY'
,p_display_order=>1790
,p_column_identifier=>'AN'
,p_column_label=>'Quote Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528402222858340853)
,p_db_column_name=>'SQL_SEQ_NO'
,p_display_order=>1740
,p_column_identifier=>'AI'
,p_column_label=>'Seq No.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528403208303340863)
,p_db_column_name=>'SQL_SIZE_ID'
,p_display_order=>1840
,p_column_identifier=>'AS'
,p_column_label=>'Sql Size Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528402941870340861)
,p_db_column_name=>'SQL_TAX_SET_ID'
,p_display_order=>1820
,p_column_identifier=>'AQ'
,p_column_label=>'Sql Tax Set Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528402031354340851)
,p_db_column_name=>'STATUS'
,p_display_order=>1720
,p_column_identifier=>'AG'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528401328525340844)
,p_db_column_name=>'Sales Area'
,p_display_order=>1650
,p_column_identifier=>'Z'
,p_column_label=>'Sales Area'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528401812131340849)
,p_db_column_name=>'Sub Terr.'
,p_display_order=>1700
,p_column_identifier=>'AE'
,p_column_label=>'Sub Terr.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528401888454340850)
,p_db_column_name=>'TERRITORY'
,p_display_order=>1710
,p_column_identifier=>'AF'
,p_column_label=>'Territory'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5528401669716340848)
,p_db_column_name=>'VALIDITY_DATE'
,p_display_order=>1690
,p_column_identifier=>'AD'
,p_column_label=>'Validity Date'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5528451008355387448)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'464892'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'SQH_PLNT_LOC_ID:SQH_PLANT:SQH_QUOTE_PFX:SQH_QUOTE_NO:SQH_QUOTE_SFX:QUOTE_DATE:SQH_CUST_TYPE:SQH_CUST_NAME:SQH_CURCY_ID:SQH_EXCHANGE_RATE:SALES_PERSON:Sales Area:SHIP_VIA:STATUS:PAYMENT_TERM:SQH_VALIDITY_DAYS:VALIDITY_DATE:Sub Terr.:TERRITORY:SQL_SEQ_'
||'NO:SQL_PROD_ID:SQL_PROD_REV:SQL_PROD_DESC1:SQL_QUOTE_QTY:SQL_CC_PRICE:SQL_DISC_PCT:SQH_APPR_BY'
);
wwv_flow_imp.component_end;
end;
/
