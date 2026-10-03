prompt --application/shared_components/user_interface/lovs/icm1090t_proc_id
begin
--   Manifest
--     ICM1090T_PROC_ID
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
 p_id=>wwv_flow_imp.id(8155880082599262565)
,p_lov_name=>'ICM1090T_PROC_ID'
,p_static_id=>'icm1090t-proc-id'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT *',
'  FROM (',
'SELECT ROWNUM rno, rouln_oprn_seq_no,rouln_oprn_ln_seq,mfgo_oprn_id, mfgo_desc1 ',
'  FROM (SELECT rouln_oprn_seq_no,rouln_oprn_ln_seq,rouln_oprn_id mfgo_oprn_id, mfgo_desc1',
'                      FROM bom_hd,routing_ln,mfg_oprns',
'                     WHERE bomhd_bu = rouln_bu',
'                       AND bomhd_plnt = rouln_plnt',
'                       AND bomhd_bom_no = rouln_bom_no',
'                       AND mfgo_bu = rouln_bu',
'                       AND mfgo_oprn_id = rouln_oprn_id',
'                       AND bomhd_bu = :GLOBAL_bu',
'                       AND bomhd_plnt = :usol_plnt',
'                       AND bomhd_bom_no = :usol_bom_no',
'                       AND bomhd_bom_name = :usol_bom_name                     ',
'                                  AND ''N'' = :usol_eng_bom_flag ))',
'WHERE rno >= INSTR(:usol_sf_code,''0'')',
'ORDER BY rno'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'MFGO_OPRN_ID'
,p_display_column_name=>'MFGO_OPRN_ID'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(8155882488996270742)
,p_query_column_name=>'MFGO_DESC1'
,p_heading=>'Process'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(8155882787976270751)
,p_query_column_name=>'MFGO_OPRN_ID'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(8155883224446270751)
,p_query_column_name=>'ROULN_OPRN_LN_SEQ'
,p_heading=>'Oprn. Seq.'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
