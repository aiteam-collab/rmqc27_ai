prompt --application/shared_components/user_interface/lovs/lov_to_mail
begin
--   Manifest
--     LOV_TO_MAIL
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>70183973784188715
,p_default_application_id=>9100
,p_default_id_offset=>70189399542726671
,p_default_owner=>'RMQC27_AI'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(6049862712480834674)
,p_lov_name=>'LOV_TO_MAIL'
,p_static_id=>'lov-to-mail'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT emp_name,mail_id, mail_type',
'  FROM (SELECT cci_person_first_name1 emp_name,cci_email1||CHR(60)||cci_person_first_name1||CHR(62) desc1,cci_email1 mail_id, ''Customer'' mail_type',
'          FROM cust_contact_info',
'         WHERE cci_bu = :GLOBAL_bu ',
'           AND cci_email1 IS NOT NULL',
'         UNION ALL',
'        SELECT sci_person_first_name1 emp_name,sci_email1||CHR(60)||sci_person_first_name1||CHR(62) desc1,sci_email1 mail_id, ''Supplier'' mail_type',
'          FROM suplr_contact_info',
'         WHERE sci_bu = :GLOBAL_bu ',
'           AND sci_email1 IS NOT NULL',
'         UNION ALL',
'        SELECT RTRIM(emp_first_name1|| '' ''|| emp_middle_name1 || '' '' || emp_last_name1) emp_name,',
'               emp_off_email_id||CHR(60)||RTRIM(emp_first_name1|| '' ''|| emp_middle_name1 || '' '' || emp_last_name1)||CHR(62) desc1,',
'               emp_off_email_id mail_id, ''Employee'' mail_type',
'          FROM employees',
'         WHERE emp_bu = :GLOBAL_bu',
'           AND emp_off_email_id IS NOT NULL)',
' WHERE NOT EXISTS (SELECT 1',
'                     FROM email_outbox_rcvr_list',
'                    WHERE eorl_bu = :GLOBAL_bu',
'                      AND eorl_doc_no = :P29_EOH_DOC_NO',
'                      AND eorl_rcvr_email = mail_id)   '))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'MAIL_ID'
,p_display_column_name=>'MAIL_ID'
,p_default_sort_column_name=>'EMP_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6049886884553849409)
,p_query_column_name=>'EMP_NAME'
,p_heading=>'Name'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6049887322212849449)
,p_query_column_name=>'MAIL_ID'
,p_heading=>'e-mail ID'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6049887701040849449)
,p_query_column_name=>'MAIL_TYPE'
,p_heading=>'Mail Type'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
