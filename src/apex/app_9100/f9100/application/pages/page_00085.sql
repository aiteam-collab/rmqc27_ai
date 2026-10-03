prompt --application/pages/page_00085
begin
--   Manifest
--     PAGE: 00085
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
 p_id=>85
,p_name=>'OTP/Mail Log'
,p_alias=>'OTP-MAIL-LOG'
,p_step_title=>'OTP/Mail Log'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>'slideclose();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* .a-IRR-headerLink, .a-IRR-headerLink:hover {',
'',
'    background: #00b1e7 !important;',
'} */',
'',
'.a-IRR-table {',
'      border-collapse: collapse;',
'      table-layout: auto;',
'      border-spacing: 0;',
'      white-space: nowrap;',
'      word-wrap: break-word;',
'}',
'',
' .t-fht-thead {',
'    overflow: auto !important;',
' }',
''))
,p_step_template=>wwv_flow_imp.id(5950304360493412392)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6083149466835499543)
,p_plug_name=>'OTP Details'
,p_static_id=>'otp-details'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT * ',
'  FROM',
'      (SELECT od_user,',
'              appluser_emp_id emp_id,',
'              (SELECT INITCAP(emp_first_name1) ',
'                 FROM employees',
'                WHERE emp_bu = appluser_bu',
'                  AND emp_emp_id = appluser_emp_id) emp_name,',
'              od_otp,',
'              to_char(od_otp_valid_from,''DD-MM-YYYY HH:MI AM'')od_otp_valid_from,',
'              to_char(od_otp_valid_to,''DD-MM-YYYY HH:MI AM'')od_otp_valid_to,',
'              decode(od_type,''LOGIN'',''Login Authentication'',''RESET'',''Reset Password'',''UNAME'',''Username Retreival'')od_type,',
'              decode(od_otp_source,''S'',''SMS'',''M'',''Mail'',''B'',''Mail/SMS'',''D'',''Details'')od_otp_source,',
'              decode(od_otp_source,''S'',''Green'',''M'',''Orange'',''B'',''Blue'',''D'',''Brown'')colur,',
'              od_rev_mob_no,',
'              od_rev_mail,',
'              od_otp_valid_from doc_date,',
'              od_device_type,',
'              od_application,',
'              od_no_of_attempts,',
'              od_ip_address,',
'              DECODE(od_status,''S'',''SUCCESS'',''F'',''FAILURE'',''X'',''SENT'')OD_STATUS,',
'              DECODE(od_status,''S'',''Green'',''F'',''RED'',''X'',''Brown'')color,',
'              od_failure_reason,',
'			  TO_CHAR(od_dob, ''DD.MM.YYYY'') od_dob,',
'			  od_yoj,',
'			  od_dl_adr_pan',
'         FROM otp_details,appl_users',
'        WHERE od_user = appluser_id',
'          AND appluser_emp_id IN (SELECT emp_emp_id ',
'                                    FROM employees',
'                                   WHERE emp_bu     = :GLOBAL_bu',
'                                     AND emp_status = ''A'')',
'   UNION ALL',
'  SELECT odh_user,',
'         appluser_emp_id emp_id,',
'         (SELECT emp_first_name1 ',
'            FROM employees',
'           WHERE emp_bu     = appluser_bu',
'             AND emp_emp_id = appluser_emp_id ) emp_name,',
'         odh_otp,',
'         to_char(odh_otp_valid_from,''DD-MM-YYYY HH:MI AM'')odh_otp_valid_from,',
'         to_char(odh_otp_valid_to,''DD-MM-YYYY HH:MI AM'')odh_otp_valid_to,',
'         decode(odh_type,''LOGIN'',''Login Authentication'',''RESET'',''Reset Password'',''UNAME'',''Username Retreival'')odh_type,',
'         decode(odh_otp_source,''S'',''SMS'',''M'',''Mail'',''B'',''Mail/SMS'',''D'',''Details'') odh_otp_source,',
'         decode(odh_otp_source,''S'',''Green'',''M'',''Orange'',''B'',''Blue'',''D'',''Brown'')colur,',
'         odh_rev_mob_no,',
'         odh_rev_mail,',
'         odh_otp_valid_from doc_date,',
'         odh_device_type,',
'         odh_application,',
'         odh_no_of_attempts,',
'         odh_ip_address,',
'         DECODE(ODH_STATUS,''S'',''SUCCESS'',''F'',''FAILURE'',''X'',''SENT'')odh_status,',
'         DECODE(ODH_STATUS,''S'',''Green'',''F'',''RED'',''X'',''Brown'')color,',
'         odh_failure_reason,',
'		 TO_CHAR(odh_dob, ''DD.MM.YYYY'') odh_dob,',
'		 odh_yoj,',
'		 odh_dl_adr_pan		 ',
'    FROM otp_details_hist,appl_users',
'   WHERE odh_user = appluser_id',
'     AND appluser_emp_id IN (SELECT emp_emp_id ',
'                               FROM employees',
'                              WHERE emp_bu = :GLOBAL_bu',
'                                AND emp_status = ''A''))',
'   WHERE od_user IN (SELECT appluser_id ',
'              	        FROM appl_users ',
'             	       WHERE appluser_bu     = :GLOBAL_bu ',
'               	      AND appluser_status = ''A'')',
'   ORDER BY doc_date DESC ;'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'OTP Details'
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
 p_id=>wwv_flow_imp.id(6083149631100499544)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No Data Found'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>601187795556888516
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6971629230634328070)
,p_db_column_name=>'COLOR'
,p_display_order=>190
,p_column_identifier=>'T'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5746966907035836032)
,p_db_column_name=>'COLUR'
,p_display_order=>200
,p_column_identifier=>'U'
,p_column_label=>'Colur'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6192953708367721070)
,p_db_column_name=>'DOC_DATE'
,p_display_order=>120
,p_column_identifier=>'M'
,p_column_label=>'Doc Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6083150732936499555)
,p_db_column_name=>'EMP_ID'
,p_display_order=>30
,p_column_identifier=>'K'
,p_column_label=>'Emp. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6083150793234499556)
,p_db_column_name=>'EMP_NAME'
,p_display_order=>40
,p_column_identifier=>'L'
,p_column_label=>'Emp. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6274476295638389563)
,p_db_column_name=>'OD_APPLICATION'
,p_display_order=>140
,p_column_identifier=>'O'
,p_column_label=>' Application'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6274476229977389562)
,p_db_column_name=>'OD_DEVICE_TYPE'
,p_display_order=>130
,p_column_identifier=>'N'
,p_column_label=>'Device Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5757827508570772654)
,p_db_column_name=>'OD_DL_ADR_PAN'
,p_display_order=>230
,p_column_identifier=>'X'
,p_column_label=>'DL/ Aadhaar/ PAN'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5757827597743772655)
,p_db_column_name=>'OD_DOB'
,p_display_order=>240
,p_column_identifier=>'Y'
,p_column_label=>'Date of Birth'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6274476691869389567)
,p_db_column_name=>'OD_FAILURE_REASON'
,p_display_order=>180
,p_column_identifier=>'S'
,p_column_label=>' Reason'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6274476510961389565)
,p_db_column_name=>'OD_IP_ADDRESS'
,p_display_order=>160
,p_column_identifier=>'Q'
,p_column_label=>'IP Address'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6274476433078389564)
,p_db_column_name=>'OD_NO_OF_ATTEMPTS'
,p_display_order=>150
,p_column_identifier=>'P'
,p_column_label=>' Atmpts.'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6083149817283499546)
,p_db_column_name=>'OD_OTP'
,p_display_order=>10
,p_column_identifier=>'B'
,p_column_label=>'OTP'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6083150174163499550)
,p_db_column_name=>'OD_OTP_SOURCE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'OTP Source'
,p_column_html_expression=>'<div style="color:#COLUR#; font-weight:bold;">#OD_OTP_SOURCE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6083150517988499553)
,p_db_column_name=>'OD_OTP_VALID_FROM'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Valid From'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6083150563494499554)
,p_db_column_name=>'OD_OTP_VALID_TO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Valid To'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6083150372334499552)
,p_db_column_name=>'OD_REV_MAIL'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Mail'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6083150295484499551)
,p_db_column_name=>'OD_REV_MOB_NO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Mob. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6274476596123389566)
,p_db_column_name=>'OD_STATUS'
,p_display_order=>170
,p_column_identifier=>'R'
,p_column_label=>'Status'
,p_column_html_expression=>'<div style="color:#COLOR#; font-weight:bold;">#OD_STATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6083150076050499549)
,p_db_column_name=>'OD_TYPE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6083149674464499545)
,p_db_column_name=>'OD_USER'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>'User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5757827399067772653)
,p_db_column_name=>'OD_YOJ'
,p_display_order=>220
,p_column_identifier=>'W'
,p_column_label=>'Year of Joining'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6221895985572145228)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'7399342'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'OD_USER:EMP_ID:EMP_NAME:OD_TYPE:OD_OTP_SOURCE:OD_DEVICE_TYPE:OD_APPLICATION:OD_REV_MOB_NO:OD_REV_MAIL:OD_OTP_VALID_FROM:OD_OTP_VALID_TO:OD_IP_ADDRESS:OD_STATUS:OD_DOB:OD_YOJ:OD_DL_ADR_PAN'
);
wwv_flow_imp.component_end;
end;
/
