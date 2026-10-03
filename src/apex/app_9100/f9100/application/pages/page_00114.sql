prompt --application/pages/page_00114
begin
--   Manifest
--     PAGE: 00114
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
 p_id=>114
,p_name=>'OPEN PURCHASE REJECTION'
,p_alias=>'OPEN_PUR_REJ_NOTIFY'
,p_page_mode=>'MODAL'
,p_step_title=>'Open Purchase Rejection'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
' .a-IRR-table {',
'    border-collapse: collapse;',
'    table-layout: auto;',
'    border-spacing: 0;',
'    white-space: nowrap;',
'    word-wrap: break-word;',
'}',
'.a-IRR-headerLabel, .a-IRR-headerLink {',
'',
'    white-space: nowrap;',
'}',
' ',
'/*.a-IRR-table td {',
'',
'    white-space: nowrap;',
'}*/ ',
'#Clear{',
'   background-image: url(#APP_FILES#clearclear-removebg-preview.png);',
'   background-position: 0px 3px;',
'   background-repeat: no-repeat;',
'   background-color: rgba(0, 0, 0, 0.15);',
'   background-size: 25px;',
'   width: 25px;',
'   height: 22px;',
'}',
'#Clear1{',
'   background-image: url(#APP_FILES#clearclear-removebg-preview.png);',
'   background-position: 0px 3px;',
'   background-repeat: no-repeat;',
'   background-color: rgba(0, 0, 0, 0.15);',
'   background-size: 25px;',
'   width: 25px;',
'   height: 22px;',
'   top: -4px;',
'}',
'',
'.ui-button--danger, .t-Button--danger {',
'    --a-button-background-color: #e0e0e0;',
'    --a-button-text-color: #ef0808;',
'    --a-button-hover-background-color: #e0e0e0;',
'    --a-button-hover-text-color: var(--a-button-text-color);',
'    --a-button-active-background-color: #d50601;',
'    --a-button-active-text-color: var(--a-button-hover-text-color);',
'    --a-button-focus-background-color: var(--a-button-hover-background-color);',
'    --a-button-focus-text-color: var(--a-button-hover-text-color);',
'}',
'.t-Region-title {',
'    font-size: small;',
'    font-weight: bold;',
'    color: #003968;',
'}',
'.t-Button--simple.t-Button--hot, .t-Button--simple.t-Button--hot .t-Icon {',
'    color: white;',
'}',
'.t-Button--simple.t-Button--hot {',
'    box-shadow: 0 0 0 2px rgba(0, 0, 0, 0.15) inset;',
'    background-color: rgba(0, 0, 0, 0.15);',
'    border-radius: 4px;',
'}',
'',
'.t-Button--success {',
'    --a-button-background-color: #e0e0e0;',
'     --a-button-text-color: #047827; ',
'    --a-button-hover-background-color: #e0e0e0;',
'    --a-button-hover-text-color: var(--a-button-text-color);',
'    /* --a-button-active-background-color: #307323; */',
'     --a-button-active-background-color: #e0e0e0;',
'    --a-button-active-text-color: var(--a-button-hover-text-color);',
'    --a-button-focus-background-color: var(--a-button-hover-background-color);',
'    --a-button-focus-text-color: var(--a-button-hover-text-color);',
'}',
'',
'',
'',
'.t-Button--padRight, .u-RTL .t-Button--padLeft {',
'    margin-right: 8px!important;',
'}',
'',
'.t-Button--gapRight, .u-RTL .t-Button--gapLeft {',
'    margin-right: 16px!important;',
'}',
'',
'.t-Form-itemWrapper .a-Switch, .t-Form-itemWrapper .apex-item-group, .t-Form-itemWrapper .apex-item-icon, .t-Form-itemWrapper .apex-item-markdown-editor, .t-Form-itemWrapper .apex-item-single-checkbox, .t-Form-itemWrapper .ck-editor, .t-Form-itemWrap'
||'per fieldset {',
'    order: 2;',
'    border: #5e6087 !important;',
'}',
'',
'.t-Button--padLeft {',
'    margin-left: 8px!important;',
'}',
'.apex-icons-fontapex .fa {',
'    font-family: inherit!important;',
'    position: relative;',
'    font-weight: bold;',
'}',
'',
'.t-Region-headerItems--title {',
'    flex-grow: 1;',
'    flex-shrink: 0;',
'    flex-basis: auto;',
'    text-align: left;',
'    padding: 0.4rem;',
'    display: flex;',
'    align-items: center;',
'}',
'',
'#UI.t-Region {',
'    padding-right: 15px;',
'    padding-left: 15px;',
'    padding-top: 15px;',
'    padding-bottom: 15px;',
'}'))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1300'
,p_dialog_css_classes=>'my-custom-dialog no-close'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5558218572548066748)
,p_plug_name=>'OPEN PURCHASE REJECTION'
,p_static_id=>'open-purchase-rejection'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT sihd_bu,',
'             sihd_plnt_loc_id,',
'             sihd_plant,',
'             sihd_type,',
'             sihd_doc_no,',
'             sihd_doc_date,',
'             sihd_inv_date,',
'             sihd_inv_pfx,',
'             sihd_inv_no,',
'             sihd_cust_id,',
'             sihd_cust_name,',
'             sihd_pay_term,',
'             sihd_ship_via,',
'             sihd_price_term,',
'             sihd_terr_id,',
'             sihd_sub_terr_id,',
'             sihd_sales_area,',
'             sihd_sales_person,',
'             sihd_net_amt,',
'             sihd_gross_amt,',
'             sihd_tax_amt,',
'             sihd_tot_amt,',
'             DECODE(sihd_status,''N'',''Draft'',''E'',''Entry Completed'',''C'',''Cancelled'',''P'',''Picked'',''I'',''Invoiced'')STATUS,',
'             siln_seq_no,',
'             siln_prod_id,',
'             siln_prod_rev,',
'             siln_prod_desc1,',
'             siln_uom,',
'             siln_class,',
'             siln_prod_cls_desc,',
'             siln_sub_cls,',
'             siln_prod_subcls_desc,',
'             siln_inv_qty,',
'             siln_price,',
'             siln_disc_pct,',
'             siln_conv_factor,',
'             siln_hsn_code,',
'             siln_gst_exempt_flag,',
'             siln_gst_input_type,',
'             siln_gross_amt,',
'             siln_tax_amt,',
'             siln_net_amt,',
'             siln_store_id,',
'             ( SELECT store_desc1',
'                 FROM stores',
'                WHERE store_bu = :GLOBAL_BU',
'                  AND store_id = siln_store_id)STORE_DESC,',
'             sihd_cre_by,',
'         sihd_cre_emp_id,',
'         sihd_cre_ip_addr,',
'         sihd_cre_os_user,',
'             sihd_cre_date,',
'             sihd_upd_by,',
'             sihd_upd_date,',
'             sihd_sub_vou_type,',
'             siln_matl_type,',
'             siln_sal_acct_id,',
'             (SELECT glac_acct_desc1',
'                FROM gl_accts  ',
'               WHERE glac_bu = siln_bu ',
'                 AND glac_acct = siln_sal_acct_id) siln_sal_acct_desc,',
'             siln_sal_cc_id,',
'	     siln_cr_dr',
'	  FROM sales_invoices_hd,sales_invoices_ln',
' WHERE sihd_bu =:GLOBAL_bu',
'   AND sihd_bu = siln_bu',
'   AND sihd_doc_no = siln_doc_no',
'   AND sihd_status = ''N''',
'   --AND sihd_type =''PR''',
'   --AND sihd_sub_vou_type =''DNPR''',
'   AND sihd_vou_type = ''DN'''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'OPEN PURCHASE REJECTION'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(5558218681001066748)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>76256845457455720
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558219462815066820)
,p_db_column_name=>'SIHD_BU'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Sihd Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558237031542066871)
,p_db_column_name=>'SIHD_CRE_BY'
,p_display_order=>44
,p_column_identifier=>'AR'
,p_column_label=>'Sihd Cre By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558238583037066874)
,p_db_column_name=>'SIHD_CRE_DATE'
,p_display_order=>48
,p_column_identifier=>'AV'
,p_column_label=>'Sihd Cre Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558237396960066871)
,p_db_column_name=>'SIHD_CRE_EMP_ID'
,p_display_order=>45
,p_column_identifier=>'AS'
,p_column_label=>'Sihd Cre Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558237753548066873)
,p_db_column_name=>'SIHD_CRE_IP_ADDR'
,p_display_order=>46
,p_column_identifier=>'AT'
,p_column_label=>'Sihd Cre Ip Addr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558238175836066874)
,p_db_column_name=>'SIHD_CRE_OS_USER'
,p_display_order=>47
,p_column_identifier=>'AU'
,p_column_label=>'Sihd Cre Os User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558223068710066837)
,p_db_column_name=>'SIHD_CUST_ID'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Party '
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558223457469066838)
,p_db_column_name=>'SIHD_CUST_NAME'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Party Nmae'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558221464681066834)
,p_db_column_name=>'SIHD_DOC_DATE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Doc. Date'
,p_column_type=>'DATE'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558221044189066832)
,p_db_column_name=>'SIHD_DOC_NO'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558227097328066846)
,p_db_column_name=>'SIHD_GROSS_AMT'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Gross Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558221868257066834)
,p_db_column_name=>'SIHD_INV_DATE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'DN Date'
,p_column_type=>'DATE'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558222689930066837)
,p_db_column_name=>'SIHD_INV_NO'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'DN No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558222309212066835)
,p_db_column_name=>'SIHD_INV_PFX'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'DN Pfx.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558226715042066846)
,p_db_column_name=>'SIHD_NET_AMT'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Net Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558223878282066838)
,p_db_column_name=>'SIHD_PAY_TERM'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Sihd Pay Term'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558220250317066831)
,p_db_column_name=>'SIHD_PLANT'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558219867170066829)
,p_db_column_name=>'SIHD_PLNT_LOC_ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Loc. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558224638963066842)
,p_db_column_name=>'SIHD_PRICE_TERM'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Sihd Price Term'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558225914756066845)
,p_db_column_name=>'SIHD_SALES_AREA'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Sihd Sales Area'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558226304943066845)
,p_db_column_name=>'SIHD_SALES_PERSON'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Sihd Sales Person'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558224333095066840)
,p_db_column_name=>'SIHD_SHIP_VIA'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Sihd Ship Via'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558225510773066843)
,p_db_column_name=>'SIHD_SUB_TERR_ID'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Sihd Sub Terr Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558239716978066878)
,p_db_column_name=>'SIHD_SUB_VOU_TYPE'
,p_display_order=>51
,p_column_identifier=>'AY'
,p_column_label=>'Sihd Sub Vou Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558227439441066849)
,p_db_column_name=>'SIHD_TAX_AMT'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Tax Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558225050860066843)
,p_db_column_name=>'SIHD_TERR_ID'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Sihd Terr Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558227845903066849)
,p_db_column_name=>'SIHD_TOT_AMT'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Tot Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558220672257066832)
,p_db_column_name=>'SIHD_TYPE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558239005359066876)
,p_db_column_name=>'SIHD_UPD_BY'
,p_display_order=>49
,p_column_identifier=>'AW'
,p_column_label=>'Sihd Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558239240208066876)
,p_db_column_name=>'SIHD_UPD_DATE'
,p_display_order=>50
,p_column_identifier=>'AX'
,p_column_label=>'Sihd Upd Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558230726666066857)
,p_db_column_name=>'SILN_CLASS'
,p_display_order=>29
,p_column_identifier=>'AC'
,p_column_label=>'Siln Class'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558233812787066862)
,p_db_column_name=>'SILN_CONV_FACTOR'
,p_display_order=>36
,p_column_identifier=>'AJ'
,p_column_label=>'Siln Conv Factor'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558241689464066882)
,p_db_column_name=>'SILN_CR_DR'
,p_display_order=>56
,p_column_identifier=>'BD'
,p_column_label=>'Siln Cr Dr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558233335952066862)
,p_db_column_name=>'SILN_DISC_PCT'
,p_display_order=>35
,p_column_identifier=>'AI'
,p_column_label=>'Siln Disc Pct'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558235342814066865)
,p_db_column_name=>'SILN_GROSS_AMT'
,p_display_order=>40
,p_column_identifier=>'AN'
,p_column_label=>'Gross Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558234582957066863)
,p_db_column_name=>'SILN_GST_EXEMPT_FLAG'
,p_display_order=>38
,p_column_identifier=>'AL'
,p_column_label=>'Siln Gst Exempt Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558234937353066865)
,p_db_column_name=>'SILN_GST_INPUT_TYPE'
,p_display_order=>39
,p_column_identifier=>'AM'
,p_column_label=>'Siln Gst Input Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558234227185066863)
,p_db_column_name=>'SILN_HSN_CODE'
,p_display_order=>37
,p_column_identifier=>'AK'
,p_column_label=>'Siln Hsn Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558232309010066859)
,p_db_column_name=>'SILN_INV_QTY'
,p_display_order=>33
,p_column_identifier=>'AG'
,p_column_label=>'Inv. Qty.'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558240131473066879)
,p_db_column_name=>'SILN_MATL_TYPE'
,p_display_order=>52
,p_column_identifier=>'AZ'
,p_column_label=>'Siln Matl Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558236194351066867)
,p_db_column_name=>'SILN_NET_AMT'
,p_display_order=>42
,p_column_identifier=>'AP'
,p_column_label=>'Net Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558233027564066860)
,p_db_column_name=>'SILN_PRICE'
,p_display_order=>34
,p_column_identifier=>'AH'
,p_column_label=>'Price'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558231088986066857)
,p_db_column_name=>'SILN_PROD_CLS_DESC'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Siln Prod Cls Desc'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558229839147066854)
,p_db_column_name=>'SILN_PROD_DESC1'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Item Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558229127178066853)
,p_db_column_name=>'SILN_PROD_ID'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Item'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558229480102066854)
,p_db_column_name=>'SILN_PROD_REV'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Rev.'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558231879038066859)
,p_db_column_name=>'SILN_PROD_SUBCLS_DESC'
,p_display_order=>32
,p_column_identifier=>'AF'
,p_column_label=>'Siln Prod Subcls Desc'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558240886761066881)
,p_db_column_name=>'SILN_SAL_ACCT_DESC'
,p_display_order=>54
,p_column_identifier=>'BB'
,p_column_label=>'Siln Sal Acct Desc'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558240505547066879)
,p_db_column_name=>'SILN_SAL_ACCT_ID'
,p_display_order=>53
,p_column_identifier=>'BA'
,p_column_label=>'Siln Sal Acct Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558241308465066881)
,p_db_column_name=>'SILN_SAL_CC_ID'
,p_display_order=>55
,p_column_identifier=>'BC'
,p_column_label=>'Siln Sal Cc Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558228643498066853)
,p_db_column_name=>'SILN_SEQ_NO'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Line'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558236631906066870)
,p_db_column_name=>'SILN_STORE_ID'
,p_display_order=>43
,p_column_identifier=>'AQ'
,p_column_label=>'Store ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558231507910066859)
,p_db_column_name=>'SILN_SUB_CLS'
,p_display_order=>31
,p_column_identifier=>'AE'
,p_column_label=>'Siln Sub Cls'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558235739203066867)
,p_db_column_name=>'SILN_TAX_AMT'
,p_display_order=>41
,p_column_identifier=>'AO'
,p_column_label=>'Tax Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558230272185066856)
,p_db_column_name=>'SILN_UOM'
,p_display_order=>28
,p_column_identifier=>'AB'
,p_column_label=>'Uom'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558344958173210629)
,p_db_column_name=>'STATUS'
,p_display_order=>66
,p_column_identifier=>'BE'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5558345115848210630)
,p_db_column_name=>'STORE_DESC'
,p_display_order=>76
,p_column_identifier=>'BF'
,p_column_label=>'Store Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5558242145528069437)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'762804'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'SIHD_PLNT_LOC_ID:SIHD_PLANT:SIHD_TYPE:SIHD_DOC_NO:SIHD_DOC_DATE:SIHD_INV_DATE:SIHD_INV_PFX:SIHD_INV_NO:SIHD_CUST_ID:SIHD_CUST_NAME:SILN_PROD_ID:SILN_PROD_REV:SILN_PROD_DESC1:SILN_SEQ_NO:SILN_UOM:SILN_INV_QTY:SILN_PRICE:SILN_GROSS_AMT:SILN_TAX_AMT:SIL'
||'N_NET_AMT:SILN_STORE_ID:STORE_DESC:STATUS'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5883180881873861850)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(5558218572548066748)
,p_button_name=>'New'
,p_static_id=>'new'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5883180980119861851)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5883180881873861850)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5883181092676861852)
,p_event_id=>wwv_flow_imp.id(5883180980119861851)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-close'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp.component_end;
end;
/
