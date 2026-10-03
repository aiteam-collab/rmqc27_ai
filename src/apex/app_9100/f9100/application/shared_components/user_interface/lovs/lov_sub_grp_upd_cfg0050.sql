prompt --application/shared_components/user_interface/lovs/lov_sub_grp_upd_cfg0050
begin
--   Manifest
--     LOV_SUB_GRP_UPD(CFG0050)
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
 p_id=>wwv_flow_imp.id(8020289370281029448)
,p_lov_name=>'LOV_SUB_GRP_UPD(CFG0050)'
,p_static_id=>'lov-sub-grp-upd-cfg'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DECODE ( (SELECT applctrl_desc_level',
'                     FROM appl_control',
'                    WHERE applctrl_bu = :global_bu),',
'                 1, supsubgroup_desc1,',
'                 NVL (supsubgroup_desc2, supsubgroup_desc1))',
'            subgroup_name,',
'         supsubgroup_type_id,',
'         SUPSUBGROUP_GROUP_ID,',
'         (SELECT SUPGRP_DESC1',
'            FROM supplier_groups',
'           WHERE SUPGRP_BU = supsubgroup_bu',
'             AND SUPGRP_GROUP_ID = SUPSUBGROUP_GROUP_ID',
'           ) group_desc',
'    FROM supplier_subgroup',
'   WHERE     supsubgroup_bu = :global_bu'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'SUPSUBGROUP_TYPE_ID'
,p_display_column_name=>'SUBGROUP_NAME'
,p_default_sort_column_name=>'SUBGROUP_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(8020290579991029451)
,p_query_column_name=>'GROUP_DESC'
,p_heading=>'Group Name'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(8020289764765029449)
,p_query_column_name=>'SUBGROUP_NAME'
,p_heading=>'Description'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(8020291022338029451)
,p_query_column_name=>'SUPSUBGROUP_GROUP_ID'
,p_heading=>'Supsubgroup Group Id'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(8020290211313029451)
,p_query_column_name=>'SUPSUBGROUP_TYPE_ID'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
