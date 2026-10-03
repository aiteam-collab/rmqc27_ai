prompt --application/shared_components/user_interface/lovs/lov_work_flow1
begin
--   Manifest
--     LOV_WORK_FLOW1
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
 p_id=>wwv_flow_imp.id(5945120019612612595)
,p_lov_name=>'LOV_WORK_FLOW1'
,p_static_id=>'lov-work-flow-2'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT wfm_bus_proc_id,wfm_bus_proc_desc,',
'       wfm_call_form,',
'       wfm_module,',
'       wfm_mod_seq_no,',
'       wfm_val_based_flag,',
'       wfm_self_appr_flag,',
'       wfm_basis',
'  FROM work_flow_master',
' WHERE wfm_bu           = :GLOBAL_BU',
'   AND wfm_bus_proc_id NOT IN (SELECT wf_bus_proc_id',
'                                FROM work_flow',
'                               WHERE wf_bu = :Global_bu',
'                                 AND wf_status <> ''C'')',
'   AND wfm_status =''A''                                 ',
' ORDER BY wfm_bus_proc_desc,',
'          wfm_module'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'WFM_BUS_PROC_ID'
,p_display_column_name=>'WFM_BUS_PROC_ID'
,p_version_scn=>'18193303192'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5945123158704612603)
,p_query_column_name=>'WFM_BASIS'
,p_heading=>'Wfm Basis'
,p_display_sequence=>80
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5945120786796612596)
,p_query_column_name=>'WFM_BUS_PROC_DESC'
,p_heading=>'Work Flow Desc.'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5945121194164612596)
,p_query_column_name=>'WFM_BUS_PROC_ID'
,p_heading=>'Work Flow Id'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5945121580896612601)
,p_query_column_name=>'WFM_CALL_FORM'
,p_heading=>'Wfm Call Form'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5945121989676612601)
,p_query_column_name=>'WFM_MODULE'
,p_heading=>'Module'
,p_display_sequence=>50
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5945120385465612595)
,p_query_column_name=>'WFM_MOD_SEQ_NO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5945122802188612603)
,p_query_column_name=>'WFM_SELF_APPR_FLAG'
,p_heading=>'Wfm Self Appr Flag'
,p_display_sequence=>70
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5945122420058612603)
,p_query_column_name=>'WFM_VAL_BASED_FLAG'
,p_heading=>'Wfm Val Based Flag'
,p_display_sequence=>60
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
