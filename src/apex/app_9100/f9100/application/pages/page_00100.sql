prompt --application/pages/page_00100
begin
--   Manifest
--     PAGE: 00100
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
 p_id=>100
,p_name=>'test'
,p_alias=>'TEST'
,p_step_title=>'test'
,p_autocomplete_on_off=>'OFF'
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<script>',
'function ckChange(ckType){',
'    var ckName = document.getElementsByName(ckType.name);',
'    var checked = document.getElementById(ckType.id);',
'',
'    if (checked.checked) {',
'      for(var i=0; i < ckName.length; i++){',
'',
'          if(!ckName[i].checked){',
'              ckName[i].disabled = true;',
'          }else{',
'              ckName[i].disabled = false;',
'          }',
'      } ',
'    }',
'    else {',
'      for(var i=0; i < ckName.length; i++){',
'        ckName[i].disabled = false;',
'      } ',
'    }    ',
'}',
'</script>'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'var prodno = [];',
'var prodqty = [];',
'console.log(''prod'' +JSON.stringify(prod));',
'',
'function checkanduncheck(a, b) {',
'    var isChecked = document.getElementById("checkbox_" + a).checked;',
'    var checkflag;',
'    if (isChecked) { checkflag = 1 ; } else { checkflag = 0 ; };',
'    apex.server.process(',
'        "CHECKANDUNCHECK",     //To call the ajax process name here',
'        {',
'            x02: a,',
'            x03: checkflag // Pass the input field value as a parameter',
'        },',
'        {',
'            dataType: ''text'',',
'            success: function (data) {',
'                if (data.trim() !== ''success'') {',
'                    apex.message.showErrors([{ type: "error", location: "page", message: data.replace(''sqlerrm:ORA-20999: '', ''''), unsafe: false }]);',
'                    document.getElementById("checkbox_" + a).checked = false;',
'                    button();',
'                } else {',
'                    console.log(''success'', data);',
'                    button();',
'                  //   output.innerText = incrementRowSelection(output.innerText, checkflag);',
'                }',
'            }',
'        }',
'    );',
'};',
'function readonly(a){',
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
'/* Checkall and Uncheckall*/',
'function selectall() {',
'    var isChecked = document.getElementById("check_all").checked;',
'    if (isChecked) {',
'        apex.server.process(',
'            "SELECTALL", // Replace with your AJAX callback name',
'            {',
'                f01: prodqty,',
'                f02: prodno',
'            },',
'            {',
'                dataType: ''text'',',
'                success: function (data) {',
'                    console.log(''success'', data);',
'                    apex.region("PEND").refresh();    ',
'                  //   overallcheck();              ',
'                },',
'                error: function (jqXHR, textStatus, errorThrown) {',
'                    console.error(errorThrown, jqXHR, textStatus);',
'                }',
'            }',
'        );',
'    } else {',
'        apex.server.process(',
'            "UNSELECTALL", // Replace with your AJAX callback name',
'            {},',
'            {',
'                dataType: ''text'',',
'                success: function (data) {',
'                    console.log(''success'', data);               ',
'                    apex.region("PEND").refresh();  ',
'                  //   overallcheck();                  ',
'                }',
'            }',
'        ); }}',
'',
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
'                if (flag[0] == ''1'' && checkbox != null) {',
'                    checkbox.checked = true;',
'                    button();',
'                } else if (flag[0] == ''0'' && checkbox != null) {',
'                    checkbox.checked = false;',
'                    button();',
'                } else if (flag[0] == ''01'' && checkbox != null) {',
'                    checkbox.checked = false;',
'                    button();',
'                }',
'            }',
'        }',
'    );',
'}',
'',
'function movetoarray(a) {',
'    prodno.push(a);',
'    console.log(JSON.stringify(prodno));',
'    console.log(JSON.stringify(prodqty));',
'}',
'',
'function button(){    ',
'           var inputElems = document.getElementsByTagName("input"),',
'        count = 0;',
'        for (var i=0; i<inputElems.length; i++) {',
'        if (inputElems[i].type === "checkbox" && inputElems[i].checked === true){',
'            count++;  ',
'            if (count != null ) { ',
'                  apex.item("B1").enable();',
'            }	',
'        }',
'        else{',
'          if (count == '' '' ) { ',
'                  apex.item("B1").disable();',
'          }	',
'        }        ',
'   }};'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* For Report Header */',
'.a-IRR-table {',
'    border-collapse: collapse;',
'    table-layout: auto;',
'    border-spacing: 0;',
'    white-space: nowrap;',
'    word-wrap: break-word;',
'}',
'',
'.t-fht-thead {',
'    overflow: auto !important;',
'}',
'',
'.a-IRR-headerLink, .a-IRR-headerLink:hover {',
'    text-decoration: none;',
'    background: #00b1e7 !important;',
'    color: #ffffff !important;',
'    //font-family: Arial !important;',
'}',
'/*2361310102*/',
'',
'.t-Cards--basic .t-Card-wrap ',
'{',
'    display: flex;',
'    flex-direction: column;',
'    overflow: hidden;',
'    border-radius: 10px;',
'}',
'',
'.t-Cards--basic .t-Card-body {',
'    padding: 16px;',
'    background-color: #e6e6fa94;// lavender;',
'}',
'',
'#P335_WF_SRCH',
'	{',
'	  width:40px;',
'	  transition: 0.5s;',
'	  border-radius:50px;',
'	  text-indent: 2rem;',
'	  font-size: 1.1rem;',
'	  //font-family: Arial;',
'	}',
'	',
'	#P335_WF_SRCH:focus',
'	{',
'	  width:450px;',
'	  transition: 0.5s;',
'}',
'',
'',
'.t-Cards--basic .t-Card-titleWrap {',
'    display: flex;',
'    flex-direction: column;',
'    justify-content: center;',
'    padding: 12px 64px 12px 16px;',
'    min-height: 22px;',
'    box-shadow: 0 -1px 0 rgba(0,0,0,.05) inset;',
'    /*background-image: linear-gradient(to top, #4b6696 0%, #56a6ea 100%);*/',
'	 background-image: linear-gradient(to top, #799f0c 0%, #acbb78 100%);',
'}',
'.t-Cards--basic .t-Card-title {',
'    font-size: 1.6rem;',
'    line-height: 0.8rem;',
'    margin: 0;',
'    font-weight: 500;',
'    overflow: hidden;',
'    text-overflow: ellipsis;',
'}',
'.t-Form--xlarge .apex-item-file, .t-Form--xlarge .apex-item-text, .t-Form-fieldContainer--xlarge .apex-item-file, .t-Form-fieldContainer--xlarge .apex-item-text {',
'    height: 3.1rem;',
'}',
'',
'.t-Cards--basic .t-Card-icon {',
'    position: absolute;',
'    right: 16px;',
'    top: 0px;',
'    width: 32px;',
'    height: 32px;',
'    line-height: 32px;',
'}',
'',
'.t-Card-info {',
'    font-size: 1.1rem;',
'    line-height: 1.3rem;',
'    margin-top: 4px;',
'    overflow: hidden;',
'    font-weight: bolder;',
'    text-overflow: ellipsis;',
'}',
'',
'.t-Form--large .t-Form-fieldContainer--floatingLabel.t-Form-fieldContainer--radioButtonGroup .apex-item-group--rc input+label, .t-Form-fieldContainer--floatingLabel.t-Form-fieldContainer--large.t-Form-fieldContainer--radioButtonGroup .apex-item-group'
||'--rc input+label {',
'    padding-top: 1.6rem;',
'    padding-bottom: 1.6rem;    ',
'    font-weight: bolder;',
'}',
'',
'.t-Cards--compact .t-Card-wrap {',
'    display: flex;',
'    flex-direction: column;',
'    overflow: hidden;',
'    border-color: lightgrey;',
'}',
'',
''))
,p_step_template=>wwv_flow_imp.id(6339300137962061229)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(18690234299391873223)
,p_plug_name=>'Approval'
,p_static_id=>'approval'
,p_region_name=>'SUB'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size600x400'
,p_plug_template=>wwv_flow_imp.id(10650510175351505351)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(13105953062480931224)
,p_name=>'Cards'
,p_static_id=>'cards'
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>110
,p_region_template_options=>'#DEFAULT#:t-Form--noPadding:margin-top-none:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#:t-Cards--compact:t-Cards--3cols:t-Cards--animColorFill'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT *',
'  FROM (',
'SELECT ROWID,',
'       ''<B><SPAN STYLE="font-size:11px; font-family:verdana; color: black">''||INITCAP(func_find_apex_wf_desc(wfdc_bu, wfdc_plnt, NVL(wfdc_src_bu, wfdc_bu), wfdc_type, wfdc_doc_no))||''</SPAN></B>'' "CARD_TITLE",',
'       ''<B><SPAN STYLE="font-size:11px; font-family:verdana; color: #ef9a9a">''||(SELECT INITCAP(TRIM(emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1))',
'                                                                                   FROM employees,',
'                                                                                        appl_users',
'                                                                                  WHERE emp_bu      = appluser_bu',
'                                                                                    AND emp_emp_id  = appluser_emp_id ',
'                                                                                    AND appluser_bu = wfdc_bu',
'                                                                                    AND appluser_id = wfdc_fwd_person',
'                                                                                    AND rownum =1)||''</SPAN></B>'' "CARD_SUBTITLE",',
'',
'       ''<table style="width:100%" border="0">''||',
'         CASE WHEN wfdc_message IS NOT NULL THEN      ',
'         ''<tr>',
'            <td style="width:10%" align="center"><span aria-hidden="true" class="fa fa-commenting" style="color:#1F618D"></span></td>',
'            <td style="width:90%; vertical-align:top"><span style="color: #5d6d7e;font-weight:bolder; font-size:12px; font-family: Calibri">''||NVL(INITCAP(wfdc_message), ''--No Message--'')||''</span></td> ',
'         </tr>''',
'         END||''         ',
'        ',
'         <tr>''||CASE WHEN wfdc_doc_no IS NOT NULL THEN ',
'            ''<td style="width:10%" align="center"><span aria-hidden="true" class="fa fa-book" style="color:#e99907"></span></td>',
'            <td style="width:90%"><span style="color: #015e07; font-weight:bolder;font-size:12px; font-family: Calibri">''||DECODE(wfdc_doc_pfx, NULL, NULL, wfdc_doc_pfx||''/'')||wfdc_doc_no||''</span></td> ',
'         </tr>'' END||         ',
'         CASE WHEN wfdc_benf_id IS NOT NULL THEN',
'         ''<tr>',
'            <td style="width:10%" align="center">''||',
'            CASE WHEN wfdc_benf_type = ''S'' THEN',
'               ''<span aria-hidden="true" class="fa fa-truck" style="color:#1F618D"></span>''',
'            WHEN wfdc_benf_type = ''C'' THEN',
'               ''<span aria-hidden="true" class="fa fa-users" style="color:#1F618D"></span>''',
'            WHEN wfdc_benf_type = ''P'' THEN',
'               ''<span aria-hidden="true" class="fa fa-binoculars" style="color:#1F618D"></span>''',
'            WHEN wfdc_benf_type = ''N'' THEN',
'               ''<span aria-hidden="true" class="fa fa-user-secret" style="color:#1F618D"></span>''',
'            END||''',
'            </td>',
'            <td style="width:90%"><span style="color: #5d6d7e; font-weight:bolder;font-size:12px; font-family: Calibri">''||CASE WHEN wfdc_benf_id IS NOT NULL THEN',
'                                                                                                             CASE WHEN wfdc_benf_type = ''S'' THEN',
'                                                                                                                       --INITCAP(func_find_suplr_name(NVL(wfdc_src_bu, wfdc_bu), wfdc_benf_id, 1))',
'                                                                                                                       (SELECT suplr_name1',
'                                                                                                                         FROM suppliers',
'                                                                                                                        WHERE suplr_bu = NVL(wfdc_src_bu, wfdc_bu)',
'                                                                                                                          AND suplr_suplr_id = wfdc_benf_id)',
'                                                                                                                  WHEN wfdc_benf_type = ''C'' THEN',
'                                                                                                                       INITCAP(func_find_cust_name(NVL(wfdc_src_bu, wfdc_bu), wfdc_benf_id, 1))',
'                                                                                                                  WHEN wfdc_benf_type = ''P'' THEN',
'                                                                                                                       --INITCAP(func_find_prospect_desc(NVL(wfdc_src_bu, wfdc_bu), wfdc_benf_id, 1))',
'                                                                                                                       (SELECT INITCAP(NVL(prosp_name2,prosp_name1)) FROM prospects WHERE prosp_bu  = NVL(wfdc_src_bu, wfdc_bu) ',
'                                                                                                                       AND prosp_prosp_id  = wfdc_benf_id)',
'                                                                                                                  WHEN wfdc_benf_type = ''N'' THEN',
'                                                                                                                       INITCAP(func_find_sale_pers_desc(NVL(wfdc_src_bu, wfdc_bu), wfdc_benf_id, 1))',
'                                                                                                                  END',
'                                                                                                            END||''</span></td> ',
'         </tr>''    ',
'         END||',
'         CASE WHEN wfdc_doc_brief IS NOT NULL THEN',
'         ''<tr>',
'            <td style="width:10%" align="center"><span aria-hidden="true" class="fa fa-file-text-o" style="color:#05ce5f"></span></td>',
'            <td style="width:90%"><span style="color: #5e003d; font-weight:bolder;font-size:12px; font-family: Calibri">''||wfdc_doc_brief||''</span></td> ',
'         </tr>''',
'         END||',
'         CASE WHEN wfdc_value IS NOT NULL THEN',
'         ''<tr>',
'            <td style="width:10%" align="center"><span aria-hidden="true" class="fa fa-money" style="color:#1F618D"></span></td>',
'            <td style="width:90%"><span style="color: #5d6d7e; font-weight:bolder;font-size:12px; font-family: Calibri">''||TO_CHAR(wfdc_value, func_get_cost_format_mask(wfdc_bu))||''</span></td> ',
'         </tr>''    ',
'         END||''',
'        </table>'' "CARD_TEXT",',
'        CASE ',
'        WHEN wfdc_priority = ''1'' THEN ',
'             ''H''',
'        WHEN wfdc_priority = ''2'' THEN       ',
'             ''M''',
'        WHEN wfdc_priority = ''3'' THEN       ',
'             ''L''',
'        END "CARD_INITIALS",',
'       ''<BR><span class="fa fa-dynamic-content" aria-hidden="true" style="color:#28a745" title="View Log"></span>'' "ATTRIBUTE_1",',
'            ''<span class="fa fa-tiles-2x2" aria-hidden="true" style="color:#ABB2B9" title="View Details"></span>'' "ATTRIBUTE_2",',
'           --''<span aria-hidden="true" class="fa fa-reply" style="color:#2980B9" title="Return"></span>'' "ATTRIBUTE_3",',
'           --''<span class="fa fa-times-circle" aria-hidden="true" style="color:#E74C3C" title="Cancel"></span>'' "ATTRIBUTE_4",           ',
'           --''<span aria-hidden="true" class="fa fa-share" style="color:#E67E22" title="Forward"></span>'' "ATTRIBUTE_5",',
'           NULL "ATTRIBUTE_3",',
'           NULL "ATTRIBUTE_4",',
'           NULL "ATTRIBUTE_5",           ',
'           ''<span style="color:  #707b7c; font-family:Arial; font-size:9px">''||CASE WHEN MOD(TRUNC((SYSDATE - NVL(wfdc_fwd_on, wfdc_cre_date)) * 24), 24) = 0 THEN',
'                                                                                        MOD(TRUNC((SYSDATE - NVL(wfdc_fwd_on, wfdc_cre_date)) * 1440), 60)||'' min ago''',
'                                                                                     ELSE',
'                                                                                        TRUNC(SYSDATE - NVL(wfdc_fwd_on, wfdc_cre_date))||'' Days ''||MOD(TRUNC((SYSDATE - NVL(wfdc_fwd_on, wfdc_cre_date)) * 24), 24)||'' hour ''||MOD(TRUNC((SYSDATE - NVL(w'
||'fdc_fwd_on, wfdc_cre_date)) * 1440), 60)||'' min ago''',
'                                                                                     END||''</SPAN>'' "CARD_DATE",',
'       ',
'       /*CASE WHEN wfdc_mail_flag = ''N'' THEN ',
'                 ''<span class="fa fa-square-o" aria-hidden="true"></span><span style="color: #5d6d7e; font-size:12px; font-family: Calibri">  Mail</span>''',
'            ELSE',
'                 ''<span class="fa fa-square-selected-o" aria-hidden="true"></span><span style="color: #5d6d7e; font-size:12px; font-family: Calibri"> Mail</span>''',
'            END ',
'            ''<span class="fa fa-paper-plane" aria-hidden="true"></span><span style="color: #3BAA2C; font-size:12px; font-family: Calibri"></span>'' */',
'            ''Process'' "CARD_SUBTEXT",    ',
'       CASE WHEN wfdc_sms_flag = ''N'' THEN ',
'                 ''<span class="fa fa-square-o" aria-hidden="true"></span><span style="color: #5d6d7e; font-size:12px; font-family: Calibri">  SMS</span>''',
'            ELSE',
'                 ''<span class="fa fa-square-selected-o" aria-hidden="true"></span><span style="color: #5d6d7e; font-size:12px; font-family: Calibri">  SMS</span>''',
'            END "ATTRIBUTE_6",      ',
'      CASE WHEN wfdc_int_msg_flag = ''N'' THEN ',
'                 ''<span class="fa fa-square-o" aria-hidden="true"></span><span style="color: #5d6d7e; font-size:12px; font-family: Calibri">  Internal Msg.</span>''',
'            ELSE',
'                 ''<span class="fa fa-square-selected-o" aria-hidden="true"></span><span style="color: #5d6d7e; font-size:12px; font-family: Calibri">  Internal Msg.</span>''',
'            END "ATTRIBUTE_7",',
'       CASE WHEN wfdc_type = ''WF_PRJ_EMPTC'' THEN 511 ELSE 335 END wfdc_call_page_no,        ',
'        ''<span aria-hidden="true" class="fa fa-paper-plane"></span>'' "CARD_ICON",    ',
'       wfdc_bu,',
'       wfdc_type,',
'       wfdc_doc_pfx,',
'       wfdc_doc_no,',
'       wfdc_status,',
'       wfdc_ctrl_person,',
'       wfdc_spplr_id,',
'       wfdc_cust_id,',
'       wfdc_lvl1,',
'       wfdc_lvl2,',
'       wfdc_lvl3,',
'       wfdc_lvl4,',
'       wfdc_accts,',
'       wfdc_prj_id,',
'       wfdc_rnd_prj_id,',
'       wfdc_value,',
'       wfdc_jrnl_type,',
'       wfdc_frwd_rtn,',
'       wfdc_po_mode,',
'       wfdc_message,',
'       wfdc_seq_no,',
'       wfdc_action_date,',
'       wfdc_qc_rev,',
'       wfdc_qc_ins_mode,',
'       wfdc_prod_id,',
'       wfdc_prod_rev,',
'       wfdc_priority,',
'       wfdc_wf_no,',
'       wfdc_doc_sfx,',
'       wfdc_wrk_cntr,',
'       wfdc_plnt,',
'       wfdc_select_flag,',
'       wfdc_mail_flag,',
'       wfdc_int_msg_flag,',
'       wfdc_sms_flag,',
'       wfdc_fwd_person,',
'       wfdc_doc_brief,',
'       wfdc_fwd_to,',
'       wfdc_nxt_status,',
'       wfdc_act,',
'       wfdc_nxt_fwd_person,',
'       wfdc_nxt_message,',
'       wfdc_fwd_on,',
'       wfdc_src_bu,',
'       wfdc_src_plnt,',
'       wfdc_nxt_fwd_entity,',
'       wfdc_src_user,',
'       wfdc_nxt_fwd_plnt,',
'       wfdc_mail_send_flag,',
'       wfdc_doc_date,',
'       wfdc_lvl_prj,',
'       wfdc_auth_type,',
'       wfdc_disc_pct,',
'       wfdc_benf_type,',
'       wfdc_benf_id,',
'       wfdc_bill_date,',
'       wfdc_bill_no,',
'       wfdc_gross_amt,',
'       wfdc_tax_amt,',
'       wfdc_bill_amt,',
'       wfdc_inv_pfx,',
'       wfdc_inv_no,',
'       wfdc_emp_id,',
'       wfdc_cre_by,',
'       wfdc_cre_ip_addr,',
'       wfdc_cre_os_user,',
'       wfdc_cre_date,',
'       wfdc_upd_by,',
'       wfdc_upd_ip_addr,',
'       wfdc_upd_os_user,',
'       wfdc_upd_date,',
'       wfdc_coll_centr_id,',
'       wfdc_cre_emp_id,',
'       wfdc_upd_emp_id,',
'       func_find_apex_wf_desc(wfdc_bu, wfdc_plnt, NVL(wfdc_src_bu, wfdc_bu), wfdc_type, wfdc_doc_no) wfdc_type_desc,',
'       (SELECT INITCAP(TRIM(emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1))',
'          FROM employees,',
'               appl_users',
'         WHERE emp_bu      = appluser_bu',
'           AND emp_emp_id  = appluser_emp_id ',
'           AND appluser_bu = wfdc_bu',
'           AND appluser_emp_id = wfdc_fwd_person',
'           AND rownum =1) wfdc_fwd_per_name,',
'       (SELECT bup_name1',
'          FROM bus_unit_plants',
'         WHERE bup_bu = NVL(wfdc_src_bu, wfdc_bu) ',
'           AND bup_plant_id = wfdc_src_plnt) wfdc_src_plnt_desc,',
'       (SELECT bup_name1',
'          FROM bus_unit_plants',
'         WHERE bup_bu = wfdc_bu ',
'           AND bup_plant_id = wfdc_plnt) wfdc_plnt_desc,',
'       NVL((SELECT INITCAP(wfaa_desc)',
'            FROM work_flow_appr_actvt',
'           WHERE wfaa_bu     = NVL(wfdc_src_bu, wfdc_bu)',
'             AND wfaa_wf_id  = wfdc_type',
'             AND wfaa_seq_no = wfdc_seq_no + 1), ''Message Not Specified.'') wfdc_nxt_process',
'  FROM work_flow_doc_control  ',
' WHERE wfdc_bu = :GLOBAL_BU',
'   AND (wfdc_auth_type = ''P'' AND wfdc_ctrl_person = func_find_position_id(:GLOBAL_BU, :GLOBAL_USER) ',
'    OR  wfdc_auth_type = ''E'' AND wfdc_ctrl_person = :global_emp_id)',
'   AND (wfdc_type, wfdc_status) NOT IN (SELECT wfaa_wf_id, wfaa_status',
'                                          FROM work_flow_appr_actvt',
'                                         WHERE wfaa_bu = :GLOBAL_BU ',
'                                           AND (wfaa_wf_id, wfaa_seq_no) IN (SELECT wfaa_wf_id, MAX(wfaa_seq_no) wfaa_seq_no',
'                                                                               FROM work_flow_appr_actvt',
'                                                                              WHERE wfaa_bu = :GLOBAL_BU ',
'                                                                              GROUP BY wfaa_wf_id))',
'  AND wfdc_status NOT IN (''C'',''R'',''S''))',
'WHERE (INSTR(UPPER(wfdc_type_desc), UPPER(NVL(:P100_WF_SRCH, wfdc_type_desc))) > 0 OR',
'       INSTR(UPPER(wfdc_fwd_per_name), UPPER(NVL(:P100_WF_SRCH, wfdc_fwd_per_name))) > 0 OR',
'       INSTR(UPPER(wfdc_src_plnt_desc), UPPER(NVL(:P100_WF_SRCH, wfdc_src_plnt_desc))) > 0 OR       ',
'       INSTR(UPPER(wfdc_doc_pfx), UPPER(NVL(:P100_WF_SRCH, wfdc_doc_pfx))) > 0 OR',
'       INSTR(UPPER(wfdc_doc_no), UPPER(NVL(:P100_WF_SRCH, wfdc_doc_no))) > 0 OR       ',
'       INSTR(UPPER(wfdc_src_bu), UPPER(NVL(:P100_WF_SRCH, wfdc_src_bu))) > 0 OR',
'       INSTR(UPPER(wfdc_plnt_desc), UPPER(NVL(:P100_WF_SRCH, wfdc_plnt_desc))) > 0)',
'ORDER BY wfdc_priority, NVL(wfdc_fwd_on, wfdc_cre_date) DESC,wfdc_type'))
,p_display_when_condition=>'P100_TYPE1'
,p_display_when_cond2=>'CA'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P100_WF_SRCH'
,p_lazy_loading=>true
,p_query_row_template=>wwv_flow_imp.id(10650533555536505382)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_query_row_count_max=>50
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591278087062996174)
,p_query_column_id=>6
,p_column_alias=>'ATTRIBUTE_1'
,p_column_display_sequence=>81
,p_column_heading=>'Attribute 1'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591278519247996176)
,p_query_column_id=>7
,p_column_alias=>'ATTRIBUTE_2'
,p_column_display_sequence=>82
,p_column_heading=>'Attribute 2'
,p_column_link=>'f?p=&APP_ID.:#WFDC_CALL_PAGE_NO#:&SESSION.::&DEBUG.::P511_WF_BU,P511_WF_PLNT,P511_WF_DOC_NO,P511_WF_NO,P511_WF_TYPE,P511_WF_SOU_BU,P511_WF_CTRL_PRSN,P511_WF_SOU_PLNT,P511_WF_SEQ_NO:#WFDC_BU#,#WFDC_PLNT#,#WFDC_DOC_NO#,#WFDC_WF_NO#,#WFDC_TYPE#,#WFDC_SR'
||'C_BU#,#WFDC_CTRL_PERSON#,#WFDC_SRC_PLNT#,#WFDC_SEQ_NO#'
,p_column_linktext=>'#ATTRIBUTE_2#'
,p_column_alignment=>'CENTER'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591278823646996178)
,p_query_column_id=>8
,p_column_alias=>'ATTRIBUTE_3'
,p_column_display_sequence=>83
,p_column_heading=>'Attribute 3'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591279223231996179)
,p_query_column_id=>9
,p_column_alias=>'ATTRIBUTE_4'
,p_column_display_sequence=>84
,p_column_heading=>'Attribute 4'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591279579950996181)
,p_query_column_id=>10
,p_column_alias=>'ATTRIBUTE_5'
,p_column_display_sequence=>85
,p_column_heading=>'Attribute 5'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591280785453996185)
,p_query_column_id=>13
,p_column_alias=>'ATTRIBUTE_6'
,p_column_display_sequence=>91
,p_column_heading=>'Mail'
,p_column_link=>'javascript:$s(''P335_WF_NO'', ''#WFDC_WF_NO#''); 	   $s(''P335_SMS_FLAG'', ''S'');'
,p_column_linktext=>'#ATTRIBUTE_6#'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591281199600996187)
,p_query_column_id=>14
,p_column_alias=>'ATTRIBUTE_7'
,p_column_display_sequence=>92
,p_column_heading=>'Attribute 7'
,p_column_link=>'javascript:$s(''P335_WF_NO'', ''#WFDC_WF_NO#''); 	   $s(''P335_INT_MSG'', ''I'');'
,p_column_linktext=>'#ATTRIBUTE_7#'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591279967226996182)
,p_query_column_id=>11
,p_column_alias=>'CARD_DATE'
,p_column_display_sequence=>93
,p_column_heading=>'Card Date'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591281992691996190)
,p_query_column_id=>16
,p_column_alias=>'CARD_ICON'
,p_column_display_sequence=>104
,p_column_heading=>'Card Icon'
,p_column_link=>'javascript:openModal(''SUB'');apex.confirm(''Do you want to post?'',''ENTRY'');'
,p_column_linktext=>'#CARD_ICON#'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591277683403996171)
,p_query_column_id=>5
,p_column_alias=>'CARD_INITIALS'
,p_column_display_sequence=>80
,p_column_heading=>'Card Initials'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591280428359996185)
,p_query_column_id=>12
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>78
,p_column_heading=>'Card Subtext'
,p_column_link=>'javascript:apex.event.trigger(document, ''myreport'', [{WFDC_WF_NO:''#WFDC_WF_NO#'',WFDC_CARD_TYPE:''C'',WFDC_SELECT_FLAG:''#WFDC_SELECT_FLAG#''}]);void(0);openModal(''SUB'');'
,p_column_linktext=>'#CARD_SUBTEXT#'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591276841292996167)
,p_query_column_id=>3
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>77
,p_column_heading=>'Card Subtitle'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591277309303996168)
,p_query_column_id=>4
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>79
,p_column_heading=>'Card Text'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591276472065996165)
,p_query_column_id=>2
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>76
,p_column_heading=>'Card Title'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591276046243996162)
,p_query_column_id=>1
,p_column_alias=>'ROWID'
,p_column_display_sequence=>1
,p_column_heading=>'Rowid'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591287163615996223)
,p_query_column_id=>29
,p_column_alias=>'WFDC_ACCTS'
,p_column_display_sequence=>14
,p_column_heading=>'Wfdc Accts'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591297941605996271)
,p_query_column_id=>56
,p_column_alias=>'WFDC_ACT'
,p_column_display_sequence=>41
,p_column_heading=>'Wfdc Act'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591290834114996240)
,p_query_column_id=>38
,p_column_alias=>'WFDC_ACTION_DATE'
,p_column_display_sequence=>23
,p_column_heading=>'Wfdc Action Date'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591302663452996309)
,p_query_column_id=>68
,p_column_alias=>'WFDC_AUTH_TYPE'
,p_column_display_sequence=>53
,p_column_heading=>'Wfdc Auth Type'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591303879325996318)
,p_query_column_id=>71
,p_column_alias=>'WFDC_BENF_ID'
,p_column_display_sequence=>56
,p_column_heading=>'Wfdc Benf Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591303500788996317)
,p_query_column_id=>70
,p_column_alias=>'WFDC_BENF_TYPE'
,p_column_display_sequence=>55
,p_column_heading=>'Wfdc Benf Type'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591305841244996331)
,p_query_column_id=>76
,p_column_alias=>'WFDC_BILL_AMT'
,p_column_display_sequence=>61
,p_column_heading=>'Wfdc Bill Amt'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591304282783996320)
,p_query_column_id=>72
,p_column_alias=>'WFDC_BILL_DATE'
,p_column_display_sequence=>57
,p_column_heading=>'Wfdc Bill Date'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591304692764996323)
,p_query_column_id=>73
,p_column_alias=>'WFDC_BILL_NO'
,p_column_display_sequence=>58
,p_column_heading=>'Wfdc Bill No'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591282389951996193)
,p_query_column_id=>17
,p_column_alias=>'WFDC_BU'
,p_column_display_sequence=>2
,p_column_heading=>'Wfdc Bu'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591281555818996188)
,p_query_column_id=>15
,p_column_alias=>'WFDC_CALL_PAGE_NO'
,p_column_display_sequence=>94
,p_column_heading=>'Wfdc Call Page No'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591310717578996360)
,p_query_column_id=>88
,p_column_alias=>'WFDC_COLL_CENTR_ID'
,p_column_display_sequence=>73
,p_column_heading=>'Wfdc Coll Centr Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591307481490996338)
,p_query_column_id=>80
,p_column_alias=>'WFDC_CRE_BY'
,p_column_display_sequence=>65
,p_column_heading=>'Wfdc Cre By'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591308667570996346)
,p_query_column_id=>83
,p_column_alias=>'WFDC_CRE_DATE'
,p_column_display_sequence=>68
,p_column_heading=>'Wfdc Cre Date'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591311083324996367)
,p_query_column_id=>89
,p_column_alias=>'WFDC_CRE_EMP_ID'
,p_column_display_sequence=>74
,p_column_heading=>'Wfdc Cre Emp Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591307867633996340)
,p_query_column_id=>81
,p_column_alias=>'WFDC_CRE_IP_ADDR'
,p_column_display_sequence=>66
,p_column_heading=>'Wfdc Cre Ip Addr'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591308290558996343)
,p_query_column_id=>82
,p_column_alias=>'WFDC_CRE_OS_USER'
,p_column_display_sequence=>67
,p_column_heading=>'Wfdc Cre Os User'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591284390134996209)
,p_query_column_id=>22
,p_column_alias=>'WFDC_CTRL_PERSON'
,p_column_display_sequence=>7
,p_column_heading=>'Wfdc Ctrl Person'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591285159063996212)
,p_query_column_id=>24
,p_column_alias=>'WFDC_CUST_ID'
,p_column_display_sequence=>9
,p_column_heading=>'Wfdc Cust Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591303050371996313)
,p_query_column_id=>69
,p_column_alias=>'WFDC_DISC_PCT'
,p_column_display_sequence=>54
,p_column_heading=>'Wfdc Disc Pct'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591296781324996267)
,p_query_column_id=>53
,p_column_alias=>'WFDC_DOC_BRIEF'
,p_column_display_sequence=>38
,p_column_heading=>'Wfdc Doc Brief'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591301879654996303)
,p_query_column_id=>66
,p_column_alias=>'WFDC_DOC_DATE'
,p_column_display_sequence=>51
,p_column_heading=>'Wfdc Doc Date'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591283547187996198)
,p_query_column_id=>20
,p_column_alias=>'WFDC_DOC_NO'
,p_column_display_sequence=>5
,p_column_heading=>'Wfdc Doc No'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591283186459996196)
,p_query_column_id=>19
,p_column_alias=>'WFDC_DOC_PFX'
,p_column_display_sequence=>4
,p_column_heading=>'Wfdc Doc Pfx'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591293593329996251)
,p_query_column_id=>45
,p_column_alias=>'WFDC_DOC_SFX'
,p_column_display_sequence=>30
,p_column_heading=>'Wfdc Doc Sfx'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591307120222996337)
,p_query_column_id=>79
,p_column_alias=>'WFDC_EMP_ID'
,p_column_display_sequence=>64
,p_column_heading=>'Wfdc Emp Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591289171667996232)
,p_query_column_id=>34
,p_column_alias=>'WFDC_FRWD_RTN'
,p_column_display_sequence=>19
,p_column_heading=>'Wfdc Frwd Rtn'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591299043005996282)
,p_query_column_id=>59
,p_column_alias=>'WFDC_FWD_ON'
,p_column_display_sequence=>44
,p_column_heading=>'Wfdc Fwd On'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591296351065996263)
,p_query_column_id=>52
,p_column_alias=>'WFDC_FWD_PERSON'
,p_column_display_sequence=>37
,p_column_heading=>'Wfdc Fwd Person'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591312267698996379)
,p_query_column_id=>92
,p_column_alias=>'WFDC_FWD_PER_NAME'
,p_column_display_sequence=>87
,p_column_heading=>'Wfdc Fwd Per Name'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591297209408996268)
,p_query_column_id=>54
,p_column_alias=>'WFDC_FWD_TO'
,p_column_display_sequence=>39
,p_column_heading=>'Wfdc Fwd To'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591305119555996324)
,p_query_column_id=>74
,p_column_alias=>'WFDC_GROSS_AMT'
,p_column_display_sequence=>59
,p_column_heading=>'Wfdc Gross Amt'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591295562577996260)
,p_query_column_id=>50
,p_column_alias=>'WFDC_INT_MSG_FLAG'
,p_column_display_sequence=>35
,p_column_heading=>'Wfdc Int Msg Flag'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591306700427996334)
,p_query_column_id=>78
,p_column_alias=>'WFDC_INV_NO'
,p_column_display_sequence=>63
,p_column_heading=>'Wfdc Inv No'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591306287169996332)
,p_query_column_id=>77
,p_column_alias=>'WFDC_INV_PFX'
,p_column_display_sequence=>62
,p_column_heading=>'Wfdc Inv Pfx'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591288753920996229)
,p_query_column_id=>33
,p_column_alias=>'WFDC_JRNL_TYPE'
,p_column_display_sequence=>18
,p_column_heading=>'Wfdc Jrnl Type'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591285632365996215)
,p_query_column_id=>25
,p_column_alias=>'WFDC_LVL1'
,p_column_display_sequence=>10
,p_column_heading=>'Wfdc Lvl1'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591285966211996217)
,p_query_column_id=>26
,p_column_alias=>'WFDC_LVL2'
,p_column_display_sequence=>11
,p_column_heading=>'Wfdc Lvl2'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591286425931996220)
,p_query_column_id=>27
,p_column_alias=>'WFDC_LVL3'
,p_column_display_sequence=>12
,p_column_heading=>'Wfdc Lvl3'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591286782461996221)
,p_query_column_id=>28
,p_column_alias=>'WFDC_LVL4'
,p_column_display_sequence=>13
,p_column_heading=>'Wfdc Lvl4'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591302319969996304)
,p_query_column_id=>67
,p_column_alias=>'WFDC_LVL_PRJ'
,p_column_display_sequence=>52
,p_column_heading=>'Wfdc Lvl Prj'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591295162683996259)
,p_query_column_id=>49
,p_column_alias=>'WFDC_MAIL_FLAG'
,p_column_display_sequence=>34
,p_column_heading=>'Wfdc Mail Flag'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591301503583996296)
,p_query_column_id=>65
,p_column_alias=>'WFDC_MAIL_SEND_FLAG'
,p_column_display_sequence=>50
,p_column_heading=>'Wfdc Mail Send Flag'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591289995399996235)
,p_query_column_id=>36
,p_column_alias=>'WFDC_MESSAGE'
,p_column_display_sequence=>21
,p_column_heading=>'Wfdc Message'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591300308724996292)
,p_query_column_id=>62
,p_column_alias=>'WFDC_NXT_FWD_ENTITY'
,p_column_display_sequence=>47
,p_column_heading=>'Wfdc Nxt Fwd Entity'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591298406912996274)
,p_query_column_id=>57
,p_column_alias=>'WFDC_NXT_FWD_PERSON'
,p_column_display_sequence=>42
,p_column_heading=>'Wfdc Nxt Fwd Person'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591301083903996295)
,p_query_column_id=>64
,p_column_alias=>'WFDC_NXT_FWD_PLNT'
,p_column_display_sequence=>49
,p_column_heading=>'Wfdc Nxt Fwd Plnt'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591298752086996276)
,p_query_column_id=>58
,p_column_alias=>'WFDC_NXT_MESSAGE'
,p_column_display_sequence=>43
,p_column_heading=>'Wfdc Nxt Message'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591313501633996393)
,p_query_column_id=>95
,p_column_alias=>'WFDC_NXT_PROCESS'
,p_column_display_sequence=>90
,p_column_heading=>'Wfdc Nxt Process'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591297549458996270)
,p_query_column_id=>55
,p_column_alias=>'WFDC_NXT_STATUS'
,p_column_display_sequence=>40
,p_column_heading=>'Wfdc Nxt Status'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591294389112996256)
,p_query_column_id=>47
,p_column_alias=>'WFDC_PLNT'
,p_column_display_sequence=>32
,p_column_heading=>'Wfdc Plnt'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591313111876996384)
,p_query_column_id=>94
,p_column_alias=>'WFDC_PLNT_DESC'
,p_column_display_sequence=>89
,p_column_heading=>'Wfdc Plnt Desc'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591289540377996234)
,p_query_column_id=>35
,p_column_alias=>'WFDC_PO_MODE'
,p_column_display_sequence=>20
,p_column_heading=>'Wfdc Po Mode'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591292799376996248)
,p_query_column_id=>43
,p_column_alias=>'WFDC_PRIORITY'
,p_column_display_sequence=>28
,p_column_heading=>'Wfdc Priority'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591287580877996224)
,p_query_column_id=>30
,p_column_alias=>'WFDC_PRJ_ID'
,p_column_display_sequence=>15
,p_column_heading=>'Wfdc Prj Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591291956173996245)
,p_query_column_id=>41
,p_column_alias=>'WFDC_PROD_ID'
,p_column_display_sequence=>26
,p_column_heading=>'Wfdc Prod Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591292424267996246)
,p_query_column_id=>42
,p_column_alias=>'WFDC_PROD_REV'
,p_column_display_sequence=>27
,p_column_heading=>'Wfdc Prod Rev'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591291537221996243)
,p_query_column_id=>40
,p_column_alias=>'WFDC_QC_INS_MODE'
,p_column_display_sequence=>25
,p_column_heading=>'Wfdc Qc Ins Mode'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591291156963996242)
,p_query_column_id=>39
,p_column_alias=>'WFDC_QC_REV'
,p_column_display_sequence=>24
,p_column_heading=>'Wfdc Qc Rev'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591288009626996226)
,p_query_column_id=>31
,p_column_alias=>'WFDC_RND_PRJ_ID'
,p_column_display_sequence=>16
,p_column_heading=>'Wfdc Rnd Prj Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591294828965996257)
,p_query_column_id=>48
,p_column_alias=>'WFDC_SELECT_FLAG'
,p_column_display_sequence=>33
,p_column_heading=>'Wfdc Select Flag'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591290371353996238)
,p_query_column_id=>37
,p_column_alias=>'WFDC_SEQ_NO'
,p_column_display_sequence=>22
,p_column_heading=>'Wfdc Seq No'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591295947227996262)
,p_query_column_id=>51
,p_column_alias=>'WFDC_SMS_FLAG'
,p_column_display_sequence=>36
,p_column_heading=>'Wfdc Sms Flag'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591284779675996210)
,p_query_column_id=>23
,p_column_alias=>'WFDC_SPPLR_ID'
,p_column_display_sequence=>8
,p_column_heading=>'Wfdc Spplr Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591299522755996285)
,p_query_column_id=>60
,p_column_alias=>'WFDC_SRC_BU'
,p_column_display_sequence=>45
,p_column_heading=>'Wfdc Src Bu'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591299907543996290)
,p_query_column_id=>61
,p_column_alias=>'WFDC_SRC_PLNT'
,p_column_display_sequence=>46
,p_column_heading=>'Wfdc Src Plnt'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591312672086996382)
,p_query_column_id=>93
,p_column_alias=>'WFDC_SRC_PLNT_DESC'
,p_column_display_sequence=>88
,p_column_heading=>'Wfdc Src Plnt Desc'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591300699888996293)
,p_query_column_id=>63
,p_column_alias=>'WFDC_SRC_USER'
,p_column_display_sequence=>48
,p_column_heading=>'Wfdc Src User'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591283972900996207)
,p_query_column_id=>21
,p_column_alias=>'WFDC_STATUS'
,p_column_display_sequence=>6
,p_column_heading=>'Wfdc Status'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591305454694996328)
,p_query_column_id=>75
,p_column_alias=>'WFDC_TAX_AMT'
,p_column_display_sequence=>60
,p_column_heading=>'Wfdc Tax Amt'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591282735616996195)
,p_query_column_id=>18
,p_column_alias=>'WFDC_TYPE'
,p_column_display_sequence=>3
,p_column_heading=>'Wfdc Type'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591311919561996378)
,p_query_column_id=>91
,p_column_alias=>'WFDC_TYPE_DESC'
,p_column_display_sequence=>86
,p_column_heading=>'Wfdc Type Desc'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591309114515996349)
,p_query_column_id=>84
,p_column_alias=>'WFDC_UPD_BY'
,p_column_display_sequence=>69
,p_column_heading=>'Wfdc Upd By'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591310300983996359)
,p_query_column_id=>87
,p_column_alias=>'WFDC_UPD_DATE'
,p_column_display_sequence=>72
,p_column_heading=>'Wfdc Upd Date'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591311455593996374)
,p_query_column_id=>90
,p_column_alias=>'WFDC_UPD_EMP_ID'
,p_column_display_sequence=>75
,p_column_heading=>'Wfdc Upd Emp Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591309448743996353)
,p_query_column_id=>85
,p_column_alias=>'WFDC_UPD_IP_ADDR'
,p_column_display_sequence=>70
,p_column_heading=>'Wfdc Upd Ip Addr'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591309864549996356)
,p_query_column_id=>86
,p_column_alias=>'WFDC_UPD_OS_USER'
,p_column_display_sequence=>71
,p_column_heading=>'Wfdc Upd Os User'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591288362016996228)
,p_query_column_id=>32
,p_column_alias=>'WFDC_VALUE'
,p_column_display_sequence=>17
,p_column_heading=>'Wfdc Value'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591293136492996249)
,p_query_column_id=>44
,p_column_alias=>'WFDC_WF_NO'
,p_column_display_sequence=>29
,p_column_heading=>'Wfdc Wf No'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7591293941878996254)
,p_query_column_id=>46
,p_column_alias=>'WFDC_WRK_CNTR'
,p_column_display_sequence=>31
,p_column_heading=>'Wfdc Wrk Cntr'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8428053065991890777)
,p_plug_name=>'Main'
,p_static_id=>'main'
,p_region_template_options=>'#DEFAULT#:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>1
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(33819157249268496697)
,p_plug_name=>'Workflow'
,p_static_id=>'workflow'
,p_region_name=>'PEND'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>80
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT "WFDC_BU",',
'         "WFDC_TYPE",',
'         WFDC_DOC_PFX,',
'         WFDC_DOC_NO,',
'         WFDC_DOC_PFX "Pfx.",',
'         /*CASE WHEN WFDC_DOC_PFX IS NOT NULL THEN',
'         (WFDC_DOC_PFX || '' '' || WFDC_DOC_NO) ',
'         ELSE WFDC_DOC_NO END*/',
'         WFDC_DOC_NO "No.",',
'         "WFDC_STATUS",',
'         "WFDC_CTRL_PERSON",',
'         "WFDC_SPPLR_ID",',
'         "WFDC_CUST_ID",',
'         "WFDC_LVL1",',
'         "WFDC_LVL2",',
'         "WFDC_LVL3",',
'         "WFDC_LVL4",',
'         "WFDC_ACCTS",',
'         "WFDC_PRJ_ID",',
'         "WFDC_RND_PRJ_ID",',
'         WFDC_VALUE "Value",',
'         "WFDC_JRNL_TYPE",',
'         "WFDC_FRWD_RTN",',
'         "WFDC_PO_MODE",',
'         "WFDC_MESSAGE",',
'         "WFDC_SEQ_NO",',
'         "WFDC_ACTION_DATE",',
'         "WFDC_QC_REV",',
'         "WFDC_QC_INS_MODE",',
'         "WFDC_PROD_ID",',
'         "WFDC_PROD_REV",',
'         "WFDC_PRIORITY",',
'         "WFDC_WF_NO",',
'         "WFDC_DOC_SFX",',
'         "WFDC_WRK_CNTR",',
'         "WFDC_PLNT",',
'         "WFDC_SELECT_FLAG",',
'         "WFDC_MAIL_FLAG",',
'         "WFDC_INT_MSG_FLAG",',
'         "WFDC_SMS_FLAG",',
'         "WFDC_CRE_BY",',
'         "WFDC_CRE_DATE",',
'         "WFDC_UPD_BY",',
'         "WFDC_UPD_DATE",',
'         WFDC_FWD_PERSON ,',
'         CASE WHEN LENGTH(WFDC_DOC_BRIEF) > 22 THEN',
'         SUBSTR(WFDC_DOC_BRIEF, 1, 22)||''...''',
'         ELSE',
'         WFDC_DOC_BRIEF',
'         END "Doc. Detail",',
'         WFDC_DOC_BRIEF,',
'         "WFDC_FWD_TO",',
'         "WFDC_NXT_STATUS",',
'         "WFDC_ACT",',
'         WFDC_NXT_FWD_PERSON,',
'         func_find_employee_desc1 (',
'            wfdc_bu,',
'            (SELECT appluser_emp_id',
'               FROM appl_users',
'              WHERE appluser_bu = wfdc_bu AND appluser_id = wfdc_fwd_person',
'              AND ROWNUM = 1),',
'            1)',
'           "Fwd. By",',
'         "WFDC_NXT_MESSAGE",',
'         WFDC_FWD_ON "Fwd. Date",',
'         nvl(ROUND (TRUNC (SYSDATE) - TRUNC(WFDC_FWD_ON)),0) "Time Elasped",',
'         WFDC_SRC_BU,',
'         WFDC_SRC_PLNT,',
'         WFDC_SRC_BU "Entity",',
'         WFDC_SRC_PLNT "Plant",',
'         NVL (',
'            (SELECT bup_name1',
'               FROM bus_unit_plants --,business_units, appl_user_plant_access',
'              WHERE bup_bu  = :Global_bu',
'				        --AND bup_bu = bu_id',
'                    --AND bup_bu = auba_bu',
'                    --AND bup_plant_id = auba_plant',
'                    --AND auba_user_id = :GLOBAL_user',
'                    --AND (TRUNC(sysdate) BETWEEN auba_from AND auba_to',
'                    AND bup_plant_id = WFDC_PLNT),',
'            WFDC_SRC_PLNT)',
'            "Unit",',
'         (SELECT UPPER (wf_bus_proc_desc)',
'            FROM WORK_FLOW',
'           WHERE WF_BU = wfdc_BU AND wf_bus_proc_id = WFDC_TYPE)',
'            "Doc.Type",',
'         (SELECT DISTINCT suplr_name1 wfdc_benf_name',
'            FROM suppliers',
'           WHERE     suplr_bu = wfdc_bu',
'                 AND suplr_suplr_id = wfdc_benf_id',
'                 AND wfdc_benf_type = ''S''',
'                 AND wfdc_benf_id IS NOT NULL',
'                 AND wfdc_bu = :GLOBAL_bu',
'          UNION ALL',
'          SELECT DISTINCT suplr_name1 wfdc_benf_name',
'            FROM suppliers',
'           WHERE     suplr_bu = wfdc_bu',
'                 AND suplr_suplr_id = wfdc_benf_id',
'                 AND wfdc_benf_type = ''C''',
'                 AND SUPLR_PARTY_TYPE = ''C''',
'                 AND wfdc_benf_id IS NOT NULL',
'                 AND wfdc_bu = :GLOBAL_bu)',
'            "Party",',
'         "WFDC_NXT_FWD_ENTITY",',
'         "WFDC_SRC_USER",',
'         "WFDC_NXT_FWD_PLNT",',
'         "WFDC_MAIL_SEND_FLAG",',
'			WFDC_DOC_DATE,',
'         to_char(WFDC_DOC_DATE,''DD-MM-YYYY'') "Doc. Date",',
'         "WFDC_LVL_PRJ",',
'         "WFDC_AUTH_TYPE",',
'         "WFDC_DISC_PCT",',
'         "WFDC_BENF_TYPE",',
'         "WFDC_BENF_ID",',
'         "WFDC_BILL_DATE",',
'         "WFDC_BILL_NO",',
'         "WFDC_GROSS_AMT",',
'         "WFDC_TAX_AMT",',
'         "WFDC_BILL_AMT",',
'         "WFDC_INV_PFX",',
'         "WFDC_INV_NO",',
'         "WFDC_EMP_ID",',
'         APEX_ITEM.checkbox2 (',
'            p_idx              => 1,',
'            p_value            => wfdc_wf_no || wfdc_select_flag,',
'            p_checked_values   => DECODE (wfdc_wf_no || wfdc_select_flag,',
'                                          wfdc_wf_no || ''1'', wfdc_wf_no || ''1''))',
'            Appr,',
'       /*    CASE',
'            WHEN wfdc_select_flag = 0',
'            THEN',
'               ''<span class="fa fa-square-o" aria-hidden="true"></span>''',
'            ELSE',
'               ''<span class="fa fa-check-square-o" style = "color:blue;background-color:#a5e1fe";; aria-hidden="true"></span>''',
'         END',
'            "select",  */',
'              CASE WHEN  wfdc_select_flag = 1 THEN',
'             ''<input type="checkbox" id="checkbox_''||wfdc_wf_no||''" checked="checked" onChange="checkanduncheck(''''''||wfdc_wf_no||'''''',''''CHECKANDUNCHECK'''')"/>'' ',
'            WHEN  wfdc_select_flag = 0 THEN',
'          ''<input type="checkbox" id="checkbox_''||wfdc_wf_no||''" onChange="checkanduncheck(''''''||wfdc_wf_no||'''''',''''CHECKANDUNCHECK'''')" />'' ',
'            END AS "select", ',
'         ''<span class="fa fa-history"  style = "color:#ff9800 ;" aria-hidden="true"></span>''',
'            hist,',
'         ''<span aria-hidden="true" style =  "color: #088def;" class="fa fa-info-circle-o"></span>''',
'            dtls,  ',
'		CASE WHEN (SELECT wf_apex_appl_no',
'                   FROM work_flow',
'                  WHERE wf_bu = wfdc_bu AND wf_bus_proc_id = wfdc_type) IS NOT NULL THEN 	          ',
'	     APEX_UTIL.PREPARE_URL(''f?p='' || ',
'		  		(SELECT wf_apex_appl_no',
'               FROM work_flow',
'              WHERE wf_bu = wfdc_bu AND wf_bus_proc_id = wfdc_type)',
'				|| '':''  ||(SELECT wf_apex_page_no',
'               FROM work_flow',
'              WHERE wf_bu = wfdc_bu AND wf_bus_proc_id = wfdc_type)||'':''||:APP_SESSION || ''::::''||  ''P''  || ',
'				(SELECT wf_apex_page_no',
'               FROM work_flow',
'              WHERE wf_bu = wfdc_bu AND wf_bus_proc_id = wfdc_type) ',
'				|| ''_WF_NO:''||wfdc_wf_no)  ',
'			ELSE NULL END LINK,',
'         ''<span aria-hidden="true" style = "color: #673ab7;" class="fa fa-file-text-o"></span>''',
'            Doc,',
'            WFDC_VOU_TYPE,',
'            WFDC_SUB_VOU_TYPE	,',
'            (SELECT DISTINCT apt_pfx_type_desc',
'               FROM appl_pfx_types',
'               WHERE apt_bu = WFDC_BU ',
'               AND apt_pfx_type = WFDC_VOU_TYPE)		VOU_TYPE_DESC,',
'            -- (SELECT DISTINCT apst_sub_type_desc',
'            --    FROM appl_vou_sub_types',
'            --    WHERE apst_bu = WFDC_BU',
'            --    AND apst_sub_type = WFDC_SUB_VOU_TYPE) SUB_VOU_DESC',
'            func_find_sub_vou_type_desc(:GLOBAL_BU,WFDC_SUB_VOU_TYPE)SUB_VOU_DESC',
'  FROM "WORK_FLOW_DOC_CONTROL"',
'   WHERE WFDC_BU = :global_bu',
'          AND (WFDC_TYPE = :P100_TYPE OR :P100_TYPE IS NULL)',
'         AND ((wfdc_auth_type = ''P'' AND wfdc_ctrl_person = func_find_position_id (:global_bu, :global_user)) OR ',
'			      wfdc_auth_type = ''E'' AND wfdc_ctrl_person = func_find_emp_id(:global_bu,:global_user))',
'         AND (wfdc_type, wfdc_status) NOT IN',
'                (SELECT WFAA_WF_ID, WFAA_STATUS',
'                   FROM WORK_FLOW_APPR_ACTVT',
'                  WHERE WFAA_BU = :GLOBAL_BU',
'                        AND (WFAA_WF_ID, WFAA_SEQ_NO) IN',
'                               (  SELECT WFAA_WF_ID,',
'                                         MAX (WFAA_SEQ_NO) WFAA_SEQ_NO',
'                                    FROM WORK_FLOW_APPR_ACTVT',
'                                   WHERE WFAA_BU = :GLOBAL_BU',
'                                GROUP BY WFAA_WF_ID))',
'         AND wfdc_status NOT IN (''C'', ''R'', ''S'') ',
'ORDER BY WFDC_CRE_DATE,WFDC_PRIORITY, WFDC_ACTION_DATE DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P100_TYPE'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P100_TYPE1'
,p_plug_display_when_cond2=>'MA'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Workflow'
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
 p_id=>wwv_flow_imp.id(33835765592820938878)
,p_max_row_count=>'1000000'
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
,p_internal_uid=>28353803757277327850
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633694552750458587)
,p_db_column_name=>'APPR'
,p_display_order=>980
,p_column_identifier=>'CW'
,p_column_label=>'&nbsp;'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13655411723942749176)
,p_db_column_name=>'DOC'
,p_display_order=>1020
,p_column_identifier=>'DA'
,p_column_label=>'Doc.'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_static_id=>'head'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13655411676271749175)
,p_db_column_name=>'DTLS'
,p_display_order=>1010
,p_column_identifier=>'CZ'
,p_column_label=>'Dtls.'
,p_column_link=>'f?p=&APP_ID.:236131010:&SESSION.::&DEBUG.:Y,::'
,p_column_linktext=>'#DTLS#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_static_id=>'head'
,p_display_condition_type=>'NEVER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9279604851023337359)
,p_db_column_name=>'Doc. Date'
,p_display_order=>1160
,p_column_identifier=>'DP'
,p_column_label=>'Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13700134547696627219)
,p_db_column_name=>'Doc. Detail'
,p_display_order=>1080
,p_column_identifier=>'DG'
,p_column_label=>'Doc. Details'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633693793821458585)
,p_db_column_name=>'Doc.Type'
,p_display_order=>800
,p_column_identifier=>'CB'
,p_column_label=>'WF. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633692168802458583)
,p_db_column_name=>'Entity'
,p_display_order=>750
,p_column_identifier=>'BW'
,p_column_label=>'Entity'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13743225484614987974)
,p_db_column_name=>'Fwd. By'
,p_display_order=>1090
,p_column_identifier=>'DH'
,p_column_label=>'Emp. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13743225593187987975)
,p_db_column_name=>'Fwd. Date'
,p_display_order=>1100
,p_column_identifier=>'DI'
,p_column_label=>'Forwarded Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH:MIPM'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13655411532614749174)
,p_db_column_name=>'HIST'
,p_display_order=>1000
,p_column_identifier=>'CY'
,p_column_label=>'Vw. Log'
,p_column_link=>'javascript:$s(''P236131010_WFDC_SRC_BU'',''#WFDC_SRC_BU#''),$s(''P236131010_WFDC_SRC_PLNT'',''#WFDC_SRC_PLNT#''),$s(''P236131010_WFDC_DOC_NO'',''#WFDC_DOC_NO#''),$s(''P236131010_WFDC_DOC_PFX'',''#WFDC_DOC_PFX#''),$s(''P236131010_WFDC_TYPE'',''#WFDC_TYPE#''),$s(''P2361310'
||'10_WFDC_PROD_ID'',''#WFDC_PROD_ID#''),$s(''P236131010_WFDC_PROD_REV'',''#WFDC_PROD_REV#''),$s(''P236131010_WFDC_SPPLR_ID'',''#WFDC_SPPLR_ID#'');apex.submit(''LOG'');'
,p_column_linktext=>'#HIST#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_static_id=>'head'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9839912385639452277)
,p_db_column_name=>'LINK'
,p_display_order=>1150
,p_column_identifier=>'DO'
,p_column_label=>'Det.'
,p_column_link=>'#LINK#'
,p_column_linktext=>' <span aria-hidden="true" style =  "color: #088def;" class="fa fa-info-circle"></span'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633690123977458579)
,p_db_column_name=>'No.'
,p_display_order=>700
,p_column_identifier=>'BR'
,p_column_label=>'No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633692977832458583)
,p_db_column_name=>'Party'
,p_display_order=>780
,p_column_identifier=>'BZ'
,p_column_label=>'Party'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633689786594458579)
,p_db_column_name=>'Pfx.'
,p_display_order=>690
,p_column_identifier=>'BQ'
,p_column_label=>'Pfx.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633692545090458583)
,p_db_column_name=>'Plant'
,p_display_order=>760
,p_column_identifier=>'BX'
,p_column_label=>'Unit ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9489747123878459079)
,p_db_column_name=>'SUB_VOU_DESC'
,p_display_order=>1210
,p_column_identifier=>'DU'
,p_column_label=>'Sub Vou. Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13743225606230987976)
,p_db_column_name=>'Time Elasped'
,p_display_order=>1110
,p_column_identifier=>'DJ'
,p_column_label=>'Lapsed(T)'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13743225776639987977)
,p_db_column_name=>'Unit'
,p_display_order=>1120
,p_column_identifier=>'DK'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9492654646590989941)
,p_db_column_name=>'VOU_TYPE_DESC'
,p_display_order=>1200
,p_column_identifier=>'DT'
,p_column_label=>'Vou. Type Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633690562657458580)
,p_db_column_name=>'Value'
,p_display_order=>710
,p_column_identifier=>'BS'
,p_column_label=>'Doc. Value'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633670594567458541)
,p_db_column_name=>'WFDC_ACCTS'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Wfdc Accts'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633681877494458563)
,p_db_column_name=>'WFDC_ACT'
,p_display_order=>450
,p_column_identifier=>'AS'
,p_column_label=>'Wfdc Act'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633673875362458548)
,p_db_column_name=>'WFDC_ACTION_DATE'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Wfdc Action Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633685000200458569)
,p_db_column_name=>'WFDC_AUTH_TYPE'
,p_display_order=>570
,p_column_identifier=>'BE'
,p_column_label=>'Wfdc Auth Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633686204102458573)
,p_db_column_name=>'WFDC_BENF_ID'
,p_display_order=>600
,p_column_identifier=>'BH'
,p_column_label=>'Wfdc Benf Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633685867297458571)
,p_db_column_name=>'WFDC_BENF_TYPE'
,p_display_order=>590
,p_column_identifier=>'BG'
,p_column_label=>'Wfdc Benf Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633688180313458576)
,p_db_column_name=>'WFDC_BILL_AMT'
,p_display_order=>650
,p_column_identifier=>'BM'
,p_column_label=>'Wfdc Bill Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633686602819458573)
,p_db_column_name=>'WFDC_BILL_DATE'
,p_display_order=>610
,p_column_identifier=>'BI'
,p_column_label=>'Wfdc Bill Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633687060067458574)
,p_db_column_name=>'WFDC_BILL_NO'
,p_display_order=>620
,p_column_identifier=>'BJ'
,p_column_label=>'Wfdc Bill No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633666616341458530)
,p_db_column_name=>'WFDC_BU'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Wfdc Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633679427761458558)
,p_db_column_name=>'WFDC_CRE_BY'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'Wfdc Cre By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633679862148458560)
,p_db_column_name=>'WFDC_CRE_DATE'
,p_display_order=>380
,p_column_identifier=>'AL'
,p_column_label=>'Wfdc Cre Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633667798663458537)
,p_db_column_name=>'WFDC_CTRL_PERSON'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Wfdc Ctrl Person'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633668621913458538)
,p_db_column_name=>'WFDC_CUST_ID'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Wfdc Cust Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633685398550458571)
,p_db_column_name=>'WFDC_DISC_PCT'
,p_display_order=>580
,p_column_identifier=>'BF'
,p_column_label=>'Wfdc Disc Pct'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13750901098365610994)
,p_db_column_name=>'WFDC_DOC_BRIEF'
,p_display_order=>1140
,p_column_identifier=>'DM'
,p_column_label=>'Wfdc Doc Brief'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9820270382742211252)
,p_db_column_name=>'WFDC_DOC_DATE'
,p_display_order=>1170
,p_column_identifier=>'DQ'
,p_column_label=>'Wfdc Doc Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13658364398081706085)
,p_db_column_name=>'WFDC_DOC_NO'
,p_display_order=>1040
,p_column_identifier=>'DC'
,p_column_label=>'Wfdc Doc No'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13658364329053706084)
,p_db_column_name=>'WFDC_DOC_PFX'
,p_display_order=>1030
,p_column_identifier=>'DB'
,p_column_label=>'Wfdc Doc Pfx'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633676654091458554)
,p_db_column_name=>'WFDC_DOC_SFX'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'Wfdc Doc Sfx'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633689327156458577)
,p_db_column_name=>'WFDC_EMP_ID'
,p_display_order=>680
,p_column_identifier=>'BP'
,p_column_label=>'Wfdc Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633672273111458544)
,p_db_column_name=>'WFDC_FRWD_RTN'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Wfdc Frwd Rtn'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13700134983173627223)
,p_db_column_name=>'WFDC_FWD_PERSON'
,p_display_order=>1130
,p_column_identifier=>'DL'
,p_column_label=>'Wfdc Fwd Person'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633681040950458562)
,p_db_column_name=>'WFDC_FWD_TO'
,p_display_order=>430
,p_column_identifier=>'AQ'
,p_column_label=>'Wfdc Fwd To'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633687381168458574)
,p_db_column_name=>'WFDC_GROSS_AMT'
,p_display_order=>630
,p_column_identifier=>'BK'
,p_column_label=>'Wfdc Gross Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633678688596458557)
,p_db_column_name=>'WFDC_INT_MSG_FLAG'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'Wfdc Int Msg Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633688982217458577)
,p_db_column_name=>'WFDC_INV_NO'
,p_display_order=>670
,p_column_identifier=>'BO'
,p_column_label=>'Wfdc Inv No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633688549745458576)
,p_db_column_name=>'WFDC_INV_PFX'
,p_display_order=>660
,p_column_identifier=>'BN'
,p_column_label=>'Wfdc Inv Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633671832194458543)
,p_db_column_name=>'WFDC_JRNL_TYPE'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Wfdc Jrnl Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633669073468458538)
,p_db_column_name=>'WFDC_LVL1'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Wfdc Lvl1'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633669485609458540)
,p_db_column_name=>'WFDC_LVL2'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Wfdc Lvl2'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633669875469458540)
,p_db_column_name=>'WFDC_LVL3'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Wfdc Lvl3'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633670269384458541)
,p_db_column_name=>'WFDC_LVL4'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Wfdc Lvl4'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633684681012458569)
,p_db_column_name=>'WFDC_LVL_PRJ'
,p_display_order=>560
,p_column_identifier=>'BD'
,p_column_label=>'Wfdc Lvl Prj'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633678241831458557)
,p_db_column_name=>'WFDC_MAIL_FLAG'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'Wfdc Mail Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633684272959458568)
,p_db_column_name=>'WFDC_MAIL_SEND_FLAG'
,p_display_order=>540
,p_column_identifier=>'BB'
,p_column_label=>'Wfdc Mail Send Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633673053853458546)
,p_db_column_name=>'WFDC_MESSAGE'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Wfdc Message'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633683037748458566)
,p_db_column_name=>'WFDC_NXT_FWD_ENTITY'
,p_display_order=>510
,p_column_identifier=>'AY'
,p_column_label=>'Wfdc Nxt Fwd Entity'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633694177033458587)
,p_db_column_name=>'WFDC_NXT_FWD_PERSON'
,p_display_order=>810
,p_column_identifier=>'CC'
,p_column_label=>'Wfdc Nxt Fwd Person'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633683815176458568)
,p_db_column_name=>'WFDC_NXT_FWD_PLNT'
,p_display_order=>530
,p_column_identifier=>'BA'
,p_column_label=>'Wfdc Nxt Fwd Plnt'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633682232371458565)
,p_db_column_name=>'WFDC_NXT_MESSAGE'
,p_display_order=>470
,p_column_identifier=>'AU'
,p_column_label=>'Wfdc Nxt Message'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633681438022458563)
,p_db_column_name=>'WFDC_NXT_STATUS'
,p_display_order=>440
,p_column_identifier=>'AR'
,p_column_label=>'Wfdc Nxt Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633677467850458555)
,p_db_column_name=>'WFDC_PLNT'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'Wfdc Plnt'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633672649239458544)
,p_db_column_name=>'WFDC_PO_MODE'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Wfdc Po Mode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633675803252458552)
,p_db_column_name=>'WFDC_PRIORITY'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Wfdc Priority'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633671061132458543)
,p_db_column_name=>'WFDC_PRJ_ID'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Wfdc Prj Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633675032188458551)
,p_db_column_name=>'WFDC_PROD_ID'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Wfdc Prod Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633675407339458551)
,p_db_column_name=>'WFDC_PROD_REV'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Wfdc Prod Rev'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633674643083458549)
,p_db_column_name=>'WFDC_QC_INS_MODE'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Wfdc Qc Ins Mode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633674240805458549)
,p_db_column_name=>'WFDC_QC_REV'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Wfdc Qc Rev'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633671416883458543)
,p_db_column_name=>'WFDC_RND_PRJ_ID'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Wfdc Rnd Prj Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633677802937458555)
,p_db_column_name=>'WFDC_SELECT_FLAG'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'Wfdc Select Flag'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633673442916458546)
,p_db_column_name=>'WFDC_SEQ_NO'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Wfdc Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633679075748458558)
,p_db_column_name=>'WFDC_SMS_FLAG'
,p_display_order=>360
,p_column_identifier=>'AJ'
,p_column_label=>'Wfdc Sms Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633668293776458537)
,p_db_column_name=>'WFDC_SPPLR_ID'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Wfdc Spplr Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13658364568478706086)
,p_db_column_name=>'WFDC_SRC_BU'
,p_display_order=>1050
,p_column_identifier=>'DD'
,p_column_label=>'Wfdc Src Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13658364630068706087)
,p_db_column_name=>'WFDC_SRC_PLNT'
,p_display_order=>1060
,p_column_identifier=>'DE'
,p_column_label=>'WFDC_SRC_PLNT'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633683399637458566)
,p_db_column_name=>'WFDC_SRC_USER'
,p_display_order=>520
,p_column_identifier=>'AZ'
,p_column_label=>'Wfdc Src User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633667417458458535)
,p_db_column_name=>'WFDC_STATUS'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Wfdc Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9452654637305942446)
,p_db_column_name=>'WFDC_SUB_VOU_TYPE'
,p_display_order=>1190
,p_column_identifier=>'DS'
,p_column_label=>'Sub Vou. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633687771612458574)
,p_db_column_name=>'WFDC_TAX_AMT'
,p_display_order=>640
,p_column_identifier=>'BL'
,p_column_label=>'Wfdc Tax Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633667078941458535)
,p_db_column_name=>'WFDC_TYPE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Wfdc Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633680238908458560)
,p_db_column_name=>'WFDC_UPD_BY'
,p_display_order=>390
,p_column_identifier=>'AM'
,p_column_label=>'Wfdc Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633680599282458562)
,p_db_column_name=>'WFDC_UPD_DATE'
,p_display_order=>400
,p_column_identifier=>'AN'
,p_column_label=>'Wfdc Upd Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9452654529646942445)
,p_db_column_name=>'WFDC_VOU_TYPE'
,p_display_order=>1180
,p_column_identifier=>'DR'
,p_column_label=>'Vou. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633676242323458552)
,p_db_column_name=>'WFDC_WF_NO'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Wfdc Wf No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633677011936458554)
,p_db_column_name=>'WFDC_WRK_CNTR'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Wfdc Wrk Cntr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13633694935696458588)
,p_db_column_name=>'select'
,p_display_order=>990
,p_column_identifier=>'CX'
,p_column_label=>'Select'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(33835830042253946291)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'53805409'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'select:LINK:Entity:Unit:Doc.Type:WFDC_VOU_TYPE:VOU_TYPE_DESC:WFDC_SUB_VOU_TYPE:SUB_VOU_DESC:Pfx.:No.:Doc. Date:Doc. Detail:Fwd. By:Party:Value:HIST'
,p_sort_column_1=>'WFDC_CRE_DATE'
,p_sort_direction_1=>'DESC'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7591350074885996665)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(33819157249268496697)
,p_button_name=>'Cards'
,p_static_id=>'cards'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Cards'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:2361310102:&SESSION.::&DEBUG.:::'
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7591350855480996667)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(33819157249268496697)
,p_button_name=>'Process'
,p_static_id=>'process'
,p_button_static_id=>'B1'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Process'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7591315794070996401)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(18690234299391873223)
,p_button_name=>'Process_BTN'
,p_static_id=>'process-btn'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--mobileHideLabel:t-Button--small:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_image_alt=>'Process'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7591350486986996667)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(33819157249268496697)
,p_button_name=>'Select'
,p_static_id=>'select'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Select/Unselect All'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7591373175712996728)
,p_branch_name=>'Cards'
,p_branch_action=>'f?p=&APP_ID.:2361310102:&SESSION.::&DEBUG.::P2361310102_TYPE:CA&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>41
,p_branch_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7591373547112996731)
,p_branch_name=>'Go To Page 236131010'
,p_branch_action=>'javascript:openModal(''SUB'');'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(7591350855480996667)
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7591374021791996731)
,p_branch_name=>'Go To Page 23613101001'
,p_branch_action=>'f?p=&APP_ID.:23613101001:&SESSION.::&DEBUG.:RP,23613101001:P23613101001_DOC_BU,P23613101001_DOC_NO,P23613101001_DOC_PFX,P23613101001_PLNT,P23613101001_WF_TYPE,P23613101001_PROD_ID,P23613101001_PROD_REV,P23613101001_PARTY_ID:&P100_WFDC_SRC_BU.,&P100_WFDC_DOC_NO.,&P100_WFDC_DOC_PFX.,&P100_WFDC_SRC_PLNT.,&P100_WFDC_TYPE.,&P100_WFDC_PROD_ID.,&P100_WFDC_PROD_REV.,&P100_WFDC_SPPLR_ID.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>21
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'LOG'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13325731571344760050)
,p_name=>'P100_COUNT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(33819157249268496697)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT COUNT (*)',
'  FROM WORK_FLOW_DOC_CONTROL',
' WHERE WFDC_BU = :global_bu AND WFDC_SELECT_FLAG = 1',
'       AND (wfdc_auth_type = ''P''',
'            AND wfdc_ctrl_person =',
'                   func_find_position_id (:global_bu, :global_user)',
'            OR wfdc_auth_type = ''E''',
'               AND wfdc_ctrl_person =',
'                      :global_emp_id)',
'       AND (wfdc_type, wfdc_status) NOT IN',
'              (SELECT WFAA_WF_ID, WFAA_STATUS',
'                 FROM WORK_FLOW_APPR_ACTVT',
'                WHERE WFAA_BU = :GLOBAL_BU',
'                      AND (WFAA_WF_ID, WFAA_SEQ_NO) IN',
'                             (  SELECT WFAA_WF_ID,',
'                                       MAX (WFAA_SEQ_NO) WFAA_SEQ_NO',
'                                  FROM WORK_FLOW_APPR_ACTVT',
'                                 WHERE WFAA_BU = :GLOBAL_BU',
'                              GROUP BY WFAA_WF_ID))',
'       AND wfdc_status NOT IN (''C'', ''R'', ''S'')'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13633741993701458875)
,p_name=>'P100_FWD_ON'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(18690234299391873223)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8430183396912584287)
,p_name=>'P100_INT_MSG'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(13105953062480931224)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8430182599288584285)
,p_name=>'P100_MAIL_FLAG'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(13105953062480931224)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13768869115542725958)
,p_name=>'P100_MSG'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(18690234299391873223)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13633742382903458875)
,p_name=>'P100_NEXT_PROCESS'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(18690234299391873223)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P100_WFDC_ACT'
,p_display_when2=>'F'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8377977506529149650)
,p_name=>'P100_SEQ_NO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(33819157249268496697)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct wfdc_select_flag  from work_flow_doc_control',
' WHERE wfdc_bu = :GLOBAL_BU AND wfdc_select_flag = 1'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8430182944342584287)
,p_name=>'P100_SMS_FLAG'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(13105953062480931224)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13698567856522348994)
,p_name=>'P100_TYPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8428053065991890777)
,p_prompt=>'Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT distinct (SELECT INITCAP (wf_bus_proc_desc)',
'            FROM WORK_FLOW',
'           WHERE WF_BU = wfdc_BU AND wf_bus_proc_id = WFDC_TYPE)',
'            "Doc.Type",WFDC_TYPE ',
'            FROM WORK_FLOW_DOC_CONTROL',
'           WHERE WFDC_BU = :global_bu',
'                 AND (wfdc_auth_type = ''P''',
'                      AND wfdc_ctrl_person =',
'                             func_find_position_id (:global_bu, :global_user)',
'                      OR wfdc_auth_type = ''E''',
'                         AND wfdc_ctrl_person =',
'                                :global_emp_id)',
'                 AND (wfdc_type, wfdc_status) NOT IN',
'                        (SELECT WFAA_WF_ID, WFAA_STATUS',
'                           FROM WORK_FLOW_APPR_ACTVT',
'                          WHERE WFAA_BU = :GLOBAL_BU',
'                                AND (WFAA_WF_ID, WFAA_SEQ_NO) IN',
'                                       (  SELECT WFAA_WF_ID,',
'                                                 MAX (WFAA_SEQ_NO) WFAA_SEQ_NO',
'                                            FROM WORK_FLOW_APPR_ACTVT',
'                                           WHERE WFAA_BU = :GLOBAL_BU',
'                                        GROUP BY WFAA_WF_ID))',
'                 AND wfdc_status NOT IN (''C'', ''R'', ''S'')',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All Documents'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_display_when=>'P100_TYPE1'
,p_display_when2=>'MA'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8417980794042871406)
,p_name=>'P100_TYPE1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8428053065991890777)
,p_item_default=>'CA'
,p_prompt=>'&nbsp'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Cards View;CA,Tabular View;MA'
,p_cHeight=>1
,p_colspan=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'execute_validations', 'Y',
  'page_action_on_selection', 'SUBMIT')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8430181380100584281)
,p_name=>'P100_TYPE_1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(13105953062480931224)
,p_item_default=>'CA'
,p_prompt=>'&nbsp'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Cards View;CA,Tabular View;MA'
,p_cHeight=>1
,p_grid_label_column_span=>0
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'execute_validations', 'Y',
  'page_action_on_selection', 'SUBMIT')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13633739238914458867)
,p_name=>'P100_WFDC_ACT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(18690234299391873223)
,p_item_default=>'W'
,p_prompt=>'&nbsp;'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Approve;A,Forward;F,Return;R,Wait ;W'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-bottom-lg'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '5',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8428095550979891046)
,p_name=>'P100_WFDC_CARD_TYPE'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(18690234299391873223)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13633740030404458871)
,p_name=>'P100_WFDC_CTRL_PERSON'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(18690234299391873223)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13658406926343706353)
,p_name=>'P100_WFDC_DOC_NO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(18690234299391873223)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13658407020358706354)
,p_name=>'P100_WFDC_DOC_PFX'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(18690234299391873223)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13633741572713458875)
,p_name=>'P100_WFDC_MESSAGE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(18690234299391873223)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P100_WFDC_ACT'
,p_display_when2=>'F'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13633743234660458878)
,p_name=>'P100_WFDC_NXT_FWD_ENT'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(18690234299391873223)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13633744027407458879)
,p_name=>'P100_WFDC_NXT_FWD_NM'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(18690234299391873223)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13633742785612458876)
,p_name=>'P100_WFDC_NXT_FWD_PERS'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(18690234299391873223)
,p_prompt=>'Forward Person'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'FORWARD_LOV_WFM0010'
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P100_WFDC_ACT,P100_WFDC_TYPE,P100_SEQ_NO'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7865772145097271646)
,p_name=>'P100_WFDC_NXT_FWD_PERS_1'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(18690234299391873223)
,p_prompt=>'Return Person'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'RETURN_LOV_WFM0010'
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P100_WFDC_TYPE,P100_WFDC_SEQ_NO,P100_WFDC_ACT'
,p_ajax_items_to_submit=>'P100_WFDC_TYPE,P100_WFDC_SEQ_NO,P100_WFDC_ACT'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13633743550599458879)
,p_name=>'P100_WFDC_NXT_FWD_PLNT'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(18690234299391873223)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13633744393699458879)
,p_name=>'P100_WFDC_NXT_MESSAGE'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(18690234299391873223)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Message'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13633744839200458881)
,p_name=>'P100_WFDC_NXT_STATUS'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(18690234299391873223)
,p_use_cache_before_default=>'NO'
,p_item_default=>'A'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P100_WFDC_ACT'
,p_display_when2=>'F'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13633745211249458881)
,p_name=>'P100_WFDC_NXT_STAT_DES'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(18690234299391873223)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8003064218281912086)
,p_name=>'P100_WFDC_PROD_ID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(33819157249268496697)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8003064299379912087)
,p_name=>'P100_WFDC_PROD_REV'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(33819157249268496697)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13633741214587458873)
,p_name=>'P100_WFDC_SELECT_FLAG'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(18690234299391873223)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13633740434891458873)
,p_name=>'P100_WFDC_SEQ_NO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(18690234299391873223)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9171644791082631090)
,p_name=>'P100_WFDC_SPPLR_ID'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(33819157249268496697)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT         ',
'	     CASE WHEN (SELECT wf_apex_appl_no',
'               FROM work_flow',
'              WHERE wf_bu = wfdc_bu AND wf_bus_proc_id = wfdc_type) IS NOT NULL THEN 	          ',
'	     APEX_UTIL.PREPARE_URL(''f?p='' || ',
'		  		(SELECT wf_apex_appl_no',
'               FROM work_flow',
'              WHERE wf_bu = wfdc_bu AND wf_bus_proc_id = wfdc_type)',
'				|| '':''  ||  ''P''  || ',
'				(SELECT wf_apex_page_no',
'               FROM work_flow',
'              WHERE wf_bu = wfdc_bu AND wf_bus_proc_id = wfdc_type) ',
'				|| ''_WF_NO:'' || :GLOBAL_USER  || '','' || :GLOBAL_P  || '','' || ',
'				(SELECT wf_apex_page_no  FROM work_flow WHERE wf_bu = wfdc_bu AND wf_bus_proc_id = wfdc_type)',
'         	|| '',''  || :APP_SESSION || '',''  || wfdc_wf_no)  ',
'			ELSE NULL END LINK',
'  FROM "WORK_FLOW_DOC_CONTROL"',
'   WHERE WFDC_BU = :global_bu',
'         AND (WFDC_TYPE = :P100_TYPE OR :P100_TYPE IS NULL)',
'         AND ((wfdc_auth_type = ''P'' AND wfdc_ctrl_person = func_find_position_id (:global_bu, :global_user)) OR ',
'			      wfdc_auth_type = ''E'' AND wfdc_ctrl_person = :global_emp_id)',
'         AND (wfdc_type, wfdc_status) NOT IN',
'                (SELECT WFAA_WF_ID, WFAA_STATUS',
'                   FROM WORK_FLOW_APPR_ACTVT',
'                  WHERE WFAA_BU = :GLOBAL_BU',
'                        AND (WFAA_WF_ID, WFAA_SEQ_NO) IN',
'                               (  SELECT WFAA_WF_ID,',
'                                         MAX (WFAA_SEQ_NO) WFAA_SEQ_NO',
'                                    FROM WORK_FLOW_APPR_ACTVT',
'                                   WHERE WFAA_BU = :GLOBAL_BU',
'                                GROUP BY WFAA_WF_ID))',
'         AND wfdc_status NOT IN (''C'', ''R'', ''S'')',
'ORDER BY WFDC_CRE_DATE,WFDC_PRIORITY, WFDC_ACTION_DATE DESC'))
,p_source_type=>'QUERY_COLON'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13658406680760706351)
,p_name=>'P100_WFDC_SRC_BU'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(18690234299391873223)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13658406819229706352)
,p_name=>'P100_WFDC_SRC_PLNT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(18690234299391873223)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13633739548294458871)
,p_name=>'P100_WFDC_TYPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(18690234299391873223)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13633740777026458873)
,p_name=>'P100_WFDC_WF_NO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(18690234299391873223)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8430182154249584284)
,p_name=>'P100_WF_NO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(13105953062480931224)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8430142655039584036)
,p_name=>'P100_WF_SRCH'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(8428053065991890777)
,p_prompt=>'Search'
,p_placeholder=>'Search'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>9
,p_grid_label_column_span=>0
,p_display_when=>'P100_TYPE1'
,p_display_when2=>'CA'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large:margin-top-none:margin-bottom-none'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7591353099109996673)
,p_validation_name=>'WFDC_NXT_FWD_PERS'
,p_static_id=>'wfdc-nxt-fwd-pers'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P100_WFDC_NXT_FWD_PERS IS NULL THEN ',
'    Return(''Forward Person must be entered'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'P100_WFDC_ACT'
,p_validation_condition2=>'F'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_imp.id(7591315794070996401)
,p_associated_item=>wwv_flow_imp.id(13633742785612458876)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7591353529703996674)
,p_validation_name=>'WFDC_NXT_FWD_PERS_1'
,p_static_id=>'wfdc-nxt-fwd-pers-2'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P100_WFDC_NXT_FWD_PERS_1 IS NULL THEN ',
'    Return(''Return Person must be entered'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'P100_WFDC_ACT'
,p_validation_condition2=>'R'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_imp.id(7591315794070996401)
,p_associated_item=>wwv_flow_imp.id(7865772145097271646)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7591353929154996676)
,p_validation_name=>'WFDC_NXT_MESSAGE'
,p_static_id=>'wfdc-nxt-message'
,p_validation_sequence=>10
,p_validation=>'P100_WFDC_NXT_MESSAGE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Return Reason must be entered.'
,p_validation_condition=>'P100_WFDC_ACT'
,p_validation_condition2=>'R'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_imp.id(7591315794070996401)
,p_associated_item=>wwv_flow_imp.id(13633744393699458879)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7591370353006996724)
,p_name=>'Check Flag'
,p_static_id=>'check-flag'
,p_event_sequence=>160
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(33819157249268496697)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7591370915637996724)
,p_event_id=>wwv_flow_imp.id(7591370353006996724)
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
 p_id=>wwv_flow_imp.id(7591365759046996718)
,p_name=>'da_selectjs'
,p_static_id=>'da-selectjs'
,p_event_sequence=>120
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7591366271518996720)
,p_event_id=>wwv_flow_imp.id(7591365759046996718)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(33819157249268496697)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7591360036778996710)
,p_name=>'java'
,p_static_id=>'java'
,p_event_sequence=>80
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'myreport'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7591362106574996713)
,p_event_id=>wwv_flow_imp.id(7591360036778996710)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(7591350855480996667)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7591361130068996712)
,p_event_id=>wwv_flow_imp.id(7591360036778996710)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P100_SEQ_NO',
  'items_to_submit', 'P100_WFDC_SELECT_FLAG,P100_WFDC_WF_NO,P100_WFDC_CARD_TYPE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '/* Formatted on 11/20/2020 10:32:22 AM (QP5 v5.163.1008.3004) */',
    '--raise_application_error(-20999,''12354''||''/''||:P100_WFDC_CARD_TYPE||''/''||:P100_WFDC_WF_NO);',
    'if :P100_WFDC_CARD_TYPE = ''C'' then',
    '        UPDATE work_flow_doc_control',
    '          SET wfdc_select_flag = 0,',
    '              wfdc_upd_by = :Global_user,',
    '              wfdc_upd_date = sysdate',
    '        WHERE     wfdc_bu = :global_bu',
    '       AND wfdc_select_flag = 1;',
    '       --AND wfdc_wf_no = :P100_WFDC_WF_NO;',
    'END IF;',
    '',
    'IF :P100_WFDC_SELECT_FLAG = 0 THEN',
    '',
    '--raise_application_error(-20999,''1''||:P100_WFDC_SELECT_FLAG||:P100_WFDC_WF_NO);',
    '',
    'UPDATE work_flow_doc_control',
    '   SET wfdc_select_flag = 1',
    ' WHERE     wfdc_bu = :global_bu',
    '       AND wfdc_select_flag = 0',
    '       AND wfdc_wf_no = :P100_WFDC_WF_NO;',
    '',
    'COMMIT;',
    'select distinct wfdc_select_flag ',
    'into ',
    ':p100_seq_no',
    'from work_flow_doc_control',
    ' WHERE wfdc_bu = :GLOBAL_BU AND wfdc_select_flag = 1;',
    'ELSE',
    '',
    'UPDATE work_flow_doc_control',
    '   SET wfdc_select_flag = 0,',
    '       wfdc_nxt_status = NULL,',
    '       wfdc_nxt_message = NULL,',
    '       wfdc_nxt_fwd_person = NULL,',
    '       wfdc_nxt_fwd_entity = NULL',
    ' WHERE     wfdc_bu = :global_bu',
    '       AND wfdc_select_flag = 1',
    '       AND wfdc_wf_no = :p100_wfdc_wf_no;',
    'COMMIT;',
    '',
    ':p100_seq_no := 0;',
    'END IF;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7591360604859996710)
,p_event_id=>wwv_flow_imp.id(7591360036778996710)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item( "P100_WFDC_SELECT_FLAG" ).setValue( this.data.WFDC_SELECT_FLAG );',
    'apex.item( "P100_WFDC_WF_NO" ).setValue( this.data.WFDC_WF_NO);',
    'apex.item( "P100_WFDC_CARD_TYPE" ).setValue( this.data.WFDC_CARD_TYPE);',
    'console.log(''1''+this.data.WFDC_CARD_TYPE);',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7591361601276996713)
,p_event_id=>wwv_flow_imp.id(7591360036778996710)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P100_SEQ_NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7591362595212996713)
,p_event_id=>wwv_flow_imp.id(7591360036778996710)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(33819157249268496697)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7591362972194996715)
,p_name=>'java_1'
,p_static_id=>'java-2'
,p_event_sequence=>90
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'#check'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'myreport'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7591363507289996717)
,p_event_id=>wwv_flow_imp.id(7591362972194996715)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P100_WFDC_SELECT_FLAG,P100_WFDC_WF_NO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '/* Formatted on 11/20/2020 10:32:22 AM (QP5 v5.163.1008.3004) */',
    'IF :P100_WFDC_SELECT_FLAG = 0 THEN',
    '',
    '--raise_application_error(-20999,''1''||:P100_WFDC_SELECT_FLAG||:P100_WFDC_WF_NO);',
    '',
    'UPDATE work_flow_doc_control',
    '   SET wfdc_select_flag = 1',
    ' WHERE     wfdc_bu = :global_bu',
    '       AND wfdc_select_flag = 0;',
    '       --AND wfdc_wf_no = :P100_WFDC_WF_NO;',
    '',
    'COMMIT;',
    'ELSE',
    '',
    'UPDATE work_flow_doc_control',
    '   SET wfdc_select_flag = 0,',
    '       wfdc_nxt_status = NULL,',
    '       wfdc_nxt_message = NULL,',
    '       wfdc_nxt_fwd_person = NULL,',
    '       wfdc_nxt_fwd_entity = NULL',
    ' WHERE     wfdc_bu = :global_bu',
    '       AND wfdc_select_flag = 1;',
    '       --AND wfdc_wf_no = :p100_wfdc_wf_no;',
    'COMMIT;',
    '',
    '',
    'END IF;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7591364506495996717)
,p_event_id=>wwv_flow_imp.id(7591362972194996715)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item( "P100_WFDC_SELECT_FLAG" ).setValue( this.data.WFDC_SELECT_FLAG );',
    '//apex.item( "P100_WFDC_WF_NO" ).setValue( this.data.WFDC_WF_NO);',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7591363940007996717)
,p_event_id=>wwv_flow_imp.id(7591362972194996715)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(33819157249268496697)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7591371267948996724)
,p_name=>'P100_TYPE'
,p_static_id=>'p100-type'
,p_event_sequence=>140
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P100_TYPE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7591371834137996726)
,p_event_id=>wwv_flow_imp.id(7591371267948996724)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(33819157249268496697)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7591366683919996720)
,p_name=>'P100_WF_SRCH'
,p_static_id=>'p100-wf-srch'
,p_event_sequence=>130
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P100_WF_SRCH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keyup'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7591367217296996720)
,p_event_id=>wwv_flow_imp.id(7591366683919996720)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(13105953062480931224)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7591372152591996726)
,p_name=>'Page load Process Refresh'
,p_static_id=>'page-load-process-refresh'
,p_event_sequence=>170
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7591372711245996728)
,p_event_id=>wwv_flow_imp.id(7591372152591996726)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(33819157249268496697)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7591357309762996699)
,p_name=>'process radio group'
,p_static_id=>'process-radio-group'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P100_WFDC_ACT'
,p_condition_element=>'P100_WFDC_ACT'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7591357765450996707)
,p_event_id=>wwv_flow_imp.id(7591357309762996699)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P100_WFDC_TYPE,P100_WFDC_CTRL_PERSON,P100_WFDC_SEQ_NO,P100_WFDC_SELECT_FLAG,P100_WFDC_NXT_FWD_PERS,P100_WFDC_NXT_FWD_ENT,P100_WFDC_NXT_FWD_PLNT,P100_WFDC_NXT_FWD_NM,P100_WFDC_NXT_MESSAGE,P100_WFDC_NXT_STATUS,P100_WFDC_NXT_STAT_DES',
  'items_to_submit', 'P100_WFDC_ACT',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Declare',
    'v_cnt    number;',
    'v_rtn_cnt varchar2(15);',
    'v_err varchar2(500);',
    'CURSOR c1',
    '   IS  SELECT *',
    '        FROM work_flow_doc_control',
    '       WHERE wfdc_bu = :global_bu  AND wfdc_select_flag = 1 AND (wfdc_auth_type = ''P'' AND wfdc_ctrl_person = func_find_position_id (:global_bu, :global_user) OR wfdc_auth_type = ''E'' AND wfdc_ctrl_person = :global_emp_id) AND wfdc_status NOT IN (''C'', '
||'''R'');',
    'Begin ',
    'FOR cr1 IN c1 LOOP',
    'SELECT COUNT (*) into v_cnt',
    '  FROM (  SELECT COUNT (*), WFDC_TYPE FROM work_flow_doc_control',
    '   WHERE wfdc_bu = :global_bu AND wfdc_select_flag = 1',
    'AND (wfdc_auth_type = ''P''',
    '     AND wfdc_ctrl_person =',
    '            func_find_position_id (:global_bu, :global_user)',
    '     OR wfdc_auth_type = ''E''',
    '        AND wfdc_ctrl_person =',
    '               :global_emp_id)',
    'AND wfdc_status NOT IN (''C'', ''R'')',
    '        GROUP BY WFDC_TYPE);',
    'If v_cnt > 1 then',
    '',
    'UPDATE work_flow_doc_control',
    '   SET wfdc_select_flag = 0',
    ' WHERE wfdc_bu = :GLOBAL_BU AND wfdc_select_flag = 1;',
    ' commit; ',
    ' raise_application_error(-20999,''Please select one particular workflow type to proceed the process'');',
    'else  :P100_WFDC_TYPE := cr1.WFDC_TYPE ;',
    '  :P100_WFDC_CTRL_PERSON := cr1.WFDC_CTRL_PERSON ;',
    '  :P100_WFDC_SEQ_NO := cr1.WFDC_SEQ_NO  ;',
    '  If (:P100_WFDC_ACT = ''R'') then',
    '    :P100_WFDC_WF_NO := cr1.WFDC_WF_NO;',
    '    End if; ',
    ' PROC_WF_RADIO_CHANGE_APEX_WEB (',
    '   p_bu          => :global_bu,',
    '   p_user        => :global_user,',
    '   p_WFDC_TYPE   => cr1.WFDC_TYPE,',
    '   p_WFDC_STATUS => cr1.WFDC_STATUS,',
    '   p_WFDC_ACT    => :P100_WFDC_ACT,',
    '   p_WFDC_PLNT   => cr1.WFDC_PLNT,',
    '   p_WFDC_VALUE  => cr1.WFDC_VALUE,',
    '   P_WFDC_WF_NO  => cr1.WFDC_WF_NO,',
    '   P_WFDC_SEQ_NO => cr1.WFDC_SEQ_NO,    ',
    '   P_WFDC_CTRL_PERSON             => cr1.WFDC_CTRL_PERSON,',
    '   P_WFDC_SRC_BU => cr1.WFDC_SRC_BU,     ',
    '   P_WFDC_DOC_PFX=> cr1.WFDC_DOC_PFX,',
    '   P_WFDC_DOC_NO => cr1.WFDC_DOC_NO,',
    '   p_WFDC_SELECT_FLAG             => :P100_WFDC_SELECT_FLAG,',
    '   p_WFDC_NXT_STATUS              => :P100_WFDC_NXT_STATUS,',
    '   p_WFDC_NXT_STATUS_DESC         => :P100_WFDC_NXT_STAT_DES,',
    '   p_WFDC_NXT_MESSAGE             => :P100_WFDC_NXT_MESSAGE,',
    '   P_WFDC_NXT_FWD_PERSON          => :P100_WFDC_NXT_FWD_PERS,',
    '   P_WFDC_NXT_FWD_ENTITY          => :P100_WFDC_NXT_FWD_ENT,',
    '   P_WFDC_NXT_FWD_PLNT            => :P100_WFDC_NXT_FWD_PLNT,',
    '   P_WFDC_NXT_FWD_PERSON_NM       => :P100_WFDC_NXT_FWD_NM);',
    'commit;',
    'UPDATE work_flow_doc_control',
    '  SET wfdc_act = :P100_WFDC_ACT,',
    '      wfdc_select_flag  =:P100_WFDC_SELECT_FLAG,',
    '      wfdc_nxt_status = :P100_WFDC_NXT_STATUS,',
    '      wfdc_nxt_message = :P100_WFDC_NXT_MESSAGE,',
    '      wfdc_nxt_fwd_person = :P100_WFDC_NXT_FWD_PERS,',
    '      wfdc_nxt_fwd_entity = :P100_WFDC_NXT_FWD_ENT',
    'WHERE wfdc_bu = :GLOBAL_BU ',
    '  AND wfdc_wf_no = cr1.wfdc_wf_no;     ',
    '  Commit; ',
    '  ',
    '  End If; ',
    '  End loop;  ',
    '  --EXCEPTION WHEN OTHERS THEN proc_apex_err_msg_log(236131010,SQLERRM);',
    '  Raise_Application_Error(-20999,func_find_erp_err_msg(SQLERRM));',
    'End;',
    '',
    '',
    '',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7591358291981996707)
,p_event_id=>wwv_flow_imp.id(7591357309762996699)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(33819157249268496697)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7591358635693996709)
,p_name=>'show/hide_fwd'
,p_static_id=>'show-hide-fwd'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P100_WFDC_ACT'
,p_condition_element=>'P100_WFDC_ACT'
,p_triggering_condition_type=>'IN_LIST'
,p_triggering_expression=>'F'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7591359190075996709)
,p_event_id=>wwv_flow_imp.id(7591358635693996709)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P100_WFDC_NXT_FWD_PERS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7591359668161996709)
,p_event_id=>wwv_flow_imp.id(7591358635693996709)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P100_WFDC_NXT_MESSAGE,P100_WFDC_NXT_FWD_PERS'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7591368983556996723)
,p_name=>'show/hide_msg'
,p_static_id=>'show-hide-msg'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P100_WFDC_ACT'
,p_condition_element=>'P100_WFDC_ACT'
,p_triggering_condition_type=>'IN_LIST'
,p_triggering_expression=>'R,F'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7591369470899996723)
,p_event_id=>wwv_flow_imp.id(7591368983556996723)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P100_WFDC_NXT_MESSAGE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7591370027115996723)
,p_event_id=>wwv_flow_imp.id(7591368983556996723)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P100_WFDC_NXT_MESSAGE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7591367536603996721)
,p_name=>'show/hide_rtn'
,p_static_id=>'show-hide-rtn'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P100_WFDC_ACT'
,p_condition_element=>'P100_WFDC_ACT'
,p_triggering_condition_type=>'IN_LIST'
,p_triggering_expression=>'R'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7591368130004996721)
,p_event_id=>wwv_flow_imp.id(7591367536603996721)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P100_WFDC_NXT_FWD_PERS_1'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7591368545265996721)
,p_event_id=>wwv_flow_imp.id(7591367536603996721)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P100_WFDC_NXT_FWD_PERS_1'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7591354503164996685)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CHECKANDUNCHECK'
,p_static_id=>'checkanduncheck'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'',
'      IF APEX_APPLICATION.G_X03  = 1',
'      THEN',
'          ',
'         UPDATE work_flow_doc_control',
'            SET wfdc_select_flag = 1',
'          WHERE     wfdc_bu = :global_bu',
'                AND wfdc_wf_no = APEX_APPLICATION.G_X02;',
' ',
'--end loop;',
'    ELSIF APEX_APPLICATION.G_X03  = 0',
'      THEN',
' ',
'         UPDATE work_flow_doc_control',
'            SET wfdc_select_flag = 0,',
'                wfdc_nxt_status = NULL,',
'                wfdc_nxt_message = NULL,',
'                wfdc_nxt_fwd_person = NULL,',
'                wfdc_nxt_fwd_entity = NULL',
'          WHERE     wfdc_bu = :global_bu',
'                AND wfdc_wf_no = APEX_APPLICATION.G_X02;',
'       ',
'      END IF;',
' ',
'COMMIT;',
'      HTP.P(''success'');',
'  ',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>2109392667621385657
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7591355683458996687)
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
'             WHEN wfdc_select_flag = 0 THEN 0',
'             WHEN wfdc_select_flag = 1 THEN 1',
'             ELSE 01',
'          END',
'             FLAG',
'     INTO V_FLAG',
'     FROM (  SELECT LISTAGG (DISTINCT wfdc_select_flag, '','')',
'                       WITHIN GROUP (ORDER BY wfdc_select_flag)',
'                       wfdc_select_flag',
'              FROM work_flow_doc_control a',
'             WHERE wfdc_bu = :GLOBAL_BU);',
'          ',
'  SELECT NVL(COUNT(wfdc_select_flag),0)',
'    INTO V_COUNT',
'    FROM work_flow_doc_control a',
'   WHERE wfdc_bu = :GLOBAL_BU ',
'     AND wfdc_select_flag = 1;',
'          ',
' HTP.P (V_FLAG || ''-'' || V_COUNT || ''-'' ||APEX_APPLICATION.G_X03||'' ''|| ''Row Selected'');          ',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>2109393847915385659
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7591354155552996676)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process For Document Approval'
,p_static_id=>'process-for-document-approval'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'v_doc_cnt    NUMBER(5);',
'BEGIN',
'--RAISE_APPLICATION_ERROR(-20999,:global_bu||''-''||:global_user||''-''||:wfdc_auth_type||:global_emp_id);',
'	SELECT COUNT(*)cnt INTO v_doc_cnt',
'	FROM WORK_FLOW_DOC_CONTROL',
'	WHERE WFDC_BU = :global_bu',
'	AND ((wfdc_auth_type = ''P'' AND wfdc_ctrl_person = func_find_position_id(:global_bu,:global_user)) OR ',
'			(wfdc_auth_type = ''E'' AND wfdc_ctrl_person =:global_emp_id))',
'	AND wfdc_select_flag = 1;',
'IF v_doc_cnt = 0 THEN',
'RAISE_APPLICATION_ERROR(-20999,''Select one document to process.'');',
'END IF;',
'END;',
'/* Formatted on 8/1/2022 4:02:56 PM (QP5 v5.163.1008.3004) */',
'DECLARE',
'   CURSOR c0',
'   IS',
'      SELECT *',
'        FROM work_flow_doc_control',
'       WHERE wfdc_bu = :GLOBAL_bu',
'         AND wfdc_select_flag = 1',
'         AND wfdc_status NOT IN (''C'', ''R'')',
'         AND wfdc_act <> ''W''',
'         AND ((wfdc_auth_type = ''P''',
'         AND wfdc_ctrl_person = func_find_position_id (:GLOBAL_bu, :GLOBAL_user)) OR (wfdc_auth_type = ''E''',
'         AND wfdc_ctrl_person = :global_emp_id));',
'',
'   CURSOR c1',
'   IS',
'      SELECT wfmc_doc_comp, wfmc_allow_dir_appr_fwd_flag',
'        FROM wfm_control',
'       WHERE wfmc_bu = :GLOBAL_BU;',
'',
'   CURSOR c2 (c_wfdc_type VARCHAR2,',
'      c_seq_no NUMBER)',
'   IS',
'      SELECT wfaa_status',
'        FROM work_flow_appr_actvt',
'       WHERE wfaa_bu = :GLOBAL_bu',
'         AND wfaa_wf_id = c_wfdc_type',
'         AND wfaa_seq_no = c_seq_no + 1;',
'',
'cursor c4 (C_WFDC_SEQ_NO    number,',
'c_wfdc_type varchar2,',
'c_wfdc_ctrl_person     varchar2)',
'is',
'SELECT distinct emp_name1, emp1,user_id1 ,user_unit1,appr_bu1 FROM (',
'SELECT emp emp1 ,emp_name emp_name1, user_id user_id1, appr_bu appr_bu1,  user_unit user_unit1  FROM (',
'SELECT emp_name, emp,func_find_user_id (:global_bu, emp) user_id,',
'                 :global_bu appr_bu,',
'                 func_find_user_plant(:GLOBAL_BU,FUNC_FIND_USER_ID(:GLOBAL_BU,emp)) user_unit FROM (SELECT LEVEL rw,ocln_bu,',
'                                   func_find_wf_emp_pos_id (ocln_bu,ocln_par_position_id)',
'                                   emp,',
'                                   func_find_employee_desc (ocln_bu,func_find_wf_emp_pos_id (ocln_bu,ocln_par_position_id),1) emp_name',
'                        FROM (SELECT *',
'                                     FROM org_chart_hd, org_chart_ln',
'                                   WHERE ochd_bu = ocln_bu',
'                                       AND ochd_chart_no = ocln_chart_no',
'                                       AND ochd_status = ''A''',
'                                       AND TRUNC (SYSDATE) BETWEEN ochd_eff_from AND ochd_eff_to',
'                                       AND ocln_bu = :global_bu)',
'                       WHERE ocln_par_position_id IS NOT NULL',
'                        START WITH ocln_position_id = func_find_position_id (:global_bu,:global_user) CONNECT BY NOCYCLE ocln_position_id = PRIOR ocln_par_position_id) a,',
'                        appl_users',
'           WHERE   appluser_bu = a.ocln_bu',
'                 AND appluser_emp_id = a.emp',
'                 AND appluser_status = ''A''',
'                 AND func_find_wf_basis (:global_bu,c_wfdc_type,(C_WFDC_SEQ_NO+1)) = ''O''',
'        GROUP BY emp_name, emp, func_find_user_id (:global_bu, emp)',
'        UNION ALL',
'        SELECT func_find_employee_desc (weh_appr_bu, weh_par_emp_id, ''1'') emp_name,',
'               weh_par_emp_id emp,',
'               weh_par_emp_id user_id,',
'               weh_appr_bu appr_bu,',
'               func_find_user_plant(:GLOBAL_BU,FUNC_FIND_USER_ID(:GLOBAL_BU,weh_par_emp_id)) user_unit',
'          FROM wf_emp_hierarchy',
'         WHERE     weh_bu = :global_bu',
'               AND weh_emp_id = :global_emp_id',
'               AND func_find_wf_basis (:global_bu,c_wfdc_type,(c_WFDC_SEQ_NO+1)) = ''E''',
'       union all',
'       SELECT func_find_employee_desc (WFDA_APPR_BU, WFDA_POSITION, 1) EMP_DESC,',
'       WFDA_POSITION,',
'       func_find_user_id (WFDA_APPR_BU, WFDA_POSITION) user1,',
'       wfda_appr_bu,',
'       wfda_plnt',
'  FROM WF_DIRECT_AUTHORIZATION',
' WHERE     WFDA_BU = :global_bu',
'       AND wfda_dflt_flag = ''Y''',
'       AND func_find_wf_basis (:GLOBAL_bu, c_wfdc_type,(c_WFDC_SEQ_NO+1)) = ''U'')       ',
' WHERE :P100_wfdc_act IN (''A'', ''F'')',
'UNION ALL',
'SELECT  emp_id,emp_name,  type1,appr_bu,func_find_user_plant(:GLOBAL_BU,FUNC_FIND_USER_ID(:GLOBAL_BU,emp_id)) user_unit',
'  FROM (SELECT DECODE (wfdcl_auth_type,''E'', func_find_employee_desc (:global_bu,',
'                                                wfdcl_ctrl_person,',
'                                                ''1''),',
'                  ''P'', func_find_employee_desc (:global_bu,',
'                          func_find_wf_emp_pos_id (:global_bu,',
'                                                   wfdcl_ctrl_person),',
'                          ''1''))',
'                  emp_name,',
'               DECODE (wfdcl_auth_type,',
'                  ''E'', wfdcl_ctrl_person,',
'                  ''P'', func_find_wf_emp_pos_id (:global_bu,',
'                                                wfdcl_ctrl_person))',
'                  emp_id,',
'               ROWNUM rno,',
'               DECODE (ROWNUM, 1, ''Creator'', ''Sender'') type1,',
'      appr_bu,wfdcl_plnt',
'          FROM (  SELECT wfdcl_ctrl_person,MIN (wfdcl_seqno) seq_no,wfdcl_auth_type,wfdcl_bu appr_bu,',
'               wfdcl_plnt wfdcl_plnt',
'                    FROM wf_doc_control_log',
'                   WHERE     wfdcl_bu = :global_bu',
'                         AND wfdcl_type = c_wfdc_type --AND wfdcl_wf_no = :P100_wfdc_wf_no',
'                AND wfdcl_ctrl_person <> c_wfdc_ctrl_person',
'                GROUP BY wfdcl_ctrl_person, wfdcl_auth_type,wfdcl_bu,wfdcl_plnt',
'                ORDER BY 2))',
' WHERE :P100_wfdc_act = ''R''',
' )',
' where emp1 = NVL(:P100_WFDC_NXT_FWD_PERS,:P100_WFDC_NXT_FWD_PERS_1);',
'',
'   cr1          c1%ROWTYPE;',
'   cr2          c2%ROWTYPE;',
'   v_seq_no     NUMBER;',
'',
'   v_fwd_flag   VARCHAR2 (1) := ''N'';',
'   v_rtn_flag   VARCHAR2 (1) := ''N'';',
'   v_can_flag   VARCHAR2 (1) := ''N'';',
'	v_wfdc_type  VARCHAR2(10);	',
'',
'',
'BEGIN',
'   FOR cr0 IN c0',
'   LOOP',
'	FOR cr4 IN c4(cr0.WFDC_SEQ_NO,cr0.wfdc_type,cr0.wfdc_ctrl_person)',
'   LOOP',
'	 /*Forward */',
'      IF :P100_wfdc_act = ''F'' then',
'      UPDATE work_flow_doc_control',
'         SET wfdc_nxt_fwd_person = NVL(:P100_WFDC_NXT_FWD_PERS,:P100_WFDC_NXT_FWD_PERS_1),         ',
'                      wfdc_nxt_fwd_entity = cr4.appr_bu1,',
'                      wfdc_nxt_fwd_plnt = cr4.user_unit1,',
'                      wfdc_message = :P100_WFDC_NXT_MESSAGE',
'       WHERE wfdc_bu = :global_bu AND wfdc_select_flag = 1 AND wfdc_act = ''F'';',
'      ELSIF :P100_wfdc_act =''R''THEN',
'',
'      /*Return */',
'      UPDATE work_flow_doc_control',
'         SET wfdc_nxt_fwd_person = NVL(:P100_WFDC_NXT_FWD_PERS,:P100_WFDC_NXT_FWD_PERS_1),',
'             wfdc_nxt_message = :P100_WFDC_NXT_MESSAGE',
'       WHERE wfdc_bu = :global_bu AND wfdc_select_flag = 1 AND wfdc_act = ''R'';',
'      END IF; ',
'	END LOOp c4;	',
'      IF cr0.wfdc_act = ''A''',
'      THEN',
'         v_seq_no :=',
'            CASE',
'               WHEN cr1.wfmc_doc_comp = ''S''',
'               THEN',
'                  func_find_wf_appr_seq_no (',
'                     cr0.wfdc_bu,',
'                     NVL (cr0.wfdc_src_plnt, cr0.wfdc_plnt),',
'                     cr0.wfdc_type,',
'                     cr0.wfdc_ctrl_person,',
'                     cr0.wfdc_nxt_status)',
'               WHEN cr1.wfmc_doc_comp = ''N''',
'               THEN',
'                  func_find_wf_appr_seq_no (',
'                     cr0.wfdc_bu,',
'                     NVL (cr0.wfdc_src_plnt, cr0.wfdc_plnt),',
'                     cr0.wfdc_type,',
'                     cr0.wfdc_ctrl_person,',
'                     NULL,',
'                     ''A'',',
'                     cr0.wfdc_value)',
'               ELSE',
'                  func_find_wf_appr_seq_no (',
'                     cr0.wfdc_bu,',
'                     NVL (cr0.wfdc_src_plnt, cr0.wfdc_plnt),',
'                     cr0.wfdc_type,',
'                     cr0.wfdc_ctrl_person)',
'            END;',
'',
'         OPEN c2 (v_wfdc_type,v_seq_no);',
'',
'         FETCH c2 INTO cr2;',
'',
'         CLOSE c2;',
'',
'         IF func_find_wf_appr_status (cr0.wfdc_bu, cr0.wfdc_type) <>',
'               cr2.wfaa_status',
'         THEN',
'            v_fwd_flag := ''Y'';',
'         END IF;',
'      ELSIF cr0.wfdc_act = ''F''',
'      THEN',
'         v_fwd_flag := ''Y'';',
'      ELSIF cr0.wfdc_act = ''R''',
'      THEN',
'         v_rtn_flag := ''Y'';',
'      ELSIF cr0.wfdc_act = ''C''',
'      THEN',
'         v_can_flag := ''Y'';',
'      END IF;',
'   ',
'',
'   IF v_fwd_flag = ''Y'' AND v_rtn_flag = ''Y''',
'   THEN',
'      Raise_Application_Error (',
'         -20999,',
'         ''APX'' || ''Forward & Return not possible same time.'');',
'   END IF;',
'',
'   IF v_fwd_flag = ''Y'' AND v_can_flag = ''Y''',
'   THEN',
'      Raise_Application_Error (',
'         -20999,',
'         ''APX'' || ''Forward & Cancel not possible same time.'');',
'   END IF;',
'',
'   IF v_rtn_flag = ''Y'' AND v_can_flag = ''Y''',
'   THEN',
'      Raise_Application_Error (',
'         -20999,',
'         ''APX'' || ''Return & Cancel not possible same time.'');',
'   END IF;',
'',
'',
'',
'   DECLARE',
'      CURSOR c1',
'      IS',
'         SELECT *',
'           FROM WORK_FLOW_DOC_CONTROL',
'          WHERE WFDC_BU = :GLOBAL_BU AND WFDC_SELECT_FLAG = 1',
'                AND ( (wfdc_auth_type = ''P''',
'                       AND wfdc_ctrl_person =',
'                              func_find_position_id (:GLOBAL_bu,',
'                                                     :GLOBAL_user))',
'                     OR (wfdc_auth_type = ''E''',
'                         AND wfdc_ctrl_person =',
'                                :global_emp_id))',
'                AND WFDC_STATUS NOT IN (''C'', ''R'')',
'                AND WFDC_ACT <> ''W'';',
'',
'      CURSOR c2 (',
'         c_type      VARCHAR2,',
'         c_seq_no    NUMBER)',
'      IS',
'         SELECT wfaa_status',
'           FROM work_flow_appr_actvt',
'          WHERE     wfaa_bu = :GLOBAL_bu',
'                AND wfaa_wf_id = c_type',
'                AND wfaa_seq_no = c_seq_no + 1;',
'',
'',
'',
'      CURSOR c3',
'      IS',
'         SELECT wfmc_doc_comp, wfmc_allow_dir_appr_fwd_flag',
'           FROM wfm_control',
'          WHERE wfmc_bu = :GLOBAL_bu;',
'',
'      CURSOR c4',
'      IS',
'         SELECT INITCAP (',
'                   func_find_wf_type_desc (wfdc_bu, wfdc_type, 1))',
'                   wfdc_type_desc',
'           FROM (  SELECT wfdc_bu, wfdc_type',
'                     FROM work_flow_doc_control',
'                    WHERE wfdc_bu = :GLOBAL_bu',
'                          AND ( (wfdc_auth_type = ''P''',
'                                 AND wfdc_ctrl_person =',
'                                        func_find_position_id (:GLOBAL_bu,',
'                                                               :GLOBAL_user))',
'                               OR (wfdc_auth_type = ''E''',
'                                   AND wfdc_ctrl_person =',
'                                          :global_emp_id))',
'                          AND wfdc_status NOT IN (''C'', ''R'')',
'                          AND wfdc_act <> ''W''',
'                 GROUP BY wfdc_bu, wfdc_type);',
'',
'',
'      cr1              c1%ROWTYPE;',
'      cr2              c2%ROWTYPE;',
'      cr3              c3%ROWTYPE;',
'',
'      v_cnt            NUMBER (10);',
'      e_cnt            NUMBER (10);',
'      v_res            VARCHAR2 (1) := ''N'';',
'      v_res3           VARCHAR2 (4000);',
'      var_err          VARCHAR2 (4000);',
'      v_result         VARCHAR2 (1) := ''N'';',
'      chk_alert        NUMBER;',
'      chk_alert1       NUMBER;',
'      var_res          VARCHAR2 (1);',
'      v_nxt_status     VARCHAR2 (5);',
'      v_seq_no         NUMBER;',
'      v_wf_control     VARCHAR2 (1);',
'      v_wf_status      VARCHAR2 (2);',
'      v_out            VARCHAR2 (1);',
'      var_msg          VARCHAR2 (4000);',
'      v_dir_apr_flag   VARCHAR2 (1);',
'      v_prod_date      DATE;',
'      var_act_cnt      NUMBER := 0;',
'      v_fwd_res        VARCHAR2 (4000) := ''N'';',
'      v_rtn_res        VARCHAR2 (4000) := ''N'';',
'      v_can_res        VARCHAR2 (4000) := ''N'';',
'      var_appr_msg     VARCHAR2 (4000);',
'      v_ce_rev_rqrd    crm_control.crmctrl_cost_est_rev_flag%TYPE;',
'      v_ce_cre_type    crm_control.crmctrl_ce_doc_cre_type%TYPE;',
'',
'      v_doc_status     VARCHAR2 (5);',
'   BEGIN',
'      FOR cr4 IN c4',
'      LOOP',
'         var_appr_msg := var_appr_msg || '' / '' || cr4.wfdc_type_desc;',
'      END LOOP;',
'',
'',
'      SELECT COUNT (*)',
'        INTO V_CNT',
'        FROM WORK_FLOW_DOC_CONTROL',
'       WHERE WFDC_BU = :GLOBAL_BU',
'         AND WFDC_SELECT_FLAG = 1',
'         AND WFDC_ACT NOT IN (''W'')',
'         AND ( (wfdc_auth_type = ''P''',
'                AND wfdc_ctrl_person =',
'                       func_find_position_id (:GLOBAL_bu, :GLOBAL_user))',
'              OR (wfdc_auth_type = ''E''',
'                  AND wfdc_ctrl_person =',
'                         :global_emp_id));',
'',
'     /* IF V_CNT = 0',
'      THEN',
'         Raise_Application_Error (-20999, ''APX'' || ''SELECT'', ''CONFIRM'');',
'      END IF;command by balamurali*/',
'',
'      FOR cr1 IN c1',
'      LOOP',
'         DBMS_APPLICATION_INFO.SET_ACTION (''proc_work_flow_dir_auth'');',
'',
'',
'',
'         OPEN c3;',
'',
'         FETCH c3 INTO cr3;',
'',
'         IF c3%NOTFOUND',
'         THEN',
'            v_wf_control := ''S'';',
'         ELSE',
'            v_wf_control := cr3.wfmc_doc_comp;',
'            v_dir_apr_flag := cr3.wfmc_allow_dir_appr_fwd_flag;',
'         END IF;',
'',
'         CLOSE c3;',
'',
'         IF v_wf_control = ''S''',
'         THEN',
'            proc_work_flow_dir_auth (:GLOBAL_bu,',
'                                     NVL (cr1.wfdc_src_plnt, cr1.wfdc_plnt),',
'                                     cr1.wfdc_type,',
'                                     cr1.wfdc_nxt_status,',
'                                     :GLOBAl_user,',
'                                     cr1.wfdc_value,',
'                                     var_res,',
'                                     p_disc_pct   => cr1.wfdc_disc_pct);',
'         ELSE',
'            proc_work_flow_dir_auth_nonseq (:GLOBAL_bu,',
'                                            NVL (cr1.wfdc_src_plnt, cr1.wfdc_plnt),',
'                                            cr1.wfdc_type,',
'                                            :GLOBAL_user,',
'                                            v_wf_status,',
'                                            v_out);',
'         END IF;',
'',
'',
'',
'         IF cr1.wfdc_act = ''A'' AND v_dir_apr_flag = ''Y''',
'         THEN',
'            v_seq_no :=',
'               CASE',
'                  WHEN v_wf_control = ''S''',
'                  THEN',
'                     func_find_wf_appr_seq_no (',
'                        :GLOBAL_bu,',
'                        NVL (cr1.wfdc_src_plnt, cr1.wfdc_plnt),',
'                        cr1.wfdc_type,',
'                        cr1.wfdc_ctrl_person,',
'                        cr1.wfdc_nxt_status)',
'                  WHEN v_wf_control = ''N''',
'                  THEN',
'                     func_find_wf_appr_seq_no (',
'                        :GLOBAL_bu,',
'                        NVL (cr1.wfdc_src_plnt, cr1.wfdc_plnt),',
'                        cr1.wfdc_type,',
'                        cr1.wfdc_ctrl_person,',
'                        NULL,',
'                        ''A'',',
'                        cr1.wfdc_value)',
'                  ELSE',
'                     func_find_wf_appr_seq_no (',
'                        :GLOBAL_bu,',
'                        NVL (cr1.wfdc_src_plnt, cr1.wfdc_plnt),',
'                        cr1.wfdc_type,',
'                        cr1.wfdc_ctrl_person)',
'               END;',
'',
'            OPEN c2 (cr1.wfdc_type, v_seq_no);',
'',
'            FETCH c2 INTO cr2;',
'',
'            CLOSE c2;',
'',
'            IF ( (cr0.wfdc_nxt_fwd_person IS NULL',
'                  OR cr0.wfdc_nxt_message IS NULL)',
'                AND (func_find_wf_appr_status (:GLOBAL_bu, cr1.wfdc_type) <>',
'                        cr2.wfaa_status))',
'            THEN',
'               Raise_Application_Error (',
'                  -20999,',
'                  ''APX'' || ''Forward details must be entered.'');',
'            END IF;',
'         END IF;',
'',
'         IF cr1.wfdc_act = ''A''',
'         THEN  ',
'            proc_doc_approve (cr1.wfdc_bu,',
'                              cr1.wfdc_plnt,',
'                              cr1.wfdc_type,',
'                              cr1.wfdc_wf_no,',
'                              v_wf_control,',
'                              :GLOBAL_user,',
'                              1,',
'                              var_msg,',
'                              var_err,',
'                              v_res);',
'',
'            ',
'            IF cr1.wfdc_type <> ''WF_PT''',
'            THEN',
'               IF var_msg IS NOT NULL',
'               THEN',
'					APEX_APPLICATION.g_print_success_message := var_msg;',
'                 --- Raise_Application_Error (-20999, ''APX'' || var_msg);',
'               END IF;',
'            END IF;',
'',
'            IF var_Err IS NOT NULL',
'            THEN',
'               Raise_Application_Error (-20999, ''APX'' || var_Err);',
'            END IF;',
'',
'            IF v_wf_control = ''S''',
'            THEN',
'               v_seq_no := cr1.wfdc_seq_no;',
'            ELSE',
'               v_seq_no :=',
'                  func_find_wf_appr_seq_no (:GLOBAL_bu,',
'                                             NVL (cr1.wfdc_src_plnt, cr1.wfdc_plnt),',
'                                             cr1.wfdc_type,',
'                                             cr1.wfdc_ctrl_person,',
'                                             NULL,',
'                                             ''A'',',
'                                             cr1.wfdc_value);',
'            END IF;',
'',
'                   proc_work_flow_auth (:GLOBAL_bu,',
'                                        cr1.wfdc_plnt, ',
'                                        cr1.wfdc_type,',
'                                        cr1.wfdc_ctrl_person,',
'                                        cr1.wfdc_value,',
'                                        v_seq_no,',
'                                        v_out,',
'                                        p_disc_pct   => cr1.wfdc_disc_pct);',
'',
'            IF v_out = ''E''',
'            THEN',
'               var_msg :=',
'                  ''Authorization limit exceeds. Do you wish to forward to Document ?'';',
'            ELSE',
'               var_msg := ''Do you wish to forward to Document(s) ?'';',
'            END IF;',
'',
'            BEGIN',
'               SELECT wfdc_status',
'                 INTO v_doc_status',
'                 FROM (SELECT wfdc_status',
'                         FROM work_flow_doc_control',
'                        WHERE wfdc_bu = :GLOBAL_bu',
'                          AND wfdc_wf_no = cr1.wfdc_wf_no',
'                       UNION ALL',
'                       SELECT wfdch_status',
'                         FROM work_flow_doc_control_hist',
'                        WHERE wfdch_bu = :GLOBAL_bu',
'                          AND wfdch_wf_no = cr1.wfdc_wf_no);',
'            END;',
'',
'            IF     cr1.wfdc_nxt_fwd_person IS NOT NULL',
'               AND cr1.wfdc_nxt_status IS NOT NULL',
'               AND cr1.wfdc_nxt_message IS NOT NULL',
'               AND v_res = ''N''',
'               AND v_doc_status <> ''A''',
'            THEN',
'               proc_wf_doc_forward (cr1.wfdc_bu,',
'                                    cr1.wfdc_plnt,',
'                                    cr1.wfdc_type,',
'                                    cr1.wfdc_doc_pfx,',
'                                    cr1.wfdc_doc_no,',
'                                    cr1.wfdc_wf_no,',
'                                    :GLOBAL_user,',
'                                    :global_emp_id,',
'                                    var_msg,',
'                                    v_fwd_res);',
'            END IF;',
'         ELSIF cr1.wfdc_act = ''F''',
'         THEN',
'            IF v_wf_control = ''S''',
'            THEN',
'               v_seq_no := cr1.wfdc_seq_no;',
'            ELSE',
'               v_seq_no :=',
'                  func_find_wf_appr_seq_no (:GLOBAL_bu,',
'                                            cr1.wfdc_plnt,',
'                                            cr1.wfdc_type,',
'                                            cr1.wfdc_ctrl_person,',
'                                            NULL,',
'                                            ''A'',',
'                                            cr1.wfdc_value);',
'            END IF;',
'',
'            proc_work_flow_auth (:GLOBAL_bu,',
'                                 cr1.wfdc_plnt,',
'                                 cr1.wfdc_type,',
'                                 cr1.wfdc_ctrl_person,',
'                                 cr1.wfdc_value,',
'                                 v_seq_no,',
'                                 v_out,',
'                                 p_disc_pct   => cr1.wfdc_disc_pct);',
'',
'            v_nxt_status := func_find_wf_appr_status (:GLOBAL_bu, cr1.wfdc_type);',
'',
'',
'            SELECT COUNT (*)',
'              INTO var_act_cnt',
'              FROM work_flow_appr_actvt',
'             WHERE wfaa_bu = :GLOBAL_bu AND wfaa_wf_id = cr1.wfdc_type;',
'',
'',
'',
'            OPEN c2 (cr1.wfdc_type, v_seq_no);',
'',
'            FETCH c2 INTO cr2;',
'',
'            CLOSE c2;',
'',
'            IF var_res = ''Y'' AND cr2.wfaa_status = v_nxt_status',
'            THEN',
'               proc_wf_doc_forward (cr1.wfdc_bu,',
'                                    cr1.wfdc_plnt,',
'                                    cr1.wfdc_type,',
'                                    cr1.wfdc_doc_pfx,',
'                                    cr1.wfdc_doc_no,',
'                                    cr1.wfdc_wf_no,',
'                                    :GLOBAL_user,',
'                                    :global_emp_id,',
'                                    var_msg,',
'                                    v_fwd_res);',
'            ELSE',
'',
'               proc_wf_doc_forward (cr1.wfdc_bu,',
'                                    cr1.wfdc_plnt,',
'                                    cr1.wfdc_type,',
'                                    cr1.wfdc_doc_pfx,',
'                                    cr1.wfdc_doc_no,',
'                                    cr1.wfdc_wf_no,',
'                                    :GLOBAL_user,',
'                                    :global_emp_id,',
'                                    var_msg,',
'                                    v_fwd_res);',
'            END IF;',
'         ELSIF cr1.wfdc_act = ''R''',
'         THEN',
'            IF cr1.wfdc_type NOT IN (''WF_SQTA'', ''WF_SQPD'')',
'            THEN',
'               proc_wf_doc_return (cr1.wfdc_bu,',
'                                   cr1.wfdc_plnt,',
'                                   cr1.wfdc_type,',
'                                   cr1.wfdc_doc_pfx,',
'                                   cr1.wfdc_doc_no,',
'                                   cr1.wfdc_wf_no,',
'                                   :GLOBAL_user,',
'                                   v_rtn_res);',
'            ELSE',
'               SELECT crmctrl_cost_est_rev_flag, crmctrl_ce_doc_cre_type',
'                 INTO v_ce_rev_rqrd, v_ce_cre_type',
'                 FROM crm_control',
'                WHERE crmctrl_bu = :GLOBAL_bu;',
'',
'               IF v_ce_rev_rqrd = ''Y'' AND v_ce_cre_type = ''T''',
'               THEN',
'                  DECLARE',
'                     --param_list   paramlist;',
'                  BEGIN',
'                      NULL;',
'                  END;',
'               ELSE',
'                  proc_wf_doc_return (cr1.wfdc_bu,',
'                                      cr1.wfdc_plnt,',
'                                      cr1.wfdc_type,',
'                                      cr1.wfdc_doc_pfx,',
'                                      cr1.wfdc_doc_no,',
'                                      cr1.wfdc_wf_no,',
'                                      :GLOBAL_user,',
'                                      v_rtn_res);',
'               END IF;',
'            END IF;',
'         ELSIF cr1.wfdc_act = ''C''',
'         THEN',
'            /* WorkFlow Document Cancellation Database procedure */',
'',
'            IF cr1.wfdc_type = ''WF_PCHD''',
'            THEN',
'               SELECT TRUNC (pt_date)',
'                 INTO v_prod_date',
'                 FROM prod_transfer',
'                WHERE pt_bu = cr0.wfdc_Src_bu',
'                  AND pt_plnt = cr0.wfdc_Src_plnt',
'                  AND pt_trans_no = cr1.wfdc_doc_no;',
'            END IF;',
'                ',
'                   ',
'                               proc_wf_doc_cancel (NVL (cr0.wfdc_src_bu,cr0.wfdc_bu),',
'                                                   :GLOBAL_bu,',
'                                                   NVL (cr0.wfdc_src_plnt,cr0.wfdc_plnt),',
'                                                   cr1.wfdc_doc_sfx,',
'                                                   cr1.wfdc_doc_pfx,',
'                                                   cr1.wfdc_doc_no,',
'                                                   v_prod_date,',
'                                                   cr1.wfdc_type,',
'                                                   cr1.wfdc_wf_no,',
'                                                   cr1.wfdc_spplr_id,',
'                                                   cr1.wfdc_cust_id,',
'                                                   cr1.wfdc_prod_id,',
'                                                   cr1.wfdc_prod_rev,',
'                                                   cr1.wfdc_jrnl_type,',
'                                                   cr1.wfdc_rnd_prj_id,',
'                                                   cr1.wfdc_prj_id,',
'                                                   cr1.wfdc_lvl1,',
'                                                   cr1.wfdc_lvl2,',
'                                                   cr1.wfdc_lvl3,',
'                                                   cr1.wfdc_lvl4,',
'                                                   cr1.wfdc_lvl_prj,',
'                                                   cr1.wfdc_accts,',
'                                                   cr1.wfdc_qc_ins_mode,',
'                                                   cr1.wfdc_qc_rev,',
'                                                   cr1.wfdc_coll_centr_id,',
'                                                   cr1.wfdc_inst_id,',
'                                                   cr1.wfdc_inst_ser_no,',
'                                                   NVL (cr1.wfdc_src_user, :GLOBAL_user),',
'                                                   1,',
'                                                   v_can_res,',
'                                                   v_res3,',
'                                                   var_msg,',
'                                                   var_err); ',
'         ',
'         APEX_APPLICATION.g_print_success_message := ''Document is Cancelled.'';  ',
'               ',
'',
'            IF var_err IS NOT NULL',
'            THEN',
'               Raise_Application_Error (-20999, ''APX'' || var_err);',
'            END IF;',
'         END IF;',
'',
'         IF v_res = ''N''',
'         THEN',
'            v_result := ''Y'';',
'         END IF;',
'',
'         UPDATE work_flow_doc_control',
'            SET wfdc_select_flag = 0,',
'                wfdc_act = ''W'',',
'                wfdc_mail_send_flag = ''N'',',
'                wfdc_nxt_status = NULL,',
'                wfdc_nxt_fwd_person = NULL,',
'                wfdc_nxt_message = NULL',
'          WHERE wfdc_bu = NVL (cr0.WFDC_SRC_BU, :GLOBAL_BU)',
'            AND wfdc_wf_no = cr1.WFDC_WF_NO;',
'',
'',
'         SELECT COUNT (*)',
'           INTO E_CNT',
'           FROM WORK_FLOW_EXP',
'          WHERE wfe_bu = :GLOBAL_bu',
'            AND wfe_type = cr1.wfdc_type',
'            AND wfe_wf_no = cr1.wfdc_wf_no;',
'      END LOOP;',
'',
'',
'      IF E_CNT > 0',
'      THEN',
'         Raise_Application_Error (-20999, ''APX'' || ''Refer Exceptions.'');',
'      END IF;',
'',
'      IF     v_result = ''Y''',
'         AND v_fwd_res = ''N''',
'         AND v_rtn_res = ''N''',
'         AND v_can_res = ''N''',
'      THEN',
'         APEX_APPLICATION.g_print_success_message :=',
'            ''<span style="color:white"> Document(s) Processed.</span>'';',
'      END IF;',
'',
'      IF v_fwd_res = ''Y''',
'      THEN',
'         APEX_APPLICATION.g_print_success_message :=',
'            ''<span style="color:white"> Document is Forwarded.</span>'';',
'      END IF;',
'',
'      IF v_rtn_res = ''Y''',
'      THEN',
'         APEX_APPLICATION.g_print_success_message := ''<span style="color:white"> Document is Returned.</span>'';',
'      END IF;',
'',
'/*       IF v_can_res = ''Y'' THEN ',
'       APEX_APPLICATION.g_print_success_message := ''<span style="color:white"> Document is Cancelled.</span>'';  ',
'     END IF;',
' */',
'      IF v_result = ''N''',
'      THEN',
'         APEX_APPLICATION.g_print_success_message :=',
'            ''<span style="color:white"> Document is Approved.</span>'';',
'      END IF;',
'',
'      proc_wf_send_mail (:GLOBAL_bu, :GLOBAL_user);',
'      COMMIT;',
'   END;',
'END LOOP;  ',
'   EXCEPTION WHEN OTHERS THEN',
'        proc_apex_err_msg_log(:GLOBAL_PAGE_ID,SQLERRM);  ',
'END;',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7591315794070996401)
,p_internal_uid=>2109392320009385648
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7591356083747996687)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process Validation'
,p_static_id=>'process-validation'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'  CURSOR C1',
'     IS',
'	  SELECT *',
'     FROM WORK_FLOW_DOC_CONTROL',
'   WHERE WFDC_BU = :global_bu',
'	and WFDC_SELECT_FLAG >0;',
'',
'	CR1 C1%ROWTYPE;',
'BEGIN',
'',
'   OPEN C1;',
'	FETCH C1 INTO CR1;',
'',
'	  IF C1%NOTFOUND THEN ',
'',
'	    raise_application_error(-20999,''Please Select Atleast one Document'');',
'     END IF;',
'',
'	CLOSE C1;',
'',
'',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7591350855480996667)
,p_internal_uid=>2109394248204385659
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7591356894011996699)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Select/unselect all'
,p_static_id=>'select-unselect-all'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   CURSOR c1',
'   IS',
'      SELECT *',
'        FROM work_flow_doc_control',
'       WHERE WFDC_BU = :global_bu',
'                 AND (wfdc_auth_type = ''P''',
'                      AND wfdc_ctrl_person =',
'                             func_find_position_id (:global_bu, :global_user)',
'                      OR wfdc_auth_type = ''E''',
'                         AND wfdc_ctrl_person =',
'                                :global_emp_id)',
'                 AND (wfdc_type, wfdc_status) NOT IN',
'                        (SELECT WFAA_WF_ID, WFAA_STATUS',
'                           FROM WORK_FLOW_APPR_ACTVT',
'                          WHERE WFAA_BU = :GLOBAL_BU',
'                                AND (WFAA_WF_ID, WFAA_SEQ_NO) IN',
'                                       (  SELECT WFAA_WF_ID,',
'                                                 MAX (WFAA_SEQ_NO) WFAA_SEQ_NO',
'                                            FROM WORK_FLOW_APPR_ACTVT',
'                                           WHERE WFAA_BU = :GLOBAL_BU',
'                                        GROUP BY WFAA_WF_ID))',
'                 AND wfdc_status NOT IN (''C'', ''R'', ''S'');',
'',
'BEGIN',
'',
'    FOR cr1 IN c1',
'       LOOP',
'      IF cr1.wfdc_select_flag = 0',
'      THEN',
'          ',
'         UPDATE work_flow_doc_control',
'            SET wfdc_select_flag = 1',
'          WHERE     wfdc_bu = :global_bu',
'                AND wfdc_select_flag = 0',
'                AND wfdc_wf_no = cr1.WFDC_WF_NO;',
' ',
'--end loop;',
'else',
' ',
'         UPDATE work_flow_doc_control',
'            SET wfdc_select_flag = 0,',
'                wfdc_nxt_status = NULL,',
'                wfdc_nxt_message = NULL,',
'                wfdc_nxt_fwd_person = NULL,',
'                wfdc_nxt_fwd_entity = NULL',
'          WHERE     wfdc_bu = :global_bu',
'                AND wfdc_select_flag = 1',
'                AND wfdc_wf_no = cr1.WFDC_WF_NO;',
'       ',
'      END IF;',
'   END LOOP;',
' ',
'COMMIT;',
'  ',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7591350486986996667)
,p_internal_uid=>2109395058468385671
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7591354927552996685)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SELECTALL'
,p_static_id=>'selectall'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'BEGIN',
'       UPDATE work_flow_doc_control',
'          SET wfdc_select_flag = 1',
'        WHERE wfdc_bu = :global_bu',
'         AND ((wfdc_auth_type = ''P'' AND wfdc_ctrl_person = func_find_position_id (:global_bu, :global_user)) OR ',
'			      wfdc_auth_type = ''E'' AND wfdc_ctrl_person = func_find_emp_id(:global_bu,:global_user))',
'         AND (wfdc_type, wfdc_status) NOT IN',
'                (SELECT WFAA_WF_ID, WFAA_STATUS',
'                   FROM WORK_FLOW_APPR_ACTVT',
'                  WHERE WFAA_BU = :GLOBAL_BU',
'                        AND (WFAA_WF_ID, WFAA_SEQ_NO) IN',
'                               (  SELECT WFAA_WF_ID,',
'                                         MAX (WFAA_SEQ_NO) WFAA_SEQ_NO',
'                                    FROM WORK_FLOW_APPR_ACTVT',
'                                   WHERE WFAA_BU = :GLOBAL_BU',
'                                GROUP BY WFAA_WF_ID))',
'         AND wfdc_status NOT IN (''C'', ''R'', ''S'');',
'',
' ',
'COMMIT;',
'      HTP.P(''success'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>2109393092009385657
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7591355279129996687)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'UNSELECTALL'
,p_static_id=>'unselectall'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--raise_application_error(-20999,''test'');',
'BEGIN',
'       UPDATE work_flow_doc_control',
'          SET wfdc_select_flag = 0',
'        WHERE wfdc_bu = :global_bu',
'         AND ((wfdc_auth_type = ''P'' AND wfdc_ctrl_person = func_find_position_id (:global_bu, :global_user)) OR ',
'			      wfdc_auth_type = ''E'' AND wfdc_ctrl_person = func_find_emp_id(:global_bu,:global_user))',
'         AND (wfdc_type, wfdc_status) NOT IN',
'                (SELECT WFAA_WF_ID, WFAA_STATUS',
'                   FROM WORK_FLOW_APPR_ACTVT',
'                  WHERE WFAA_BU = :GLOBAL_BU',
'                        AND (WFAA_WF_ID, WFAA_SEQ_NO) IN',
'                               (  SELECT WFAA_WF_ID,',
'                                         MAX (WFAA_SEQ_NO) WFAA_SEQ_NO',
'                                    FROM WORK_FLOW_APPR_ACTVT',
'                                   WHERE WFAA_BU = :GLOBAL_BU',
'                                GROUP BY WFAA_WF_ID))',
'         AND wfdc_status NOT IN (''C'', ''R'', ''S'');',
'',
' ',
'COMMIT;',
'      HTP.P(''success'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>2109393443586385659
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7591356506402996688)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Workflow'
,p_static_id=>'workflow'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--RAISE_APPLICATION_ERROR(-20999,:P100_WFDC_TYPE||''/''||:P100_WFDC_SEQ_NO);',
'DECLARE',
'   CURSOR c1',
'   IS',
'      SELECT *',
'        FROM work_flow_doc_control',
'       WHERE wfdc_bu = :global_bu AND wfdc_select_flag = 1',
'             AND (wfdc_auth_type = ''P''',
'                  AND wfdc_ctrl_person =',
'                         func_find_position_id (:global_bu, :global_user)',
'                  OR wfdc_auth_type = ''E''',
'                     AND wfdc_ctrl_person =',
'                            func_find_emp_id (:global_bu, :global_user)',
'                  OR func_find_position_check (:global_bu, :global_user)',
'                        IS NULL)',
'             AND wfdc_status NOT IN (''C'', ''R'')',
'             AND wfdc_act <> ''W'';',
'',
'   --AND wfdc_wf_no = :P100_WFDC_WF_NO;',
'',
'   CURSOR c2 (',
'      c_type      VARCHAR2,',
'      c_seq_no    NUMBER)',
'   IS',
'      SELECT wfaa_status',
'        FROM work_flow_appr_actvt',
'       WHERE     wfaa_bu = :global_bu',
'             AND wfaa_wf_id = c_type',
'             AND wfaa_seq_no = c_seq_no + 1;',
'',
'   CURSOR c3',
'   IS',
'      SELECT wfmc_doc_comp, wfmc_allow_dir_appr_fwd_flag',
'        FROM wfm_control',
'       WHERE wfmc_bu = :global_bu;',
'',
'cursor c4 (C_WFDC_SEQ_NO    number,',
'c_wfdc_type varchar2,',
'c_wfdc_ctrl_person     varchar2)',
'is',
'SELECT distinct emp_name1, emp1,user_id1 ,user_unit1,appr_bu1 FROM (',
'SELECT emp emp1 ,emp_name emp_name1, user_id user_id1, appr_bu appr_bu1,  user_unit user_unit1  FROM (',
'SELECT emp_name, emp,func_find_user_id (:global_bu, emp) user_id,',
'                 :global_bu appr_bu,',
'                 func_find_user_plant(:GLOBAL_BU,FUNC_FIND_USER_ID(:GLOBAL_BU,emp)) user_unit FROM (SELECT LEVEL rw,ocln_bu,',
'                                   func_find_wf_emp_pos_id (ocln_bu,ocln_par_position_id)',
'                                   emp,',
'                                   func_find_employee_desc (ocln_bu,func_find_wf_emp_pos_id (ocln_bu,ocln_par_position_id),1) emp_name',
'                        FROM (SELECT *',
'                                     FROM org_chart_hd, org_chart_ln',
'                                   WHERE ochd_bu = ocln_bu',
'                                       AND ochd_chart_no = ocln_chart_no',
'                                       AND ochd_status = ''A''',
'                                       AND TRUNC (SYSDATE) BETWEEN ochd_eff_from AND ochd_eff_to',
'                                       AND ocln_bu = :global_bu)',
'                       WHERE ocln_par_position_id IS NOT NULL',
'                        START WITH ocln_position_id = func_find_position_id (:global_bu,:global_user) CONNECT BY NOCYCLE ocln_position_id = PRIOR ocln_par_position_id) a,',
'                        appl_users',
'           WHERE   appluser_bu = a.ocln_bu',
'                 AND appluser_emp_id = a.emp',
'                 AND appluser_status = ''A''',
'                 AND func_find_wf_basis (:global_bu,c_wfdc_type,(C_WFDC_SEQ_NO+1)) = ''O''',
'        GROUP BY emp_name, emp, func_find_user_id (:global_bu, emp)',
'        UNION ALL',
'        SELECT func_find_employee_desc (weh_appr_bu, weh_par_emp_id, ''1'') emp_name,',
'               weh_par_emp_id emp,',
'               weh_par_emp_id user_id,',
'               weh_appr_bu appr_bu,',
'               func_find_user_plant(:GLOBAL_BU,FUNC_FIND_USER_ID(:GLOBAL_BU,weh_par_emp_id)) user_unit',
'          FROM wf_emp_hierarchy',
'         WHERE     weh_bu = :global_bu',
'               AND weh_emp_id = func_find_emp_id (:global_bu, :global_user)',
'               AND func_find_wf_basis (:global_bu,c_wfdc_type,(c_WFDC_SEQ_NO+1)) = ''E''',
'       union all',
'       SELECT func_find_employee_desc (WFDA_APPR_BU, WFDA_POSITION, 1) EMP_DESC,',
'       WFDA_POSITION,',
'       func_find_user_id (WFDA_APPR_BU, WFDA_POSITION) user1,',
'       wfda_appr_bu,',
'       wfda_plnt',
'  FROM WF_DIRECT_AUTHORIZATION',
' WHERE     WFDA_BU = :global_bu',
'       AND wfda_dflt_flag = ''Y''',
'       AND func_find_wf_basis (:GLOBAL_bu, c_wfdc_type,(c_WFDC_SEQ_NO+1)) = ''U'')       ',
' WHERE :P100_wfdc_act IN (''A'', ''F'')',
'UNION ALL',
'SELECT  emp_id,emp_name,  type1,appr_bu,func_find_user_plant(:GLOBAL_BU,FUNC_FIND_USER_ID(:GLOBAL_BU,emp_id)) user_unit',
'  FROM (SELECT DECODE (wfdcl_auth_type,''E'', func_find_employee_desc (:global_bu,',
'                                                wfdcl_ctrl_person,',
'                                                ''1''),',
'                  ''P'', func_find_employee_desc (:global_bu,',
'                          func_find_wf_emp_pos_id (:global_bu,',
'                                                   wfdcl_ctrl_person),',
'                          ''1''))',
'                  emp_name,',
'               DECODE (wfdcl_auth_type,',
'                  ''E'', wfdcl_ctrl_person,',
'                  ''P'', func_find_wf_emp_pos_id (:global_bu,',
'                                                wfdcl_ctrl_person))',
'                  emp_id,',
'               ROWNUM rno,',
'               DECODE (ROWNUM, 1, ''Creator'', ''Sender'') type1,',
'      appr_bu,wfdcl_plnt',
'          FROM (  SELECT wfdcl_ctrl_person,MIN (wfdcl_seqno) seq_no,wfdcl_auth_type,wfdcl_bu appr_bu,',
'               wfdcl_plnt wfdcl_plnt',
'                    FROM wf_doc_control_log',
'                   WHERE     wfdcl_bu = :global_bu',
'                         AND wfdcl_type = c_wfdc_type --AND wfdcl_wf_no = :P100_wfdc_wf_no',
'                AND wfdcl_ctrl_person <> c_wfdc_ctrl_person',
'                GROUP BY wfdcl_ctrl_person, wfdcl_auth_type,wfdcl_bu,wfdcl_plnt',
'                ORDER BY 2))',
' WHERE :P100_wfdc_act = ''R''',
' )',
' where emp1 = :P100_WFDC_NXT_FWD_PERS;',
'   --cr1              c1%ROWTYPE;',
'   cr2              c2%ROWTYPE;',
'   cr3              c3%ROWTYPE;',
'   -- cr4              c4%ROWTYPE;',
'',
'   v_cnt            NUMBER (10);',
'   e_cnt            NUMBER (10);',
'   v_res            VARCHAR2 (1) := ''N'';',
'   v_res3           VARCHAR2 (4000);',
'   var_err          VARCHAR2 (4000);',
'   v_result         VARCHAR2 (1) := ''N'';',
'   chk_alert        NUMBER;',
'   chk_alert1       NUMBER;',
'   var_res          VARCHAR2 (1);',
'   v_nxt_status     VARCHAR2 (5);',
'   v_seq_no         NUMBER;',
'   v_wf_control     VARCHAR2 (1);',
'   v_wf_status      VARCHAR2 (2);',
'   v_out            VARCHAR2 (1);',
'   var_msg          VARCHAR2 (4000);',
'   v_dir_apr_flag   VARCHAR2 (1);',
'   v_prod_date      DATE;',
'   var_act_cnt      NUMBER := 0;',
'   v_err            VARCHAR2 (4000);',
'  v_doc_status	VARCHAR2(5);',
'BEGIN',
'   --RAISE_APPLICATION_ERROR(-20999,''TEST1''||''person''||:P100_FWD_PERSON||''msg''||:wfdc_nxt_message);',
'   SELECT COUNT (*)',
'     INTO v_cnt',
'     FROM work_flow_doc_control',
'    WHERE     WFDC_BU = :GLOBAL_BU',
'          AND WFDC_SELECT_FLAG = 1',
'          AND WFDC_ACT NOT IN (''W'')',
'          AND (wfdc_auth_type = ''P''',
'               AND wfdc_ctrl_person =',
'                      func_find_position_id (:GLOBAL_bu, :GLOBAL_user)',
'               OR wfdc_auth_type = ''E''',
'                  AND wfdc_ctrl_person =',
'                         func_find_emp_id (:GLOBAL_bu, :GLOBAL_user)',
'               OR FUNC_FIND_POSITION_CHECK (:GLOBAL_BU, :GLOBAL_USER) IS NULL);',
'',
'   IF V_CNT = 0',
'   THEN',
'      v_err := ''Please choose a action to perform'';',
'   -- goto msg;',
'   END IF;',
'',
'   FOR cr1 IN c1',
'   LOOP',
'  -- RAISE_APPLICATION_ERROR(-20999,cr1.WFDC_SEQ_NO||''/''||cr1.wfdc_type||''/''||cr1.wfdc_ctrl_person);',
'   FOR cr4 IN c4(cr1.WFDC_SEQ_NO,cr1.wfdc_type,cr1.wfdc_ctrl_person)',
'   LOOP',
'      /*Forward */',
'      IF :P100_wfdc_act = ''F'' then',
'      UPDATE work_flow_doc_control',
'         SET wfdc_nxt_fwd_person = :P100_WFDC_NXT_FWD_PERS,         ',
'                      wfdc_nxt_fwd_entity = cr4.appr_bu1,',
'                      wfdc_nxt_fwd_plnt = cr4.user_unit1,',
'                      wfdc_message = :P100_WFDC_NXT_MESSAGE',
'       WHERE wfdc_bu = :global_bu AND wfdc_select_flag = 1 AND wfdc_act = ''F'';',
'End if;',
'',
'      /*Return */',
'      UPDATE work_flow_doc_control',
'         SET wfdc_nxt_fwd_person = :P100_WFDC_NXT_FWD_PERS,',
'             wfdc_nxt_message = :P100_WFDC_NXT_MESSAGE',
'       WHERE wfdc_bu = :global_bu AND wfdc_select_flag = 1 AND wfdc_act = ''R'';',
'',
'      --RAISE_APPLICATION_ERROR(-20999,''''||''person''||:P100_WFDC_NXT_FWD_PERS);',
'      DBMS_APPLICATION_INFO.set_action (''proc_work_flow_dir_auth'');',
'End loop;',
'      OPEN c3;',
'',
'      FETCH c3 INTO cr3;',
'',
'      IF c3%NOTFOUND',
'      THEN',
'         v_wf_control := ''S'';',
'      ELSE',
'         --  raise_application_error(-20999,cr1.wfdc_value||''/''||cr1.wfdc_type||''/''||cr1.wfdc_ctrl_person||''/''||cr3.wfmc_doc_comp||''/''||cr3.wfmc_allow_dir_appr_fwd_flag);',
'         v_wf_control := cr3.wfmc_doc_comp;',
'         v_dir_apr_flag := cr3.wfmc_allow_dir_appr_fwd_flag;',
'      END IF;',
'',
'      CLOSE c3;',
'',
'      IF v_wf_control = ''S''',
'      THEN',
'         proc_work_flow_dir_auth (:global_bu,',
'                                   NVL(cr1.wfdc_src_plnt,cr1.wfdc_plnt),',
'                                  cr1.wfdc_type,',
'                                  cr1.wfdc_nxt_status,',
'                                  :global_user,',
'                                  cr1.wfdc_value,',
'                                  var_res);',
'      ELSE',
'         proc_work_flow_dir_auth_nonseq (:global_bu,',
'                                         NVL(cr1.wfdc_src_plnt,cr1.wfdc_plnt),',
'                                         cr1.wfdc_type,',
'                                         :global_user,',
'                                         v_wf_status,',
'                                         v_out);',
'      END IF;',
'',
'     -- raise_application_error(-20999,''A''||''/''||cr1.wfdc_act ||''/''||v_dir_apr_flag||''/''||cr1.wfdc_value||''/''||cr1.wfdc_type||''/''||cr1.wfdc_ctrl_person||''/''||cr1.wfdc_plnt||''/''||v_wf_control);',
'      IF cr1.wfdc_act = ''A'' AND v_dir_apr_flag = ''Y''',
'      THEN',
'         v_seq_no :=',
'            CASE',
'               WHEN v_wf_control = ''S''',
'               THEN',
'                  func_find_wf_appr_seq_no (:global_bu,',
'                                         NVL(cr1.wfdc_src_plnt,cr1.wfdc_plnt),',
'                                            cr1.wfdc_type,',
'                                            cr1.wfdc_ctrl_person)',
'               WHEN v_wf_control = ''N''',
'               THEN',
'                  func_find_wf_appr_seq_no (:global_bu,',
'                                         NVL(cr1.wfdc_src_plnt,cr1.wfdc_plnt),',
'                                            cr1.wfdc_type,',
'                                            cr1.wfdc_ctrl_person,',
'                                            NULL,',
'                                            ''A'',',
'                                            cr1.wfdc_value)',
'               ELSE',
'                  func_find_wf_appr_seq_no (:global_bu,',
'                                         NVL(cr1.wfdc_src_plnt,cr1.wfdc_plnt),',
'                                            cr1.wfdc_type,',
'                                            cr1.wfdc_ctrl_person)',
'            END;',
'',
'         OPEN c2 (cr1.wfdc_type, v_seq_no);',
'',
'         FETCH c2 INTO cr2;',
'',
'         CLOSE c2;',
'',
'         IF ( (:wfdc_nxt_fwd_pers IS NULL OR :wfdc_nxt_message IS NULL)',
'             AND (func_find_wf_appr_status (:global_bu, cr1.wfdc_type) <>',
'                     cr2.wfaa_status))',
'         THEN',
'            v_err := ''Forward details must be entered.'';',
'         -- GOTO msg;',
'         END IF;',
'      END IF;',
'      --raise_application_error(-20999,cr1.wfdc_bu||''/''||cr1.wfdc_act||''/''||cr1.wfdc_type||''/''||cr1.wfdc_wf_no||''/''||v_wf_control||''/''||:global_user);',
'',
'      IF cr1.wfdc_act = ''A''',
'      THEN',
'         proc_doc_approve (cr1.wfdc_bu,',
'                           cr1.wfdc_plnt,',
'                           cr1.wfdc_type,',
'                           cr1.wfdc_wf_no,',
'                           v_wf_control,',
'                           :global_user,',
'                           ''1'',',
'                           var_msg,',
'                           var_err,',
'                           v_res);',
'--raise_application_error(-20999,cr1.wfdc_bu||''/''||cr1.wfdc_act||''/''||cr1.wfdc_type||''/''||cr1.wfdc_wf_no||''/''||v_wf_control||''/''||:global_user);',
'         --apex_application.g_print_success_message := ''<span style="color:white"> '' || cr1.wfdc_wf_no || '' </span>'';',
'',
'         IF var_msg IS NOT NULL',
'          THEN',
'             v_err := var_msg;',
'            -- GOTO msg1;',
'          END IF;',
'',
'          IF var_err IS NOT NULL',
'          THEN',
'             v_err := var_err;                                       --var_msg;',
'            -- GOTO msg;',
'          END IF;',
'',
'         IF v_wf_control = ''S''',
'         THEN',
'            v_seq_no := cr1.wfdc_seq_no;',
'         ELSE',
'            v_seq_no :=',
'               func_find_wf_appr_seq_no (:global_bu,',
'                                         NVL(cr1.wfdc_src_plnt,cr1.wfdc_plnt),',
'                                         cr1.wfdc_type,',
'                                         cr1.wfdc_ctrl_person,',
'                                         NULL,',
'                                         ''A'',',
'                                         cr1.wfdc_value);',
'         END IF;',
'',
'         proc_work_flow_auth (:global_bu,',
'                              cr1.wfdc_plnt,',
'                              cr1.wfdc_type,',
'                              cr1.wfdc_ctrl_person,',
'                              cr1.wfdc_value,',
'                              v_seq_no,',
'                              v_out);',
'',
'         IF v_out = ''E''',
'         THEN',
'            var_msg :=',
'               ''Authorization limit exceeds. Do you wish to forward to Document ?'';',
'         ELSE',
'            var_msg := ''Do you wish to forward to Document ?'';',
'         END IF;',
'			 BEGIN',
'					 	 SELECT wfdc_status',
'					 	   INTO v_doc_status',
'					 	   FROM (',
'					 	 SELECT wfdc_status',
'					 	   FROM work_flow_doc_control',
'					 	  WHERE wfdc_bu = :GLOBAL_bu',
'					 	    AND wfdc_wf_no = cr1.wfdc_wf_no',
'					 	 UNION ALL',
'					 	 SELECT wfdch_status',
'					 	   FROM work_flow_doc_control_hist',
'					 	  WHERE wfdch_bu = :GLOBAL_bu',
'					 	    AND wfdch_wf_no = cr1.wfdc_wf_no);',
'					 END;',
'         --raise_application_error(-20999,cr1.wfdc_act||''/''||cr1.wfdc_nxt_fwd_person||''/''||cr1.wfdc_nxt_status||''/''||cr1.wfdc_nxt_message);',
'       --  raise_application_error(-20999,cr1.wfdc_bu||''/''||cr1.wfdc_plnt||''/''||cr1.wfdc_type||''/''||cr1.wfdc_wf_no||''/''||v_wf_control||''/''||:global_user);',
'         IF     cr1.wfdc_nxt_fwd_person IS NOT NULL',
'            AND cr1.wfdc_nxt_status IS NOT NULL',
'            AND cr1.wfdc_nxt_message IS NOT NULL',
'            AND v_res = ''N'' AND v_doc_status <> ''A''',
'         THEN',
'            -- PROC_DOC_FWD(cr1.WFDC_TYPE,cr1.WFDC_PLNT,cr1.WFDC_DOC_PFX,cr1.WFDC_DOC_NO,cr1.WFDC_WF_NO,v_res);',
'            proc_wf_doc_forward (cr1.wfdc_bu,',
'                                 cr1.wfdc_plnt,',
'                                 cr1.wfdc_type,',
'                                 cr1.wfdc_doc_pfx,',
'                                 cr1.wfdc_doc_no,',
'                                 cr1.wfdc_wf_no,',
'                                 :global_user,',
'                                 var_msg,',
'                                 v_res);',
'         --   raise_application_error(-20999,''test''||cr1.wfdc_bu||''/''||cr1.wfdc_plnt||''/''||cr1.wfdc_type||''/''||cr1.wfdc_wf_no||''/''||v_wf_control||''/''||:global_user);',
'         END IF;',
'      ELSIF cr1.wfdc_act = ''F''',
'      THEN',
'       /*  APEX_APPLICATION.g_print_success_message :=              ''<span style="color:white"> * ''            || ''Document Processed.''            || '' </span>'';*/',
'',
'         --raise_application_error(-20999,''BINGO_2:''||:global_bu||''/''||cr1.wfdc_plnt||''/''||cr1.wfdc_type||''/''||cr1.wfdc_doc_pfx||''/''||cr1.wfdc_doc_no||''/''||cr1.wfdc_wf_no||''/''||v_wf_control||''/''||:global_user);',
'         IF v_wf_control = ''S''',
'         THEN',
'            v_seq_no := cr1.wfdc_seq_no;',
'         ELSE',
'            v_seq_no :=',
'               func_find_wf_appr_seq_no (:global_bu,',
'                                         cr1.wfdc_plnt,',
'                                         cr1.wfdc_type,',
'                                         cr1.wfdc_ctrl_person,',
'                                         NULL,',
'                                         ''A'',',
'                                         cr1.wfdc_value);',
'         END IF;',
'',
'         proc_work_flow_auth (:global_bu,',
'                              cr1.wfdc_plnt,',
'                              cr1.wfdc_type,',
'                              cr1.wfdc_ctrl_person,',
'                              cr1.wfdc_value,',
'                              v_seq_no,',
'                              v_out);',
'',
'         v_nxt_status := func_find_wf_appr_status (cr1.wfdc_bu, cr1.wfdc_type);',
'',
'        /* v_seq_no :=',
'            func_find_wf_appr_seq_no (cr1.wfdc_bu,',
'                                      cr1.wfdc_plnt,',
'                                      cr1.wfdc_type,',
'                                      cr1.wfdc_ctrl_person);*/',
'',
'         SELECT COUNT (*)',
'           INTO var_act_cnt',
'           FROM work_flow_appr_actvt',
'          WHERE wfaa_bu = :global_bu AND wfaa_wf_id = cr1.wfdc_type;',
'/*',
'         IF var_act_cnt > 1 AND v_out <> ''E''',
'         THEN',
'            OPEN c2 (cr1.wfdc_type, v_seq_no);',
'',
'            FETCH c2 INTO cr2;',
'',
'            IF c2%FOUND',
'            THEN',
'               IF cr2.wfaa_status = cr1.wfdc_nxt_status',
'               THEN',
'                  v_err := ''Process the document and proceed.'';',
'               -- GOTO msg;',
'               END IF;',
'            END IF;',
'',
'            CLOSE c2;',
'         END IF;*/',
'',
'         OPEN c2 (cr1.wfdc_type, v_seq_no);',
'',
'         FETCH c2 INTO cr2;',
'',
'         CLOSE c2;',
'',
'',
'',
'         IF var_res = ''Y'' AND cr2.wfaa_status = v_nxt_status',
'         THEN',
'          --  raise_application_error(-20999,''BINGO_1:''||:global_bu||''/''||cr1.wfdc_plnt||''/''||cr1.wfdc_type||''/''||cr1.wfdc_doc_pfx||''/''||cr1.wfdc_doc_no||''/''||cr1.wfdc_wf_no||''/''||v_wf_control||''/''||:global_user);',
'            --   PROC_DOC_FWD(cr1.WFDC_TYPE,cr1.WFDC_PLNT,cr1.WFDC_DOC_PFX,cr1.WFDC_DOC_NO,cr1.WFDC_WF_NO,v_res);',
'            proc_wf_doc_forward (cr1.wfdc_bu,',
'                                 cr1.wfdc_plnt,',
'                                 cr1.wfdc_type,',
'                                 cr1.wfdc_doc_pfx,',
'                                 cr1.wfdc_doc_no,',
'                                 cr1.wfdc_wf_no,',
'                                 :global_user,',
'                                 var_msg,',
'                                 v_res);',
'         --  raise_application_error (-20999,''HRM12'' || cr1.wfdc_type || cr1.wfdc_wf_no||var_msg);',
'',
'',
'										',
'         ELSE',
'         --   raise_application_error(-20999,''BINGO_3''||cr1.wfdc_bu||''/''||cr1.wfdc_plnt||''/''||cr1.wfdc_type||''/''||cr1.wfdc_wf_no||''/''||cr1.wfdc_doc_pfx||''/''||cr1.wfdc_doc_no);',
'            --   PROC_DOC_FWD(cr1.WFDC_TYPE,cr1.WFDC_PLNT,cr1.WFDC_DOC_PFX,cr1.WFDC_DOC_NO,cr1.WFDC_WF_NO,v_res);',
'            proc_wf_doc_forward (cr1.wfdc_bu,',
'                                 cr1.wfdc_plnt,',
'                                 cr1.wfdc_type,',
'                                 cr1.wfdc_doc_pfx,',
'                                 cr1.wfdc_doc_no,',
'                                 cr1.wfdc_wf_no,',
'                                 :global_user,',
'                                 var_msg,',
'                                 v_res);',
'                               --  commit;',
'',
'             	 ',
'										',
'										                     ',
'   --- raise_application_error (-20999,''HRM'' || cr1.wfdc_type || cr1.wfdc_wf_no||var_msg||v_res);',
'',
'         END IF;',
'      ELSIF cr1.wfdc_act = ''R''',
'      THEN',
'         --PROC_DOC_RTN(cr1.WFDC_TYPE,cr1.WFDC_PLNT,cr1.WFDC_DOC_PFX,cr1.WFDC_DOC_NO,cr1.WFDC_WF_NO,v_res);',
'         proc_wf_doc_return (cr1.wfdc_bu,',
'                             cr1.wfdc_plnt,',
'                             cr1.wfdc_type,',
'                             cr1.wfdc_doc_pfx,',
'                             cr1.wfdc_doc_no,',
'                             cr1.wfdc_wf_no,',
'                             :global_user,',
'                             v_res);',
'      ELSIF cr1.wfdc_act = ''C''',
'      THEN',
'         /* WorkFlow Document Cancellation Database procedure */',
'',
'         IF cr1.wfdc_type = ''WF_PCHD''',
'         THEN',
'            SELECT TRUNC (pt_date)',
'              INTO v_prod_date',
'              FROM prod_transfer',
'             WHERE     pt_bu = cr1.wfdc_bu',
'                   AND pt_plnt = cr1.wfdc_plnt',
'                   AND pt_trans_no = cr1.wfdc_doc_no;',
'         END IF;',
'         proc_wf_doc_cancel (cr1.wfdc_bu,',
'                             :global_bu,',
'                             cr1.wfdc_plnt,',
'                             cr1.wfdc_doc_sfx,',
'                             cr1.wfdc_doc_pfx,',
'                             cr1.wfdc_doc_no,',
'                             v_prod_date,',
'                             cr1.wfdc_type,',
'                             cr1.wfdc_wf_no,',
'                             cr1.wfdc_spplr_id,',
'                             cr1.wfdc_cust_id,',
'                             cr1.wfdc_prod_id,',
'                             cr1.wfdc_prod_rev,',
'                             cr1.wfdc_jrnl_type,',
'                             cr1.wfdc_rnd_prj_id,',
'                             cr1.wfdc_prj_id,',
'                             cr1.wfdc_lvl1,',
'                             cr1.wfdc_lvl2,',
'                             cr1.wfdc_lvl3,',
'                             cr1.wfdc_lvl4,',
'                             cr1.wfdc_lvl_prj,',
'                             cr1.wfdc_accts,',
'                             cr1.wfdc_qc_ins_mode,',
'                             cr1.wfdc_qc_rev,',
'                             NULL,',
'                             NULL,',
'                             NULL,',
'                             :global_user,',
'                             ''1'',',
'                             v_res,',
'                             v_res3,',
'                             var_msg,',
'                             var_err);',
'       IF var_msg IS NOT NULL',
'       THEN',
'            v_err:=var_msg;',
'        -- GOTO msg1;',
'       END IF;',
'',
'       IF var_err IS NOT NULL',
'       THEN',
'          v_err := var_err;',
'         -- GOTO msg;',
'       END IF;',
'      END IF;',
'',
'      IF v_res = ''N''',
'      THEN',
'         v_result := ''Y'';',
'      END IF;',
'',
'      UPDATE work_flow_doc_control',
'         SET wfdc_select_flag = 0,',
'             wfdc_act = ''W'',',
'             wfdc_nxt_status = NULL,',
'             wfdc_nxt_fwd_person = NULL,',
'             wfdc_nxt_message = NULL',
'       WHERE wfdc_bu = :global_bu AND wfdc_wf_no = cr1.wfdc_wf_no;',
'',
'      SELECT COUNT (*)',
'        INTO e_cnt',
'        FROM work_flow_exp',
'       WHERE     wfe_bu = :global_bu',
'             AND wfe_type = cr1.wfdc_type',
'             AND wfe_wf_no = cr1.wfdc_wf_no;',
'   END LOOP c1;',
'',
'   IF e_cnt > 0',
'   THEN',
'      v_err := ''Refer Exceptions'';',
'   --GOTO msg;',
'   END IF;',
'',
'   IF v_result = ''N''',
'   THEN',
'      v_err := ''Document Processed'';  ',
'      GOTO msg1;',
'   END IF;',
'   <<msg1>>',
'   --  raise_application_error (-20999, v_err);',
'   :P100_MSG :=  v_err;',
'   ',
'EXCEPTION',
'   WHEN OTHERS',
'   THEN',
'      /*IF v_err IS NOT NULL',
'      THEN',
'      null;',
'         ',
'      ELSE*/',
'       ',
'             raise_application_error ((SQLCODE),',
'             func_find_err_msg (:global_bu,ABS (SQLCODE),SUBSTR (REPLACE (SQLERRM, '' '', ''''), 11, 3),1,:GLOBAL_USER));',
'      --END IF;',
'      COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_process_success_message=>'&P100_MSG.'
,p_internal_uid=>2109394670859385660
);
wwv_flow_imp.component_end;
end;
/
