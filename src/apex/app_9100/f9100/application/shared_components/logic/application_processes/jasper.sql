prompt --application/shared_components/logic/application_processes/jasper
begin
--   Manifest
--     APPLICATION PROCESS: JASPER
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>70183973784188715
,p_default_application_id=>9100
,p_default_id_offset=>70189399542726671
,p_default_owner=>'RMQC27_AI'
);
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(8033835490036662742)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_name=>'JASPER'
,p_static_id=>'jasper'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
' p_bu               VARCHAR2(10)  := :GLOBAL_BU;',
' p_user             VARCHAR2(30)  := :GLOBAL_USER;',
' p_sub_vou			VARCHAR2(30)  := :GLOBAL_RPT_SUB_VOU;',
' p_plnt			    VARCHAR2(30)  := :GLOBAL_RPT_PLNT;',
' p_format			VARCHAR2(30)  := ''PDF'';',
' p_browser			VARCHAR2(30)  := ''BROWSER'';',
' p_type				VARCHAR2(30)  := NVL(:GLOBAL_RPT_TYPE,''N'');',
' p_vou_pfx			VARCHAR2(30)  := :GLOBAL_RPT_VOU_PFX;',
' p_vou_no			VARCHAR2(30)  := :GLOBAL_RPT_VOU_NO;',
' p_prod_id			VARCHAR2(100) := :GLOBAL_RPT_PROD_ID;',
' p_prod_rev			NUMBER(30)    := :GLOBAL_RPT_PROD_REV;',
' p_party            VARCHAR2(30)  := :GLOBAL_RPT_PARTY;',
' p_suplr_id         VARCHAR2(30)  := :GLOBAL_RPT_PARTY;',
' p_seq_no           VARCHAR2(30)  := :GLOBAL_RPT_SEQ;',
' p_test_no          VARCHAR2(30)  := :GLOBAL_RPT_TEST_NO;',
' p_emp_id           VARCHAR2(30)  := :GLOBAL_RPT_EMP_ID;',
' v_module           VARCHAR2(5);',
' v_rpt_id			VARCHAR2(10);',
' v_rpt_param		VARCHAR2(32000);',
' v_rpt_param_val	VARCHAR2(100);',
' v_url              VARCHAR2(32000):=''webapp.roadmaperp.com''; ',
' v_return_url       VARCHAR2(32000);',
'BEGIN',
'   ',
'   ',
'  v_module := nvl(func_find_module_frm_sub_vou(p_bu,p_sub_vou),substr(func_find_rpt_id_frm_sub_vou(p_bu,p_sub_vou,p_plnt,p_party,p_type),1,3));',
'  --proc_debug_proc(p_plnt||''/''||p_party||''/''||p_type);',
'  ',
'  IF v_module =''FIN'' THEN ',
'     v_module := substr(func_find_rpt_id_frm_sub_vou(p_bu,p_sub_vou,p_plnt,p_party,p_type),1,3);',
'  END IF;',
'  ',
'  IF p_sub_vou = ''ADVREC'' THEN',
'      v_module := ''ARM'';',
'  END IF;',
'  ',
'  v_rpt_id := func_find_rpt_id_frm_sub_vou(p_bu,p_sub_vou,p_plnt,p_party,p_type);',
'    ',
'  v_rpt_param := NULL;',
'  FOR r_param	IN (SELECT asvrp_rpt_param, DECODE(asvrp_rpt_param_val,''P_BU'',p_bu,''P_PLNT'',p_plnt,''P_VOU_PFX'',p_vou_pfx,''P_VOU_NO'',p_vou_no,''P_USER'',p_user,',
'                                ''P_PARTY'',p_party,''P_SUB_VOU'',p_sub_vou,''P_PROD_ID'',p_prod_id,''P_PROD_REV'',p_prod_rev',
'                                ,''P_SEQ_NO'',p_seq_no,''P_TEST_NO'',p_test_no,''P_EMP_ID'',p_emp_id,''P_PARTY'',p_suplr_id,''suppliers'',p_suplr_id) asvrp_rpt_param_val',
'                    FROM appl_sub_vou_rpt_param',
'                   WHERE asvrp_bu = :GLOBAL_bu',
'                     AND asvrp_sub_vou_type = p_sub_vou',
'                     AND asvrp_rpt_id = v_rpt_id',
'                   ORDER BY asvrp_seq_no)',
'  LOOP  	',
'  	v_rpt_param := v_rpt_param||''&''||r_param.asvrp_rpt_param||''=''||r_param.asvrp_rpt_param_val;',
'  END LOOP;',
'',
'   /*IF p_bu = ''PERP'' THEN',
'       RAISE_APPLICATION_ERROR(-20999,v_rpt_id||''~''||v_module||''~''||v_rpt_param);',
'    END IF;*/',
'',
'  htp.p(func_get_jasper_report(p_bu,v_module,v_rpt_id,p_format,p_browser,v_url)||v_rpt_param);  ',
'   ',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_version_scn=>'25064847023'
);
wwv_flow_imp.component_end;
end;
/
