CREATE OR REPLACE
"PACKAGE BODY pkg_repair_work_order
"
"IS
"
"
"
"	PROCEDURE proc_cre_int_work_order(p_bu				VARCHAR2,
"
"									  p_plnt			VARCHAR2,
"
"									  p_doc_no			VARCHAR2,
"
"									  p_doc_date		DATE,
"
"									  p_user			VARCHAR2,
"
"									  p_res		OUT		VARCHAR2
"
"									  )
"
"	IS
"
"
"
"	v_doc_no	VARCHAR2(15);
"
"	v_seq_no	NUMBER;
"
"
"
"	BEGIN
"
"
"
"		v_doc_no := func_find_mfg_nextno(
"
"										 p_bu,
"
"										 p_plnt,
"
"										 p_doc_date,
"
"										 func_find_year(p_bu,p_doc_date),
"
"										 'RCO',
"
"										 p_user
"
"										 );
"
"
"
"		FOR r_comp IN (SELECT *
"
"						 FROM rework_order_comp_hd
"
"						WHERE rwochd_bu = p_bu
"
"						  AND rwochd_plnt = p_plnt
"
"						  AND rwochd_doc_no = p_doc_no
"
"						  )
"
"		LOOP
"
"				INSERT INTO rework_order_comp_hd(
"
"												rwochd_bu                      ,
"
"												rwochd_plnt                    ,
"
"												rwochd_doc_no                  ,
"
"												rwochd_date                    ,
"
"												rwochd_rw_ord_no               ,
"
"												rwochd_prod_id                 ,
"
"												rwochd_prod_rev                ,
"
"												rwochd_comp_qty                ,
"
"												rwochd_scrap_qty               ,
"
"												rwochd_status                  ,
"
"												rwochd_line_id                 ,
"
"												rwochd_prod_ord_no             ,
"
"												rwochd_dis_assemble            ,
"
"												rwochd_ord_type                ,
"
"												rwochd_material_cost           ,
"
"												rwochd_res_cost                ,
"
"												rwochd_ot_cost                 ,
"
"												rwochd_unit_cost               ,
"
"												rwochd_alloc_flag              ,
"
"												rwochd_rcpt_line               ,
"
"												rwochd_so_pfx                  ,
"
"												rwochd_so_no                   ,
"
"												rwochd_so_seq_no               ,
"
"												rwochd_so_sub_seq_no           ,
"
"												rwochd_type                    ,
"
"												rwochd_gen_cons                ,
"
"												rwochd_prod_comp_qty           ,
"
"												rwochd_conv_factor             ,
"
"												rwochd_comp_stk_qty            ,
"
"												rwochd_prod_comp_stk_qty       ,
"
"												rwochd_year                    ,
"
"												rwochd_period                  ,
"
"												rwochd_sf_code                 ,
"
"												rwochd_cre_by                  ,
"
"												rwochd_cre_date                ,
"
"												rwochd_upd_by                  ,
"
"												rwochd_upd_date                ,
"
"												rwochd_mach_id                 ,
"
"												rwochd_opt_id                  ,
"
"												rwochd_shift_id                ,
"
"												rwochd_trans_qty               ,
"
"												rwochd_source                  ,
"
"												rwochd_sou_store               ,
"
"												rwochd_target_store            ,
"
"												rwochd_lot_no                  ,
"
"												rwochd_ser_no                  ,
"
"												rwochd_source_id               ,
"
"												rwochd_source_type             ,
"
"												rwochd_comp_sf_code            ,
"
"												rwochd_batch_id                ,
"
"												rwochd_reference               ,
"
"												rwochd_prod_ord_type           ,
"
"												rwochd_cust_id                 ,
"
"												rwochd_sal_ord_type            ,
"
"												rwochd_pp_no                   ,
"
"												rwochd_pp_rev                  ,
"
"												rwochd_pp_seq_no               ,
"
"												rwochd_source_pfx              ,
"
"												rwochd_source_no               ,
"
"												rwochd_source_line             ,
"
"												rwochd_proj_id                 ,
"
"												rwochd_task_id                 ,
"
"												rwochd_qc_pfx                  ,
"
"												rwochd_qc_no                   ,
"
"												rwochd_rej_qty                 ,
"
"												rwochd_qc_flag                 ,
"
"												rwochd_sys_ls_no               ,
"
"												rwochd_route_card_no           ,
"
"												rwochd_vi_flag                 ,
"
"												rwochd_oprn_id                 ,
"
"												rwochd_so_schld_desc           ,
"
"												rwochd_stl_doc_no              ,
"
"												rwochd_stl_seq_no              ,
"
"												rwochd_inc_jrnl                ,
"
"												rwochd_imo_rplc_type           ,
"
"												rwochd_imo_no
"
"												)
"
"										VALUES(p_bu                      ,
"
"												p_plnt                    ,
"
"												v_doc_no                  ,
"
"												p_doc_date                    ,
"
"												NULL               ,
"
"												r_comp.rwochd_prod_id                 ,
"
"												r_comp.rwochd_prod_rev                ,
"
"												r_comp.rwochd_comp_qty                ,
"
"												0 ,
"
"												'N'                  ,
"
"												NULL                 ,
"
"												NULL             ,
"
"												NULL            ,
"
"												'RW'                ,
"
"												0           ,
"
"												0                ,
"
"												0                 ,
"
"												func_find_unitcost(p_bu,r_comp.rwochd_prod_id,r_comp.rwochd_prod_rev,''),
"
"												'N'              ,
"
"												NULL               ,
"
"												NULL                  ,
"
"												NULL                   ,
"
"												NULL               ,
"
"												NULL           ,
"
"												'S'                    ,
"
"												'N'                ,
"
"												0           ,
"
"												1             ,
"
"												0            ,
"
"												0       ,
"
"												func_find_year(p_bu,TRUNC(SYSDATE))                    ,
"
"												func_find_period(p_bu,TRUNC(SYSDATE))         ,
"
"												NULL                 ,
"
"												p_user                  ,
"
"												SYSDATE                ,
"
"												NULL                  ,
"
"												NULL                ,
"
"												NULL                 ,
"
"												NULL                  ,
"
"												NULL                ,
"
"												0               ,
"
"												'S'                  ,
"
"												''               ,
"
"												''            ,
"
"												p_doc_no                  ,
"
"												NULL                  ,
"
"												func_find_deflt_storeid(p_bu,p_plnt,r_comp.rwochd_loc_id,r_comp.rwochd_prod_id,r_comp.rwochd_prod_rev,'N')              ,
"
"												'P'             ,
"
"												NULL            ,
"
"												NULL                ,
"
"												'INTERNAL REPAIR WORK ORDER FOR BUFFER STOCK'  ,
"
"												'S'           ,
"
"												NULL                 ,
"
"												'NA'            ,
"
"												NULL                   ,
"
"												NULL                  ,
"
"												NULL               ,
"
"												NULL              ,
"
"												r_comp.rwochd_lot_no               ,
"
"												NULL             ,
"
"												NULL                 ,
"
"												NULL                 ,
"
"												NULL                  ,
"
"												NULL                   ,
"
"												0                 ,
"
"												'N'                 ,
"
"												r_comp.rwochd_sys_ls_no               ,
"
"												NULL           ,
"
"												'N'                 ,
"
"												NULL                 ,
"
"												NULL           ,
"
"												NULL              ,
"
"												NULL              ,
"
"												'N'                ,
"
"												r_comp.rwochd_imo_rplc_type           ,
"
"												r_comp.rwochd_imo_no
"
"												);
"
"				FOR r_ser IN (SELECT *
"
"								FROM rework_order_comp_ser_dtls
"
"							   WHERE rocsd_bu = p_bu
"
"								 AND rocsd_plnt   = p_plnt
"
"								 AND rocsd_doc_no = p_doc_no
"
"							)
"
"				LOOP
"
"
"
"					v_seq_no := v_seq_no + 1;
"
"
"
"					INSERT INTO rework_order_comp_ser_dtls(
"
"														rocsd_bu             ,
"
"														rocsd_plnt            ,
"
"														rocsd_doc_no           ,
"
"														rocsd_seq_no           ,
"
"														rocsd_ser_no           ,
"
"														rocsd_sys_ls_no       ,
"
"														rocsd_source_id        ,
"
"														rocsd_source_type      ,
"
"														rocsd_ser_status       ,
"
"														rocsd_cre_by           ,
"
"														rocsd_cre_date         ,
"
"														rocsd_upd_by           ,
"
"														rocsd_upd_date         ,
"
"														rocsd_prod_ord_no      ,
"
"														rocsd_repair_qty       ,
"
"														rocsd_scrap_qty        ,
"
"														rocsd_dis_assemble
"
"														)
"
"													VALUES(p_bu             ,
"
"														p_plnt            ,
"
"														v_doc_no           ,
"
"														v_seq_no           ,
"
"														r_ser.rocsd_ser_no           ,
"
"														r_ser.rocsd_sys_ls_no       ,
"
"														r_ser.rocsd_source_id        ,
"
"														r_ser.rocsd_source_type      ,
"
"														r_ser.rocsd_ser_status       ,
"
"														p_user           ,
"
"														SYSDATE         ,
"
"														NULL           ,
"
"														NULL         ,
"
"														r_ser.rocsd_prod_ord_no      ,
"
"														r_ser.rocsd_repair_qty       ,
"
"														r_ser.rocsd_scrap_qty        ,
"
"														r_ser.rocsd_dis_assemble
"
"														);
"
"
"
"				END LOOP r_ser;
"
"
"
"		END LOOP r_comp;
"
"
"
"	END proc_cre_int_work_order;
"
"
"
"END pkg_repair_work_order;"
/
