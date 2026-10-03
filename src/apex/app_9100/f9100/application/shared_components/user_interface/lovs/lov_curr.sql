prompt --application/shared_components/user_interface/lovs/lov_curr
begin
--   Manifest
--     LOV_CURR
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
 p_id=>wwv_flow_imp.id(6316122741944472232)
,p_lov_name=>'LOV_CURR'
,p_static_id=>'lov-curr'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT scb_currency',
'  FROM suplr_curr_bal',
' WHERE scb_bu = :global_bu /*AND',
'scb_suplr_id = :gl_lvl_acct_subs.bfcry_id',
' and  :gl_lvl_acct_subs.part_type = ''S''*/',
'UNION ALL',
'SELECT DISTINCT ccb_currency',
'  FROM cust_curr_bal',
' WHERE ccb_bu = :global_bu /*AND ccb_cust_id = :gl_lvl_acct_subs.bfcry_id',
'  and  :gl_lvl_acct_subs.part_type = ''C''*/',
'UNION ALL',
'SELECT DISTINCT scb_currency',
'FROM (',
'SELECT DISTINCT scb_currency',
'  FROM suplr_curr_bal',
' WHERE scb_bu = :global_bu /*AND scb_suplr_id = :gl_lvl_acct_subs.bfcry_id',
'and  :gl_lvl_acct_subs.part_type = ''P''*/',
'UNION ALL',
'SELECT DISTINCT ccb_currency',
'  FROM cust_curr_bal',
' WHERE ccb_bu = :global_bu /*AND ccb_cust_id = :gl_lvl_acct_subs.bfcry_id',
'and  :gl_lvl_acct_subs.part_type = ''P'')*/)'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'SCB_CURRENCY'
,p_display_column_name=>'SCB_CURRENCY'
,p_default_sort_column_name=>'SCB_CURRENCY'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp.component_end;
end;
/
