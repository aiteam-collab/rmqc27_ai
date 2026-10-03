CREATE OR REPLACE
"package aop_api18_pkg
"
"AUTHID CURRENT_USER
"
"as
"
"/* Copyright 2015-2018 - APEX RnD
"
"*/
"
"-- CONSTANTS
"
"
"
"/* AOP Version */
"
"c_aop_version               constant varchar2(5)  := '18.2';                                 -- The version of APEX Office Print (AOP)
"
"c_aop_url                   constant varchar2(50) := 'http://api.apexofficeprint.com/';      -- The default url for the AOP Server
"
"                                                                                             -- for https use https://api.apexofficeprint.com/
"
"                                                                                             -- alternative https url https://www.apexrnd.be/aop/
"
"c_aop_url_fallback          constant varchar2(50) := 'http://www.cloudofficeprint.com/aop/'; -- The default url for the AOP Fallback Server in case the c_aop_url would fail
"
"                                                                                             -- for https use https://www.cloudofficeprint.com/aop/
"
"-- Available constants
"
"-- Template and Data Type
"
"c_source_type_apex          constant varchar2(4)  := 'APEX';      -- Template Type
"
"c_source_type_workspace     constant varchar2(9)  := 'WORKSPACE'; -- Template Type
"
"c_source_type_sql           constant varchar2(3)  := 'SQL';       -- Template and Data Type
"
"c_source_type_plsql_sql     constant varchar2(9)  := 'PLSQL_SQL'; -- Template and Data Type
"
"c_source_type_plsql         constant varchar2(5)  := 'PLSQL';     -- Template and Data Type
"
"c_source_type_url           constant varchar2(3)  := 'URL';       -- Template and Data Type
"
"c_source_type_rpt           constant varchar2(6)  := 'IR';        -- Data Type
"
"c_source_type_filename      constant varchar2(8)  := 'FILENAME';  -- Template Type
"
"-- Converter
"
"c_source_type_converter     constant varchar2(9)  := 'CONVERTER';
"
"-- Mime Type
"
"c_mime_type_docx            constant varchar2(71) := 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
"
"c_mime_type_xlsx            constant varchar2(65) := 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
"
"c_mime_type_pptx            constant varchar2(73) := 'application/vnd.openxmlformats-officedocument.presentationml.presentation';
"
"c_mime_type_pdf             constant varchar2(15) := 'application/pdf';
"
"c_mime_type_html            constant varchar2(9)  := 'text/html';
"
"c_mime_type_markdown        constant varchar2(13) := 'text/markdown';
"
"c_mime_type_rtf             constant varchar2(15) := 'application/rtf';
"
"c_mime_type_json            constant varchar2(16) := 'application/json';
"
"c_mime_type_text            constant varchar2(10) := 'text/plain';
"
"c_mime_type_csv             constant varchar2(10) := 'text/csv';
"
"c_mime_type_png             constant varchar2(9)  := 'image/png';
"
"c_mime_type_jpg             constant varchar2(10) := 'image/jpeg';
"
"c_mime_type_gif             constant varchar2(9)  := 'image/gif';
"
"c_mime_type_bmp             constant varchar2(9)  := 'image/bmp';
"
"c_mime_type_msbmp           constant varchar2(19) := 'image/x-windows-bmp';
"
"-- Output Encoding
"
"c_output_encoding_raw       constant varchar2(3)  := 'raw';
"
"c_output_encoding_base64    constant varchar2(6)  := 'base64';
"
"-- Output Type
"
"c_word_docx                 constant varchar2(4)  := 'docx';
"
"c_excel_xlsx                constant varchar2(4)  := 'xlsx';
"
"c_powerpoint_pptx           constant varchar2(4)  := 'pptx';
"
"c_pdf_pdf                   constant varchar2(3)  := 'pdf';
"
"c_html_html                 constant varchar2(4)  := 'html';
"
"c_markdown_md               constant varchar2(2)  := 'md';
"
"c_text_txt                  constant varchar2(3)  := 'txt';
"
"c_csv_csv                   constant varchar2(3)  := 'csv';
"
"c_word_rtf                  constant varchar2(3)  := 'rtf';
"
"c_onepagepdf_pdf            constant varchar2(10) := 'onepagepdf';
"
"c_count_tags                constant varchar2(10)  := 'count_tags';
"
"c_defined_by_apex_item      constant varchar2(9)  := 'apex_item';
"
"-- Output To
"
"c_output_browser            constant varchar2(1)  := null;
"
"c_output_procedure          constant varchar2(9)  := 'PROCEDURE';
"
"c_output_procedure_browser  constant varchar2(17) := 'PROCEDURE_BROWSER';
"
"c_output_inline             constant varchar2(14) := 'BROWSER_INLINE';
"
"c_output_directory          constant varchar2(9)  := 'DIRECTORY';
"
"c_output_cloud              constant varchar2(5)  := 'CLOUD';
"
"-- Special
"
"c_special_number_as_string  constant varchar2(16) := 'NUMBER_TO_STRING';
"
"c_special_report_as_label   constant varchar2(16) := 'REPORT_AS_LABELS';
"
"c_special_ir_filters_top    constant varchar2(14) := 'FILTERS_ON_TOP';
"
"c_special_ir_highlights_top constant varchar2(17) := 'HIGHLIGHTS_ON_TOP';
"
"c_special_ir_excel_header_f constant varchar2(18) := 'HEADER_WITH_FILTER';
"
"c_special_ir_saved_report   constant varchar2(19) := 'ALWAYS_REPORT_ALIAS';
"
"c_special_ir_repeat_header  constant varchar2(13) := 'repeat_header';
"
"-- Debug
"
"c_debug_remote              constant varchar2(3)  := 'Yes';
"
"c_debug_local               constant varchar2(5)  := 'Local';
"
"c_debug_application_item    constant varchar2(9)  := 'APEX_ITEM';
"
"-- Converter
"
"c_converter_libreoffice     constant varchar2(1)  := null;           -- LibreOffice is the default converter
"
"c_converter_msoffice        constant varchar2(11) := 'officetopdf';  -- MS Office on Windows
"
"c_converter_custom          constant varchar2(7)  := 'custom';       -- Custom converter defined in the AOP Server config
"
"/* Strings */
"
"c_init_null                 constant varchar2(5)  := 'null;';
"
"c_false                     constant varchar2(5)  := 'false';
"
"c_true                      constant varchar2(4)  := 'true';
"
"c_yes                       constant varchar2(3)  := 'Yes';
"
"c_no                        constant varchar2(2)  := 'No';
"
"c_y                         constant varchar2(1)  := 'Y';
"
"c_n                         constant varchar2(1)  := 'N';
"
"/* Internal Use for conditional compilation */
"
"c_apex_050                  constant pls_integer  := 20130101;
"
"c_apex_051                  constant pls_integer  := 20160824;
"
"c_apex_181                  constant pls_integer  := 20180404;
"
"-- TYPES
"
"/**
"
" * @types
"
" */
"
"--type t_bind_record is record(name varchar2(100), value varchar2(32767));
"
"--type t_bind_table  is table of t_bind_record index by pls_integer;
"
"c_binds wwv_flow_plugin_util.t_bind_list;
"
"-- VARIABLES
"
"-- Logger
"
"g_logger_enabled            boolean := true;        -- In case you use Logger (https://github.com/OraOpenSource/Logger), you can compile this package to enable Logger output:
"
"                                                    -- SQL> ALTER PACKAGE aop_api18_pkg COMPILE PLSQL_CCFLAGS = 'logger_on:TRUE';
"
"                                                    -- When compiled and this global variable is set to true, debug will be written to logger too
"
"-- Call to AOP
"
"g_aop_url                   varchar2(100) := null;  -- AOP Server url
"
"g_api_key                   varchar2(50)  := null;  -- AOP API Key; only needed when AOP Cloud is used (http(s)://www.apexofficeprint.com/api)
"
"g_failover_aop_url          varchar2(100) := null;  -- AOP Server url in case of failure of AOP url
"
"g_failover_procedure        varchar2(200) := null;  -- When the failover url is used, the procedure specified in this variable will be called
"
"g_output_converter          varchar2(50)  := null;  -- Set the converter to go to PDF (or other format different from template) e.g. officetopdf or libreoffice
"
"g_proxy_override            varchar2(300) := null;  -- null=proxy defined in the application attributes
"
"g_transfer_timeout          number(6)     := 1800;  -- default of APEX is 180
"
"g_wallet_path               varchar2(300) := null;  -- null=defined in Manage Instance > Instance Settings
"
"g_wallet_pwd                varchar2(300) := null;  -- null=defined in Manage Instance > Instance Settings
"
"g_output_filename           varchar2(100) := null;  -- output
"
"g_cloud_provider            varchar2(30)  := null;  -- dropbox, gdrive, onedrive, aws_s3
"
"g_cloud_location            varchar2(300) := null;  -- directory in dropbox, gdrive, onedrive, aws_s3 (with bucket)
"
"g_cloud_access_token        varchar2(500) := null;  -- access token for dropbox, gdrive, onedrive, aws_s3 (needs json)
"
"g_language                  varchar2(2)   := 'en';  -- Language can be: en, fr, nl, de, used for the translation of filters applied etc. (translation build-in AOP)
"
"g_app_language              varchar2(20)  := null;  -- Language specified in the APEX app (primary language, translated language), when left to null, apex_util.get_session_lang is being used
"
"g_logging                   clob          := '';    -- ability to add your own logging: e.g. ""request_id"":""123"", ""request_app"":""APEX"", ""request_user"":""RND""
"
"g_debug                     varchar2(10)  := null;  -- set to 'Local' when only the JSON needs to be generated, 'Remote' for remore debug
"
"g_debug_procedure           varchar2(4000):= null;  -- when debug in APEX is turned on, next to the normal APEX debug, this procedure will be called
"
"                                                    --   e.g. to write to your own debug table. The definition of the procedure needs to be the same as aop_debug
"
"-- APEX Page Items
"
"g_apex_items                varchar2(4000):= null;  -- colon separated list of APEX items e.g. P1_X:P1_Y, which can be referenced in a template using {Pxx_ITEM}
"
"-- Layout for IR
"
"g_rpt_header_font_name      varchar2(50)  := '';    -- Arial - see https://www.microsoft.com/typography/Fonts/product.aspx?PID=163
"
"g_rpt_header_font_size      varchar2(3)   := '';    -- 14
"
"g_rpt_header_font_color     varchar2(50)  := '';    -- #071626
"
"g_rpt_header_back_color     varchar2(50)  := '';    -- #FAFAFA
"
"g_rpt_header_border_width   varchar2(50)  := '';    -- 1 ; '0' = no border
"
"g_rpt_header_border_color   varchar2(50)  := '';    -- #000000
"
"g_rpt_data_font_name        varchar2(50)  := '';    -- Arial - see https://www.microsoft.com/typography/Fonts/product.aspx?PID=163
"
"g_rpt_data_font_size        varchar2(3)   := '';    -- 14
"
"g_rpt_data_font_color       varchar2(50)  := '';    -- #000000
"
"g_rpt_data_back_color       varchar2(50)  := '';    -- #FFFFFF
"
"g_rpt_data_border_width     varchar2(50)  := '';    -- 1 ; '0' = no border
"
"g_rpt_data_border_color     varchar2(50)  := '';    -- #000000
"
"g_rpt_data_alt_row_color    varchar2(50)  := '';    -- #FFFFFF for no alt row color, use same color as g_rpt_data_back_color
"
"/* see also Printing attributes in Interactive Report */
"
"-- Settings for Calendar
"
"g_cal_type                  varchar2(10)  := 'month'; -- can be month (default), week, day, list
"
"g_start_date                date          := null;    -- start date of calendar
"
"g_end_date                  date          := null;    -- end date of calendar
"
"g_weekdays                  varchar2(300) := null;    -- translation for weekdays e.g. Monday:Tuesday:Wednesday etc.
"
"g_months                    varchar2(300) := null;    -- translation for months   e.g. January:February etc.
"
"g_color_days_sql            varchar2(4000):= null;    -- color the background of certain days.
"
"                                                      --   e.g. select 1 as ""id"", sysdate as ""date"", 'FF8800' as ""color"" from dual
"
"-- HTML template to Word/PDF
"
"g_orientation               varchar2(50)  := '';      -- empty is portrait, other option is 'landscape'
"
"-- Call to URL data source
"
"g_url_username              varchar2(300) := null;
"
"g_url_password              varchar2(300) := null;
"
"g_url_proxy_override        varchar2(300) := null;
"
"g_url_transfer_timeout      number        := 180;
"
"g_url_body                  clob          := empty_clob();
"
"g_url_body_blob             blob          := empty_blob();
"
"g_url_parm_name             apex_application_global.vc_arr2; --:= empty_vc_arr;
"
"g_url_parm_value            apex_application_global.vc_arr2; --:= empty_vc_arr;
"
"g_url_wallet_path           varchar2(300) := null;
"
"g_url_wallet_pwd            varchar2(300) := null;
"
"g_url_https_host            varchar2(300) := null;    -- parameter for apex_web_service, not used, please apply APEX patch if issues
"
"-- Web Source Module (APEX >= 18.1)
"
"g_web_source_first_row      pls_integer   := null;    -- parameter for apex_exec.open_web_source_query
"
"g_web_source_max_rows       pls_integer   := null;    -- parameter for apex_exec.open_web_source_query
"
"g_web_source_total_row_cnt  boolean       := false;   -- parameter for apex_exec.open_web_source_query
"
"-- REST Enabled SQL (APEX >= 18.1)
"
"g_rest_sql_auto_bind_items  boolean       := true;    -- parameter for apex_exec.open_remote_sql_query
"
"g_rest_sql_first_row        pls_integer   := null;    -- parameter for apex_exec.open_remote_sql_query
"
"g_rest_sql_max_rows         pls_integer   := null;    -- parameter for apex_exec.open_remote_sql_query
"
"g_rest_sql_total_row_cnt    boolean       := false;   -- parameter for apex_exec.open_remote_sql_query
"
"g_rest_sql_total_row_limit  pls_integer   := null;    -- parameter for apex_exec.open_remote_sql_query
"
"-- IP Printer support
"
"g_ip_printer_location       varchar2(300) := null;
"
"g_ip_printer_version        varchar2(300) := '1';
"
"g_ip_printer_requester      varchar2(300) := nvl(apex_application.g_user, USER);
"
"g_ip_printer_job_name       varchar2(300) := 'AOP';
"
"g_ip_printer_return_output  varchar2(5)   := null;   -- null or 'Yes' or 'true'
"
"-- Convert characterset
"
"g_convert                   varchar2(1)   := c_n;    -- set to Y (c_y) if you want to convert the JSON that is send over; necessary for Arabic support
"
"g_convert_source_charset    varchar2(20)  := null;   -- default of database
"
"g_convert_target_charset    varchar2(20)  := 'AL32UTF8';
"
"-- Output
"
"g_output_directory          varchar2(200) := '.';    -- set output directory on AOP Server
"
"                                                     -- if . is specified the files are saved in the default directory: outputfiles
"
"g_output_split              varchar2(5)   := null;   -- split file: one file per page: true/false
"
"-- Files
"
"g_prepend_files_sql         clob := null;    -- format: select filename, mime_type, [file_blob, file_base64, url_call_from_db, url_call_from_aop, file_on_aop_server]
"
"g_append_files_sql          clob := null;    --           from my_table
"
"-- Sub-Templates
"
"g_sub_templates_sql         clob := null;    -- format: select filename, mime_type, [file_blob, file_base64, url_call_from_db, url_call_from_aop, file_on_aop_server] from my_table
"
"-- Password protected PDF
"
"g_output_read_password      varchar2(200) := null;  -- protect PDF to read
"
"g_output_modify_password    varchar2(200) := null;  -- protect PDF to write (modify)
"
"g_output_pwd_protection_flag number(4)    := null;  -- optional; default is 4.
"
"                                                    -- Number when bit calculation is done as specified in http://pdfhummus.com/post/147451287581/hummus-1058-and-pdf-writer-updates-encryption
"
"-- EXCEPTIONS
"
"  /**
"
"   * @exception
"
"   */
"
"-- FUNCTIONS AND PROCEDURES
"
"/**
"
" * Functions and Procedures
"
" *
"
" * ! package body contains documentation
"
" */
"
"-- debug function, will write to apex_debug_messages, logger (if enabled) and your own debug procedure
"
"procedure aop_debug(p_message     in varchar2,
"
"                    p0            in varchar2 default null,
"
"                    p1            in varchar2 default null,
"
"                    p2            in varchar2 default null,
"
"                    p3            in varchar2 default null,
"
"                    p4            in varchar2 default null,
"
"                    p5            in varchar2 default null,
"
"                    p6            in varchar2 default null,
"
"                    p7            in varchar2 default null,
"
"                    p8            in varchar2 default null,
"
"                    p9            in varchar2 default null,
"
"                    p10           in varchar2 default null,
"
"                    p11           in varchar2 default null,
"
"                    p12           in varchar2 default null,
"
"                    p13           in varchar2 default null,
"
"                    p14           in varchar2 default null,
"
"                    p15           in varchar2 default null,
"
"                    p16           in varchar2 default null,
"
"                    p17           in varchar2 default null,
"
"                    p18           in varchar2 default null,
"
"                    p19           in varchar2 default null,
"
"                    p_level       in apex_debug.t_log_level default apex_debug.c_log_level_info,
"
"                    p_description in clob default null);
"
"-- convert a url with for example an image to base64
"
"function url2base64 (
"
"  p_url in varchar2)
"
"  return clob;
"
"-- get the value of one of the above constants
"
"function getconstantvalue (
"
"  p_constant in varchar2)
"
"  return varchar2 deterministic;
"
"-- get the mime type of a file extention: docx, xlsx, pptx, pdf
"
"function getmimetype (
"
"  p_file_ext in varchar2)
"
"  return varchar2 deterministic;
"
"-- get the file extention of a mime type
"
"function getfileextension (
"
"  p_mime_type in varchar2)
"
"  return varchar2 deterministic;
"
"-- convert a blob to a clob
"
"function blob2clob(p_blob in blob)
"
"  return clob;
"
"-- internal function to check a server-side condition
"
"function is_component_used_yn(p_build_option_id         in number default null,
"
"                              p_authorization_scheme_id in varchar2,
"
"                              p_condition_type          in varchar2,
"
"                              p_condition_expression1   in varchar2,
"
"                              p_condition_expression2   in varchar2,
"
"                              p_component               in varchar2 default null)
"
"  return varchar2;
"
"-- Manual call to AOP
"
"-- p_aop_remote_debug:
"
"--   - No            : No debugging (= Default)
"
"--   - Yes (=Remote) : Data is send to the AOP cloud server
"
"--   - Local         : A JSON file is generated locally from your database server
"
"-- p_special options: NUMBER_TO_STRING, ALWAYS_REPORT_ALIAS, FILTERS_ON_TOP, HIGHLIGHTS_ON_TOP, HEADER_WITH_FILTER
"
"-- usage: p_special => 'ALWAYS_REPORT_ALIAS' or multiple p_special => 'FILTERS_ON_TOP:HIGHLIGHTS_ON_TOP'
"
"function plsql_call_to_aop(
"
"  p_data_type             in varchar2 default c_source_type_sql,
"
"  p_data_source           in clob,
"
"  p_template_type         in varchar2 default c_source_type_apex,
"
"  p_template_source       in clob,
"
"  p_output_type           in varchar2,
"
"  p_output_filename       in out nocopy varchar2,
"
"  p_output_type_item_name in varchar2 default null,
"
"  p_output_to             in varchar2 default null,
"
"  p_procedure             in varchar2 default null,
"
"  p_binds                 in wwv_flow_plugin_util.t_bind_list default c_binds,
"
"  p_special               in varchar2 default null,
"
"  p_aop_remote_debug      in varchar2 default c_no,
"
"  p_output_converter      in varchar2 default null,
"
"  p_aop_url               in varchar2,
"
"  p_api_key               in varchar2 default null,
"
"  p_app_id                in number   default null,
"
"  p_page_id               in number   default null,
"
"  p_user_name             in varchar2 default null,
"
"  p_init_code             in clob     default c_init_null,
"
"  p_output_encoding       in varchar2 default c_output_encoding_raw,
"
"  p_output_split          in varchar2 default c_false,
"
"  p_failover_aop_url      in varchar2 default null,
"
"  p_failover_procedure    in varchar2 default null,
"
"  p_log_procedure         in varchar2 default null,
"
"  p_prepend_files_sql     in clob     default null,
"
"  p_append_files_sql      in clob     default null,
"
"  p_sub_templates_sql     in clob     default null)
"
"  return blob;
"
"-- retrieve underlaying PL/SQL code of APEX Plug-in call
"
"function show_plsql_call_plugin(
"
"  p_process_id            in number   default null,
"
"  p_dynamic_action_id     in number   default null,
"
"  p_show_api_key          in varchar2 default c_no)
"
"  return clob;
"
"-- APEX Plugins
"
"-- Process Type Plugin
"
"function f_process_aop(
"
"  p_process in apex_plugin.t_process,
"
"  p_plugin  in apex_plugin.t_plugin)
"
"  return apex_plugin.t_process_exec_result;
"
"-- Dynamic Action Plugin
"
"function f_render_aop (
"
"  p_dynamic_action in apex_plugin.t_dynamic_action,
"
"  p_plugin         in apex_plugin.t_plugin)
"
"  return apex_plugin.t_dynamic_action_render_result;
"
"function f_ajax_aop(
"
"  p_dynamic_action in apex_plugin.t_dynamic_action,
"
"  p_plugin         in apex_plugin.t_plugin)
"
"  return apex_plugin.t_dynamic_action_ajax_result;
"
"-- Other Procedure
"
"-- Create an APEX session from PL/SQL
"
"-- p_enable_debug: Yes / No (default)
"
"procedure create_apex_session(
"
"  p_app_id       in apex_applications.application_id%type,
"
"  p_user_name    in apex_workspace_sessions.user_name%type default 'ADMIN',
"
"  p_page_id      in apex_application_pages.page_id%type default null,
"
"  p_session_id   in apex_workspace_sessions.apex_session_id%type default null,
"
"  p_enable_debug in varchar2 default 'No');
"
"-- Get the current APEX Session
"
"function get_apex_session
"
"  return apex_workspace_sessions.apex_session_id%type;
"
"-- Join an APEX Session
"
"procedure join_apex_session(
"
"  p_session_id   in apex_workspace_sessions.apex_session_id%type,
"
"  p_app_id       in apex_applications.application_id%type default null,
"
"  p_page_id      in apex_application_pages.page_id%type default null,
"
"  p_enable_debug in varchar2 default 'No');
"
"-- Drop the current APEX Session
"
"procedure drop_apex_session(
"
"  p_app_id     in apex_applications.application_id%type default null,
"
"  p_session_id in apex_workspace_sessions.apex_session_id%type default null);
"
"end aop_api18_pkg;"
/
