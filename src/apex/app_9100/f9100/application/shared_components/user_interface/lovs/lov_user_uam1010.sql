prompt --application/shared_components/user_interface/lovs/lov_user_uam1010
begin
--   Manifest
--     LOV_USER(UAM1010)
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
 p_id=>wwv_flow_imp.id(7562354319795025220)
,p_lov_name=>'LOV_USER(UAM1010)'
,p_static_id=>'lov-user-uam'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT distinct APPLUSER_ID, ',
'DECODE(APPLUSER_EMP_ID,NULL,NULL,DECODE((SELECT APPLCTRL_DESC_LEVEL FROM APPL_CONTROL  ',
'		WHERE APPLCTRL_BU = :GLOBAl_bu),',
'		 1,LTRIM(EMP_FIRST_NAME1)||'' ''||',
'		   LTRIM(EMP_MIDDLE_NAME1)||'' ''||    ',
'		   LTRIM(EMP_LAST_NAME1),',
'		   NVL(LTRIM(EMP_FIRST_NAME2) ||'' ''||',
'   		       LTRIM(EMP_MIDDLE_NAME2)||'' ''||',
' 		       LTRIM(EMP_LAST_NAME2),',
'		       LTRIM(EMP_FIRST_NAME1)||'' ''||',
'		       LTRIM(EMP_MIDDLE_NAME1)||'' ''||    ',
'		       LTRIM(EMP_LAST_NAME1)))',
')EMPNAME',
'FROM APPL_USERS,EMPLOYEES',
'WHERE APPLUSER_BU =:GLOBAL_bu',
'AND EMP_BU(+) = APPLUSER_BU',
'AND (EMP_EMP_ID = APPLUSER_EMP_ID  OR APPLUSER_EMP_ID IS NULL)',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'APPLUSER_ID'
,p_display_column_name=>'APPLUSER_ID'
,p_default_sort_column_name=>'APPLUSER_ID'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7562354669744025223)
,p_query_column_name=>'APPLUSER_ID'
,p_heading=>'Name'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7562355060601025226)
,p_query_column_name=>'EMPNAME'
,p_heading=>'Employee'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
