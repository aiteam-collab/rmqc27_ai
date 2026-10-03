prompt --application/pages/page_41531000
begin
--   Manifest
--     PAGE: 41531000
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
 p_id=>41531000
,p_name=>'Attachment'
,p_alias=>'ATTACHMENT'
,p_page_mode=>'MODAL'
,p_step_title=>'Attachment'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'11'
);
wwv_flow_imp.component_end;
end;
/
