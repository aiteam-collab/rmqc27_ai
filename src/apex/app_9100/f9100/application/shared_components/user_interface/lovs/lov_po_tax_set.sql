prompt --application/shared_components/user_interface/lovs/lov_po_tax_set
begin
--   Manifest
--     LOV_PO_TAX_SET
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
 p_id=>wwv_flow_imp.id(11171814631741160021)
,p_lov_name=>'LOV_PO_TAX_SET'
,p_static_id=>'lov-po-tax-set'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT tcf_desc d, ',
'       tcf_id r',
'  FROM tax_classification',
' WHERE tcf_bu = :global_bu'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_default_sort_column_name=>'D'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp.component_end;
end;
/
