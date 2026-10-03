prompt --application/shared_components/user_interface/lovs/198_emp_id
begin
--   Manifest
--     198_EMP_ID
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
 p_id=>wwv_flow_imp.id(7285534125574705547)
,p_lov_name=>'198_EMP_ID'
,p_static_id=>'198-emp-id'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT ID, NAME, MAIL_ID FROM (',
' (SELECT DISTINCT EMP_EMP_ID ID,',
'  NVL(EMP_FIRST_NAME1,EMP_FIRST_NAME2) NAME,',
'  EMP_EMAIL_ID MAIL_ID',
' FROM EMPLOYEES',
' WHERE  EMP_BU = :GLOBAL_BU',
' AND EMP_EMP_ID IS NOT NULL',
' )',
' UNION ',
' (SELECT ',
' DISTINCT SUPLR_SUPLR_ID ID,',
' NVL(SUPLR_NAME1,SUPLR_NAME2) NAME,',
' NVL(SUPLR_EMAIL1,SUPLR_EMAIL2) MAIL_ID',
' FROM SUPPLIERS',
' WHERE  SUPLR_BU = :GLOBAL_BU',
'AND SUPLR_EMAIL1 IS NOT NULL ',
'));'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_query_owner=>'BCCHIPS'
,p_return_column_name=>'ID'
,p_display_column_name=>'ID'
,p_version_scn=>'25143931107'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5491587584037225246)
,p_query_column_name=>'ID'
,p_heading=>'Emp/Suplr ID'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5491587261851225246)
,p_query_column_name=>'MAIL_ID'
,p_heading=>'Mail ID'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5491586831484225244)
,p_query_column_name=>'NAME'
,p_heading=>'Emp/Suplr Name'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
