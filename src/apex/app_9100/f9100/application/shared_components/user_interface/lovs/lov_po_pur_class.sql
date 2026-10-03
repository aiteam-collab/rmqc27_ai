prompt --application/shared_components/user_interface/lovs/lov_po_pur_class
begin
--   Manifest
--     LOV_PO_PUR_CLASS
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
 p_id=>wwv_flow_imp.id(11171815256641160032)
,p_lov_name=>'LOV_PO_PUR_CLASS'
,p_static_id=>'lov-po-pur-class'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   SELECT DECODE (applctrl_desc_level,',
'                 1, tcset_desc1,',
'                 NVL (tcset_desc2, tcset_desc1))',
'            tcset_desc,',
'         tcset_set_id',
'    FROM tax_charges_sets, appl_control',
'   WHERE     tcset_bu = :global_bu',
'         AND applctrl_bu = :global_bu',
'         AND tcset_active_flag = ''Y''',
'ORDER BY 1'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TCSET_SET_ID'
,p_display_column_name=>'TCSET_DESC'
,p_version_scn=>'1'
);
wwv_flow_imp.component_end;
end;
/
