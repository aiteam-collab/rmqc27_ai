prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 9100
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>70183973784188715
,p_default_application_id=>9100
,p_default_id_offset=>70189399542726671
,p_default_owner=>'RMQC27_AI'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(10650605450818505481)
,p_group_name=>'Administration'
,p_static_id=>'administration'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(11124860734624317334)
,p_group_name=>'Finance'
,p_static_id=>'finance'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(11124861197562318725)
,p_group_name=>'HRM'
,p_static_id=>'hrm'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(11131025203043319632)
,p_group_name=>'Loan Request'
,p_static_id=>'loan-request'
,p_group_desc=>'Loan Request'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(11124861509885319207)
,p_group_name=>'PMF'
,p_static_id=>'pmf'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(11124860992494317917)
,p_group_name=>'SCM'
,p_static_id=>'scm'
);
wwv_flow_imp.component_end;
end;
/
