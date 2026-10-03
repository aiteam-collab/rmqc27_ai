prompt --application/pages/page_93131020
begin
--   Manifest
--     PAGE: 93131020
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
 p_id=>93131020
,p_name=>'Pending MR Lines'
,p_alias=>'PENDING-MR-LINES'
,p_page_mode=>'MODAL'
,p_step_title=>'Pending MR Lines'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var invno  = [];',
'var invamt = [];',
'var chcnt = [];',
'',
'',
'function checkanduncheck(a,b) {',
'    var inputValue = document.getElementById("inputField_" + a).value;',
'    var isChecked = document.getElementById("checkbox_"+a).checked;',
'    var checkflag;',
'    console.log(inputValue);',
'    if (isChecked) {checkflag = ''Y'';}else{ checkflag = ''N'';};',
'      apex.server.process(',
'        "CHECKANDUNCHECK", ',
'        {',
'          x01: checkflag, // Pass the input field value as a parameter',
'          x02: a,',
'          x03: inputValue',
'        },',
'        { dataType: ''text'',',
'          success: function(data) {',
'             apex.message.clearErrors();',
'            if (data.trim() !== ''success''){                ',
'                apex.message.showErrors([{type:"error",location:"page",message:data.replace(''sqlerrm:ORA-20999: '', ''''),unsafe:false}]);',
'                document.getElementById("checkbox_" + a).checked = false;',
'                document.getElementById("inputField_" + a).readOnly = false;                ',
'                button();',
'            }else{                ',
'                console.log(data);                             ',
'                if (isChecked) {',
'                   document.getElementById("inputField_" + a).readOnly = checkflag === ''Y'' ? true : false;                   ',
'                   //output.innerText = incrementRowSelection(output.innerText, checkflag);',
'                   button();',
'                }',
'                else{',
'                   document.getElementById("inputField_" + a).readOnly = checkflag === ''Y'' ? true : false;',
'                   //output.innerText = incrementRowSelection(output.innerText, checkflag);',
'                   button();',
'                }                           ',
'            }            ',
'          }',
'',
'        }',
'      );',
'  };',
'',
'',
'    ',
'',
'',
'  function readonly(a){',
'      var value = Boolean;      ',
'      var isChecked = document.getElementById("checkbox_"+a).checked;      ',
'',
'      if (isChecked) {',
'          value =  true;         ',
'      }else{',
'          value = false; ',
'      }',
'      console.log(value)',
'      return value',
'  }',
'',
'function selectall() {',
'     var isChecked = document.getElementById("check_all").checked;',
'     var spinner = apex.util.showSpinner();',
'    if (isChecked) {',
'        apex.server.process(',
'            "CHECKALL", // Replace with your AJAX callback name',
'            {',
'                f01: invamt,',
'                f02: invno',
'            },',
'            {',
'                dataType: ''text'',',
'                success: function (data) {',
'                   apex.message.clearErrors();',
'                   if (data.trim() !== ''success''){',
'                       spinner.remove();',
'                       apex.message.showErrors([{type:"error",location:"page",message:data.replace(''sqlerrm:ORA-20999: '', ''''),unsafe:false}]);',
'                   }',
'                   else',
'                   {',
'                    spinner.remove();  ',
'                    console.log(''success'', data);',
'                    overallcheck();',
'                    apex.region("PEND").refresh();   ',
'                                   ',
'                   }',
'                    ',
'                },',
'                error: function (jqXHR, textStatus, errorThrown) {',
'                    console.error(errorThrown, jqXHR, textStatus);',
'                }',
'            }',
'        );',
'    } else {',
'        apex.server.process(',
'            "UNCHECKALL", // Replace with your AJAX callback name',
'            {},',
'            {',
'                dataType: ''text'',',
'                success: function (data) {',
'                console.log(''success'', data);',
'                spinner.remove();',
'                overallcheck();                                    ',
'                apex.region("PEND").refresh();  ',
'                }',
'            }',
'        ); }}',
'function overallcheck() {',
'    var checkbox = document.getElementById("check_all");',
'    apex.server.process(',
'        "OVERALLCHECK",',
'        {},',
'        {',
'            dataType: ''text'',',
'            success: function (data) {',
'                console.log(data);',
'                let flag = data.split("-");',
'                //output.innerText = (flag[1]).toString();',
'',
'                if (flag[0] == ''Y'' && checkbox != null) {',
'                    checkbox.checked = true;',
'                    button();',
'                } else if (flag[0] == ''N'' && checkbox != null) {',
'                    checkbox.checked = false;',
'                    button();',
'                } else if (flag[0] == ''NY'' && checkbox != null) {',
'                    checkbox.checked = false;',
'                    button();',
'                }',
'            }',
'        }',
'    );',
'}',
'',
'function movetoarray(a) {',
'    invno.push(a);',
'    invamt.push(document.getElementById("inputField_" + a).value);',
'    console.log(JSON.stringify(invno));',
'    console.log(JSON.stringify(invamt));',
'}',
'',
'',
'',
'function incrementRowSelection(inputString, type) {',
'    return inputString.replace(/(\d+)/, function (match, number) {',
'        if (type.trim() == ''Y'') {',
'            return (parseInt(number, 10) + 1);',
'        } else {',
'            let cnt;',
'            if ((parseInt(number, 10) - 1) < 0){',
'                cnt = 0;',
'            }else{',
'                cnt = (parseInt(number, 10) - 1);',
'            }',
'            return cnt;',
'        }',
'    });',
'}',
'',
'',
'   function button(){    ',
'           var inputElems = document.getElementsByTagName("input"),',
'        count = 0;',
'        for (var i=0; i<inputElems.length; i++) {',
'        if (inputElems[i].type === "checkbox" && inputElems[i].checked === true){',
'            count++;  ',
'            if (count != null ) { ',
'                  apex.item("B1").enable();',
'                  apex.item("B2").enable();',
'            }	',
'        }',
'        else{',
'          if (count == '' '' ) { ',
'                  apex.item("B1").disable();',
'                  apex.item("B2").disable();',
'          }	',
'        }        ',
'   }};'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (typeof $.apex.interactiveReport === "function") {',
'    // only extend when the IR code is present',
'    $.apex.interactiveReport.prototype.reset = function() {this._reset();};',
'}',
'',
'overallcheck();',
'button();',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'button, input, select, textarea {',
'    font: inherit;',
'    margin: 0;',
'    color: inherit;',
'    border-top: 2px solid transparent;',
'    border-left: 2px solid transparent;',
'    border-right: 2px solid transparent;',
'}',
'',
'#head.a-IRR-header {',
'    background-color: #a8d9bc;',
'    border-top: 1px solid #e6e6e6;',
'    box-shadow: inset 1px 0 0 0 #e6e6e6;',
'}',
'',
'',
' .t-fht-thead {',
'    overflow: auto !important;',
'}',
' ',
' .a-IG-controlsContainer, .a-IRR-controlsContainer {',
'    padding-top: var(--a-report-controls-padding-y,-8px);',
'    padding-bottom: var(--a-report-controls-padding-y,-8px);',
'}',
'',
'#reset .a-MediaBlock, .a-RegionMedia {',
'    display: -ms-flexbox;',
'    display: none;',
'}',
'',
' .a-IG-reportSummary-label, .a-IRR-reportSummary-label {',
'    display: -ms-flexbox;',
'    display: none;',
'    -ms-flex-align: center;',
'    align-items: center;',
'    text-decoration: none;',
'}',
'#reset .a-MediaBlock-graphic {',
'    float: left;',
'    display: none;',
'    margin-right: 8px;',
'}',
'',
'.a-IRR-table {                                    ',
'      border-collapse: collapse;  ',
'      table-layout: auto;',
'      border-spacing: 0;',
'      white-space: nowrap;',
'      word-wrap: break-word;',
'  }',
'',
'  #Clear{',
'   background-image: url(#APP_FILES#clearclear-removebg-preview.png);',
'   background-position: 0px 3px;',
'   background-repeat: no-repeat;',
'   background-color: rgba(0, 0, 0, 0.15);',
'   background-size: 25px;',
'   width: 25px;',
'   height: 22px;',
'}',
'',
'  #Clear1{',
'   background-image: url(#APP_FILES#clearclear-removebg-preview.png);',
'   background-position: 0px 3px;',
'   background-repeat: no-repeat;',
'   background-color: rgba(0, 0, 0, 0.15);',
'   background-size: 25px;',
'   width: 25px;',
'   height: 22px;',
'}',
'',
'',
'',
'',
''))
,p_step_template=>wwv_flow_imp.id(5741311521565371726)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1400'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(14560231772765063966)
,p_plug_name=>'Enter Close Short Narration'
,p_static_id=>'enter-close-short-narration'
,p_region_name=>'narration'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>wwv_flow_imp.id(10650510175351505351)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'BELOW'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7807360702365851072)
,p_plug_name=>'Find'
,p_static_id=>'find'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--hiddenOverflow:t-Form--slimPadding'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>1
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(14553236437221487725)
,p_plug_name=>'PENDINGMIV'
,p_static_id=>'pendingmiv'
,p_region_name=>'PEND'
,p_parent_plug_id=>wwv_flow_imp.id(7807360702365851072)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>140
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rowid,',
'       IMRSV_BU,',
'       IMRSV_RQST_NO,',
'       IMRSV_PLNT,',
'       IMRSV_REF_PLNT,',
'       IMRSV_RQST_DATE,',
'       IMRSV_RQST_YEAR,',
'       IMRSV_RQST_PERIOD,',
'       IMRSV_RQSTTO_STORE_ID,',
'       (SELECt store_desc1',
'         FROM stores',
'        WHERE store_bu = IMRSV_BU',
'          AND store_id = IMRSV_RQSTTO_STORE_ID)Wh_DESC,',
'       IMRSV_RQSTBY_TYPE,',
'       IMRSV_RQSTBY_ID,',
'       IMRSV_HD_STATUS,',
'       IMRSV_HD_REF,',
'       IMRSV_RQST_SEQ_NO,',
'       IMRSV_MAT_TYPE,',
'       CASE IMRSV_MAT_TYPE WHEN ''S'' THEN ''STD''',
'                           WHEN ''F'' THEN ''SFG''',
'       END IMRSV_MAT_TYPE_DESC,',
'       IMRSV_PAR_PROD_ID,',
'       IMRSV_PAR_PROD_REV,',
'       (select prod_desc11 from products where prod_bu = IMRSV_bu and prod_id = imrsv_par_prod_id and prod_rev = imrsv_par_prod_rev) par_item_Desc,',
'       IMRSV_PROD_ID,',
'       IMRSV_PROD_REV,',
'       IMRSV_PROD_DESC1,',
'       IMRSV_PROD_EXT_DESC,',
'       (select prod_ext_desc1 from products where prod_bu = IMRSV_bu and prod_id = IMRSV_PROD_ID and prod_rev = IMRSV_PROD_REV) Item_Desc1,',
'       IMRSV_PROD_CLS,',
'       IMRSV_PROD_SUBCLS,',
'       IMRSV_PROD_UOM,',
'       IMRSV_UOM,',
'       IMRSV_CONV_FACTOR,',
'       IMRSV_ORD_TYPE,',
'       IMRSV_ORD_PFX,',
'       IMRSV_ORD_NO,',
'       IMRSV_ORD_SEQ_NO,',
'       IMRSV_ORD_SUB_SEQ_NO,',
'       IMRSV_ORD_QTY,',
'       IMRSV_UNIT_COST,',
'       IMRSV_RQRD_DATE,',
'       IMRSV_PROC_ID,',
'       IMRSV_PROD_ORD_NO,',
'       IMRSV_SF_CODE,',
'       IMRSV_LN_STATUS,',
'       IMRSV_WC_ID,',
'       IMRSV_PROJ_TASK_ID,',
'       IMRSV_MNT_OPRN_ID,',
'       IMRSV_MNT_TASK_ID,',
'       IMRSV_MNT_WC_ID,',
'       IMRSV_LN_REF,',
'       IMRSV_MI_METHOD,',
'       IMRSV_SO_TYPE,',
'       IMRSV_SO_PFX,',
'       IMRSV_SO_NO,',
'       IMRSV_SO_SEQ_NO,',
'       IMRSV_SO_SUB_SEQ_NO,',
'       IMRSV_PROJ_ID,',
'       IMRSV_TASK_ID,',
'       IMRSV_SYS_LS_NO,',
'       IMRSV_LOT_NO,',
'       IMRSV_SER_NO,',
'       IMRSV_EXPIRY_DATE,',
'       IMRSV_NO_OF_BALE,',
'       IMRSV_RQST_QTY,',
'       IMRSV_ALLOC_QTY,',
'		 ( (imrsv_rqst_qty + imrsv_excs_qty) ',
'                                            - (imrsv_alloc_qty + imrsv_iss_qty + imrsv_cls_qty - imrsv_rtn_qty )) IMRSV_TOALLOC_QTY,',
'       IMRSV_ISS_QTY,',
'       IMRSV_EXCS_QTY,',
'       IMRSV_CLS_QTY,',
'       IMRSV_RTN_QTY,',
'       IMRSV_SEL_FLAG,',
'     CASE WHEN IMRSV_SEL_FLAG = ''Y''  THEN',
'      ''<input type="checkbox" id="checkbox_''||IMRSV_RQST_NO||IMRSV_RQST_SEQ_NO||''" checked="checked" onChange="checkanduncheck(''''''||IMRSV_RQST_NO||IMRSV_RQST_SEQ_NO||'''''',''''N'''')"/>''',
'         ELSE',
'      ''<input type="checkbox" id="checkbox_''||IMRSV_RQST_NO||IMRSV_RQST_SEQ_NO||''" onChange="checkanduncheck(''''''||IMRSV_RQST_NO||IMRSV_RQST_SEQ_NO||'''''',''''Y'''')" />''',
'         END   select_flag,	',
'     CASE WHEN IMRSV_SEL_FLAG = ''Y'' THEN',
'		''<input style="text-align:end" type="number" id="inputField_''||IMRSV_RQST_NO||IMRSV_RQST_SEQ_NO||''" value="''||IMRSV_TOALLOC_QTY||''" readonly />''',
'	   ELSE',
'		''<input style="text-align:end" oninput="if (this.value.length > 6) this.value = this.value.slice(0, 6);" type="number"  id="inputField_''||IMRSV_RQST_NO||IMRSV_RQST_SEQ_NO||''"  value="''||NVL (((imrsv_rqst_qty + imrsv_excs_qty) - (imrsv_iss_qty + imr'
||'sv_alloc_qty + imrsv_cls_qty - imrsv_rtn_qty)),0)||''"   onchange="movetoarray(''''''||IMRSV_RQST_NO||IMRSV_RQST_SEQ_NO||'''''')"/>''',
'	   END',
'          TOALLOC_QTY,',
'',
'       IMRSV_SEL_USER,',
'       IMRSV_CRE_BY,',
'       IMRSV_CRE_DATE,',
'       IMRSV_UPD_BY,',
'       IMRSV_UPD_DATE,',
'       IMRSV_RES_ID,',
'       IMRSV_SHIFT_ID,',
'       IMRSV_REC_SOURCE,',
'       IMRSV_SO_SCHLD_DESC,',
'       IMRSV_TRANS_NO,',
'       IMRSV_CAP_ASSET_ID,',
'       IMRSV_JOB_ORD_NO,',
'       IMRSV_PAR_BATCH_NO,',
'       IMRSV_ISS_CODE,',
'       IMRSV_MIX_DOC_NO,',
'       IMRSV_PR_PFX,',
'       IMRSV_PR_NO,',
'       IMRSV_PR_SEQ_NO,',
'       IMRSV_FCM_BL_ID,',
'       IMRSV_FCM_PROJ_NO,',
'       IMRSV_SWO_TYPE,',
'       IMRSV_SUBSTIT_ITEM_FLAG,',
'       IMRSV_THICKNESS,',
'       IMRSV_WIDTH,',
'       IMRSV_LENGTH,',
'       IMRSV_CSR_DOC_NO,',
'       IMRSV_EMP_ID,',
'       IMRSV_BIN_ID,',
'       IMRSV_CRATE_ID,',
'       IMRSV_AEN_TYPE,',
'       IMRSV_BOQ_REF_NO,',
'       IMRSV_BOQ_SEQ_NO,',
'       IMRSV_BOQ_SUB_SEQ_NO,',
'       IMRSV_BOQ_REF_TEST_NO,',
'       IMRSV_CUST_PROD_ID,',
'       IMRSV_CUST_PROD_DESC,',
'       IMRSV_EQPMT_ID,',
'       IMRSV_OPRN_LN_SEQ_NO,',
'       IMRSV_MR_TYPE,',
'       IMRSV_RQSTBY_ENTITY,',
'		 IMRSV_DRAWING_NO,',
'IMRSV_DRAWING_REV,',
'       NVL (ROUND (func_find_curr_stk_hand (imrsv_bu,',
'                                     imrsv_rqstto_store_id,',
'                                     imrsv_prod_id,',
'                                     imrsv_prod_rev,',
'                                     imrsv_mat_type,',
'                                     imrsv_prod_ord_no,',
'                                     imrsv_sf_code,',
'                                     imrsv_sys_ls_no)',
'                                  *  imrsv_conv_factor,3),0) stk_qty,',
'       (SELECT NVL (SUM ( (sfsos_qty - sfsos_allocated_qty)), 0)',
'          FROM store_sf_stocks, store_sf_so_stock',
'         WHERE stsfs_bu = sfsos_bu',
'           AND stsfs_trans_no = sfsos_trans_no',
'           AND stsfs_bu = imrsv_bu',
'           AND stsfs_store_id = imrsv_rqstto_store_id',
'           AND stsfs_prod_id = imrsv_prod_id',
'           AND stsfs_prod_rev = imrsv_prod_rev',
'           AND (stsfs_ord_no = imrsv_prod_ord_no OR (stsfs_ord_no IS NULL AND imrsv_prod_ord_no IS NULL))',
'           AND stsfs_sf_code = imrsv_sf_code',
'           AND sfsos_so_prefix = imrsv_so_pfx',
'           AND sfsos_so_no = imrsv_so_no',
'           AND sfsos_so_seq_no = imrsv_so_seq_no',
'           AND sfsos_so_sub_seq_no = imrsv_so_sub_seq_no',
'           AND (stsfs_sys_ls_no = imrsv_sys_ls_no OR (stsfs_sys_ls_no IS NULL AND imrsv_sys_ls_no IS NULL)))',
'       so_stk_qty,',
'       ''<span class="fa fa-stock-chart" aria-hidden="true" style="color: brown;"></span>'' shortage,',
'       ''<span class="fa fa-list" aria-hidden="true" style="color: brown;"></span>'' "Details",',
'        ''<span class="fa fa-exclamation-diamond-o"  style="color: red;"></span>'' "Exception",',
'       ''<span class="fa fa-cart-plus" aria-hidden="true" style="color: green;"></span>'' variant',
'  FROM INV_MAT_RQST_SO_VIEW',
' WHERE imrsv_bu =:global_bu ',
'   AND ((imrsv_rqst_qty + imrsv_excs_qty) - (imrsv_iss_qty + imrsv_alloc_qty + imrsv_cls_qty)) > 0',
'   AND (IMRSV_SEL_FLAG LIKE''%''||:P93131020_SHOW_FIND ||''%'' OR :P93131020_SHOW_FIND IS NULL)',
'   AND imrsv_plnt IN  (SELECT auba_plant FROM appl_user_plant_access',
'                         WHERE auba_bu = :GLOBAL_bu ',
'                           AND auba_user_id =  :GLOBAL_user',
'                           AND trunc(sysdate) between  auba_from and  auba_to)',
'   AND (imrsv_plnt_loc_id LIKE ''%''|| :P93131020_LOCATION ||''%'' OR :P93131020_LOCATION IS NULL)',
'   AND (imrsv_plnt LIKE ''%''|| :P93131020_UNIT ||''%'' OR :P93131020_UNIT IS NULL)',
'   AND (imrsv_rqst_no LIKE ''%''|| :P93131020_MR_NO ||''%'' OR :P93131020_MR_NO IS NULL)',
'   AND (imrsv_prod_ord_no LIKE ''%''|| :P93131020_ORD_NO ||''%'' OR :P93131020_ORD_NO IS NULL)',
'   AND (IMRSV_RQSTTO_STORE_ID LIKE ''%''|| :P93131020_WH ||''%'' OR :P93131020_WH IS NULL)',
'   AND (imrsv_sf_code LIKE ''%''|| :P93131020_SF_CODE ||''%'' OR :P93131020_SF_CODE IS NULL)',
'    AND (IMRSV_ORD_TYPE LIKE ''%''||:P93131020_ORDER_TYPE||''%'' OR :P93131020_ORDER_TYPE IS NULL)',
'   AND (IMRSV_MAT_TYPE LIKE ''%''|| :P93131020_TYPE ||''%'' OR :P93131020_TYPE IS NULL)',
'   AND (IMRSV_PROD_ID LIKE''%''||:P93131020_ITEM||''%'' OR :P93131020_ITEM IS NULL)  ',
'   AND (IMRSV_PROD_DESC1 LIKE''%''||:P93131020_ITEM_DESC||''%'' OR :P93131020_ITEM_DESC IS NULL)  ',
'   AND (TRUNC(IMRSV_RQST_DATE) >= TO_DATE(:P93131020_MR_FROM_DATE) OR TO_DATE(:P93131020_MR_FROM_DATE) IS NULL)',
'   AND (TRUNC(IMRSV_RQST_DATE) <= TO_DATE(:P93131020_MR_FROM_TO) OR TO_DATE(:P93131020_MR_FROM_TO) IS NULL)',
'',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P93131020_SHOW_FIND,P93131020_LOCATION,P93131020_UNIT,P93131020_MR_NO,P93131020_ORD_NO,P93131020_WH,P93131020_SF_CODE,P93131020_ORDER_TYPE,P93131020_TYPE,P93131020_ITEM,P93131020_ITEM_DESC,P93131020_IMRSV_MAT_TYPE,P93131020_MR_FROM_DATE,P93131020_MR_'
||'FROM_TO'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'PENDINGMIV'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(14553236496717487725)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>9071274661173876697
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7371096271057630572)
,p_db_column_name=>'Details'
,p_display_order=>294
,p_column_identifier=>'DV'
,p_column_label=>'Details'
,p_column_link=>'f?p=&APP_ID.:931310207:&SESSION.::&DEBUG.::P931310207_IMRSV_RQST_NO,P931310207_IMRSV_RQST_SEQ_NO,P931310207_IMRSV_PROD_ID,P931310207_IMRSV_PROD_REV,P931310207_IMRSV_SEL_FLAG,P931310207_IMRSV_UOM,P931310207_IMRSV_SUBSTIT_ITEM_FLAG:#IMRSV_RQST_NO#,#IMR'
||'SV_RQST_SEQ_NO#,#IMRSV_PROD_ID#,#IMRSV_PROD_REV#,#IMRSV_SEL_FLAG#,#IMRSV_UOM#,#IMRSV_SUBSTIT_ITEM_FLAG#'
,p_column_linktext=>'#Details#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'instr(nvl(:REQUEST,''~''),''XLS'') = 0 and',
'instr(nvl(:REQUEST,''~''),''CSV'') = 0'))
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8093467869765820200)
,p_db_column_name=>'Exception'
,p_display_order=>314
,p_column_identifier=>'DX'
,p_column_label=>'Exception'
,p_column_link=>'f?p=&APP_ID.:931310202:&SESSION.::&DEBUG.::P931310202_RQST_NO,P931310202_RQST_SEQ_NO:#IMRSV_RQST_NO#,#IMRSV_RQST_SEQ_NO#'
,p_column_linktext=>'#Exception#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835266848852297209)
,p_db_column_name=>'IMRSV_AEN_TYPE'
,p_display_order=>94
,p_column_identifier=>'CP'
,p_column_label=>'Imrsv Aen Type'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835230221077297004)
,p_db_column_name=>'IMRSV_ALLOC_QTY'
,p_display_order=>144
,p_column_identifier=>'DE'
,p_column_label=>'Allocated'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835266052840297203)
,p_db_column_name=>'IMRSV_BIN_ID'
,p_display_order=>92
,p_column_identifier=>'CN'
,p_column_label=>'Imrsv Bin Id'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835267228976297211)
,p_db_column_name=>'IMRSV_BOQ_REF_NO'
,p_display_order=>95
,p_column_identifier=>'CQ'
,p_column_label=>'Imrsv Boq Ref No'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835268348021297217)
,p_db_column_name=>'IMRSV_BOQ_REF_TEST_NO'
,p_display_order=>98
,p_column_identifier=>'CT'
,p_column_label=>'Imrsv Boq Ref Test No'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835267602847297214)
,p_db_column_name=>'IMRSV_BOQ_SEQ_NO'
,p_display_order=>96
,p_column_identifier=>'CR'
,p_column_label=>'Imrsv Boq Seq No'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835268013538297215)
,p_db_column_name=>'IMRSV_BOQ_SUB_SEQ_NO'
,p_display_order=>97
,p_column_identifier=>'CS'
,p_column_label=>'Imrsv Boq Sub Seq No'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835230652008297006)
,p_db_column_name=>'IMRSV_BU'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Imrsv Bu'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835259176002297161)
,p_db_column_name=>'IMRSV_CAP_ASSET_ID'
,p_display_order=>75
,p_column_identifier=>'BW'
,p_column_label=>'Imrsv Cap Asset Id'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835254057483297134)
,p_db_column_name=>'IMRSV_CLS_QTY'
,p_display_order=>62
,p_column_identifier=>'BJ'
,p_column_label=>'Cls. Qty.'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835240080890297053)
,p_db_column_name=>'IMRSV_CONV_FACTOR'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Imrsv Conv Factor'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835266388734297206)
,p_db_column_name=>'IMRSV_CRATE_ID'
,p_display_order=>93
,p_column_identifier=>'CO'
,p_column_label=>'Imrsv Crate Id'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835255662555297144)
,p_db_column_name=>'IMRSV_CRE_BY'
,p_display_order=>66
,p_column_identifier=>'BN'
,p_column_label=>'Imrsv Cre By'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835256037358297145)
,p_db_column_name=>'IMRSV_CRE_DATE'
,p_display_order=>67
,p_column_identifier=>'BO'
,p_column_label=>'Imrsv Cre Date'
,p_allow_sorting=>'N'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835265223785297200)
,p_db_column_name=>'IMRSV_CSR_DOC_NO'
,p_display_order=>90
,p_column_identifier=>'CL'
,p_column_label=>'Imrsv Csr Doc No'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835269155642297219)
,p_db_column_name=>'IMRSV_CUST_PROD_DESC'
,p_display_order=>100
,p_column_identifier=>'CV'
,p_column_label=>'Imrsv Cust Prod Desc'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835268673546297217)
,p_db_column_name=>'IMRSV_CUST_PROD_ID'
,p_display_order=>99
,p_column_identifier=>'CU'
,p_column_label=>'Imrsv Cust Prod Id'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9460639043064135272)
,p_db_column_name=>'IMRSV_DRAWING_NO'
,p_display_order=>254
,p_column_identifier=>'DR'
,p_column_label=>'Dwg. No.'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9460639079548135273)
,p_db_column_name=>'IMRSV_DRAWING_REV'
,p_display_order=>264
,p_column_identifier=>'DS'
,p_column_label=>'Dwg. Rev.'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835265663135297201)
,p_db_column_name=>'IMRSV_EMP_ID'
,p_display_order=>91
,p_column_identifier=>'CM'
,p_column_label=>'Imrsv Emp Id'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835269528591297220)
,p_db_column_name=>'IMRSV_EQPMT_ID'
,p_display_order=>101
,p_column_identifier=>'CW'
,p_column_label=>'Imrsv Eqpmt Id'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835253658261297131)
,p_db_column_name=>'IMRSV_EXCS_QTY'
,p_display_order=>61
,p_column_identifier=>'BI'
,p_column_label=>'Imrsv Excs Qty'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835252078848297114)
,p_db_column_name=>'IMRSV_EXPIRY_DATE'
,p_display_order=>55
,p_column_identifier=>'BC'
,p_column_label=>'Imrsv Expiry Date'
,p_allow_sorting=>'N'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835262411308297179)
,p_db_column_name=>'IMRSV_FCM_BL_ID'
,p_display_order=>83
,p_column_identifier=>'CE'
,p_column_label=>'Imrsv Fcm Bl Id'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835262785444297183)
,p_db_column_name=>'IMRSV_FCM_PROJ_NO'
,p_display_order=>84
,p_column_identifier=>'CF'
,p_column_label=>'Imrsv Fcm Proj No'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835234882556297029)
,p_db_column_name=>'IMRSV_HD_REF'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Imrsv Hd Ref'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835234511462297028)
,p_db_column_name=>'IMRSV_HD_STATUS'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Imrsv Hd Status'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835260440297297169)
,p_db_column_name=>'IMRSV_ISS_CODE'
,p_display_order=>78
,p_column_identifier=>'BZ'
,p_column_label=>'Imrsv Iss Code'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835253222240297129)
,p_db_column_name=>'IMRSV_ISS_QTY'
,p_display_order=>59
,p_column_identifier=>'BG'
,p_column_label=>'Issued'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835259639380297162)
,p_db_column_name=>'IMRSV_JOB_ORD_NO'
,p_display_order=>76
,p_column_identifier=>'BX'
,p_column_label=>'Imrsv Job Ord No'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835264832609297197)
,p_db_column_name=>'IMRSV_LENGTH'
,p_display_order=>89
,p_column_identifier=>'CK'
,p_column_label=>'Imrsv Length'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835247276801297089)
,p_db_column_name=>'IMRSV_LN_REF'
,p_display_order=>43
,p_column_identifier=>'AQ'
,p_column_label=>'Imrsv Ln Ref'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835244880919297078)
,p_db_column_name=>'IMRSV_LN_STATUS'
,p_display_order=>37
,p_column_identifier=>'AK'
,p_column_label=>'Imrsv Ln Status'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835251287773297108)
,p_db_column_name=>'IMRSV_LOT_NO'
,p_display_order=>53
,p_column_identifier=>'BA'
,p_column_label=>'Imrsv Lot No'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835235720793297033)
,p_db_column_name=>'IMRSV_MAT_TYPE'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Type ID'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835228966986296992)
,p_db_column_name=>'IMRSV_MAT_TYPE_DESC'
,p_display_order=>114
,p_column_identifier=>'DA'
,p_column_label=>'Mat. Type'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835260847672297172)
,p_db_column_name=>'IMRSV_MIX_DOC_NO'
,p_display_order=>79
,p_column_identifier=>'CA'
,p_column_label=>'Imrsv Mix Doc No'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835247669730297090)
,p_db_column_name=>'IMRSV_MI_METHOD'
,p_display_order=>44
,p_column_identifier=>'AR'
,p_column_label=>'Imrsv Mi Method'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835246146234297083)
,p_db_column_name=>'IMRSV_MNT_OPRN_ID'
,p_display_order=>40
,p_column_identifier=>'AN'
,p_column_label=>'Imrsv Mnt Oprn Id'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835246513023297084)
,p_db_column_name=>'IMRSV_MNT_TASK_ID'
,p_display_order=>41
,p_column_identifier=>'AO'
,p_column_label=>'Imrsv Mnt Task Id'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835246894241297087)
,p_db_column_name=>'IMRSV_MNT_WC_ID'
,p_display_order=>42
,p_column_identifier=>'AP'
,p_column_label=>'Imrsv Mnt Wc Id'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835270353014297223)
,p_db_column_name=>'IMRSV_MR_TYPE'
,p_display_order=>103
,p_column_identifier=>'CY'
,p_column_label=>'Imrsv Mr Type'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835252370490297123)
,p_db_column_name=>'IMRSV_NO_OF_BALE'
,p_display_order=>56
,p_column_identifier=>'BD'
,p_column_label=>'Imrsv No Of Bale'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835269878702297222)
,p_db_column_name=>'IMRSV_OPRN_LN_SEQ_NO'
,p_display_order=>102
,p_column_identifier=>'CX'
,p_column_label=>'Imrsv Oprn Ln Seq No'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835241338260297062)
,p_db_column_name=>'IMRSV_ORD_NO'
,p_display_order=>28
,p_column_identifier=>'AB'
,p_column_label=>'Imrsv Ord No'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835240939955297061)
,p_db_column_name=>'IMRSV_ORD_PFX'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Imrsv Ord Pfx'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835242485866297067)
,p_db_column_name=>'IMRSV_ORD_QTY'
,p_display_order=>31
,p_column_identifier=>'AE'
,p_column_label=>'Imrsv Ord Qty'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835241699276297064)
,p_db_column_name=>'IMRSV_ORD_SEQ_NO'
,p_display_order=>29
,p_column_identifier=>'AC'
,p_column_label=>'Imrsv Ord Seq No'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835242120954297065)
,p_db_column_name=>'IMRSV_ORD_SUB_SEQ_NO'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Imrsv Ord Sub Seq No'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835240524694297058)
,p_db_column_name=>'IMRSV_ORD_TYPE'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Imrsv Ord Type'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835259975081297167)
,p_db_column_name=>'IMRSV_PAR_BATCH_NO'
,p_display_order=>77
,p_column_identifier=>'BY'
,p_column_label=>'Imrsv Par Batch No'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835236090885297033)
,p_db_column_name=>'IMRSV_PAR_PROD_ID'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Parent Item'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835236534130297037)
,p_db_column_name=>'IMRSV_PAR_PROD_REV'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Parent Rev.'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835231386034297014)
,p_db_column_name=>'IMRSV_PLNT'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Imrsv Plnt'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835243723853297070)
,p_db_column_name=>'IMRSV_PROC_ID'
,p_display_order=>34
,p_column_identifier=>'AH'
,p_column_label=>'Imrsv Proc Id'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835238539935297047)
,p_db_column_name=>'IMRSV_PROD_CLS'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Imrsv Prod Cls'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835237683562297042)
,p_db_column_name=>'IMRSV_PROD_DESC1'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Item Desc.'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835238130014297045)
,p_db_column_name=>'IMRSV_PROD_EXT_DESC'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Item Ext. Description'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835236872916297039)
,p_db_column_name=>'IMRSV_PROD_ID'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Item'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835244144051297072)
,p_db_column_name=>'IMRSV_PROD_ORD_NO'
,p_display_order=>35
,p_column_identifier=>'AI'
,p_column_label=>'Prod .Ord .No.'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835237265927297040)
,p_db_column_name=>'IMRSV_PROD_REV'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Rev.'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835238943667297048)
,p_db_column_name=>'IMRSV_PROD_SUBCLS'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Imrsv Prod Subcls'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835239305978297050)
,p_db_column_name=>'IMRSV_PROD_UOM'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Imrsv Prod Uom'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835250085006297100)
,p_db_column_name=>'IMRSV_PROJ_ID'
,p_display_order=>50
,p_column_identifier=>'AX'
,p_column_label=>'Imrsv Proj Id'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835245737782297083)
,p_db_column_name=>'IMRSV_PROJ_TASK_ID'
,p_display_order=>39
,p_column_identifier=>'AM'
,p_column_label=>'Imrsv Proj Task Id'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835261639258297178)
,p_db_column_name=>'IMRSV_PR_NO'
,p_display_order=>81
,p_column_identifier=>'CC'
,p_column_label=>'PR No.'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835261218524297176)
,p_db_column_name=>'IMRSV_PR_PFX'
,p_display_order=>80
,p_column_identifier=>'CB'
,p_column_label=>'Imrsv Pr Pfx'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835262032233297178)
,p_db_column_name=>'IMRSV_PR_SEQ_NO'
,p_display_order=>82
,p_column_identifier=>'CD'
,p_column_label=>'Imrsv Pr Seq No'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835258011145297154)
,p_db_column_name=>'IMRSV_REC_SOURCE'
,p_display_order=>72
,p_column_identifier=>'BT'
,p_column_label=>'Imrsv Rec Source'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835231810674297015)
,p_db_column_name=>'IMRSV_REF_PLNT'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Imrsv Ref Plnt'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835257212827297151)
,p_db_column_name=>'IMRSV_RES_ID'
,p_display_order=>70
,p_column_identifier=>'BR'
,p_column_label=>'Imrsv Res Id'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835243308782297069)
,p_db_column_name=>'IMRSV_RQRD_DATE'
,p_display_order=>33
,p_column_identifier=>'AG'
,p_column_label=>'Imrsv Rqrd Date'
,p_allow_sorting=>'N'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835270744964297228)
,p_db_column_name=>'IMRSV_RQSTBY_ENTITY'
,p_display_order=>104
,p_column_identifier=>'CZ'
,p_column_label=>'Imrsv Rqstby Entity'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835234065236297026)
,p_db_column_name=>'IMRSV_RQSTBY_ID'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Imrsv Rqstby Id'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835233758016297025)
,p_db_column_name=>'IMRSV_RQSTBY_TYPE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Imrsv Rqstby Type'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835233313388297023)
,p_db_column_name=>'IMRSV_RQSTTO_STORE_ID'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Imrsv Rqstto Store Id'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835232100217297017)
,p_db_column_name=>'IMRSV_RQST_DATE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'MR Date'
,p_column_type=>'DATE'
,p_format_mask=>'&GLOBAL_RPT_DATE_MASK.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835231018360297009)
,p_db_column_name=>'IMRSV_RQST_NO'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'MR. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835232932419297019)
,p_db_column_name=>'IMRSV_RQST_PERIOD'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Imrsv Rqst Period'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835252823903297126)
,p_db_column_name=>'IMRSV_RQST_QTY'
,p_display_order=>57
,p_column_identifier=>'BE'
,p_column_label=>'Requested'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835235356931297031)
,p_db_column_name=>'IMRSV_RQST_SEQ_NO'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Line'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835232559132297017)
,p_db_column_name=>'IMRSV_RQST_YEAR'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Imrsv Rqst Year'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835254442762297136)
,p_db_column_name=>'IMRSV_RTN_QTY'
,p_display_order=>63
,p_column_identifier=>'BK'
,p_column_label=>'Returned'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835254806179297139)
,p_db_column_name=>'IMRSV_SEL_FLAG'
,p_display_order=>64
,p_column_identifier=>'BL'
,p_column_label=>'Imrsv Sel Flag'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835255199847297142)
,p_db_column_name=>'IMRSV_SEL_USER'
,p_display_order=>65
,p_column_identifier=>'BM'
,p_column_label=>'Imrsv Sel User'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835251764587297111)
,p_db_column_name=>'IMRSV_SER_NO'
,p_display_order=>54
,p_column_identifier=>'BB'
,p_column_label=>'Imrsv Ser No'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835244481842297076)
,p_db_column_name=>'IMRSV_SF_CODE'
,p_display_order=>36
,p_column_identifier=>'AJ'
,p_column_label=>'Imrsv Sf Code'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835257592352297153)
,p_db_column_name=>'IMRSV_SHIFT_ID'
,p_display_order=>71
,p_column_identifier=>'BS'
,p_column_label=>'Imrsv Shift Id'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835248883122297095)
,p_db_column_name=>'IMRSV_SO_NO'
,p_display_order=>47
,p_column_identifier=>'AU'
,p_column_label=>'Imrsv So No'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835248488559297094)
,p_db_column_name=>'IMRSV_SO_PFX'
,p_display_order=>46
,p_column_identifier=>'AT'
,p_column_label=>'Imrsv So Pfx'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835258437267297158)
,p_db_column_name=>'IMRSV_SO_SCHLD_DESC'
,p_display_order=>73
,p_column_identifier=>'BU'
,p_column_label=>'Imrsv So Schld Desc'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835249267858297097)
,p_db_column_name=>'IMRSV_SO_SEQ_NO'
,p_display_order=>48
,p_column_identifier=>'AV'
,p_column_label=>'Imrsv So Seq No'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835249682530297098)
,p_db_column_name=>'IMRSV_SO_SUB_SEQ_NO'
,p_display_order=>49
,p_column_identifier=>'AW'
,p_column_label=>'Imrsv So Sub Seq No'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835248139773297092)
,p_db_column_name=>'IMRSV_SO_TYPE'
,p_display_order=>45
,p_column_identifier=>'AS'
,p_column_label=>'Imrsv So Type'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835263594107297187)
,p_db_column_name=>'IMRSV_SUBSTIT_ITEM_FLAG'
,p_display_order=>86
,p_column_identifier=>'CH'
,p_column_label=>'Imrsv Substit Item Flag'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835263210817297184)
,p_db_column_name=>'IMRSV_SWO_TYPE'
,p_display_order=>85
,p_column_identifier=>'CG'
,p_column_label=>'Imrsv Swo Type'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835250868101297104)
,p_db_column_name=>'IMRSV_SYS_LS_NO'
,p_display_order=>52
,p_column_identifier=>'AZ'
,p_column_label=>'Imrsv Sys Ls No'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835250507504297103)
,p_db_column_name=>'IMRSV_TASK_ID'
,p_display_order=>51
,p_column_identifier=>'AY'
,p_column_label=>'Imrsv Task Id'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835264038000297190)
,p_db_column_name=>'IMRSV_THICKNESS'
,p_display_order=>87
,p_column_identifier=>'CI'
,p_column_label=>'Imrsv Thickness'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835228637021296989)
,p_db_column_name=>'IMRSV_TOALLOC_QTY'
,p_display_order=>234
,p_column_identifier=>'DP'
,p_column_label=>'Imrsv Toalloc Qty'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835258830203297159)
,p_db_column_name=>'IMRSV_TRANS_NO'
,p_display_order=>74
,p_column_identifier=>'BV'
,p_column_label=>'Imrsv Trans No'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835242874953297067)
,p_db_column_name=>'IMRSV_UNIT_COST'
,p_display_order=>32
,p_column_identifier=>'AF'
,p_column_label=>'Imrsv Unit Cost'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835239751920297051)
,p_db_column_name=>'IMRSV_UOM'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'UOM'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835256404282297147)
,p_db_column_name=>'IMRSV_UPD_BY'
,p_display_order=>68
,p_column_identifier=>'BP'
,p_column_label=>'Imrsv Upd By'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835256768129297150)
,p_db_column_name=>'IMRSV_UPD_DATE'
,p_display_order=>69
,p_column_identifier=>'BQ'
,p_column_label=>'Imrsv Upd Date'
,p_allow_sorting=>'N'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835245322809297079)
,p_db_column_name=>'IMRSV_WC_ID'
,p_display_order=>38
,p_column_identifier=>'AL'
,p_column_label=>'Imrsv Wc Id'
,p_allow_sorting=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835264422419297195)
,p_db_column_name=>'IMRSV_WIDTH'
,p_display_order=>88
,p_column_identifier=>'CJ'
,p_column_label=>'Imrsv Width'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5945944629855913688)
,p_db_column_name=>'ITEM_DESC1'
,p_display_order=>324
,p_column_identifier=>'DY'
,p_column_label=>'Item Ext. Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5631354857698887972)
,p_db_column_name=>'PAR_ITEM_DESC'
,p_display_order=>334
,p_column_identifier=>'DZ'
,p_column_label=>'Parent  Item Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9037641542474273406)
,p_db_column_name=>'ROWID'
,p_display_order=>244
,p_column_identifier=>'DQ'
,p_column_label=>'Rowid'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7783638329509335490)
,p_db_column_name=>'SELECT_FLAG'
,p_display_order=>304
,p_column_identifier=>'DW'
,p_column_label=>'<input type="checkbox" id="check_all"  onChange="selectall()"/>'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835271555102297228)
,p_db_column_name=>'SHORTAGE'
,p_display_order=>194
,p_column_identifier=>'DL'
,p_column_label=>'Shortage'
,p_column_link=>'f?p=&APP_ID.:931310201:&SESSION.::&DEBUG.::P931310201_BU,P931310201_RQST_NO,P931310201_PROD_ID,P931310201_PROD_REV:#IMRSV_BU#,#IMRSV_RQST_NO#,#IMRSV_PROD_ID#,#IMRSV_PROD_REV#'
,p_column_linktext=>'#SHORTAGE#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_display_condition_type=>'NEVER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835229782640297003)
,p_db_column_name=>'SO_STK_QTY'
,p_display_order=>134
,p_column_identifier=>'DC'
,p_column_label=>'SO Stock'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835229464453297001)
,p_db_column_name=>'STK_QTY'
,p_display_order=>124
,p_column_identifier=>'DB'
,p_column_label=>'Stock'
,p_allow_sorting=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835271117569297228)
,p_db_column_name=>'TOALLOC_QTY'
,p_display_order=>174
,p_column_identifier=>'DJ'
,p_column_label=>'Curr. Proc. Qty.'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'RIGHT'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'instr(nvl(:REQUEST,''~''),''XLS'') = 0 and',
'instr(nvl(:REQUEST,''~''),''CSV'') = 0'))
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'Y'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8835271914620297231)
,p_db_column_name=>'VARIANT'
,p_display_order=>204
,p_column_identifier=>'DM'
,p_column_label=>'Variant Items'
,p_column_link=>'f?p=&APP_ID.:931310203:&SESSION.::&DEBUG.::P931310203_IMRSV_BU,P931310203_IMRSV_RQST_NO,P931310203_IMRSV_RQST_SEQ_NO:#IMRSV_BU#,#IMRSV_RQST_NO#,#IMRSV_RQST_SEQ_NO#'
,p_column_linktext=>'#VARIANT#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7339370258662506875)
,p_db_column_name=>'WH_DESC'
,p_display_order=>284
,p_column_identifier=>'DU'
,p_column_label=>'WH'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(14553278375934488131)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'50671152'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'IMRSV_MAT_TYPE_DESC:IMRSV_RQST_NO:IMRSV_RQST_SEQ_NO:IMRSV_RQST_DATE:IMRSV_PROD_ID:IMRSV_PROD_REV:IMRSV_PROD_DESC1:ITEM_DESC1:IMRSV_UOM:WH_DESC:IMRSV_RQST_QTY:TOALLOC_QTY:SELECT_FLAG:IMRSV_ALLOC_QTY:IMRSV_ISS_QTY:IMRSV_RTN_QTY:IMRSV_CLS_QTY:Details:Ex'
||'ception:IMRSV_PR_NO:IMRSV_PROD_ORD_NO:IMRSV_PAR_PROD_ID:IMRSV_PAR_PROD_REV:PAR_ITEM_DESC'
,p_sort_column_1=>'IMRSV_RQST_DATE'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'IMRSV_RQST_NO'
,p_sort_direction_2=>'DESC'
,p_sort_column_3=>'IMRSV_RQST_SEQ_NO'
,p_sort_direction_3=>'ASC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(14560232513301063973)
,p_plug_name=>'Select Unit to create Stock Transfer PO'
,p_static_id=>'select-unit-to-create-stock-transfer-po'
,p_region_name=>'stock_transfer'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>wwv_flow_imp.id(10650510175351505351)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_item_display_point=>'BELOW'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5610318412897811654)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(14553236437221487725)
,p_button_name=>'Bag_details'
,p_static_id=>'bag-details'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Bag Details'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:931310206:&SESSION.::&DEBUG.:::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-file-text'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5610327929609811671)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(14560231772765063966)
,p_button_name=>'clear'
,p_static_id=>'clear'
,p_button_static_id=>'Clear1'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Clear'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5610274328402811506)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_imp.id(7807360702365851072)
,p_button_name=>'Clear'
,p_static_id=>'clear-2'
,p_button_static_id=>'Clear'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--gapRight'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Clear'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5610315220542811648)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(14553236437221487725)
,p_button_name=>'CloseShort'
,p_static_id=>'closeshort'
,p_button_static_id=>'B2'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Closeshort'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript: openModal(''narration'');'
,p_icon_css_classes=>'fa-cart-magnifying-glass'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5610315561971811649)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(14553236437221487725)
,p_button_name=>'CRE_STK_TRANSER'
,p_static_id=>'cre-stk-transer'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cre. Stk. Trans. PO'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript: openModal(''stock_transfer'');'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-cart-magnifying-glass'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5610314782746811648)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(14553236437221487725)
,p_button_name=>'CreateMI'
,p_static_id=>'createmi'
,p_button_static_id=>'B1'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create MI'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_show_processing=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5610327077006811670)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(14560231772765063966)
,p_button_name=>'CS_CANCEL'
,p_static_id=>'cs-cancel'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5610327489310811671)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(14560231772765063966)
,p_button_name=>'CS_OK'
,p_static_id=>'cs-ok'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5610315946232811651)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(14553236437221487725)
,p_button_name=>'Exceptions'
,p_static_id=>'exceptions'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Exceptions'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:931310202:&SESSION.::&DEBUG.:931310202:P931310202_RQST_NO,P931310202_RQST_SEQ_NO:&P93131020_IMRSV_RQST_NO.,&P93131020_IMRSV_RQST_SEQ_NO.'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-exception'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5610273887194811504)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(7807360702365851072)
,p_button_name=>'Find'
,p_static_id=>'find'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'savebtn'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5610318035029811653)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(14553236437221487725)
,p_button_name=>'Itemwise'
,p_static_id=>'itemwise'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Itemwise Summary'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:931310205:&SESSION.::&DEBUG.:::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-file-text'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5610317563641811653)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(14553236437221487725)
,p_button_name=>'Prod_ord_wise'
,p_static_id=>'prod-ord-wise'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Prod. Orderwise'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:931310204:&SESSION.::&DEBUG.:::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-file-text'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5610318787223811654)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(14553236437221487725)
,p_button_name=>'Reset'
,p_static_id=>'reset'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--success'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5610317197559811653)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(14553236437221487725)
,p_button_name=>'RUN_REPORT'
,p_static_id=>'run-report'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Run Report'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript: window.open(''&GLOBAL_REPORT_URL./ICM/ICM3050.rdf&REPORT_SERVER.&DESFORMAT=pdf&DESTYPE=cache&BU=&P931310102_IMRHD_BU.&P_USER=&GLOBAL_USER.&REQUEST_NO=&P931310102_IMRHD_RQST_NO.&STATUS=&P931310102_IMRHD_STATUS.&TYPE=&P931310102_IMRHD_TYPE.&P_LANG=1&PLNT=&P931310102_IMRHD_PLNT.&paramform=no'');'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-print'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5610316342535811651)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(14553236437221487725)
,p_button_name=>'Show_my_Record'
,p_static_id=>'show-my-record'
,p_button_static_id=>'hid'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Show My Record'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5610316835484811651)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(14553236437221487725)
,p_button_name=>'Show_my_Record_1'
,p_static_id=>'show-my-record-2'
,p_button_static_id=>'shd'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Show My Record'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check-square'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5610328971878811673)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(14560232513301063973)
,p_button_name=>'STK_CANCEL'
,p_static_id=>'stk-cancel'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5610329407665811673)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(14560232513301063973)
,p_button_name=>'STK_OK'
,p_static_id=>'stk-ok'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5610343520075811721)
,p_branch_name=>'go to page 931310202'
,p_branch_action=>'f?p=&APP_ID.:931310202:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(5610315946232811651)
,p_branch_sequence=>40
,p_branch_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5610343926862811723)
,p_branch_name=>'Go-to-branch(93131628)'
,p_branch_action=>'f?p=&APP_ID.:9313117011:&SESSION.::&DEBUG.::P9313117011_ISTHD_DOC_NO:&P93131020_IMRSV_DOC_NO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(5610314782746811648)
,p_branch_sequence=>20
,p_branch_condition_type=>'EXPRESSION'
,p_branch_condition=>'(select ICMCTRL_ALOW_AUTO_ISS_FLAG from  icm_control where icmctrl_bu = :global_bu) = ''Y'';'
,p_branch_condition_text=>'SQL'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5610344241712811723)
,p_branch_name=>'Go-to-branch 931311701'
,p_branch_action=>'f?p=&APP_ID.:931311701:&SESSION.::&DEBUG.:RP,93131020:P931311701_ISTHD_DOC_NO:&P93131020_IMRSV_DOC_NO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'EXPRESSION'
,p_branch_condition=>'(select ICMCTRL_ALOW_AUTO_ISS_FLAG from  icm_control where icmctrl_bu = :global_bu) = ''N'' AND :request =''CreateMI'';'
,p_branch_condition_text=>'SQL'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5610344670790811723)
,p_branch_name=>'go to page 93131170'
,p_branch_action=>'f?p=&APP_ID.:93131628:&SESSION.::&DEBUG.::P93131628_OPEN_REPORT:Y&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(5610327489310811671)
,p_branch_sequence=>30
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8835328860128297459)
,p_name=>'P93131020_IMRSV_ALLOC_QTY'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(14553236437221487725)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8835329667706297459)
,p_name=>'P93131020_IMRSV_CLS_QTY'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(14553236437221487725)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8835326875952297456)
,p_name=>'P93131020_IMRSV_CONV_FACTOR'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(14553236437221487725)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7325968836322116391)
,p_name=>'P93131020_IMRSV_DOC_NO'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(14553236437221487725)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8835328529512297458)
,p_name=>'P93131020_IMRSV_ISS_QTY'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(14553236437221487725)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8835325250815297455)
,p_name=>'P93131020_IMRSV_MAT_TYPE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(14553236437221487725)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8835322095772297444)
,p_name=>'P93131020_IMRSV_PLNT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(14553236437221487725)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8835324514220297453)
,p_name=>'P93131020_IMRSV_PROD_ID'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(14553236437221487725)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8835325669398297455)
,p_name=>'P93131020_IMRSV_PROD_ORD_NO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(14553236437221487725)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8835324867925297455)
,p_name=>'P93131020_IMRSV_PROD_REV'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(14553236437221487725)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8835327266311297456)
,p_name=>'P93131020_IMRSV_RQSTBY_ID'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(14553236437221487725)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8835323725510297453)
,p_name=>'P93131020_IMRSV_RQSTTO_STORE_ID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(14553236437221487725)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8835322520174297450)
,p_name=>'P93131020_IMRSV_RQST_NO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(14553236437221487725)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8835328073356297458)
,p_name=>'P93131020_IMRSV_RQST_QTY'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(14553236437221487725)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8835322849531297452)
,p_name=>'P93131020_IMRSV_RQST_SEQ_NO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(14553236437221487725)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8835329264571297459)
,p_name=>'P93131020_IMRSV_RTN_QTY'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(14553236437221487725)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8835323323762297452)
,p_name=>'P93131020_IMRSV_SEL_FLAG'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(14553236437221487725)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8835330106309297459)
,p_name=>'P93131020_IMRSV_SEL_USER'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(14553236437221487725)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8835326083230297456)
,p_name=>'P93131020_IMRSV_SF_CODE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(14553236437221487725)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8835324135398297453)
,p_name=>'P93131020_IMRSV_SUBSTIT_ITEM'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(14553236437221487725)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8835326523717297456)
,p_name=>'P93131020_IMRSV_SYS_LS_NO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(14553236437221487725)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8835327678952297458)
,p_name=>'P93131020_IMRSV_TOALLOC_QTY'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(14553236437221487725)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7807363117214851117)
,p_name=>'P93131020_ITEM'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(7807360702365851072)
,p_prompt=>'Item'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'FIRST_ROWSET',
  'submit_when_enter_pressed', 'DIALOG',
  'subtype', 'TEXT',
  'text_case', '0',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7807363155801851118)
,p_name=>'P93131020_ITEM_DESC'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(7807360702365851072)
,p_prompt=>'Item Desc'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7807362191491851108)
,p_name=>'P93131020_LOCATION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7807360702365851072)
,p_prompt=>'Loc. ID'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm:margin-left-sm'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'FIRST_ROWSET',
  'submit_when_enter_pressed', 'DIALOG',
  'subtype', 'TEXT',
  'text_case', '0',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7807363235284851119)
,p_name=>'P93131020_MR_FROM_DATE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(7807360702365851072)
,p_prompt=>'MR Date From'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7807363430651851120)
,p_name=>'P93131020_MR_FROM_TO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(7807360702365851072)
,p_prompt=>'MR Date To'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-right-sm'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7807362501178851111)
,p_name=>'P93131020_MR_NO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7807360702365851072)
,p_prompt=>'MR No.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT imrsv_rqst_no FROM inv_mat_rqst_so_view',
'  WHERE imrsv_bu = :GLOBAL_bu',
'   ORDER BY imrsv_rqst_no DESC'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Search MR No.')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8835340721026297484)
,p_name=>'P93131020_NARRATION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(14560231772765063966)
,p_prompt=>'Narration'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>50
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7807362930085851115)
,p_name=>'P93131020_ORDER_TYPE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(7807360702365851072)
,p_prompt=>'Order Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Production Order;PO,Subcontract;SC,Rework Order;RW,Work Order;WO,Work Request;WR,SCO - STD;SCOP,Equipment;EQ,SCO - REWORK;SCOR,SCO - VAL. ADD.;SCOV'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7807362538364851112)
,p_name=>'P93131020_ORD_NO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(7807360702365851072)
,p_prompt=>'Prod. Ord. No.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT imrsv_prod_ord_no',
'  FROM inv_mat_rqst_so_view',
' WHERE     imrsv_bu = :GLOBAL_bu',
'       AND imrsv_prod_ord_no IS NOT NULL',
'       AND (imrsv_rqst_qty - imrsv_alloc_qty) > 0',
'GROUP BY  imrsv_prod_ord_no',
'ORDER BY imrsv_prod_ord_no'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm:margin-right-sm'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Search Prod. Ord. No.')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6840739143360311780)
,p_name=>'P93131020_REC_SOURCE'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(14553236437221487725)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9037687467349273590)
,p_name=>'P93131020_ROWID'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(14553236437221487725)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7807362736563851114)
,p_name=>'P93131020_SF_CODE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(7807360702365851072)
,p_prompt=>'SF Code'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT imrsv_sf_code',
'    FROM inv_mat_rqst_so_view',
'   WHERE imrsv_bu = :GLOBAL_bu AND imrsv_sf_code IS NOT NULL',
'GROUP BY imrsv_sf_code',
'  '))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Search SF Code')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7793986692127900568)
,p_name=>'P93131020_SHOW_FIND'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(14553236437221487725)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8835343698060297489)
,p_name=>'P93131020_STK_UNIT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(14560232513301063973)
,p_prompt=>'Narration'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'FIRST_ROWSET',
  'submit_when_enter_pressed', 'POPUP',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7807362953268851116)
,p_name=>'P93131020_TYPE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(7807360702365851072)
,p_prompt=>'Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:STD;S,SFG;F'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-right-sm'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7807362387495851110)
,p_name=>'P93131020_UNIT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7807360702365851072)
,p_prompt=>'Unit'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'FIRST_ROWSET',
  'submit_when_enter_pressed', 'DIALOG',
  'subtype', 'TEXT',
  'text_case', '0',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7807362724744851113)
,p_name=>'P93131020_WH'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(7807360702365851072)
,p_prompt=>'W/H'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'FIRST_ROWSET',
  'submit_when_enter_pressed', 'DIALOG',
  'subtype', 'TEXT',
  'text_case', '0',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5610340719287811717)
,p_name=>'Clear'
,p_static_id=>'clear'
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5610274328402811506)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5610341209766811718)
,p_event_id=>wwv_flow_imp.id(5610340719287811717)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P93131020_LOCATION,P93131020_UNIT,P93131020_MR_NO,P93131020_ORD_NO,P93131020_WH,P93131020_SF_CODE,P93131020_ORDER_TYPE,P93131020_TYPE,P93131020_ITEM,P93131020_ITEM_DESC,P93131020_MR_FROM_DATE,P93131020_MR_FROM_TO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5610341563072811718)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5610314782746811648)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5610342050518811718)
,p_event_id=>wwv_flow_imp.id(5610341563072811718)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'request_button_name', 'CreateMI',
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5610342506065811720)
,p_name=>'New_1'
,p_static_id=>'new-2'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5610327929609811671)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5610343022276811720)
,p_event_id=>wwv_flow_imp.id(5610342506065811720)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P93131020_NARRATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5610335214446811709)
,p_name=>'Overallcheck Assign'
,p_static_id=>'overallcheck-assign'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(14553236437221487725)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5610335734458811710)
,p_event_id=>wwv_flow_imp.id(5610335214446811709)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'overallcheck();',
    'button();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5610339762611811715)
,p_name=>'Refresh Report'
,p_static_id=>'refresh-report'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5610273887194811504)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5610340272237811717)
,p_event_id=>wwv_flow_imp.id(5610339762611811715)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(14553236437221487725)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5610334376061811707)
,p_name=>'Reset'
,p_static_id=>'reset'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5610318787223811654)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5610334925206811709)
,p_event_id=>wwv_flow_imp.id(5610334376061811707)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.jQuery(''#reset_ir'').interactiveReport("reset");')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5610336065150811710)
,p_name=>'Show'
,p_static_id=>'show'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5610316342535811651)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5610336576849811710)
,p_event_id=>wwv_flow_imp.id(5610336065150811710)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P93131020_SHOW_FIND',
  'language', 'PLSQL',
  'plsql_code', ':P93131020_SHOW_FIND := ''Y'';',
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5610337131327811712)
,p_event_id=>wwv_flow_imp.id(5610336065150811710)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("shd").show();',
    'apex.item("hid").hide();',
    'apex.item("PEND").refresh();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5610337480375811712)
,p_name=>'Show_1'
,p_static_id=>'show-2'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5610316835484811651)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5610337963767811712)
,p_event_id=>wwv_flow_imp.id(5610337480375811712)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P93131020_SHOW_FIND',
  'language', 'PLSQL',
  'plsql_code', ':P93131020_SHOW_FIND := NULL;',
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5610338459832811713)
,p_event_id=>wwv_flow_imp.id(5610337480375811712)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("shd").hide();',
    'apex.item("hid").show();',
    'apex.item("PEND").refresh();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5610338847051811713)
,p_name=>'Show my Record Page Load'
,p_static_id=>'show-my-record-page-load'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5610339387084811713)
,p_event_id=>wwv_flow_imp.id(5610338847051811713)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("shd").hide();',
    'apex.item("hid").show();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5610333507495811704)
,p_name=>'Submit'
,p_static_id=>'submit'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P93131020_FILTER'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5610334012973811707)
,p_event_id=>wwv_flow_imp.id(5610333507495811704)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5610330636058811696)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CHECKALL'
,p_static_id=>'checkall'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' DECLARE',
'     v_doc_no    VARCHAR2(30);',
'     v_seq_no    NUMBER;',
'',
'TYPE PENDPAY IS REF CURSOR;',
'   PAY_CURSOR PENDPAY;',
' BEGIN',
' ',
' FOR i in 1..APEX_APPLICATION.G_f01.COUNT ',
'    LOOP ',
'     UPDATE inv_material_request_ln',
'        SET imrln_to_allocated_qty = APEX_APPLICATION.G_f01(i),',
'            imrln_sel_user = :global_user',
'      WHERE imrln_bu = :global_bu',
'        AND imrln_sel_flag = ''N''',
'        AND (imrln_requested_qty - (imrln_issued_qty + imrln_mi_allocated_qty + imrln_cls_qty -  imrln_returned_qty)) > 0',
'        AND imrln_rqst_no||imrln_seq_no = APEX_APPLICATION.G_f02(i)',
'        AND (imrln_rqst_no = :P93131020_MR_NO OR :P93131020_MR_NO IS NULL);',
'',
'',
'        UPDATE inv_material_request_ln',
'        SET imrln_sel_flag = ''Y'',',
'            imrln_sel_user = :global_user  -- imrln_to_allocated_qty =(imrln_requested_qty - (imrln_issued_qty + imrln_mi_allocated_qty + imrln_cls_qty -  imrln_returned_qty))',
'      WHERE imrln_bu = :global_bu',
'        AND imrln_sel_flag = ''N''',
'        AND (imrln_requested_qty - (imrln_issued_qty + imrln_mi_allocated_qty + imrln_cls_qty -  imrln_returned_qty)) > 0',
'        AND func_find_prod_var_group_type(:GLOBAL_bu,imrln_prod_id,imrln_prod_rev) = ''N''',
'        AND imrln_rqst_no||imrln_seq_no = APEX_APPLICATION.G_f02(i)',
'        AND (imrln_rqst_no = :P93131020_MR_NO OR :P93131020_MR_NO IS NULL);',
'        IF sql%FOUND THEN ',
'        COMMIT;',
'        EXIT;',
'        END IF;',
'END LOOP;',
'  ',
'',
'OPEN PAY_CURSOR FOR  ''SELECT IMRSV_RQST_NO,IMRSV_RQST_SEQ_NO',
'                  FROM INV_MAT_RQST_SO_VIEW',
'                 WHERE imrsv_bu = ''''''||:GLOBAL_bu||''''''',
'                   AND (IMRSV_RQST_NO = ''''''||:P93131020_MR_NO||'''''' OR ''''''||:P93131020_MR_NO||'''''' IS NULL)',
'                   AND ((imrsv_rqst_qty + imrsv_excs_qty) - (imrsv_iss_qty + imrsv_alloc_qty + imrsv_cls_qty - imrsv_rtn_qty)) > ''''''||0||''''''',
'                   AND ''||func_find_ir_condition_expression(9011,93131020,''PENDINGMIV'',:APP_SESSION);',
'   LOOP',
'   FETCH PAY_CURSOR INTO v_doc_no,v_seq_no;',
'    proc_debug_proc(''MRSH''||v_doc_no);',
'   EXIT WHEN PAY_CURSOR%notfound;',
'',
'     UPDATE inv_material_request_ln',
'        SET imrln_sel_flag = ''Y'',',
'            imrln_sel_user = :global_user,',
'            imrln_to_allocated_qty =(imrln_requested_qty - (imrln_issued_qty + imrln_mi_allocated_qty + imrln_cls_qty -  imrln_returned_qty))',
'      WHERE imrln_bu = :global_bu',
'        AND imrln_sel_flag = ''N''',
'        AND (imrln_requested_qty - (imrln_issued_qty + imrln_mi_allocated_qty + imrln_cls_qty -  imrln_returned_qty)) > 0',
'        AND func_find_prod_var_group_type(:GLOBAL_bu,imrln_prod_id,imrln_prod_rev) = ''N''',
'        AND imrln_rqst_no = v_doc_no',
'        AND (imrln_rqst_no = :P93131020_MR_NO OR :P93131020_MR_NO IS NULL)',
'        AND imrln_seq_no = v_seq_no; ',
'',
'   END LOOP; ',
'  CLOSE PAY_CURSOR;',
'',
' ',
'  COMMIT;',
' HTP.P(''success'');  ',
' END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>128368800515200668
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5610330325229811692)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CHECKANDUNCHECK'
,p_static_id=>'checkanduncheck'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'Cursor c_pend',
'     IS ',
'      SELECT imrsv_rqst_no,imrsv_rqst_seq_no,IMRSV_PLNT,imrsv_rqstto_store_id,imrsv_mat_type,imrsv_prod_id,imrsv_prod_rev,imrsv_uom,imrsv_substit_item_flag,',
'      imrsv_prod_ord_no,imrsv_sf_code,imrsv_sys_ls_no,imrsv_conv_factor,imrsv_rqst_qty,imrsv_toalloc_qty,imrsv_iss_qty,imrsv_alloc_qty,imrsv_cls_qty,imrsv_rtn_qty,',
'       ((imrsv_rqst_qty + imrsv_excs_qty) - (imrsv_iss_qty + imrsv_alloc_qty + imrsv_cls_qty - imrsv_rtn_qty)) AS Bal_qty',
'        FROM INV_MAT_RQST_SO_VIEW',
'       WHERE imrsv_bu =:global_bu ',
'         AND ((imrsv_rqst_qty + imrsv_excs_qty) - (imrsv_iss_qty + imrsv_alloc_qty + imrsv_cls_qty - imrsv_rtn_qty)) > 0',
'         AND imrsv_plnt IN  (SELECT wupal_plnt_id',
'                            FROM wapl_user_plnt_access_ln',
'                           WHERE wupal_bu= :global_bu',
'                             AND wupal_user_id= :global_user',
'                             AND TRUNC (SYSDATE) BETWEEN TRUNC(wupal_date_from) AND TRUNC(wupal_date_to))',
'        AND imrsv_rqst_no||IMRSV_RQST_SEQ_NO = APEX_APPLICATION.G_X02;',
'',
'    ',
'',
' CURSOR c11(c_plnt VARCHAR2,',
' c_prod_id VARCHAR2,',
' c_prod_rev VARCHAR2) IS',
'	SELECT prodplnt_excs_iss_flag',
'	  FROM prod_plants',
'	 WHERE prodplnt_bu = :GLOBAL_bu',
'	   AND prodplnt_plnt = c_plnt',
'	   AND prodplnt_prod_id = c_prod_id',
'	   AND prodplnt_prod_rev = c_prod_rev;',
'',
'  cr11 c11%ROWTYPE;',
'        r_pend c_pend%rowtype;',
'        v_error   varchar2(500);  ',
'BEGIN',
'',
'',
'      IF APEX_APPLICATION.G_X03 <= 0 OR APEX_APPLICATION.G_X03 IS NULL THEN',
'        v_error:=''Cur. Proc. Qty. should be greater than zero.'';',
'      END IF;',
'',
'',
'',
' DECLARE',
'	qty 	NUMBER;',
'   BEGIN',
'	  SELECT SUM(imrvd_requested_qty) ',
'	    INTO qty ',
'	    FROM inv_mat_req_vg_details',
'	   WHERE imrvd_bu = :global_bu',
'	     AND imrvd_rqst_no||imrvd_seq_no = APEX_APPLICATION.G_X02;',
'',
'      IF qty <> APEX_APPLICATION.G_X03 THEN',
'          v_error:=''To allocated qty should be equal to the sum of requested variant qty.''||'' ''||qty;',
'      END IF;',
'      END;',
'',
'OPEN c_pend;',
'FETCH c_pend INTO r_pend;',
'IF c_pend%found then',
'',
'OPEN c11(r_pend.IMRSV_PLNT,r_pend.imrsv_prod_id,r_pend.imrsv_prod_rev);',
'FETCH c11 INTO cr11;	',
'',
'   /*IF LENGTH(APEX_APPLICATION.G_X03 ) > 9 THEN',
'       v_error :=''Cur. Proc. Qty. invalid number'';',
'    END IF;',
'',
'   IF cr11.prodplnt_excs_iss_flag = ''Y'' AND APEX_APPLICATION.G_X03 > r_pend.Bal_qty THEN',
'           v_error :=''Cur. Proc. Qty. should not be greater than requested qty.'';',
'  END IF;*/',
'    ',
'  IF cr11.prodplnt_excs_iss_flag = ''N'' AND APEX_APPLICATION.G_X03 > r_pend.Bal_qty THEN',
'           v_error :=''Cur. Proc. Qty. should not be greater than requested qty.'';',
'  END IF;',
'',
'  IF  (APEX_APPLICATION.G_X03 <> TRUNC(APEX_APPLICATION.G_X03))  AND func_find_uom_fraction(:GLOBAL_bu,r_pend.imrsv_uom) = ''N'' THEN ',
'          v_error :=''Fraction is not allowed for this UOM ''||r_pend.imrsv_uom||'' against MR No. ''||r_pend.imrsv_rqst_no||''(''||r_pend.imrsv_rqst_seq_no||'')'';',
'  END IF;',
'CLOSE C11;',
'DECLARE',
'  CURSOR c1',
'      IS',
'  SELECT count(*)v_cnt',
'    FROM inv_mat_req_substit_item',
'   WHERE imrsi_bu = :GLOBAL_bu',
'     AND imrsi_rqst_no||imrsi_seq_no = APEX_APPLICATION.G_X02',
'     AND imrsi_prod_id IS NULL;',
'cr1 c1%ROWTYPE;',
'v_cnt VARCHAR2(50);  ',
'',
'BEGIN',
'',
'  OPEN c1;',
'  FETCH c1 INTO cr1;',
'    IF cr1.v_cnt > 0 AND r_pend.imrsv_substit_item_flag = ''Y''',
'    	 AND ROUND(func_find_curr_stk_hand(:GLOBAL_bu,r_pend.imrsv_rqstto_store_id,r_pend.imrsv_prod_id,r_pend.imrsv_prod_rev,',
'        r_pend.imrsv_mat_type,r_pend.imrsv_prod_ord_no,r_pend.imrsv_sf_code,r_pend.imrsv_sys_ls_no) * r_pend.imrsv_conv_factor) = 0 THEN',
'',
'      v_error :=''Substitute Item must be entered for the request no.'';',
'    END IF;',
'  CLOSE c1;',
'END;',
'',
'',
'      ',
'IF r_pend.IMRSV_PROD_ID IS NOT NULL THEN',
'	IF func_find_prod_var_group_type(:GLOBAL_bu,',
'	                               r_pend.imrsv_prod_id,',
'	                               r_pend.imrsv_prod_rev) = ''Y'' THEN',
'	DECLARE',
'	v_cnt   			NUMBER;',
'	var_item			VARCHAR2(25);',
'	var_item_rev	NUMBER(5);',
'	BEGIN',
'		SELECT COUNT(*)',
'		  INTO v_cnt',
'		  FROM inv_mat_req_vg_details',
'		 WHERE imrvd_bu = :GLOBAL_bu',
'		   AND imrvd_rqst_no = r_pend.imrsv_rqst_no',
'		   AND imrvd_seq_no  = r_pend.imrsv_rqst_seq_no;',
'	',
'	IF v_cnt = 0 THEN',
'        v_error :=''Variant item must be entered.'';',
'	END IF;',
'	     BEGIN',
'       SELECT pvga_var_item,',
'              pvga_var_rev',
'         INTO var_item,',
'              var_item_rev',
'         FROM prod_variant_group_asso',
'        WHERE pvga_bu = :GLOBAL_bu',
'          AND pvga_var_group_id  = r_pend.imrsv_prod_id   ',
'          AND pvga_var_group_rev = r_pend.imrsv_prod_rev',
'          AND pvga_deflt_flag = ''Y'';',
'	     EXCEPTION WHEN NO_DATA_FOUND THEN',
'	     	 var_item := NULL;',
'	     	 var_item_rev := NULL;',
'	     END;',
'',
'          ',
'       UPDATE inv_mat_req_vg_details',
'          SET imrvd_requested_qty = r_pend.imrsv_toalloc_qty',
'        WHERE imrvd_bu       = :GLOBAL_bu',
'          AND imrvd_rqst_no  = r_pend.imrsv_rqst_no',
'          AND imrvd_seq_no   = r_pend.imrsv_rqst_seq_no',
'          AND imrvd_prod_id  = var_item',
'          AND imrvd_prod_rev = var_item_rev;',
'          ',
'	END;',
'   END IF;',
'   END IF;',
'IF APEX_APPLICATION.G_X01 = ''Y'' AND v_error IS NULL THEN ',
'',
'         proc_sel_rec_frm_mat_req(:GLOBAL_BU,',
'                                  r_pend.IMRSV_RQST_NO,',
'                                  r_pend.IMRSV_RQST_SEQ_NO,',
'                                  ''Y'' ,',
'                                  APEX_APPLICATION.G_X03,',
'                                  CASE ',
'                                  WHEN APEX_APPLICATION.G_X03 - (r_pend.imrsv_rqst_qty - (r_pend.imrsv_iss_qty + r_pend.imrsv_alloc_qty - r_pend.imrsv_rtn_qty)) < 0 THEN 0',
'   						             ELSE NVL(APEX_APPLICATION.G_X03 - (r_pend.imrsv_rqst_qty - (r_pend.imrsv_iss_qty + r_pend.imrsv_alloc_qty - r_pend.imrsv_rtn_qty)),0)',
'   						             END,',
'   						             :GLOBAL_USER); ',
'ELSE',
'',
'       proc_sel_rec_frm_mat_req(:GLOBAL_BU,',
'                                  r_pend.IMRSV_RQST_NO,',
'                                  r_pend.IMRSV_RQST_SEQ_NO,',
'                                 ''N'' ,',
'                                  APEX_APPLICATION.G_X03,',
'                                  CASE ',
'                                  WHEN APEX_APPLICATION.G_X03 - (r_pend.imrsv_rqst_qty - (r_pend.imrsv_iss_qty + r_pend.imrsv_alloc_qty - r_pend.imrsv_rtn_qty)) < 0 THEN 0',
'   						             ELSE NVL(APEX_APPLICATION.G_X03 - (r_pend.imrsv_rqst_qty - (r_pend.imrsv_iss_qty + r_pend.imrsv_alloc_qty - r_pend.imrsv_rtn_qty)),0)',
'   						             END,',
'   						             :GLOBAL_USER); ',
'END IF;',
'      CLOSE c_pend;',
'      END IF;',
' IF v_error IS NOT NULL THEN',
' HTP.P(v_error); ',
' ELSE',
' HTP.P(''success''); ',
' END IF;',
' COMMIT;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>128368489686200664
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5610332733945811703)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cre. Stk. Trans. PO'
,p_static_id=>'cre-stk-trans-po'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'var_doc_no 		VARCHAR2(1000);',
'BEGIN',
'FOR i IN 1 .. APEX_APPLICATION.g_f01.COUNT',
'   LOOP',
'    IF    REGEXP_SUBSTR (APEX_APPLICATION.g_f01(i),''[^|"]+'',1,1) = REGEXP_SUBSTR (APEX_APPLICATION.g_f02(i),''[^|"]+'',1,1)',
'      AND REGEXP_SUBSTR (APEX_APPLICATION.g_f01(i),''[^|"]+'',1,2) = REGEXP_SUBSTR (APEX_APPLICATION.g_f02(i),''[^|"]+'',1,2)',
'      AND REGEXP_SUBSTR (APEX_APPLICATION.g_f01(i),''[^|"]+'',2,3) = REGEXP_SUBSTR (APEX_APPLICATION.g_f02(i),''[^|"]+'',2,3)',
'      AND REGEXP_SUBSTR (APEX_APPLICATION.g_f01(i),''[^|"]+'',3,4) = REGEXP_SUBSTR (APEX_APPLICATION.g_f02(i),''[^|"]+'',3,4)',
'    THEN',
'      IF TO_NUMBER(APEX_APPLICATION.g_f03(i))  > 0',
'      THEN',
'		UPDATE inv_material_request_ln',
'		   SET imrln_sel_flag = ''Y'',',
'			   imrln_upd_by = :global_user,',
'			   imrln_upd_date = SYSDATE',
'		 WHERE imrln_bu = REGEXP_SUBSTR (APEX_APPLICATION.g_f01 (i),''[^|"]+'',1,1)',
'		   AND imrln_plnt = REGEXP_SUBSTR (APEX_APPLICATION.g_f01 (i),''[^|"]+'',2,3)',
'		   AND imrln_rqst_no = REGEXP_SUBSTR (APEX_APPLICATION.g_f01 (i),''[^|"]+'',1,2)',
'		   AND imrln_seq_no = REGEXP_SUBSTR (APEX_APPLICATION.g_f01 (i),''[^|"]+'',3,4);',
'	  END IF;',
'      ELSE',
'          raise_application_error(-20999,''Please select document to Cre. Stk. Trans. PO.'');',
'	END IF;',
'END LOOP;',
'    IF SQL%FOUND',
'    THEN',
'	IF :P93131020_STK_UNIT IS NOT NULL',
'	THEN',
'		proc_cre_stk_trf_po_frm_mr(:GLOBAL_bu,',
'								   :P93131020_STK_UNIT,',
'								   :GLOBAL_user,',
'								   1,',
'								   var_doc_no',
'								);',
'		IF var_doc_no IS NOT NULL ',
'		THEN',
'		apex_application.g_print_success_message := (''Stock transfer PO created :  ''||'' ''||var_doc_no);',
'		ELSE',
'			raise_application_error(-20999,''Stock transfer PO not created.'');',
'		END IF;',
'	ELSE',
'		raise_application_error(-20999,''Please select Unit.'');',
'	END IF;',
'    END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5610329407665811673)
,p_internal_uid=>128370898402200675
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5610332329944811699)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Create MI'
,p_static_id=>'create-mi'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--	IF func_find_stk_trfr_backlog_flg(:GLOBAL_bu) = ''N'' THEN',
'DECLARE',
'    v_cnt NUMBER;',
'BEGIN',
'    SELECT COUNT(*)',
'      INTO v_cnt',
'      FROM inv_mat_rqst_so_view',
'     WHERE imrsv_bu = :global_bu',
'       AND imrsv_sel_flag = ''Y''',
'       AND imrsv_sel_user = :GLOBAL_user;',
'    IF v_cnt = 0 THEN',
'        raise_application_error(-20999, ''Select the Record'');',
'    END IF;',
'END;',
'',
'DECLARE',
'  v_cnt NUMBER;',
'  BEGIN ',
'    SELECT COUNT(*) INTO V_cnt',
'      FROM inv_mat_rqst_exp',
'   WHERE imre_bu = :GLOBAL_bu',
'     AND imre_user = :GLOBAL_user;',
'  ',
'  IF V_cnt > 0 THEN',
'',
'  DELETE FROM inv_mat_rqst_exp',
'   WHERE imre_bu = :GLOBAL_bu',
'     AND imre_user = :GLOBAL_user;',
'  Commit;',
'  END IF;',
'',
'  END;   ',
'',
'DECLARE',
'    CURSOR c1 IS',
'    SELECT icmctrl_mr_to_pr_flag,',
'           icmctrl_alow_auto_iss_flag,',
'           icmctrl_auto_mr_issue_flag',
'      FROM icm_control',
'     WHERE icmctrl_bu = :global_bu;',
'',
'    var_doc_no     VARCHAR2(100);',
'    var_doc_no1    VARCHAR2(100);',
'    var_res_flag   VARCHAR2(1);',
'    var_dc_no      VARCHAR2(100);',
'    var_pack_dc_no VARCHAR2(100);',
'    v_alert        NUMBER;',
'    var_res        VARCHAR2(1);',
'    v_rqst_no      VARCHAR2(20);',
'    v_plnt         VARCHAR2(20);',
'    v_plnt_loc     VARCHAR2(20);',
'    v_doc_type     VARCHAR2(1);',
'    v_doc_no       VARCHAR2(1);',
'    v_date_fr      DATE;',
'    v_date_to      DATE;',
'    v_wh           VARCHAR2(20);',
'    v_wh_desc      VARCHAR2(20);',
'    v_prod_id      VARCHAR2(20);',
'    v_prod_desc    VARCHAR2(20);',
'    v_status       VARCHAR2(20);',
'    v_icm_pr_flag  VARCHAR2(1);',
'    cr1            c1%rowtype;',
'BEGIN',
'    OPEN c1;',
'    FETCH c1 INTO cr1;',
'				  --raise_application_error(-20999,cr1.icmctrl_mr_to_pr_flag);',
'    IF cr1.icmctrl_mr_to_pr_flag = ''Y'' THEN',
'        proc_chk_mr_to_pur_req(:global_bu, :global_user, 1, var_res_flag);',
'  ',
'        IF var_res_flag = ''Y'' THEN',
'            proc_cre_mr_to_pur_req(:global_bu, :global_user, 1, var_res, v_rqst_no);',
'             -- raise_application_error(-20999,var_res||''~''||v_rqst_no); ',
'             apex_application.g_print_success_message := ''PR Created'' ||''-''||v_rqst_no;',
'        END IF;',
'',
'    END IF;',
'',
'    CLOSE c1;',
'',
'    proc_exp_frm_pend_mat_rqst(:global_bu, trunc(sysdate), :global_user);',
'',
'    proc_alloc_frm_mat_req(:global_bu, trunc(sysdate), :global_user, 1, var_doc_no,',
'                          var_dc_no, var_pack_dc_no);',
'',
'    /*proc_ins_mi_srch_dtls1(:global_bu, v_plnt, v_plnt_loc, v_doc_type, v_doc_no,',
'                          to_date(v_date_fr, ''DD-MM-YYYY''), to_date(v_date_to, ''DD-MM-YYYY''), v_wh, v_wh_desc, v_prod_id, v_prod_desc,',
'                          v_status, :global_user,''LN'',null);*/',
'',
'',
'IF var_doc_no IS NOT NULL  THEN',
'   :P93131020_IMRSV_DOC_NO := TRIM(REGEXP_SUBSTR(var_doc_no,''[^to"]+'',1,1));',
'END IF;',
'',
'    COMMIT;',
'   ',
'    IF var_doc_no IS NOT NULL THEN',
'',
'    ',
'',
'        apex_application.g_print_success_message := ''Material Allocated''',
'',
'                                                    || '' and''',
'                                                    || chr(10)',
'                                                    || ''Issuance Doc. Created.''',
'                                                    || '' - ''',
'                                                    || var_doc_no;',
'           ',
'         ',
'         ',
'        OPEN c1;',
'        FETCH c1 INTO cr1;',
'        IF',
'            cr1.icmctrl_alow_auto_iss_flag = ''Y''',
'            AND ( (',
'                cr1.icmctrl_auto_mr_issue_flag = ''N''',
'                AND :p93131020_rec_source IN ( ''S'', ''M'' )',
'            ) OR (',
'                cr1.icmctrl_auto_mr_issue_flag = ''Y''',
'                AND :p93131020_rec_source = ''M''',
'            ) )',
'        THEN',
'            apex_application.g_print_success_message := ''Material Issuance Posted.'';',
'',
'            IF var_pack_dc_no IS NOT NULL THEN',
'',
'                apex_application.g_print_success_message := ''Packing ''',
'                                                            || '' ''',
'                                                            || '' Delivery Challan Created and DC No. :''',
'                                                            || var_pack_dc_no;',
'            END IF;',
'',
'        END IF;',
'',
'        CLOSE c1;',
'    END IF;',
'     IF var_dc_no IS NOT NULL THEN',
'        apex_application.g_print_success_message := ''Material Allocated''',
'                                                    || '' and''',
'                                                    || chr(10)',
'                                                    || ''Issuance Doc. Created.''',
'                                                    || '' - ''',
'                                                    || var_doc_no',
'                                                    || ''.''',
'                                                    || ''Delivery Challan Created and DC No.''',
'                                                    || ''-''',
'                                                    || var_dc_no;',
'       END IF;		 --KV',
'',
'',
'    EXCEPTION WHEN OTHERS THEN',
'        proc_apex_err_msg_log(93131020,''MIV'');   ',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5610314782746811648)
,p_internal_uid=>128370494401200671
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5610331478730811698)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'OVERALLCHECK'
,p_static_id=>'overallcheck'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   V_FLAG    VARCHAR2 (5);',
'   V_COUNT   VARCHAR2 (10);',
'BEGIN',
'   SELECT CASE',
'             WHEN imrsv_sel_flag = ''N'' THEN ''N''',
'             WHEN imrsv_sel_flag = ''Y'' THEN ''Y''',
'             ELSE ''NY''',
'          END',
'             FLAG',
'     INTO V_FLAG',
'     FROM (  SELECT LISTAGG (DISTINCT imrsv_sel_flag, '','')',
'                       WITHIN GROUP (ORDER BY imrsv_sel_flag)',
'                       imrsv_sel_flag',
'              FROM INV_MAT_RQST_SO_VIEW a',
'             WHERE imrsv_bu = :GLOBAL_BU ',
'             AND ((imrsv_rqst_qty + imrsv_excs_qty) - (imrsv_iss_qty + imrsv_alloc_qty + imrsv_cls_qty - imrsv_rtn_qty)) > 0',
'        AND func_find_prod_var_group_type(:GLOBAL_bu,imrsv_prod_id,imrsv_prod_rev) = ''N'');',
'          ',
'  SELECT NVL(COUNT(imrsv_sel_flag),0)',
'    INTO V_COUNT',
'    FROM INV_MAT_RQST_SO_VIEW a',
'   WHERE imrsv_bu = :GLOBAL_BU ',
'     AND imrsv_sel_flag = ''Y''',
'     AND ((imrsv_rqst_qty + imrsv_excs_qty) - (imrsv_iss_qty + imrsv_alloc_qty + imrsv_cls_qty - imrsv_rtn_qty)) > 0',
'        AND func_find_prod_var_group_type(:GLOBAL_bu,imrsv_prod_id,imrsv_prod_rev) = ''N'';',
'          ',
' HTP.P (V_FLAG || ''-'' || V_COUNT || ''-'' ||APEX_APPLICATION.G_X03||'' ''|| ''Row Selected'');          ',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>128369643187200670
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5610333131463811703)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Closeshort OK'
,p_static_id=>'process-for-closeshort-ok'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_cnt number;',
'begin',
'      select count(*)',
'        into v_cnt',
'        from INV_MAT_RQST_SO_VIEW',
'       WHERE imrsv_bu =:global_bu ',
'         AND IMRSV_SEL_FLAG = ''Y''',
'         AND ((imrsv_rqst_qty + imrsv_excs_qty) - (imrsv_iss_qty + imrsv_alloc_qty + imrsv_cls_qty - imrsv_rtn_qty)) > 0',
'      AND imrsv_plnt IN',
'(SELECT wupal_plnt_id',
'FROM wapl_user_plnt_access_ln',
'WHERE     wupal_bu= :global_bu',
'AND wupal_user_id= :global_user',
'AND TRUNC (SYSDATE) BETWEEN TRUNC(wupal_date_from) AND TRUNC(wupal_date_to));',
'IF v_cnt = 0 THEN',
'Raise_Application_Error(-20999,''Select the Record'');',
'END IF;',
'end;',
'DECLARE',
'	CURSOR c1 ',
'	    IS',
'	SELECT *',
'	  FROM inv_mat_rqst_so_view',
'	 WHERE imrsv_bu = :GLOBAL_BU',
'	   AND imrsv_sel_user = :GLOBAL_USER',
'	   AND imrsv_sel_flag = ''Y''',
'	   AND (imrsv_rqst_qty - (imrsv_alloc_qty + imrsv_iss_qty + imrsv_cls_qty + imrsv_toalloc_qty - imrsv_rtn_qty)) < 0;',
'  v_cnt  NUMBER;',
'  cr1  c1%ROWTYPE;',
'BEGIN',
'',
'	OPEN c1;',
'  FETCH c1 INTO cr1;',
'  IF c1%FOUND THEN',
'       raise_application_error(-20999,''Closeshort Qty. should be lesser than or equal to Pending Qty.'');',
'  	  ',
'  END IF;',
'  ',
'  SELECT count(*)',
'    INTO v_cnt',
'    FROM inv_mat_rqst_so_view',
'   WHERE imrsv_bu = :GLOBAL_BU',
'     AND imrsv_sel_flag = ''Y''',
'     AND imrsv_sel_user = :GLOBAL_USER; ',
'	  ',
'  IF v_cnt = 0 THEN',
'    raise_application_error(-20999,''Select records for CloseShort.'');',
'  END IF;',
'  ',
'    --apex_application.g_print_success_message:= ''Document Closeshorted.'';',
'END;',
'----------------------------------------Check WO exists or not------------------------------------',
'DECLARE',
'CURSOR c1 IS',
'SELECT imrsv_rqst_no,imrsv_rqst_seq_no',
'  FROM inv_mat_rqst_so_view',
' WHERE imrsv_bu = :GLOBAL_BU',
'   AND imrsv_sel_flag = ''Y''',
'   AND imrsv_sel_user = :GLOBAL_USER; ',
'',
'CURSOR c2(c_rqst_no VARCHAR2,',
'          c_seq_no  NUMBER)IS   ',
'',
'SELECT mwsmr_wo_no',
'  FROM inv_material_request_ln,maint_wo,maint_wo_spare_mtrl_rqrd',
' WHERE imrln_bu = mwsmr_bu',
'   AND imrln_plnt = mwsmr_plnt',
'   AND imrln_ord_no = mwsmr_wo_no',
'   AND mntwo_bu =  mwsmr_bu',
'   AND mntwo_plnt = mwsmr_plnt',
'   AND mntwo_wo_no = mwsmr_wo_no',
'   AND imrln_ord_type = ''WO''',
'   AND mntwo_status =''A''',
'   AND imrln_bu = :GLOBAL_bu ',
'   AND imrln_rqst_no = c_rqst_no',
'   AND imrln_seq_no = c_seq_no;',
'',
'cr2     c2%ROWTYPE;   ',
' BEGIN ',
'   FOR cr1 IN c1',
'   LOOP',
'      OPEN c2(cr1.imrsv_rqst_no,cr1.imrsv_rqst_seq_no);',
'      FETCH c2 INTO cr2;',
'        IF c2%FOUND THEN ',
'           RAISE_APPLICATION_ERROR(-20999,''Cannot closeshort the MR Against Work order in Approved status.'');',
'        END IF;',
'      CLOSE c2;',
'   END LOOP;',
' END;         ',
'-------------------------------------------------BTN CS OK PROCESS----------------------------------------------------------------------',
'DECLARE',
'CURSOR c1',
'    IS',
'SELECT *',
'  FROM inv_mat_rqst_so_view',
' WHERE imrsv_bu = :GLOBAL_BU',
'   AND imrsv_sel_flag = ''Y''',
'   AND imrsv_sel_user = :GLOBAL_USER;    	',
'	',
'   alert             NUMBER (10);',
'   var_res         VARCHAR2 (10);',
'BEGIN',
'   IF :P93131020_NARRATION IS NULL',
'   THEN',
'      raise_application_error(-20999,''Closeshort reason must be entered.'');',
'   END IF;',
'     -- func_frm_msg (:GLOBAL.BU, ''STATUS_CNG_LN'', ''CLOSESHOT'')); CAUTION ALERT',
'     proc_closeshort_frm_mr(:GLOBAL_BU,',
'                            :GLOBAL_USER,',
'                            :P93131020_NARRATION',
'                           );',
'    COMMIT;',
'    apex_application.g_print_success_message:= ''Document Closeshorted.'';',
'END;',
'---------------------------------------------------------------------------------------------------------------------------------'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5610327489310811671)
,p_internal_uid=>128371295920200675
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5610331841479811698)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Sel_flag'
,p_static_id=>'sel-flag'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P93131020_IMRSV_SEL_FLAG = ''N'' THEN ',
':P93131020_IMRSV_SEL_FLAG := ''Y'';',
'ELSE',
':P93131020_IMRSV_SEL_FLAG := ''N'';',
'END IF;',
'',
'DECLARE',
'  CURSOR c1',
'      IS',
'  SELECT count(*)v_cnt',
'    FROM inv_mat_req_substit_item',
'   WHERE imrsi_bu = :GLOBAL_bu',
'     AND imrsi_rqst_no = :P93131020_IMRSV_RQST_NO',
'     AND imrsi_seq_no = :P93131020_IMRSV_RQST_SEQ_NO',
'     AND imrsi_prod_id IS NULL;',
'cr1 c1%ROWTYPE;',
'v_cnt VARCHAR2(50);    ',
'BEGIN',
'  OPEN c1;',
'  FETCH c1 INTO cr1;',
'    IF cr1.v_cnt > 0 AND :P93131020_IMRSV_SUBSTIT_ITEM = ''Y''',
'    	 AND ROUND(func_find_curr_stk_hand(:global_bu,:imrsv_rqstto_store_id,:imrsv_prod_id,:imrsv_prod_rev,:imrsv_mat_type,:imrsv_prod_ord_no,:imrsv_sf_code,:imrsv_sys_ls_no) * :mrsv_conv_factor) = 0 THEN',
'      :P93131020_IMRSV_SEL_FLAG := ''N'';',
'      raise_application_error(-20999,''Substitute Item must be entered for the request no. :''||'' - ''||:P93131020_IMRSV_RQST_NO);',
'    END IF;',
'  CLOSE c1;',
'END;',
'',
'DECLARE',
'CURSOR c1 IS',
'SELECT store_inv_id',
'  FROM stores',
' WHERE store_bu = :global_bu ',
'   AND STORE_PLNT=:P93131020_IMRSV_PLNT',
'   AND store_physical IN (''V'')',
'  AND store_id=:P93131020_IMRSV_RQSTBY_ID;',
'',
'  cr1		c1%ROWTYPE;',
'',
'BEGIN',
' ',
'OPEN c1;',
'FETCH c1 INTO cr1;',
'close c1;',
'				',
'-- proc_chk_suplr_stk_out_days(:global_bu,:P93131020_IMRSV_PLNT,cr1.store_inv_id);	',
'		',
'END;',
'',
'IF :P93131020_IMRSV_PROD_ID IS NOT NULL THEN',
'	IF func_find_prod_var_group_type(:global_bu,',
'	                                 :P93131020_IMRSV_PROD_ID,',
'	                                 :P93131020_IMRSV_PROD_REV) = ''Y'' THEN',
'	DECLARE',
'	v_cnt   			NUMBER;',
'	var_item			VARCHAR2(25);',
'	var_item_rev	NUMBER(5);',
'	BEGIN',
'		SELECT COUNT(*)',
'		  INTO v_cnt',
'		  FROM inv_mat_req_vg_details',
'		 WHERE imrvd_bu = :global_bu',
'		   AND imrvd_rqst_no = :P93131020_IMRSV_RQST_NO',
'		   AND imrvd_seq_no = :P93131020_IMRSV_RQST_SEQ_NO;',
'	',
'	IF v_cnt = 0 THEN',
'		:P93131020_IMRSV_SEL_FLAG:=''N'';',
'		raise_application_error(-20999,''Variant item must be entered.'');',
'	END IF;',
'	     BEGIN',
'       SELECT pvga_var_item,',
'              pvga_var_rev',
'         INTO var_item,',
'              var_item_rev',
'         FROM prod_variant_group_asso',
'        WHERE pvga_bu = :global_bu',
'          AND pvga_var_group_id  = :P93131020_IMRSV_PROD_ID   ',
'          AND pvga_var_group_rev = :P93131020_IMRSV_PROD_REV',
'          AND pvga_deflt_flag = ''Y'';',
'	     EXCEPTION WHEN NO_DATA_FOUND THEN',
'	     	 var_item := NULL;',
'	     	 var_item_rev := NULL;',
'	     END;',
'	     ',
'          ',
'       UPDATE inv_mat_req_vg_details',
'          SET imrvd_requested_qty = :P93131020_IMRSV_TOALLOC_QTY',
'        WHERE imrvd_bu = :global_bu',
'          AND imrvd_rqst_no = :P93131020_IMRSV_RQST_NO',
'          AND imrvd_seq_no = :P93131020_IMRSV_RQST_SEQ_NO',
'          AND imrvd_prod_id = var_item',
'          AND imrvd_prod_rev = var_item_rev;',
'          ',
'	END;',
'	',
'  DECLARE',
'	qty 	NUMBER;',
'  BEGIN',
'	  SELECT SUM(imrvd_requested_qty) ',
'	    INTO qty ',
'	    FROM inv_mat_req_vg_details',
'	   WHERE imrvd_bu = :global_bu',
'	     AND imrvd_rqst_no = :P93131020_IMRSV_RQST_NO',
'	     AND imrvd_seq_no    = :P93131020_IMRSV_RQST_SEQ_NO;',
'		',
'  IF qty <> :P93131020_IMRSV_TOALLOC_QTY THEN',
'  	:P93131020_IMRSV_SEL_FLAG:=''N'';',
'	  raise_application_error(-20999,''To allocated qty should be equal to the sum of requested variant qty.'');',
'  END IF;',
'',
'',
'  END;',
'',
'	END IF;',
'END IF;',
'',
'DECLARE',
'  CURSOR c1 IS',
'  SELECT *',
'    FROM inv_mat_rqst_so_view',
'	WHERE imrsv_bu = :GLOBAL_bu',
'	  AND imrsv_rqst_no = :P93131020_IMRSV_RQST_NO',
'	  AND imrsv_rqst_seq_no = :P93131020_IMRSV_RQST_SEQ_NO;',
'  ',
'  CURSOR c11',
'	IS',
'	SELECT prodplnt_excs_iss_flag',
'	  FROM prod_plants',
'	 WHERE prodplnt_bu = :GLOBAL_bu',
'	   AND prodplnt_plnt = :P93131020_IMRSV_PLNT',
'	   AND prodplnt_prod_id = :P93131020_IMRSV_PROD_ID',
'	   AND prodplnt_prod_rev = :P93131020_IMRSV_PROD_REV;',
'',
'  cr1  c1%ROWTYPE;',
'  cr11 c11%ROWTYPE;',
' ',
' V_ALLOCTO_QTY  NUMBER;',
' V_CAL_QTY  NUMBER;',
'',
'BEGIN',
'   ',
'  FOR i IN 1..APEX_APPLICATION.g_f01.COUNT',
'  LOOP',
'    OPEN c1;',
'	 FETCH c1 INTO cr1;',
'	 CLOSE c1;',
'	 OPEN c11;',
'	 FETCH c11 INTO cr11;',
'	 CLOSE c11;',
'    ',
'	   SELECT (IMRSV_RQST_QTY -(:P93131020_IMRSV_ALLOC_QTY + IMRSV_ISS_QTY - IMRSV_RTN_QTY + IMRSV_CLS_QTY) )Cal    ',
'	   INTO V_CAL_QTY',
'	FROM inv_mat_rqst_so_view',
'	WHERE imrsv_bu = :GLOBAL_bu',
'	  AND imrsv_rqst_no = :P93131020_IMRSV_RQST_NO',
'	  AND imrsv_rqst_seq_no = :P93131020_IMRSV_RQST_SEQ_NO; ',
'	',
'   IF APEX_APPLICATION.g_f01(i) = cr1.imrsv_bu||cr1.imrsv_rqst_no||cr1.imrsv_rqst_seq_no THEN    ',
'	',
'	IF cr11.prodplnt_excs_iss_flag = ''N'' THEN  ',
'	  IF to_number(APEX_APPLICATION.g_f02(i)) > TO_NUMBER(V_CAL_QTY)   THEN',
'	      --Raise_Application_Error(-20999,V_CAL_QTY||''/''||APEX_APPLICATION.g_f02(i)||''/''||:P93131020_IMRSV_TOALLOC_QTY);',
'	  	    raise_application_error(-20999,''Excess Qty. not allowed'');',
'		END IF;',
'',
'	END IF;',
'	END IF; ',
' ',
'    IF APEX_APPLICATION.g_f01(i) = cr1.imrsv_bu||cr1.imrsv_rqst_no||cr1.imrsv_rqst_seq_no THEN',
'',
'		IF APEX_APPLICATION.g_f02(i) <= 0 THEN',
'        :P93131020_IMRSV_SEL_FLAG:=''N'';',
'        raise_application_error(-20999,''Quantity should be greater than zero.''||:P93131020_IMRSV_TOALLOC_QTY );',
'      END IF;',
'',
'      proc_sel_rec_frm_mat_req(:global_bu,:P93131020_IMRSV_RQST_NO,:P93131020_IMRSV_RQST_SEQ_NO,:P93131020_IMRSV_SEL_FLAG,',
'            APEX_APPLICATION.g_f02(i),',
'            CASE WHEN APEX_APPLICATION.g_f02(i) - (cr1.imrsv_rqst_qty - (cr1.imrsv_iss_qty + cr1.imrsv_alloc_qty - cr1.imrsv_rtn_qty)) < 0 THEN 0',
'						ELSE NVL(APEX_APPLICATION.g_f02(i) - (cr1.imrsv_rqst_qty - (cr1.imrsv_iss_qty + cr1.imrsv_alloc_qty - cr1.imrsv_rtn_qty)),0)',
'						END,',
'						:global_user',
'            ); ',
'	   Commit;',
'	 END IF;',
'  END LOOP;',
'END;',
'',
'IF :P93131020_IMRSV_TOALLOC_QTY > 0 THEN',
' ',
'IF :P93131020_IMRSV_SEL_FLAG = ''N'' THEN',
'',
'/* DELETE FROM mat_rqst_fnm_pckg_dtls',
' WHERE mrfpd_bu = :global_bu',
'   AND mrfpd_rqst_no = :P93131020_IMRSV_RQST_NO',
'   AND mrfpd_seq_no = :P93131020_IMRSV_RQST_SEQ_NO; */',
'commit;',
':P93131020_IMRSV_SEL_USER := NULL;',
':P93131020_IMRSV_TOALLOC_QTY := (:imrsv_rqst_qty - (:imrsv_iss_qty + :imrsv_alloc_qty + :imrsv_cls_qty - :imrsv_rtn_qty));',
'',
'ELSE',
':P93131020_IMRSV_SEL_USER := :global_USER;',
'END IF;',
'',
'END IF;',
'',
'',
'IF :P93131020_IMRSV_SEL_FLAG = ''Y'' OR :P93131020_IMRSV_SEL_FLAG IS NOT NULL THEN',
'DECLARE',
'    v_sel_ctn NUMBER;',
'BEGIN',
'    SELECT COUNT(*)',
'      INTO v_sel_ctn',
'    FROM inv_mat_rqst_so_view',
'   WHERE imrsv_bu = :global_bu',
'     AND IMRSV_sel_flag = ''Y'';',
'  IF v_sel_ctn > 0 THEN',
'      :P93131020_IMRSV_SEL_FLAG := ''Y'';',
'  ELSE',
'      :P93131020_IMRSV_SEL_FLAG := ''N'';',
'  END IF;',
'END;',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SELECT'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>128370005936200670
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5610331067277811696)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'UNCHECKALL'
,p_static_id=>'uncheckall'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'',
'     UPDATE inv_material_request_ln',
'        SET imrln_to_allocated_qty = 0,',
'            imrln_excs_qty = 0,',
'            imrln_sel_flag = ''N'',',
'            imrln_sel_user = NULL',
'      WHERE imrln_bu = :global_bu',
'        AND imrln_sel_flag = ''Y''',
'        AND (imrln_requested_qty - (imrln_issued_qty + imrln_mi_allocated_qty + imrln_cls_qty -  imrln_returned_qty)) > 0',
'        AND func_find_prod_var_group_type(:GLOBAL_bu,imrln_prod_id,imrln_prod_rev) = ''N'';',
' HTP.P(''success''); ',
'END;',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>128369231734200668
);
wwv_flow_imp.component_end;
end;
/
