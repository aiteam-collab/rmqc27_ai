prompt --application/shared_components/user_interface/lovs/login_remember_username
begin
--   Manifest
--     LOGIN_REMEMBER_USERNAME
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
 p_id=>wwv_flow_imp.id(10650607451952505495)
,p_lov_name=>'LOGIN_REMEMBER_USERNAME'
,p_static_id=>'login-remember-username'
,p_lov_query=>'.'||wwv_flow_imp.id(10650607451952505495)||'.'
,p_location=>'STATIC'
,p_version_scn=>'17780337518'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(10650607890995505496)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Remember Me'
,p_lov_return_value=>'Y'
,p_static_id=>'remember-me'
);
wwv_flow_imp.component_end;
end;
/
