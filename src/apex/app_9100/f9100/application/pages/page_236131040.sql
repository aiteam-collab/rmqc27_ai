prompt --application/pages/page_236131040
begin
--   Manifest
--     PAGE: 236131040
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
 p_id=>236131040
,p_name=>'Doc. Administrator'
,p_alias=>'DOC-ADMINISTRATOR'
,p_step_title=>'Doc. Administrator'
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
,p_javascript_file_urls=>'#WORKSPACE_FILES#interactive_grid.js'
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
'/*',
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
'    background-color: #e6e6fa94;',
'}',
'',
'#P335_WF_SRCH',
'	{',
'	  width:40px;',
'	  transition: 0.5s;',
'	  border-radius:50px;',
'	  text-indent: 2rem;',
'	  font-size: 1.1rem;',
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
'*/',
'',
'/*#Clear{',
'   background-image: url(#APP_FILES#clearclear-removebg-preview.png);',
'   background-position: 0px 3px;',
'   background-repeat: no-repeat;',
'   background-color: rgba(0, 0, 0, 0.15);',
'   background-size: 25px;',
'   width: 25px;',
'   height: 25px;',
'   padding-bottom: 9px;',
'}*/',
'',
'#Clear1{',
'   background-image: url(#APP_FILES#clearclear-removebg-preview.png);',
'   background-position: 0px 3px;',
'   background-repeat: no-repeat;',
'   background-color: #ffffff;',
'   background-size: 25px;',
'   width: 25px;',
'   height: 23px;',
'   top: -3px;',
'}',
'',
'',
'.a-IRR-table {',
'      border-collapse: collapse;',
'      table-layout: auto;',
'      border-spacing: 0;',
'      white-space: nowrap;',
'      word-wrap: break-word;',
'}',
'',
' .t-fht-thead {',
'    overflow: auto !important;',
' }',
'',
'',
' .ui-button--danger, .t-Button--danger {',
'    --a-button-background-color: #fdfdfd;',
'    --a-button-text-color: #ffffff;',
'    --a-button-hover-background-color: #ffffff;',
'    --a-button-hover-text-color: var(--a-button-text-color);',
'    --a-button-active-background-color: #ffffff;',
'    --a-button-active-text-color: var(--a-button-hover-text-color);',
'    --a-button-focus-background-color: var(--a-button-hover-background-color);',
'    --a-button-focus-text-color: var(--a-button-hover-text-color);',
'}',
''))
,p_step_template=>wwv_flow_imp.id(5774347642628043810)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19223061753443694398)
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
 p_id=>wwv_flow_imp.id(13638780516532752399)
,p_name=>'Cards'
,p_static_id=>'cards'
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'Y'
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
'                                                                                                                       INITCAP(func_find_sale_pers_qry_desc(NVL(wfdc_src_bu, wfdc_bu), wfdc_benf_id, 1))',
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
'WHERE (INSTR(UPPER(wfdc_type_desc), UPPER(NVL(:P236131040_WF_SRCH, wfdc_type_desc))) > 0 OR',
'       INSTR(UPPER(wfdc_fwd_per_name), UPPER(NVL(:P236131040_WF_SRCH, wfdc_fwd_per_name))) > 0 OR',
'       INSTR(UPPER(wfdc_src_plnt_desc), UPPER(NVL(:P236131040_WF_SRCH, wfdc_src_plnt_desc))) > 0 OR       ',
'       INSTR(UPPER(wfdc_doc_pfx), UPPER(NVL(:P236131040_WF_SRCH, wfdc_doc_pfx))) > 0 OR',
'       INSTR(UPPER(wfdc_doc_no), UPPER(NVL(:P236131040_WF_SRCH, wfdc_doc_no))) > 0 OR       ',
'       INSTR(UPPER(wfdc_src_bu), UPPER(NVL(:P236131040_WF_SRCH, wfdc_src_bu))) > 0 OR',
'       INSTR(UPPER(wfdc_plnt_desc), UPPER(NVL(:P236131040_WF_SRCH, wfdc_plnt_desc))) > 0)',
'ORDER BY wfdc_priority, NVL(wfdc_fwd_on, wfdc_cre_date) DESC,wfdc_type'))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P236131040_WF_SRCH'
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
 p_id=>wwv_flow_imp.id(8124107509887817818)
,p_query_column_id=>6
,p_column_alias=>'ATTRIBUTE_1'
,p_column_display_sequence=>81
,p_column_heading=>'Attribute 1'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124107915779817826)
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
 p_id=>wwv_flow_imp.id(8124108271439817832)
,p_query_column_id=>8
,p_column_alias=>'ATTRIBUTE_3'
,p_column_display_sequence=>83
,p_column_heading=>'Attribute 3'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124108636557817837)
,p_query_column_id=>9
,p_column_alias=>'ATTRIBUTE_4'
,p_column_display_sequence=>84
,p_column_heading=>'Attribute 4'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124109019675817851)
,p_query_column_id=>10
,p_column_alias=>'ATTRIBUTE_5'
,p_column_display_sequence=>85
,p_column_heading=>'Attribute 5'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124109789352817856)
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
 p_id=>wwv_flow_imp.id(8124110167224817860)
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
 p_id=>wwv_flow_imp.id(8124109407539817853)
,p_query_column_id=>11
,p_column_alias=>'CARD_DATE'
,p_column_display_sequence=>93
,p_column_heading=>'Card Date'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124110988516817874)
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
 p_id=>wwv_flow_imp.id(8124107036658817812)
,p_query_column_id=>5
,p_column_alias=>'CARD_INITIALS'
,p_column_display_sequence=>80
,p_column_heading=>'Card Initials'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124105146094817776)
,p_query_column_id=>12
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>114
,p_column_heading=>'Process'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124106261175817801)
,p_query_column_id=>3
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>77
,p_column_heading=>'Card Subtitle'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124106640958817807)
,p_query_column_id=>4
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>79
,p_column_heading=>'Card Text'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124105930794817798)
,p_query_column_id=>2
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>76
,p_column_heading=>'Card Title'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124105475622817795)
,p_query_column_id=>1
,p_column_alias=>'ROWID'
,p_column_display_sequence=>1
,p_column_heading=>'Rowid'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124116098165817971)
,p_query_column_id=>29
,p_column_alias=>'WFDC_ACCTS'
,p_column_display_sequence=>14
,p_column_heading=>'Wfdc Accts'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124126711763818199)
,p_query_column_id=>56
,p_column_alias=>'WFDC_ACT'
,p_column_display_sequence=>41
,p_column_heading=>'Wfdc Act'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124119681450818021)
,p_query_column_id=>38
,p_column_alias=>'WFDC_ACTION_DATE'
,p_column_display_sequence=>23
,p_column_heading=>'Wfdc Action Date'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124131540004818313)
,p_query_column_id=>68
,p_column_alias=>'WFDC_AUTH_TYPE'
,p_column_display_sequence=>53
,p_column_heading=>'Wfdc Auth Type'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124132773937818332)
,p_query_column_id=>71
,p_column_alias=>'WFDC_BENF_ID'
,p_column_display_sequence=>56
,p_column_heading=>'Wfdc Benf Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124132356396818326)
,p_query_column_id=>70
,p_column_alias=>'WFDC_BENF_TYPE'
,p_column_display_sequence=>55
,p_column_heading=>'Wfdc Benf Type'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124134730498818370)
,p_query_column_id=>76
,p_column_alias=>'WFDC_BILL_AMT'
,p_column_display_sequence=>61
,p_column_heading=>'Wfdc Bill Amt'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124133219891818342)
,p_query_column_id=>72
,p_column_alias=>'WFDC_BILL_DATE'
,p_column_display_sequence=>57
,p_column_heading=>'Wfdc Bill Date'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124133492474818348)
,p_query_column_id=>73
,p_column_alias=>'WFDC_BILL_NO'
,p_column_display_sequence=>58
,p_column_heading=>'Wfdc Bill No'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124111426546817887)
,p_query_column_id=>17
,p_column_alias=>'WFDC_BU'
,p_column_display_sequence=>2
,p_column_heading=>'Wfdc Bu'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124110557066817862)
,p_query_column_id=>15
,p_column_alias=>'WFDC_CALL_PAGE_NO'
,p_column_display_sequence=>94
,p_column_heading=>'Wfdc Call Page No'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124139415437818462)
,p_query_column_id=>88
,p_column_alias=>'WFDC_COLL_CENTR_ID'
,p_column_display_sequence=>73
,p_column_heading=>'Wfdc Coll Centr Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124136287714818407)
,p_query_column_id=>80
,p_column_alias=>'WFDC_CRE_BY'
,p_column_display_sequence=>65
,p_column_heading=>'Wfdc Cre By'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124137498415818431)
,p_query_column_id=>83
,p_column_alias=>'WFDC_CRE_DATE'
,p_column_display_sequence=>68
,p_column_heading=>'Wfdc Cre Date'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124139766128818468)
,p_query_column_id=>89
,p_column_alias=>'WFDC_CRE_EMP_ID'
,p_column_display_sequence=>74
,p_column_heading=>'Wfdc Cre Emp Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124136722336818417)
,p_query_column_id=>81
,p_column_alias=>'WFDC_CRE_IP_ADDR'
,p_column_display_sequence=>66
,p_column_heading=>'Wfdc Cre Ip Addr'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124137097276818421)
,p_query_column_id=>82
,p_column_alias=>'WFDC_CRE_OS_USER'
,p_column_display_sequence=>67
,p_column_heading=>'Wfdc Cre Os User'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124113338155817923)
,p_query_column_id=>22
,p_column_alias=>'WFDC_CTRL_PERSON'
,p_column_display_sequence=>7
,p_column_heading=>'Wfdc Ctrl Person'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124114147438817934)
,p_query_column_id=>24
,p_column_alias=>'WFDC_CUST_ID'
,p_column_display_sequence=>9
,p_column_heading=>'Wfdc Cust Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124132028906818320)
,p_query_column_id=>69
,p_column_alias=>'WFDC_DISC_PCT'
,p_column_display_sequence=>54
,p_column_heading=>'Wfdc Disc Pct'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124125566362818135)
,p_query_column_id=>53
,p_column_alias=>'WFDC_DOC_BRIEF'
,p_column_display_sequence=>38
,p_column_heading=>'Wfdc Doc Brief'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124130768487818301)
,p_query_column_id=>66
,p_column_alias=>'WFDC_DOC_DATE'
,p_column_display_sequence=>51
,p_column_heading=>'Wfdc Doc Date'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124112555080817906)
,p_query_column_id=>20
,p_column_alias=>'WFDC_DOC_NO'
,p_column_display_sequence=>5
,p_column_heading=>'Wfdc Doc No'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124112199061817898)
,p_query_column_id=>19
,p_column_alias=>'WFDC_DOC_PFX'
,p_column_display_sequence=>4
,p_column_heading=>'Wfdc Doc Pfx'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124122423531818070)
,p_query_column_id=>45
,p_column_alias=>'WFDC_DOC_SFX'
,p_column_display_sequence=>30
,p_column_heading=>'Wfdc Doc Sfx'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124135888807818396)
,p_query_column_id=>79
,p_column_alias=>'WFDC_EMP_ID'
,p_column_display_sequence=>64
,p_column_heading=>'Wfdc Emp Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124118056883818004)
,p_query_column_id=>34
,p_column_alias=>'WFDC_FRWD_RTN'
,p_column_display_sequence=>19
,p_column_heading=>'Wfdc Frwd Rtn'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124127924253818228)
,p_query_column_id=>59
,p_column_alias=>'WFDC_FWD_ON'
,p_column_display_sequence=>44
,p_column_heading=>'Wfdc Fwd On'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124125155210818124)
,p_query_column_id=>52
,p_column_alias=>'WFDC_FWD_PERSON'
,p_column_display_sequence=>37
,p_column_heading=>'Wfdc Fwd Person'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124141001229818495)
,p_query_column_id=>92
,p_column_alias=>'WFDC_FWD_PER_NAME'
,p_column_display_sequence=>87
,p_column_heading=>'Wfdc Fwd Per Name'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124125863889818156)
,p_query_column_id=>54
,p_column_alias=>'WFDC_FWD_TO'
,p_column_display_sequence=>39
,p_column_heading=>'Wfdc Fwd To'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124133934380818359)
,p_query_column_id=>74
,p_column_alias=>'WFDC_GROSS_AMT'
,p_column_display_sequence=>59
,p_column_heading=>'Wfdc Gross Amt'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124124362016818109)
,p_query_column_id=>50
,p_column_alias=>'WFDC_INT_MSG_FLAG'
,p_column_display_sequence=>35
,p_column_heading=>'Wfdc Int Msg Flag'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124135490662818387)
,p_query_column_id=>78
,p_column_alias=>'WFDC_INV_NO'
,p_column_display_sequence=>63
,p_column_heading=>'Wfdc Inv No'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124135114885818373)
,p_query_column_id=>77
,p_column_alias=>'WFDC_INV_PFX'
,p_column_display_sequence=>62
,p_column_heading=>'Wfdc Inv Pfx'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124117708131817992)
,p_query_column_id=>33
,p_column_alias=>'WFDC_JRNL_TYPE'
,p_column_display_sequence=>18
,p_column_heading=>'Wfdc Jrnl Type'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124114569106817942)
,p_query_column_id=>25
,p_column_alias=>'WFDC_LVL1'
,p_column_display_sequence=>10
,p_column_heading=>'Wfdc Lvl1'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124115015207817948)
,p_query_column_id=>26
,p_column_alias=>'WFDC_LVL2'
,p_column_display_sequence=>11
,p_column_heading=>'Wfdc Lvl2'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124115264922817954)
,p_query_column_id=>27
,p_column_alias=>'WFDC_LVL3'
,p_column_display_sequence=>12
,p_column_heading=>'Wfdc Lvl3'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124115644596817965)
,p_query_column_id=>28
,p_column_alias=>'WFDC_LVL4'
,p_column_display_sequence=>13
,p_column_heading=>'Wfdc Lvl4'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124131175942818306)
,p_query_column_id=>67
,p_column_alias=>'WFDC_LVL_PRJ'
,p_column_display_sequence=>52
,p_column_heading=>'Wfdc Lvl Prj'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124123962396818101)
,p_query_column_id=>49
,p_column_alias=>'WFDC_MAIL_FLAG'
,p_column_display_sequence=>34
,p_column_heading=>'Wfdc Mail Flag'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124130167012818290)
,p_query_column_id=>65
,p_column_alias=>'WFDC_MAIL_SEND_FLAG'
,p_column_display_sequence=>50
,p_column_heading=>'Wfdc Mail Send Flag'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124118894790818012)
,p_query_column_id=>36
,p_column_alias=>'WFDC_MESSAGE'
,p_column_display_sequence=>21
,p_column_heading=>'Wfdc Message'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124128981631818267)
,p_query_column_id=>62
,p_column_alias=>'WFDC_NXT_FWD_ENTITY'
,p_column_display_sequence=>47
,p_column_heading=>'Wfdc Nxt Fwd Entity'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124127046939818213)
,p_query_column_id=>57
,p_column_alias=>'WFDC_NXT_FWD_PERSON'
,p_column_display_sequence=>42
,p_column_heading=>'Wfdc Nxt Fwd Person'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124129803036818282)
,p_query_column_id=>64
,p_column_alias=>'WFDC_NXT_FWD_PLNT'
,p_column_display_sequence=>49
,p_column_heading=>'Wfdc Nxt Fwd Plnt'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124127479314818220)
,p_query_column_id=>58
,p_column_alias=>'WFDC_NXT_MESSAGE'
,p_column_display_sequence=>43
,p_column_heading=>'Wfdc Nxt Message'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124142301463818509)
,p_query_column_id=>95
,p_column_alias=>'WFDC_NXT_PROCESS'
,p_column_display_sequence=>90
,p_column_heading=>'Wfdc Nxt Process'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124126242745818163)
,p_query_column_id=>55
,p_column_alias=>'WFDC_NXT_STATUS'
,p_column_display_sequence=>40
,p_column_heading=>'Wfdc Nxt Status'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124123177532818090)
,p_query_column_id=>47
,p_column_alias=>'WFDC_PLNT'
,p_column_display_sequence=>32
,p_column_heading=>'Wfdc Plnt'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124141892997818506)
,p_query_column_id=>94
,p_column_alias=>'WFDC_PLNT_DESC'
,p_column_display_sequence=>89
,p_column_heading=>'Wfdc Plnt Desc'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124118456398818007)
,p_query_column_id=>35
,p_column_alias=>'WFDC_PO_MODE'
,p_column_display_sequence=>20
,p_column_heading=>'Wfdc Po Mode'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124121540370818060)
,p_query_column_id=>43
,p_column_alias=>'WFDC_PRIORITY'
,p_column_display_sequence=>28
,p_column_heading=>'Wfdc Priority'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124116526085817978)
,p_query_column_id=>30
,p_column_alias=>'WFDC_PRJ_ID'
,p_column_display_sequence=>15
,p_column_heading=>'Wfdc Prj Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124120865915818040)
,p_query_column_id=>41
,p_column_alias=>'WFDC_PROD_ID'
,p_column_display_sequence=>26
,p_column_heading=>'Wfdc Prod Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124121198735818053)
,p_query_column_id=>42
,p_column_alias=>'WFDC_PROD_REV'
,p_column_display_sequence=>27
,p_column_heading=>'Wfdc Prod Rev'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124120502391818035)
,p_query_column_id=>40
,p_column_alias=>'WFDC_QC_INS_MODE'
,p_column_display_sequence=>25
,p_column_heading=>'Wfdc Qc Ins Mode'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124120059485818031)
,p_query_column_id=>39
,p_column_alias=>'WFDC_QC_REV'
,p_column_display_sequence=>24
,p_column_heading=>'Wfdc Qc Rev'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124116883036817982)
,p_query_column_id=>31
,p_column_alias=>'WFDC_RND_PRJ_ID'
,p_column_display_sequence=>16
,p_column_heading=>'Wfdc Rnd Prj Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124123583070818095)
,p_query_column_id=>48
,p_column_alias=>'WFDC_SELECT_FLAG'
,p_column_display_sequence=>33
,p_column_heading=>'Wfdc Select Flag'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124119314933818017)
,p_query_column_id=>37
,p_column_alias=>'WFDC_SEQ_NO'
,p_column_display_sequence=>22
,p_column_heading=>'Wfdc Seq No'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124124824514818115)
,p_query_column_id=>51
,p_column_alias=>'WFDC_SMS_FLAG'
,p_column_display_sequence=>36
,p_column_heading=>'Wfdc Sms Flag'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124113802050817928)
,p_query_column_id=>23
,p_column_alias=>'WFDC_SPPLR_ID'
,p_column_display_sequence=>8
,p_column_heading=>'Wfdc Spplr Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124128247081818240)
,p_query_column_id=>60
,p_column_alias=>'WFDC_SRC_BU'
,p_column_display_sequence=>45
,p_column_heading=>'Wfdc Src Bu'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124128572976818256)
,p_query_column_id=>61
,p_column_alias=>'WFDC_SRC_PLNT'
,p_column_display_sequence=>46
,p_column_heading=>'Wfdc Src Plnt'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124141534590818501)
,p_query_column_id=>93
,p_column_alias=>'WFDC_SRC_PLNT_DESC'
,p_column_display_sequence=>88
,p_column_heading=>'Wfdc Src Plnt Desc'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124129341949818274)
,p_query_column_id=>63
,p_column_alias=>'WFDC_SRC_USER'
,p_column_display_sequence=>48
,p_column_heading=>'Wfdc Src User'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124112989518817917)
,p_query_column_id=>21
,p_column_alias=>'WFDC_STATUS'
,p_column_display_sequence=>6
,p_column_heading=>'Wfdc Status'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124134281503818365)
,p_query_column_id=>75
,p_column_alias=>'WFDC_TAX_AMT'
,p_column_display_sequence=>60
,p_column_heading=>'Wfdc Tax Amt'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124111817840817890)
,p_query_column_id=>18
,p_column_alias=>'WFDC_TYPE'
,p_column_display_sequence=>3
,p_column_heading=>'Wfdc Type'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124140577915818490)
,p_query_column_id=>91
,p_column_alias=>'WFDC_TYPE_DESC'
,p_column_display_sequence=>86
,p_column_heading=>'Wfdc Type Desc'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124137848280818437)
,p_query_column_id=>84
,p_column_alias=>'WFDC_UPD_BY'
,p_column_display_sequence=>69
,p_column_heading=>'Wfdc Upd By'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124139014299818459)
,p_query_column_id=>87
,p_column_alias=>'WFDC_UPD_DATE'
,p_column_display_sequence=>72
,p_column_heading=>'Wfdc Upd Date'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124140178294818474)
,p_query_column_id=>90
,p_column_alias=>'WFDC_UPD_EMP_ID'
,p_column_display_sequence=>75
,p_column_heading=>'Wfdc Upd Emp Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124138316085818442)
,p_query_column_id=>85
,p_column_alias=>'WFDC_UPD_IP_ADDR'
,p_column_display_sequence=>70
,p_column_heading=>'Wfdc Upd Ip Addr'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124138621755818451)
,p_query_column_id=>86
,p_column_alias=>'WFDC_UPD_OS_USER'
,p_column_display_sequence=>71
,p_column_heading=>'Wfdc Upd Os User'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124117238025817990)
,p_query_column_id=>32
,p_column_alias=>'WFDC_VALUE'
,p_column_display_sequence=>17
,p_column_heading=>'Wfdc Value'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124121943061818063)
,p_query_column_id=>44
,p_column_alias=>'WFDC_WF_NO'
,p_column_display_sequence=>29
,p_column_heading=>'Wfdc Wf No'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8124122776797818076)
,p_query_column_id=>46
,p_column_alias=>'WFDC_WRK_CNTR'
,p_column_display_sequence=>31
,p_column_heading=>'Wfdc Wrk Cntr'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8960880520043711952)
,p_plug_name=>'Main'
,p_static_id=>'main'
,p_region_template_options=>'#DEFAULT#:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>1
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10985092332941685582)
,p_plug_name=>'Search'
,p_static_id=>'search'
,p_region_name=>'FD'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--controlsPosEnd:is-expanded:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>5
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(34351984703320317872)
,p_plug_name=>'Workflow'
,p_static_id=>'workflow'
,p_region_name=>'PEND'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody:t-Form--stretchInputs'
,p_region_attributes=>'style=''display:none;'''
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
'         wfdc_fwd_person_emp,',
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
'         END Doc_Detail,',
'         WFDC_DOC_BRIEF,',
'         "WFDC_FWD_TO",',
'         "WFDC_NXT_STATUS",',
'         "WFDC_ACT",',
'         WFDC_NXT_FWD_PERSON,',
'  ( select emp_first_name1 from employees where emp_bu = :global_bu',
'   and emp_emp_id =  (SELECT appluser_emp_id',
'               FROM appl_users',
'              WHERE appluser_bu = wfdc_bu AND   appluser_id = wfdc_cre_by AND ROWNUM=1) )',
'                   "Fwd. By",',
'         "WFDC_NXT_MESSAGE",',
'         WFDC_FWD_ON "Fwd. Date",',
'         nvl(ROUND (TRUNC (SYSDATE) - TRUNC(WFDC_FWD_ON)),0) "Time Elasped",',
'         WFDC_SRC_BU,',
'         WFDC_SRC_PLNT,',
'         WFDC_SRC_BU "Entity",',
'         WFDC_SRC_PLNT "Plant",',
'         NVL (',
'            (SELECT bup_name1',
'               FROM bus_unit_plants ',
'              WHERE bup_bu  = :Global_bu',
'                    AND bup_plant_id = WFDC_PLNT),',
'            WFDC_SRC_PLNT)',
'            "Unit",',
'         (SELECT UPPER (wf_bus_proc_desc)',
'            FROM WORK_FLOW',
'           WHERE WF_BU = wfdc_BU AND wf_bus_proc_id = WFDC_TYPE)',
'            "Doc.Type",',
'         (CASE WHEN wfdc_benf_type = ''S'' THEN ',
'             func_find_party_name(wfdc_bu,wfdc_spplr_id,1)',
'         WHEN wfdc_benf_type = ''C'' THEN ',
'             func_find_party_name(wfdc_bu,wfdc_cust_id,1)',
'         WHEN  wfdc_benf_type = ''E'' THEN ',
'             func_find_employee_desc(wfdc_bu,wfdc_benf_id,1)',
'         END )  "Party",',
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
'            p_value            => wfdc_wf_no || wfdc_ADMIN_select_flag,',
'            p_checked_values   => DECODE (wfdc_wf_no || wfdc_ADMIN_select_flag,',
'                                          wfdc_wf_no || ''1'', wfdc_wf_no || ''1''))',
'            Appr,',
'              CASE WHEN  wfdc_ADMIN_select_flag = 1 THEN',
'             ''<input type="checkbox" id="checkbox_''||wfdc_wf_no||''" checked="checked" onChange="checkanduncheck(''''''||wfdc_wf_no||'''''',''''CHECKANDUNCHECK'''')"/>'' ',
'            WHEN  wfdc_ADMIN_select_flag = 0 THEN',
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
'        CASE WHEN (SELECT wf_apex_appl_no',
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
'				|| ''_WF_TYPE:''||''AD'')  ',
'			ELSE NULL END LINK1,',
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
'            func_find_sub_vou_type_desc(:GLOBAL_BU,WFDC_SUB_VOU_TYPE)SUB_VOU_DESC,',
'            ''<span aria-hidden="true" class="fa fa-print" style="color: orange" ></span>'' WFDC_PRINT',
'  FROM WORK_FLOW_DOC_CONTROL',
' WHERE WFDC_BU = :global_bu',
'   --AND (WFDC_TYPE = :P236131040_TYPE OR :P236131040_TYPE IS NULL)',
'AND ((SELECT wf_bus_proc_desc',
'              FROM WORK_FLOW',
'             WHERE WF_BU = wfdc_BU ',
'               AND wf_bus_proc_id = WFDC_TYPE) = :P236131040_TYPE_2 OR :P236131040_TYPE_2 IS NULL)',
'    AND (WFDC_SRC_PLNT LIKE ''%'' || :P236131040_UNIT || ''%'' OR :P236131040_UNIT IS NULL)',
'   AND ( func_find_sub_vou_type_desc(wfdc_bu,wfdc_sub_vou_type) LIKE ''%'' || :P236131040_SUB_VOU_TYPE || ''%'' OR :P236131040_SUB_VOU_TYPE IS NULL)',
'    AND (WFDC_DOC_NO LIKE ''%'' || :P236131040_DOC_NO || ''%'' OR :P236131040_DOC_NO IS NULL)',
'    AND (WFDC_BENF_ID LIKE ''%'' || :P236131040_PARTY || ''%'' OR :P236131040_PARTY IS NULL)',
'    AND (TRUNC(WFDC_DOC_DATE) >= TO_DATE(:P236131040_FROM_DATE,:GLOBAL_DATE_FORMAT) OR TO_DATE(:P236131040_FROM_DATE,:GLOBAL_DATE_FORMAT) IS NULL)',
'    AND (TRUNC(WFDC_DOC_DATE) <= TO_DATE(:P236131040_TO_DATE,:GLOBAL_DATE_FORMAT) OR TO_DATE(:P236131040_TO_DATE,:GLOBAL_DATE_FORMAT) IS NULL) ',
'   AND wfdc_status NOT IN (''C'', ''R'') ',
'ORDER BY WFDC_CRE_DATE,WFDC_PRIORITY, WFDC_ACTION_DATE DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P236131040_UNIT,P236131040_TYPE_2,P236131040_SUB_VOU_TYPE,P236131040_DOC_NO,P236131040_PARTY,P236131040_FROM_DATE,P236131040_TO_DATE,P236131040_TYPE1_1'
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
 p_id=>wwv_flow_imp.id(34368593046872760053)
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
,p_internal_uid=>28886631211329149025
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166522006802279762)
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
 p_id=>wwv_flow_imp.id(14188239177994570351)
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
 p_id=>wwv_flow_imp.id(10263050628171401041)
,p_db_column_name=>'DOC_DETAIL'
,p_display_order=>1220
,p_column_identifier=>'DV'
,p_column_label=>'Doc. Detail'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14188239130323570350)
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
 p_id=>wwv_flow_imp.id(9812432305075158534)
,p_db_column_name=>'Doc. Date'
,p_display_order=>1160
,p_column_identifier=>'DP'
,p_column_label=>'Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166521247873279760)
,p_db_column_name=>'Doc.Type'
,p_display_order=>800
,p_column_identifier=>'CB'
,p_column_label=>'WF. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166519622854279758)
,p_db_column_name=>'Entity'
,p_display_order=>750
,p_column_identifier=>'BW'
,p_column_label=>'Entity'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14276052938666809149)
,p_db_column_name=>'Fwd. By'
,p_display_order=>1090
,p_column_identifier=>'DH'
,p_column_label=>'Emp. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14276053047239809150)
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
 p_id=>wwv_flow_imp.id(14188238986666570349)
,p_db_column_name=>'HIST'
,p_display_order=>1000
,p_column_identifier=>'CY'
,p_column_label=>'Vw. Log'
,p_column_link=>'javascript:$s(''P236131040_WFDC_SRC_BU'',''#WFDC_SRC_BU#''),$s(''P236131040_WFDC_SRC_PLNT'',''#WFDC_SRC_PLNT#''),$s(''P236131040_WFDC_DOC_NO'',''#WFDC_DOC_NO#''),$s(''P236131040_WFDC_DOC_PFX'',''#WFDC_DOC_PFX#''),$s(''P236131040_WFDC_TYPE'',''#WFDC_TYPE#''),$s(''P2361310'
||'40_WFDC_PROD_ID'',''#WFDC_PROD_ID#''),$s(''P236131040_WFDC_PROD_REV'',''#WFDC_PROD_REV#''),$s(''P236131040_WFDC_SPPLR_ID'',''#WFDC_SPPLR_ID#'');apex.submit(''LOG'');'
,p_column_linktext=>'#HIST#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_static_id=>'head'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Instr(NVL(:REQUEST,''~''),''CSV'')=0',
'  and Instr(NVL(:REQUEST,''~''),''XLSX'')=0'))
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10372739839691273452)
,p_db_column_name=>'LINK'
,p_display_order=>1150
,p_column_identifier=>'DO'
,p_column_label=>'Det.'
,p_column_link=>'#LINK#'
,p_column_linktext=>'<span aria-hidden="true" style =  "color: #088def;" class="fa fa-info-circle"></span'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Instr(NVL(:REQUEST,''~''),''CSV'')=0',
'and Instr(NVL(:REQUEST,''~''),''XLSX'')=0'))
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5806774115316495450)
,p_db_column_name=>'LINK1'
,p_display_order=>1250
,p_column_identifier=>'DY'
,p_column_label=>'Link1'
,p_column_link=>'#LINK1#'
,p_column_linktext=>'<span aria-hidden="true" style =  "color: #088def;" class="fa fa-info-circle"></span'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_display_condition_type=>'NEVER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166517578029279754)
,p_db_column_name=>'No.'
,p_display_order=>700
,p_column_identifier=>'BR'
,p_column_label=>'Vou. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166520431884279758)
,p_db_column_name=>'Party'
,p_display_order=>780
,p_column_identifier=>'BZ'
,p_column_label=>'Party'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166517240646279754)
,p_db_column_name=>'Pfx.'
,p_display_order=>690
,p_column_identifier=>'BQ'
,p_column_label=>'Pfx.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166519999142279758)
,p_db_column_name=>'Plant'
,p_display_order=>760
,p_column_identifier=>'BX'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10022574577930280254)
,p_db_column_name=>'SUB_VOU_DESC'
,p_display_order=>1210
,p_column_identifier=>'DU'
,p_column_label=>'Sub Vou. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14276053060282809151)
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
 p_id=>wwv_flow_imp.id(14276053230691809152)
,p_db_column_name=>'Unit'
,p_display_order=>1120
,p_column_identifier=>'DK'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10025482100642811116)
,p_db_column_name=>'VOU_TYPE_DESC'
,p_display_order=>1200
,p_column_identifier=>'DT'
,p_column_label=>'Vou. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166518016709279755)
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
 p_id=>wwv_flow_imp.id(14166498048619279716)
,p_db_column_name=>'WFDC_ACCTS'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Wfdc Accts'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166509331546279738)
,p_db_column_name=>'WFDC_ACT'
,p_display_order=>450
,p_column_identifier=>'AS'
,p_column_label=>'Wfdc Act'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166501329414279723)
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
 p_id=>wwv_flow_imp.id(14166512454252279744)
,p_db_column_name=>'WFDC_AUTH_TYPE'
,p_display_order=>570
,p_column_identifier=>'BE'
,p_column_label=>'Wfdc Auth Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166513658154279748)
,p_db_column_name=>'WFDC_BENF_ID'
,p_display_order=>600
,p_column_identifier=>'BH'
,p_column_label=>'Wfdc Benf Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166513321349279746)
,p_db_column_name=>'WFDC_BENF_TYPE'
,p_display_order=>590
,p_column_identifier=>'BG'
,p_column_label=>'Wfdc Benf Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166515634365279751)
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
 p_id=>wwv_flow_imp.id(14166514056871279748)
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
 p_id=>wwv_flow_imp.id(14166514514119279749)
,p_db_column_name=>'WFDC_BILL_NO'
,p_display_order=>620
,p_column_identifier=>'BJ'
,p_column_label=>'Wfdc Bill No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166494070393279705)
,p_db_column_name=>'WFDC_BU'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Wfdc Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166506881813279733)
,p_db_column_name=>'WFDC_CRE_BY'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'Wfdc Cre By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166507316200279735)
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
 p_id=>wwv_flow_imp.id(14166495252715279712)
,p_db_column_name=>'WFDC_CTRL_PERSON'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Ctrl. Person'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166496075965279713)
,p_db_column_name=>'WFDC_CUST_ID'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Wfdc Cust Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166512852602279746)
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
 p_id=>wwv_flow_imp.id(14283728552417432169)
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
 p_id=>wwv_flow_imp.id(10353097836794032427)
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
 p_id=>wwv_flow_imp.id(14191191852133527260)
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
 p_id=>wwv_flow_imp.id(14191191783105527259)
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
 p_id=>wwv_flow_imp.id(14166504108143279729)
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
 p_id=>wwv_flow_imp.id(14166516781208279752)
,p_db_column_name=>'WFDC_EMP_ID'
,p_display_order=>680
,p_column_identifier=>'BP'
,p_column_label=>'Emp. Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166499727163279719)
,p_db_column_name=>'WFDC_FRWD_RTN'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Wfdc Frwd Rtn'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14232962437225448398)
,p_db_column_name=>'WFDC_FWD_PERSON'
,p_display_order=>1130
,p_column_identifier=>'DL'
,p_column_label=>'Wfdc Fwd Person'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10299751643239968523)
,p_db_column_name=>'WFDC_FWD_PERSON_EMP'
,p_display_order=>1230
,p_column_identifier=>'DW'
,p_column_label=>'Fwd. Person Emp.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166508495002279737)
,p_db_column_name=>'WFDC_FWD_TO'
,p_display_order=>430
,p_column_identifier=>'AQ'
,p_column_label=>'Fwd. To'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166514835220279749)
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
 p_id=>wwv_flow_imp.id(14166506142648279732)
,p_db_column_name=>'WFDC_INT_MSG_FLAG'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'Wfdc Int Msg Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166516436269279752)
,p_db_column_name=>'WFDC_INV_NO'
,p_display_order=>670
,p_column_identifier=>'BO'
,p_column_label=>'Wfdc Inv No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166516003797279751)
,p_db_column_name=>'WFDC_INV_PFX'
,p_display_order=>660
,p_column_identifier=>'BN'
,p_column_label=>'Wfdc Inv Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166499286246279718)
,p_db_column_name=>'WFDC_JRNL_TYPE'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Wfdc Jrnl Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166496527520279713)
,p_db_column_name=>'WFDC_LVL1'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Wfdc Lvl1'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166496939661279715)
,p_db_column_name=>'WFDC_LVL2'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Wfdc Lvl2'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166497329521279715)
,p_db_column_name=>'WFDC_LVL3'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Wfdc Lvl3'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166497723436279716)
,p_db_column_name=>'WFDC_LVL4'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Wfdc Lvl4'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166512135064279744)
,p_db_column_name=>'WFDC_LVL_PRJ'
,p_display_order=>560
,p_column_identifier=>'BD'
,p_column_label=>'Wfdc Lvl Prj'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166505695883279732)
,p_db_column_name=>'WFDC_MAIL_FLAG'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'Wfdc Mail Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166511727011279743)
,p_db_column_name=>'WFDC_MAIL_SEND_FLAG'
,p_display_order=>540
,p_column_identifier=>'BB'
,p_column_label=>'Wfdc Mail Send Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166500507905279721)
,p_db_column_name=>'WFDC_MESSAGE'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Wfdc Message'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166510491800279741)
,p_db_column_name=>'WFDC_NXT_FWD_ENTITY'
,p_display_order=>510
,p_column_identifier=>'AY'
,p_column_label=>'Wfdc Nxt Fwd Entity'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166521631085279762)
,p_db_column_name=>'WFDC_NXT_FWD_PERSON'
,p_display_order=>810
,p_column_identifier=>'CC'
,p_column_label=>'Nxt. Fwd. Person'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166511269228279743)
,p_db_column_name=>'WFDC_NXT_FWD_PLNT'
,p_display_order=>530
,p_column_identifier=>'BA'
,p_column_label=>'Wfdc Nxt Fwd Plnt'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166509686423279740)
,p_db_column_name=>'WFDC_NXT_MESSAGE'
,p_display_order=>470
,p_column_identifier=>'AU'
,p_column_label=>'Wfdc Nxt Message'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166508892074279738)
,p_db_column_name=>'WFDC_NXT_STATUS'
,p_display_order=>440
,p_column_identifier=>'AR'
,p_column_label=>'Wfdc Nxt Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166504921902279730)
,p_db_column_name=>'WFDC_PLNT'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'Wfdc Plnt'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166500103291279719)
,p_db_column_name=>'WFDC_PO_MODE'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Wfdc Po Mode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10316584030832453916)
,p_db_column_name=>'WFDC_PRINT'
,p_display_order=>1240
,p_column_identifier=>'DX'
,p_column_label=>'Print'
,p_column_link=>'javascript:$s(''P236131010_PRNT_PLNT'',''#WFDC_PLNT#''),$s(''P236131010_PRNT_DOC_PFX'',''#WFDC_DOC_PFX#''),$s(''P236131010_PRNT_DOC_NO'',''#WFDC_DOC_NO#''),$s(''P236131010_PRNT_PROD_ID'',''#WFDC_PROD_ID#''),$s(''P236131010_PRNT_PROD_REV'',''#WFDC_PROD_REV#''),$s(''P23613'
||'1010_PRNT_SUPLR_ID'',''#WFDC_SPPLR_ID#''),$s(''P236131010_PRNT_WF_TYPE'',''#WFDC_SUB_VOU_TYPE#'');apex.submit(''PRINT'');'
,p_column_linktext=>'#WFDC_PRINT#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166503257304279727)
,p_db_column_name=>'WFDC_PRIORITY'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Wfdc Priority'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166498515184279718)
,p_db_column_name=>'WFDC_PRJ_ID'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Wfdc Prj Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166502486240279726)
,p_db_column_name=>'WFDC_PROD_ID'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Wfdc Prod Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166502861391279726)
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
 p_id=>wwv_flow_imp.id(14166502097135279724)
,p_db_column_name=>'WFDC_QC_INS_MODE'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Wfdc Qc Ins Mode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166501694857279724)
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
 p_id=>wwv_flow_imp.id(14166498870935279718)
,p_db_column_name=>'WFDC_RND_PRJ_ID'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Wfdc Rnd Prj Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166505256989279730)
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
 p_id=>wwv_flow_imp.id(14166500896968279721)
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
 p_id=>wwv_flow_imp.id(14166506529800279733)
,p_db_column_name=>'WFDC_SMS_FLAG'
,p_display_order=>360
,p_column_identifier=>'AJ'
,p_column_label=>'Wfdc Sms Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166495747828279712)
,p_db_column_name=>'WFDC_SPPLR_ID'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Wfdc Spplr Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14191192022530527261)
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
 p_id=>wwv_flow_imp.id(14191192084120527262)
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
 p_id=>wwv_flow_imp.id(14166510853689279741)
,p_db_column_name=>'WFDC_SRC_USER'
,p_display_order=>520
,p_column_identifier=>'AZ'
,p_column_label=>'Src. User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166494871510279710)
,p_db_column_name=>'WFDC_STATUS'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Wfdc Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9985482091357763621)
,p_db_column_name=>'WFDC_SUB_VOU_TYPE'
,p_display_order=>1190
,p_column_identifier=>'DS'
,p_column_label=>'Sub Vou. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166515225664279749)
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
 p_id=>wwv_flow_imp.id(14166494532993279710)
,p_db_column_name=>'WFDC_TYPE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Wfdc Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166507692960279735)
,p_db_column_name=>'WFDC_UPD_BY'
,p_display_order=>390
,p_column_identifier=>'AM'
,p_column_label=>'Wfdc Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166508053334279737)
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
 p_id=>wwv_flow_imp.id(9985481983698763620)
,p_db_column_name=>'WFDC_VOU_TYPE'
,p_display_order=>1180
,p_column_identifier=>'DR'
,p_column_label=>'Vou. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166503696375279727)
,p_db_column_name=>'WFDC_WF_NO'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Wfdc Wf No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166504465988279729)
,p_db_column_name=>'WFDC_WRK_CNTR'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Wfdc Wrk Cntr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14166522389748279763)
,p_db_column_name=>'select'
,p_display_order=>990
,p_column_identifier=>'CX'
,p_column_label=>'Select'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Instr(NVL(:REQUEST,''~''),''CSV'')=0',
'and Instr(NVL(:REQUEST,''~''),''XLSX'')=0'))
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(34368657496305767466)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'53805409'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'select:LINK:Entity:Plant:Doc.Type:VOU_TYPE_DESC:SUB_VOU_DESC:Pfx.:No.:Doc. Date:DOC_DETAIL:Fwd. By:Party:Value:HIST'
,p_sort_column_1=>'WFDC_CRE_DATE'
,p_sort_direction_1=>'DESC'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8124179858717819081)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(34351984703320317872)
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
 p_id=>wwv_flow_imp.id(8250960093145227162)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(10985092332941685582)
,p_button_name=>'Clear'
,p_static_id=>'clear'
,p_button_static_id=>'Clear1'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--padTop'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Clear'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7318336663130927404)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(10985092332941685582)
,p_button_name=>'Close'
,p_static_id=>'close'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--gapRight'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Close'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'&GLOBAL_HOME_URL.'
,p_button_css_classes=>'closebtn'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8124180566247819085)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(34351984703320317872)
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
 p_id=>wwv_flow_imp.id(8124144585244818520)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(19223061753443694398)
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
 p_id=>wwv_flow_imp.id(8250959713559227153)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(10985092332941685582)
,p_button_name=>'Search'
,p_static_id=>'search'
,p_button_static_id=>'SEARCH'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'<b>Search</b>'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8124180234171819084)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(34351984703320317872)
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
 p_id=>wwv_flow_imp.id(8124207492276819249)
,p_branch_name=>'Cards'
,p_branch_action=>'f?p=&APP_ID.:2361310102:&SESSION.::&DEBUG.::P2361310102_TYPE:CA&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>41
,p_branch_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(8124207844441819251)
,p_branch_name=>'PRINT'
,p_branch_action=>'javascript:window.open(''&P236131040_PRNT_URL.'');'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>51
,p_branch_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(8124208333302819253)
,p_branch_name=>'PRINT'
,p_branch_action=>'javascript:jasper();'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>61
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'PRINT'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(8124208695768819253)
,p_branch_name=>'Go To Page 236131010'
,p_branch_action=>'javascript:openModal(''SUB'');'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(8124180566247819085)
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(8124209036239819253)
,p_branch_name=>'Go To Page 23613101001'
,p_branch_action=>'f?p=&APP_ID.:23613101001:&SESSION.::&DEBUG.:RP,23613101001:P23613101001_DOC_BU,P23613101001_DOC_NO,P23613101001_DOC_PFX,P23613101001_PLNT,P23613101001_WF_TYPE,P23613101001_PROD_ID,P23613101001_PROD_REV,P23613101001_PARTY_ID:&P236131040_WFDC_SRC_BU.,&P236131040_WFDC_DOC_NO.,&P236131040_WFDC_DOC_PFX.,&P236131040_WFDC_SRC_PLNT.,&P236131040_WFDC_TYPE.,&P236131040_WFDC_PROD_ID.,&P236131040_WFDC_PROD_REV.,&P236131040_WFDC_SPPLR_ID.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>21
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'LOG'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13858561260356582481)
,p_name=>'P236131040_COUNT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(34351984703320317872)
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
 p_id=>wwv_flow_imp.id(10985094091850685683)
,p_name=>'P236131040_DOC_NO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(10985092332941685582)
,p_prompt=>'Vou. No.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>' SELECT wfdc_doc_no FROM work_flow_doc_control where wfdc_bu =:GLOBAL_bu AND wfdc_doc_no  IS NOT NULL'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Vou. No.')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10985093699463685679)
,p_name=>'P236131040_FROM_DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(10985092332941685582)
,p_prompt=>'From Date'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-right-sm'
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
 p_id=>wwv_flow_imp.id(14166570791159281006)
,p_name=>'P236131040_FWD_ON'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(19223061753443694398)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8963012165908406404)
,p_name=>'P236131040_INT_MSG'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(13638780516532752399)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8963011368284406402)
,p_name=>'P236131040_MAIL_FLAG'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(13638780516532752399)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14301697913000548089)
,p_name=>'P236131040_MSG'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(19223061753443694398)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14166571180361281006)
,p_name=>'P236131040_NEXT_PROCESS'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(19223061753443694398)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P236131040_WFDC_ACT'
,p_display_when2=>'F'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10985093659193685678)
,p_name=>'P236131040_PARTY'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(10985092332941685582)
,p_prompt=>'Party'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'WFM1010_PARTY_FIND'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Party',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10316663939554455705)
,p_name=>'P236131040_PRNT_DOC_NO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(34351984703320317872)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10316663863356455704)
,p_name=>'P236131040_PRNT_DOC_PFX'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(34351984703320317872)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10316663760772455703)
,p_name=>'P236131040_PRNT_PLNT'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(34351984703320317872)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10316664044397455706)
,p_name=>'P236131040_PRNT_PROD_ID'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(34351984703320317872)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10316664130170455707)
,p_name=>'P236131040_PRNT_PROD_REV'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(34351984703320317872)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10316663659669455702)
,p_name=>'P236131040_PRNT_SRC_PLNT'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(34351984703320317872)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10316664243024455708)
,p_name=>'P236131040_PRNT_SUPLR_ID'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(34351984703320317872)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10316664378875455710)
,p_name=>'P236131040_PRNT_URL'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(34351984703320317872)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10316664294154455709)
,p_name=>'P236131040_PRNT_WF_TYPE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(34351984703320317872)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8910807195540972081)
,p_name=>'P236131040_SEQ_NO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(34351984703320317872)
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
 p_id=>wwv_flow_imp.id(8963011713338406404)
,p_name=>'P236131040_SMS_FLAG'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(13638780516532752399)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10985093961141685681)
,p_name=>'P236131040_SUB_VOU_TYPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(10985092332941685582)
,p_prompt=>'Sub Vou. Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT Distinct func_find_sub_vou_type_desc(wfdc_bu,wfdc_sub_vou_type) AS Sub_Vou ',
'   FROM work_flow_doc_control ',
'  WHERE wfdc_bu =:GLOBAL_bu ',
'    AND wfdc_sub_vou_type IS NOT NULL'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Sub Vou. Type')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10985093816705685680)
,p_name=>'P236131040_TO_DATE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(10985092332941685582)
,p_prompt=>'To Date'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
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
 p_id=>wwv_flow_imp.id(14231396808435170507)
,p_name=>'P236131040_TYPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8960880520043711952)
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
,p_display_when=>'P236131040_TYPE1'
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
 p_id=>wwv_flow_imp.id(8950809745955692919)
,p_name=>'P236131040_TYPE1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8960880520043711952)
,p_item_default=>'MA'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9077666455902102419)
,p_name=>'P236131040_TYPE1_1'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(10985092332941685582)
,p_item_default=>'MA'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8963010149096406398)
,p_name=>'P236131040_TYPE_1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(13638780516532752399)
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
 p_id=>wwv_flow_imp.id(14358253518381580007)
,p_name=>'P236131040_TYPE_2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(10985092332941685582)
,p_prompt=>'WF Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'WFM1010_WF_TYPE_FIND'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'WF Type')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10985093486915685677)
,p_name=>'P236131040_UNIT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(10985092332941685582)
,p_prompt=>'Unit'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT wfdc_src_plnt d,wfdc_src_plnt r',
' FROM work_flow_doc_control ',
'WHERE wfdc_bu = :GLOBAL_bu',
'  AND wfdc_src_plnt IS NOT NULL',
'  '))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14166568036372280998)
,p_name=>'P236131040_WFDC_ACT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(19223061753443694398)
,p_item_default=>'W'
,p_prompt=>'&nbsp;'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Forward;F,Return;R,Wait ;W'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-bottom-lg:margin-left-lg'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '5',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8960924348437713177)
,p_name=>'P236131040_WFDC_CARD_TYPE'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(19223061753443694398)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14166568827862281002)
,p_name=>'P236131040_WFDC_CTRL_PERSON'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(19223061753443694398)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14191235723801528484)
,p_name=>'P236131040_WFDC_DOC_NO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(19223061753443694398)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14191235817816528485)
,p_name=>'P236131040_WFDC_DOC_PFX'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(19223061753443694398)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14166570370171281006)
,p_name=>'P236131040_WFDC_MESSAGE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(19223061753443694398)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P236131040_WFDC_ACT'
,p_display_when2=>'F'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14166572032118281009)
,p_name=>'P236131040_WFDC_NXT_FWD_ENT'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(19223061753443694398)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14166572824865281010)
,p_name=>'P236131040_WFDC_NXT_FWD_NM'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(19223061753443694398)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14166571583070281007)
,p_name=>'P236131040_WFDC_NXT_FWD_PERS'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(19223061753443694398)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Forward Person'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'FORWARD_LOV_WFM0010_A'
,p_lov_cascade_parent_items=>'P236131040_WFDC_TYPE,P236131040_WFDC_SEQ_NO,P236131040_WFDC_ACT'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Search Forward Person')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8398600942555093777)
,p_name=>'P236131040_WFDC_NXT_FWD_PERS_1'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(19223061753443694398)
,p_prompt=>'Return Person'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_RTN_PROCESS_A'
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P236131040_WFDC_TYPE,P236131040_WFDC_CTRL_PERSON,P236131040_WFDC_WF_NO'
,p_ajax_items_to_submit=>'P236131040_WFDC_TYPE,P236131040_WFDC_CTRL_PERSON,P236131040_WFDC_WF_NO'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'N',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Return Person',
  'width', '1000')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14166572348057281010)
,p_name=>'P236131040_WFDC_NXT_FWD_PLNT'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(19223061753443694398)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14166573191157281010)
,p_name=>'P236131040_WFDC_NXT_MESSAGE'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(19223061753443694398)
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
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14166573636658281012)
,p_name=>'P236131040_WFDC_NXT_STATUS'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(19223061753443694398)
,p_use_cache_before_default=>'NO'
,p_item_default=>'A'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P236131040_WFDC_ACT'
,p_display_when2=>'F'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14166574008707281012)
,p_name=>'P236131040_WFDC_NXT_STAT_DES'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(19223061753443694398)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8535893907293734517)
,p_name=>'P236131040_WFDC_PROD_ID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(34351984703320317872)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8535893988391734518)
,p_name=>'P236131040_WFDC_PROD_REV'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(34351984703320317872)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14166570012045281004)
,p_name=>'P236131040_WFDC_SELECT_FLAG'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(19223061753443694398)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14166569232349281004)
,p_name=>'P236131040_WFDC_SEQ_NO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(19223061753443694398)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9704474480094453521)
,p_name=>'P236131040_WFDC_SPPLR_ID'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(34351984703320317872)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14191235478218528482)
,p_name=>'P236131040_WFDC_SRC_BU'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(19223061753443694398)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14191235616687528483)
,p_name=>'P236131040_WFDC_SRC_PLNT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(19223061753443694398)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14166568345752281002)
,p_name=>'P236131040_WFDC_TYPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(19223061753443694398)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14166569574484281004)
,p_name=>'P236131040_WFDC_WF_NO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(19223061753443694398)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8963010923245406401)
,p_name=>'P236131040_WF_NO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(13638780516532752399)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8962971606952405549)
,p_name=>'P236131040_WF_SRCH'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(8960880520043711952)
,p_prompt=>'Search'
,p_placeholder=>'Search'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>9
,p_grid_label_column_span=>0
,p_display_when=>'P236131040_TYPE1'
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
 p_id=>wwv_flow_imp.id(8124185808148819146)
,p_validation_name=>'WFDC_NXT_FWD_PERS'
,p_static_id=>'wfdc-nxt-fwd-pers'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P236131040_WFDC_NXT_FWD_PERS IS NULL THEN ',
'    Return(''Forward Person must be entered'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'P236131040_WFDC_ACT'
,p_validation_condition2=>'F'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_imp.id(8124144585244818520)
,p_associated_item=>wwv_flow_imp.id(14166571583070281007)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(8124186074040819151)
,p_validation_name=>'WFDC_NXT_FWD_PERS_1'
,p_static_id=>'wfdc-nxt-fwd-pers-2'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P236131040_WFDC_NXT_FWD_PERS_1 IS NULL THEN ',
'    Return(''Return Person must be entered'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'P236131040_WFDC_ACT'
,p_validation_condition2=>'R'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_imp.id(8124144585244818520)
,p_associated_item=>wwv_flow_imp.id(8398600942555093777)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(8124186522012819153)
,p_validation_name=>'WFDC_NXT_MESSAGE'
,p_static_id=>'wfdc-nxt-message'
,p_validation_sequence=>10
,p_validation=>'P236131040_WFDC_NXT_MESSAGE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Return Reason must be entered.'
,p_validation_condition=>'P236131040_WFDC_ACT'
,p_validation_condition2=>'R'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_imp.id(8124144585244818520)
,p_associated_item=>wwv_flow_imp.id(14166573191157281010)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8124203917606819240)
,p_name=>'Check Flag'
,p_static_id=>'check-flag'
,p_event_sequence=>160
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(34351984703320317872)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8124204409249819243)
,p_event_id=>wwv_flow_imp.id(8124203917606819240)
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
 p_id=>wwv_flow_imp.id(8250983175963232031)
,p_name=>'Clear'
,p_static_id=>'clear'
,p_event_sequence=>200
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(8250960093145227162)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8250983321358232032)
,p_event_id=>wwv_flow_imp.id(8250983175963232031)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236131040_UNIT,P236131040_TYPE_2,P236131040_SUB_VOU_TYPE,P236131040_DOC_NO,P236131040_PARTY,P236131040_FROM_DATE,P236131040_TO_DATE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8250983427081232033)
,p_event_id=>wwv_flow_imp.id(8250983175963232031)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'ref'
,p_static_id=>'ref'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(34351984703320317872)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8124198420618819224)
,p_name=>'close modal for wait'
,p_static_id=>'close-modal-for-wait'
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P236131040_WFDC_ACT'
,p_condition_element=>'P236131040_WFDC_ACT'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'W'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8124198878917819228)
,p_event_id=>wwv_flow_imp.id(8124198420618819224)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'closeModal(''SUB'');')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8124199257383819228)
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
 p_id=>wwv_flow_imp.id(8124199819973819229)
,p_event_id=>wwv_flow_imp.id(8124199257383819228)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(34351984703320317872)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8124205715830819245)
,p_name=>'Forward Next Person'
,p_static_id=>'forward-next-person'
,p_event_sequence=>180
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P236131040_WFDC_NXT_FWD_PERS_1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8124206199725819248)
,p_event_id=>wwv_flow_imp.id(8124205715830819245)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P236131040_WFDC_NXT_MESSAGE',
  'items_to_submit', 'P236131040_WFDC_ACT,P236131040_WFDC_TYPE,P236131040_WFDC_NXT_STATUS,P236131040_WFDC_SEQ_NO,P236131040_WFDC_NXT_FWD_PERS,P236131040_WFDC_NXT_FWD_PERS_1,P236131040_WFDC_SELECT_FLAG,P236131040_WFDC_NXT_FWD_ENT,P236131040_WFDC_WF_NO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P236131040_WFDC_ACT =''R'' AND :P236131040_WFDC_NXT_FWD_PERS_1 IS NOT NULL THEN',
    '	',
    'DECLARE',
    '	',
    '  CURSOR c1 IS',
    '  SELECT NVL(MAX(wfaa_seq_no),0) wfaa_seq_no',
    '    FROM work_flow_appr_actvt',
    '   WHERE wfaa_bu = :GLOBAL_bu',
    '     AND wfaa_wf_id = :P236131040_WFDC_TYPE',
    '     AND wfaa_status = :P236131040_WFDC_NXT_STATUS; 	  ',
    '	  ',
    '	CURSOR c2(c_seq_no	NUMBER) IS',
    '   SELECT * FROM (',
    '   SELECT * FROM (',
    '  SELECT * ',
    '    FROM work_flow_appr_actvt',
    '   WHERE wfaa_bu         = :GLOBAL_bu',
    '     AND wfaa_wf_id      = :P236131040_WFDC_TYPE',
    '     AND wfaa_seq_no     > c_seq_no   ',
    '     AND :P236131040_WFDC_ACT       IN (''F'' ,''R'')',
    '  UNION ALL   ',
    '  SELECT * ',
    '    FROM work_flow_appr_actvt',
    '   WHERE wfaa_bu             = :GLOBAL_bu',
    '     AND wfaa_wf_id      = :P236131040_WFDC_TYPE',
    '     AND wfaa_seq_no     >= c_seq_no   +1',
    '     AND :P236131040_WFDC_ACT        = ''A'')',
    '     ORDER BY WFAA_SEQ_NO)',
    '   WHERE ROWNUM = 1;',
    '   ',
    '	CURSOR c3(c_seq_no NUMBER)',
    '	IS',
    '	SELECT *',
    '	  FROM work_flow_appr_actvt',
    '	 WHERE wfaa_bu					= :GLOBAL_bu',
    '	   AND wfaa_wf_id				= :P236131040_WFDC_TYPE',
    '	   AND wfaa_seq_no			= c_seq_no; ',
    '  ',
    '  CURSOR c4',
    '  IS',
    '  SELECT wfmc_allow_dir_appr_fwd_flag,',
    '         wfmc_allow_dir_rtn_to_cre',
    '    FROM wfm_control         ',
    '   WHERE wfmc_bu = :GLOBAL_bu;',
    '',
    '   CURSOR c5 IS ',
    '    SELECT *',
    '   FROM work_flow_doc_control',
    '  WHERE wfdc_bu = :global_bu  AND wfdc_select_flag = 1',
    '     AND ((wfdc_auth_type = ''P'' AND wfdc_ctrl_person = func_find_position_id(:global_bu, :global_user)) OR',
    '        (wfdc_auth_type = ''E'' AND wfdc_ctrl_person = :global_emp_id) OR',
    '	     func_find_wf_admin_user(:global_bu, :global_user) = ''Y'')',
    '   AND wfdc_status NOT IN(''C'',''R'');  ',
    '   ',
    '	cr1				c1%ROWTYPE;',
    '	cr2				c2%ROWTYPE;',
    '	cr3				c3%ROWTYPE;',
    '	cr4				c4%ROWTYPE;',
    '	',
    '	var_res				VARCHAR2(1);',
    '	v_nxt_proc		VARCHAR2(2);',
    '	v_condn				VARCHAR2(1)		:= ''Y'';',
    '	v_emp_id			VARCHAR2(10) 	:= :GLOBAL_emp_id;',
    '	v_appr_plnt		VARCHAR2(10);	  ',
    '	',
    'BEGIN',
    '',
    '',
    '',
    '	OPEN c1;',
    '	FETCH c1 INTO cr1;',
    '	',
    '	IF c1%FOUND THEN',
    '		',
    '				IF :P236131040_WFDC_ACT = ''R'' THEN',
    '					:P236131040_WFDC_NXT_MESSAGE := ''FOR RETURN'';',
    '				ELSIF :P236131040_WFDC_ACT = ''C'' THEN',
    '					:P236131040_WFDC_NXT_MESSAGE := ''FOR CANCEL'';',
    '			  END IF;',
    '		',
    '		OPEN c2(cr1.wfaa_seq_no);',
    '		FETCH c2 INTO cr2;',
    '		',
    '		IF c2%FOUND THEN',
    '		',
    '					',
    '				IF :P236131040_WFDC_ACT IN (''A'',''F'') THEN',
    '					:P236131040_WFDC_NXT_MESSAGE := ''FOR ''||cr2.wfaa_desc;',
    '				END IF;',
    '				',
    '			OPEN c3(cr1.wfaa_seq_no + 1);',
    '			FETCH c3 INTO cr3;',
    '				IF c3%FOUND THEN ',
    '					v_nxt_proc	:= cr3.wfaa_status;',
    '        IF :P236131040_WFDC_ACT = ''A'' THEN',
    '					:P236131040_WFDC_NXT_MESSAGE := ''FOR ''||cr3.wfaa_desc;',
    '				END IF;',
    '				ELSE',
    '					v_nxt_proc	:= NULL;',
    '				END IF;',
    '			CLOSE c3;',
    '         END IF;',
    '         	CLOSE c2;',
    '         END IF;',
    '            	CLOSE c1;',
    '               ',
    'FOR cr5 IN c5',
    'LOOP',
    'UPDATE work_flow_doc_control',
    '  SET wfdc_act = :P236131040_WFDC_ACT,',
    '      wfdc_select_flag  =:P236131040_WFDC_SELECT_FLAG,',
    '      wfdc_nxt_status = :P236131040_WFDC_NXT_STATUS,',
    '      wfdc_nxt_message = :P236131040_WFDC_NXT_MESSAGE,',
    '     -- wfdc_nxt_fwd_person = :P236131040_WFDC_NXT_FWD_PERS_1,',
    '      wfdc_nxt_fwd_entity = :P236131040_WFDC_NXT_FWD_ENT',
    'WHERE wfdc_bu = :GLOBAL_BU ',
    '  AND wfdc_wf_no = cr5.WFDC_WF_NO;  ',
    '  Commit; ',
    'END LOOP;  ',
    '         ',
    'END;',
    'END IF;',
    '',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8124193624045819213)
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
 p_id=>wwv_flow_imp.id(8124195584086819218)
,p_event_id=>wwv_flow_imp.id(8124193624045819213)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(8124180566247819085)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8124194634066819215)
,p_event_id=>wwv_flow_imp.id(8124193624045819213)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P236131040_SEQ_NO',
  'items_to_submit', 'P236131040_WFDC_SELECT_FLAG,P236131040_WFDC_WF_NO,P236131040_WFDC_CARD_TYPE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '/* Formatted on 11/20/2020 10:32:22 AM (QP5 v5.163.1008.3004) */',
    '--raise_application_error(-20999,''12354''||''/''||:P236131040_WFDC_CARD_TYPE||''/''||:P236131040_WFDC_WF_NO);',
    'if :P236131040_WFDC_CARD_TYPE = ''C'' then',
    '        UPDATE work_flow_doc_control',
    '          SET wfdc_select_flag = 0,',
    '              wfdc_upd_by = :Global_user,',
    '              wfdc_upd_date = sysdate',
    '        WHERE     wfdc_bu = :global_bu',
    '       AND wfdc_select_flag = 1;',
    '       --AND wfdc_wf_no = :P236131040_WFDC_WF_NO;',
    'END IF;',
    '',
    'IF :P236131040_WFDC_SELECT_FLAG = 0 THEN',
    '',
    '--raise_application_error(-20999,''1''||:P236131040_WFDC_SELECT_FLAG||:P236131040_WFDC_WF_NO);',
    '',
    'UPDATE work_flow_doc_control',
    '   SET wfdc_select_flag = 1',
    ' WHERE     wfdc_bu = :global_bu',
    '       AND wfdc_select_flag = 0',
    '       AND wfdc_wf_no = :P236131040_WFDC_WF_NO;',
    '',
    'COMMIT;',
    'select distinct wfdc_select_flag ',
    'into ',
    ':p236131040_seq_no',
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
    '       AND wfdc_wf_no = :p236131040_wfdc_wf_no;',
    'COMMIT;',
    '',
    ':p236131040_seq_no := 0;',
    'END IF;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8124194098268819213)
,p_event_id=>wwv_flow_imp.id(8124193624045819213)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item( "P236131040_WFDC_SELECT_FLAG" ).setValue( this.data.WFDC_SELECT_FLAG );',
    'apex.item( "P236131040_WFDC_WF_NO" ).setValue( this.data.WFDC_WF_NO);',
    'apex.item( "P236131040_WFDC_CARD_TYPE" ).setValue( this.data.WFDC_CARD_TYPE);',
    'console.log(''1''+this.data.WFDC_CARD_TYPE);',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8124195124740819217)
,p_event_id=>wwv_flow_imp.id(8124193624045819213)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236131040_SEQ_NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8124196083491819220)
,p_event_id=>wwv_flow_imp.id(8124193624045819213)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(34351984703320317872)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8124196514800819220)
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
 p_id=>wwv_flow_imp.id(8124196998089819221)
,p_event_id=>wwv_flow_imp.id(8124196514800819220)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P236131040_WFDC_SELECT_FLAG,P236131040_WFDC_WF_NO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '/* Formatted on 11/20/2020 10:32:22 AM (QP5 v5.163.1008.3004) */',
    'IF :P236131040_WFDC_SELECT_FLAG = 0 THEN',
    '',
    '--raise_application_error(-20999,''1''||:P236131040_WFDC_SELECT_FLAG||:P236131040_WFDC_WF_NO);',
    '',
    'UPDATE work_flow_doc_control',
    '   SET wfdc_select_flag = 1',
    ' WHERE     wfdc_bu = :global_bu',
    '       AND wfdc_select_flag = 0;',
    '       --AND wfdc_wf_no = :P236131040_WFDC_WF_NO;',
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
    '       --AND wfdc_wf_no = :p236131040_wfdc_wf_no;',
    'COMMIT;',
    '',
    '',
    'END IF;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8124197971729819223)
,p_event_id=>wwv_flow_imp.id(8124196514800819220)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item( "P236131040_WFDC_SELECT_FLAG" ).setValue( this.data.WFDC_SELECT_FLAG );',
    '//apex.item( "P236131040_WFDC_WF_NO" ).setValue( this.data.WFDC_WF_NO);',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8124197491445819221)
,p_event_id=>wwv_flow_imp.id(8124196514800819220)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(34351984703320317872)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8124204833090819243)
,p_name=>'P236131040_TYPE'
,p_static_id=>'p236131040-type'
,p_event_sequence=>140
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P236131040_TYPE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8124205291961819245)
,p_event_id=>wwv_flow_imp.id(8124204833090819243)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(34351984703320317872)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8124200143732819232)
,p_name=>'P236131040_WF_SRCH'
,p_static_id=>'p236131040-wf-srch'
,p_event_sequence=>130
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P236131040_WF_SRCH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keyup'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8124200732660819232)
,p_event_id=>wwv_flow_imp.id(8124200143732819232)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(13638780516532752399)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8124206516528819248)
,p_name=>'Page load Process Refresh'
,p_static_id=>'page-load-process-refresh'
,p_event_sequence=>170
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8124206967891819249)
,p_event_id=>wwv_flow_imp.id(8124206516528819248)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(34351984703320317872)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8124190789163819193)
,p_name=>'process radio group'
,p_static_id=>'process-radio-group'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P236131040_WFDC_ACT'
,p_condition_element=>'P236131040_WFDC_ACT'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8124191260308819203)
,p_event_id=>wwv_flow_imp.id(8124190789163819193)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P236131040_WFDC_TYPE,P236131040_WFDC_CTRL_PERSON,P236131040_WFDC_SEQ_NO,P236131040_WFDC_SELECT_FLAG,P236131040_WFDC_NXT_FWD_ENT,P236131040_WFDC_NXT_FWD_PLNT,P236131040_WFDC_NXT_FWD_NM,P236131040_WFDC_NXT_MESSAGE,P236131040_WFDC_NXT_STATUS,P236131040_'
||'WFDC_NXT_STAT_DES,P236131040_WFDC_WF_NO',
  'items_to_submit', 'P236131040_WFDC_ACT',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Declare',
    'v_cnt    number;',
    'v_rtn_cnt varchar2(15);',
    'v_err varchar2(500);',
    'CURSOR c1',
    '   IS  SELECT *',
    '        FROM work_flow_doc_control',
    '       WHERE wfdc_bu = :global_bu  AND WFDC_ADMIN_SELECT_FLAG = 1 ',
    '         AND wfdc_status NOT IN (''C'', ''R'');',
    'Begin ',
    'FOR cr1 IN c1 LOOP',
    '',
    'SELECT COUNT (*) into v_cnt',
    '  FROM (  SELECT COUNT (*), WFDC_TYPE FROM work_flow_doc_control',
    '   WHERE wfdc_bu = :global_bu AND WFDC_ADMIN_SELECT_FLAG = 1',
    'AND wfdc_status NOT IN (''C'', ''R'')',
    '        GROUP BY WFDC_TYPE);',
    'If v_cnt > 1 then',
    '',
    'UPDATE work_flow_doc_control',
    '   SET WFDC_ADMIN_SELECT_FLAG = 0',
    ' WHERE wfdc_bu = :GLOBAL_BU AND WFDC_ADMIN_SELECT_FLAG = 1;',
    ' commit; ',
    ' raise_application_error(-20999,''Please select one particular workflow type to proceed the process'');',
    'else  :P236131040_WFDC_TYPE := cr1.WFDC_TYPE ;',
    '  :P236131040_WFDC_CTRL_PERSON := cr1.WFDC_CTRL_PERSON ;',
    '  :P236131040_WFDC_SEQ_NO := cr1.WFDC_SEQ_NO  ;',
    '  If (:P236131040_WFDC_ACT = ''R'') then',
    '    :P236131040_WFDC_WF_NO := cr1.WFDC_WF_NO;',
    '    End if; ',
    ' PROC_WF_RADIO_CHANGE_APEX_WEB (',
    '   p_bu          => :global_bu,',
    '   p_user        => :global_user,',
    '   p_WFDC_TYPE   => cr1.WFDC_TYPE,',
    '   p_WFDC_STATUS => cr1.WFDC_STATUS,',
    '   p_WFDC_ACT    => :P236131040_WFDC_ACT,',
    '   p_WFDC_PLNT   => cr1.WFDC_PLNT,',
    '   p_WFDC_VALUE  => cr1.WFDC_VALUE,',
    '   P_WFDC_WF_NO  => cr1.WFDC_WF_NO,',
    '   P_WFDC_SEQ_NO => cr1.WFDC_SEQ_NO,    ',
    '   P_WFDC_CTRL_PERSON             => cr1.WFDC_CTRL_PERSON,',
    '   P_WFDC_SRC_BU => cr1.WFDC_SRC_BU,     ',
    '   P_WFDC_DOC_PFX=> cr1.WFDC_DOC_PFX,',
    '   P_WFDC_DOC_NO => cr1.WFDC_DOC_NO,',
    '   p_WFDC_SELECT_FLAG             => :P236131040_WFDC_SELECT_FLAG,',
    '   p_WFDC_NXT_STATUS              => :P236131040_WFDC_NXT_STATUS,',
    '   p_WFDC_NXT_STATUS_DESC         => :P236131040_WFDC_NXT_STAT_DES,',
    '   p_WFDC_NXT_MESSAGE             => :P236131040_WFDC_NXT_MESSAGE,',
    '   P_WFDC_NXT_FWD_PERSON          => :P236131040_WFDC_NXT_FWD_PERS,',
    '   P_WFDC_NXT_FWD_ENTITY          => :P236131040_WFDC_NXT_FWD_ENT,',
    '   P_WFDC_NXT_FWD_PLNT            => :P236131040_WFDC_NXT_FWD_PLNT,',
    '   P_WFDC_NXT_FWD_PERSON_NM       => :P236131040_WFDC_NXT_FWD_NM);',
    '',
    '--Raise_Application_Error(-20999,:P236131040_WFDC_NXT_FWD_PERS);',
    'UPDATE work_flow_doc_control',
    '  SET wfdc_act = :P236131040_WFDC_ACT,',
    '      WFDC_ADMIN_SELECT_FLAG  =:P236131040_WFDC_SELECT_FLAG,',
    '      wfdc_nxt_status = :P236131040_WFDC_NXT_STATUS,',
    '      wfdc_nxt_message = :P236131040_WFDC_NXT_MESSAGE,',
    '     -- wfdc_nxt_fwd_person = :P236131040_WFDC_NXT_FWD_PERS,',
    '      wfdc_nxt_fwd_entity = :P236131040_WFDC_NXT_FWD_ENT',
    'WHERE wfdc_bu = :GLOBAL_BU ',
    '  AND wfdc_wf_no = cr1.WFDC_WF_NO;  ',
    'COMMIT;',
    '  ',
    '  End If; ',
    '  End loop;  ',
    '  EXCEPTION WHEN OTHERS THEN proc_apex_err_msg_log(236131040,SQLERRM);',
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
 p_id=>wwv_flow_imp.id(8124191743096819207)
,p_event_id=>wwv_flow_imp.id(8124190789163819193)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(34351984703320317872)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8250982979616232029)
,p_name=>'ref'
,p_static_id=>'ref'
,p_event_sequence=>190
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(8250959713559227153)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8250983085503232030)
,p_event_id=>wwv_flow_imp.id(8250982979616232029)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(34351984703320317872)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7318336519849927403)
,p_event_id=>wwv_flow_imp.id(8250982979616232029)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(34351984703320317872)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8124192201690819210)
,p_name=>'show/hide_fwd'
,p_static_id=>'show-hide-fwd'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P236131040_WFDC_ACT'
,p_condition_element=>'P236131040_WFDC_ACT'
,p_triggering_condition_type=>'IN_LIST'
,p_triggering_expression=>'F'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8124192682148819210)
,p_event_id=>wwv_flow_imp.id(8124192201690819210)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236131040_WFDC_NXT_FWD_PERS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8124193165133819212)
,p_event_id=>wwv_flow_imp.id(8124192201690819210)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236131040_WFDC_NXT_MESSAGE,P236131040_WFDC_NXT_FWD_PERS'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8124202480166819238)
,p_name=>'show/hide_msg'
,p_static_id=>'show-hide-msg'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P236131040_WFDC_ACT'
,p_condition_element=>'P236131040_WFDC_ACT'
,p_triggering_condition_type=>'IN_LIST'
,p_triggering_expression=>'R,F'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8124202967943819240)
,p_event_id=>wwv_flow_imp.id(8124202480166819238)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236131040_WFDC_NXT_MESSAGE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8124203485481819240)
,p_event_id=>wwv_flow_imp.id(8124202480166819238)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236131040_WFDC_NXT_MESSAGE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8124201112324819235)
,p_name=>'show/hide_rtn'
,p_static_id=>'show-hide-rtn'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P236131040_WFDC_ACT'
,p_condition_element=>'P236131040_WFDC_ACT'
,p_triggering_condition_type=>'IN_LIST'
,p_triggering_expression=>'R'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8124201602660819237)
,p_event_id=>wwv_flow_imp.id(8124201112324819235)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236131040_WFDC_NXT_FWD_PERS_1'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8124202051720819238)
,p_event_id=>wwv_flow_imp.id(8124201112324819235)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236131040_WFDC_NXT_FWD_PERS_1'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8124187152200819174)
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
'',
'         UPDATE work_flow_doc_control',
'            SET WFDC_ADMIN_SELECT_FLAG = 1',
'          WHERE     wfdc_bu = :global_bu',
'                AND wfdc_wf_no = APEX_APPLICATION.G_X02;',
' COMMIT;',
'--end loop;',
'    ELSIF APEX_APPLICATION.G_X03  = 0',
'      THEN',
' ',
'         UPDATE work_flow_doc_control',
'            SET WFDC_ADMIN_SELECT_FLAG = 0,',
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
,p_internal_uid=>2642225316657208146
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8124188348149819176)
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
'             WHEN WFDC_ADMIN_SELECT_FLAG = 0 THEN 0',
'             WHEN WFDC_ADMIN_SELECT_FLAG = 1 THEN 1',
'             ELSE 01',
'          END',
'             FLAG',
'     INTO V_FLAG',
'     FROM (  SELECT LISTAGG (DISTINCT WFDC_ADMIN_SELECT_FLAG, '','')',
'                       WITHIN GROUP (ORDER BY WFDC_ADMIN_SELECT_FLAG)',
'                       WFDC_ADMIN_SELECT_FLAG',
'              FROM work_flow_doc_control a',
'             WHERE wfdc_bu = :GLOBAL_BU);',
'          ',
'  SELECT NVL(COUNT(WFDC_ADMIN_SELECT_FLAG),0)',
'    INTO V_COUNT',
'    FROM work_flow_doc_control a',
'   WHERE wfdc_bu = :GLOBAL_BU ',
'     AND WFDC_ADMIN_SELECT_FLAG = 1;',
'          ',
' HTP.P (V_FLAG || ''-'' || V_COUNT || ''-'' ||APEX_APPLICATION.G_X03||'' ''|| ''Row Selected'');          ',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>2642226512606208148
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8124189219955819178)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Print'
,p_static_id=>'print'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'	CURSOR c1 IS',
'	  SELECT wfm_report_id,substr(wfm_report_id,1,3) wfm_report_module,wfm_bus_proc_id',
'	    FROM work_flow_master',
'     WHERE wfm_bu =  :Global_bu',
'       AND wfm_bus_proc_id = :P236131040_PRNT_WF_TYPE;',
' ',
'  cr1 c1%rowtype;',
'  v_sales_currency varchar2(15);',
'  v_sales_exp_rpt varchar2(15);',
'  ',
'BEGIN',
'',
'   ',
'	OPEN c1;',
'	FETCH c1 INTO cr1;',
'',
'	  IF cr1.wfm_report_id IS NULL THEN',
'	    	--raise_application_error(-20999,cr1.wfm_report_id||'' - Report ID not found.'');',
'          	raise_application_error(-20999,:P236131040_PRNT_WF_TYPE||''/''||''Report ID not found.'');',
'	  ELSE',
'         IF cr1.wfm_bus_proc_id = ''WF_SIA_REV'' THEN',
'          :P236131040_PRNT_URL := :JASPER_REPORT_URL1||''/''||cr1.wfm_report_module||:JASPER_REPORT_URL2||''/''||cr1.wfm_report_module||''/''||cr1.wfm_report_id||''&p_bu=''||:GLOBAL_BU||''&p_plnt=''||NVL(:P236131040_PRNT_SRC_PLNT,:P236131040_PRNT_PLNT)||''&p_in'
||'v_pfx=''||:P236131040_PRNT_DOC_PFX||''&p_inv_no=''||:P236131040_PRNT_DOC_NO||''&p_prod_id=''||:P236131040_PRNT_PROD_ID||''&p_prod_rev=''||:P236131040_PRNT_PROD_REV||''&p_suplr_id=''||:P236131040_PRNT_SUPLR_ID||''&p_user=''||:GLOBAL_USER||''&p_lang=1''||''&j_userna'
||'me=''||:JASPER_REPORT_USR_ID||''&j_password=''||:JASPER_REPORT_USR_ID||''&output=pdf''; --JASPER_REPORT_PWD',
'        ELSE',
'          :P236131040_PRNT_URL := :JASPER_REPORT_URL1||''/''||cr1.wfm_report_module||:JASPER_REPORT_URL2||''/''||cr1.wfm_report_module||''/''||cr1.wfm_report_id||''&p_bu=''||:GLOBAL_BU||''&p_plnt=''||NVL(:P236131040_PRNT_SRC_PLNT,:P236131040_PRNT_PLNT)||''&p_do'
||'c_pfx=''||:P236131040_PRNT_DOC_PFX||''&p_doc_no=''||:P236131040_PRNT_DOC_NO||''&p_prod_id=''||:P236131040_PRNT_PROD_ID||''&p_prod_rev=''||:P236131040_PRNT_PROD_REV||''&p_suplr_id=''||:P236131040_PRNT_SUPLR_ID||''&p_vou_pfx=''||:P236131040_PRNT_DOC_PFX||''&p_vou_'
||'no=''||:P236131040_PRNT_DOC_NO||''&p_user=''||:GLOBAL_USER||''&p_lang=1''||''&j_username=''||:JASPER_REPORT_USR_ID||''&j_password=''||:JASPER_REPORT_USR_ID||''&output=pdf''; --JASPER_REPORT_PWD',
'        END IF;',
'     END IF;',
'   ',
'   CLOSE c1;',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>2642227384412208150
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8124189579740819181)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Print_1'
,p_static_id=>'print-2'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'',
'v_curr   VARCHAR2(30);',
'BEGIN',
'',
'BEGIN',
'SELECT poh_currency',
'  INTO v_curr',
'  FROM (',
'SELECT poh_currency',
'  FROM pur_order_hd',
' WHERE poh_bu = :GLOBAL_bu',
'   AND poh_order_no =:P236131040_PRNT_DOC_NO',
'UNION ALL ',
'SELECT porh_currency poh_currency',
'  FROM pur_ord_receipt_hd_view',
' WHERE porh_bu = :GLOBAL_bu',
'   AND porh_receipt_no = :P236131040_PRNT_DOC_NO',
'   AND porh_mode = ''PR''',
'UNION ALL',
'SELECT poh_currency',
'  FROM pur_order_hd_vw,',
'       po_amend_hd',
' WHERE poh_bu = pah_bu',
'   AND poh_plant = pah_plnt',
'   AND poh_order_no = pah_po_no',
'   AND poh_bu = :GLOBAL_bu',
'   AND pah_doc_no =:P236131040_PRNT_DOC_NO',
'UNION ALL',
'SELECT rfqsup_suplr_curcy poh_currency',
'  FROM rfq_hd,',
'       rfq_suplr',
' WHERE rfqhd_bu = rfqsup_bu',
'   AND rfqhd_rfq_no = rfqsup_rfq_no',
'   AND rfqhd_bu = :GLOBAL_bu',
'   AND rfqhd_rfq_no =:P236131040_PRNT_DOC_NO',
'UNION ALL ',
'SELECT sihd_currency poh_currency',
'  FROM sales_invoices_hd',
' WHERE sihd_bu = :GLOBAL_bu',
'   AND sihd_doc_no  = :P236131040_PRNT_DOC_NO',
'   AND sihd_type IN  (''SIG'',''SIT'',''SISUP'',''SISCR'',''SIS'',''SIDE'',''SIFA'',''SIFR'',''SIFS'')',
'UNION ALL ',
'SELECT soh_currency poh_currency',
'  FROM sales_order_hd',
' WHERE soh_bu = :GLOBAL_bu',
'   AND soh_order_pfx  = :P236131040_PRNT_DOC_PFX',
'   AND soh_order_no  = :P236131040_PRNT_DOC_NO',
'   AND soh_order_type NOT IN (''LI'',''LE'',''RB'',''RP'',''LO'',''LW'',''ER'',''IR'',''SE'',''JWOG'',''JWOR''));',
'EXCEPTION WHEN NO_DATA_FOUND THEN',
' NULL;',
'END;',
'',
':GLOBAL_RPT_PLNT     := NVL(:P236131040_PRNT_SRC_PLNT,:P236131040_PRNT_PLNT);',
':GLOBAL_RPT_VOU_NO   := :P236131040_PRNT_DOC_NO;',
':GLOBAL_RPT_VOU_PFX  := :P236131040_PRNT_DOC_PFX;',
':GLOBAL_RPT_SUB_VOU  := NVL(:P236131040_PRNT_WF_TYPE,''RPTITM'');',
':GLOBAL_RPT_PARTY    := NVL(:P236131040_PRNT_SUPLR_ID,NULL);',
':GLOBAL_RPT_PROD_ID  := NVL(:P236131040_PRNT_PROD_ID,NULL);',
':GLOBAL_RPT_PROD_REV := NVL(:P236131040_PRNT_PROD_REV,NULL);',
'--:GLOBAL_RPT_TYPE   := NVL(''N'',''DM'');',
'',
'',
'',
'IF v_curr IS NOT NULL THEN',
'IF v_curr = func_find_base_currency(:global_bu) THEN',
'   :GLOBAL_RPT_TYPE  :=''DM'';',
'ELSif v_curr <> func_find_base_currency(:global_bu) THEN',
'    :GLOBAL_RPT_TYPE :=''EX'';',
'ELSIF :P236131040_PRNT_WF_TYPE = ''RPTITM'' THEN',
'    :GLOBAL_RPT_TYPE :=''N'';',
'END IF;',
'ELSE :GLOBAL_RPT_TYPE :=''N'';',
'END IF;',
'',
'',
'',
'END;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'PRINT'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>2642227744197208153
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8124186786892819153)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process For Document Approval'
,p_static_id=>'process-for-document-approval'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Declare',
'v_cnt    number;',
'v_rtn_cnt varchar2(15);',
'v_err varchar2(500);',
'CURSOR c1 IS',
'SELECT *',
'  FROM work_flow_doc_control',
' WHERE wfdc_bu = :global_bu  ',
'   AND wfdc_admin_select_flag = 1',
'   AND wfdc_status NOT IN (''C'', ''R'');',
'   ',
'Begin ',
'FOR cr1 IN c1 LOOP',
'',
'IF :P236131040_WFDC_ACT =''R'' THEN',
'UPDATE work_flow_doc_control',
'  SET wfdc_nxt_fwd_person = :P236131040_WFDC_NXT_FWD_PERS_1',
'WHERE wfdc_bu = :GLOBAL_BU ',
'  AND wfdc_wf_no = cr1.WFDC_WF_NO;',
'ELSIF :P236131040_WFDC_ACT =''F'' THEN',
'UPDATE work_flow_doc_control',
'  SET wfdc_nxt_fwd_person = :P236131040_WFDC_NXT_FWD_PERS',
'WHERE wfdc_bu = :GLOBAL_BU ',
'  AND wfdc_wf_no = cr1.WFDC_WF_NO;',
'  END IF;',
'END LOOP  ;',
'',
'END;',
'',
'DECLARE ',
'v_doc_cnt    NUMBER(5);',
'BEGIN',
'',
'	SELECT COUNT(*)cnt INTO v_doc_cnt',
'	FROM WORK_FLOW_DOC_CONTROL',
'	WHERE WFDC_BU = :global_bu',
'	AND wfdc_ADMIN_select_flag = 1;',
'',
'IF v_doc_cnt = 0 THEN',
'RAISE_APPLICATION_ERROR(-20999,''Select one document to process.''||:global_user||''~''||:global_emp_id);',
'END IF;',
'END;',
'',
'/* Formatted on 8/1/2022 4:02:56 PM (QP5 v5.163.1008.3004) */',
'DECLARE',
'   CURSOR c0',
'   IS',
'      SELECT *',
'        FROM work_flow_doc_control',
'       WHERE wfdc_bu = :GLOBAL_bu',
'         AND wfdc_admin_select_flag = 1',
'         AND wfdc_status NOT IN (''C'', ''R'')',
'         AND wfdc_act <> ''W''; ',
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
' WHERE :P236131040_wfdc_act IN (''A'', ''F'')',
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
'                         AND wfdcl_type = c_wfdc_type --AND wfdcl_wf_no = :P236131040_wfdc_wf_no',
'                AND wfdcl_ctrl_person <> c_wfdc_ctrl_person',
'                GROUP BY wfdcl_ctrl_person, wfdcl_auth_type,wfdcl_bu,wfdcl_plnt',
'                ORDER BY 2))',
' WHERE :P236131040_wfdc_act = ''R''',
' )',
' where emp1 = NVL(:P236131040_WFDC_NXT_FWD_PERS,:P236131040_WFDC_NXT_FWD_PERS_1);',
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
'   LOOP ',
'	FOR cr4 IN c4(cr0.WFDC_SEQ_NO,cr0.wfdc_type,cr0.wfdc_ctrl_person)',
'   LOOP   ',
'	 /*Forward */',
'      IF :P236131040_wfdc_act = ''F'' then',
'      UPDATE work_flow_doc_control',
'         SET ',
'                 ---wfdc_nxt_fwd_person = NVL(:P236131040_WFDC_NXT_FWD_PERS,:P236131040_WFDC_NXT_FWD_PERS_1),         ',
'                      wfdc_nxt_fwd_entity = cr4.appr_bu1,',
'                      wfdc_nxt_fwd_plnt = cr4.user_unit1,',
'                      wfdc_message = :P236131040_WFDC_NXT_MESSAGE',
'       WHERE wfdc_bu = :global_bu AND wfdc_admin_select_flag = 1 AND wfdc_act = ''F'';',
'',
'      ELSIF :P236131040_wfdc_act =''R''THEN',
'',
'      /*Return */',
'      UPDATE work_flow_doc_control',
'         SET wfdc_nxt_fwd_person = NVL(:P236131040_WFDC_NXT_FWD_PERS,:P236131040_WFDC_NXT_FWD_PERS_1),',
'             wfdc_nxt_message = :P236131040_WFDC_NXT_MESSAGE',
'       WHERE wfdc_bu = :global_bu AND wfdc_admin_select_flag = 1 AND wfdc_act = ''R'';',
'',
'      END IF; ',
'	END LOOp c4;	',
'',
'      IF cr0.wfdc_act = ''F''',
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
'          WHERE WFDC_BU = :GLOBAL_BU AND wfdc_admin_select_flag = 1',
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
'         AND wfdc_admin_select_flag = 1',
'         AND WFDC_ACT NOT IN (''W''); ',
'',
'     /* IF V_CNT = 0',
'      THEN',
'         Raise_Application_Error (-20999, ''APX'' || ''SELECT'', ''CONFIRM'');',
'      END IF;command by balamurali*/',
'',
'      FOR cr1 IN c1',
'      LOOP',
'',
'         IF cr1.wfdc_act = ''F''',
'         THEN',
'            IF v_wf_control = ''S'' THEN',
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
'            OPEN c2 (cr1.wfdc_type, v_seq_no);',
'            FETCH c2 INTO cr2;',
'            CLOSE c2;',
'',
'--Raise_Application_Error(-20999,:P236131040_WFDC_NXT_FWD_PERS);',
'            UPDATE WORK_FLOW_DOC_CONTROL',
'            SET wfdc_nxt_fwd_person = :P236131040_WFDC_NXT_FWD_PERS',
'          WHERE     WFDC_BU = cr1.wfdc_bu',
'                AND WFDC_TYPE = cr1.wfdc_type',
'                AND WFDC_WF_NO = cr1.wfdc_wf_no;',
' ',
'               proc_wf_doc_forward_frm_admin (cr1.wfdc_bu,',
'                                    cr1.wfdc_plnt,',
'                                    cr1.wfdc_type,',
'                                    cr1.wfdc_doc_pfx,',
'                                    cr1.wfdc_doc_no,',
'                                    cr1.wfdc_wf_no,',
'                                    :GLOBAL_user,',
'                                     :global_emp_id,',
'                                    var_msg,',
'                                    v_fwd_res);',
'',
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
'                                   :GLOBAL_EMP_ID,',
'                                   v_rtn_res,',
'                                   ''Y'');',
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
'                                      :GLOBAL_EMP_ID,',
'                                      v_rtn_res,',
'                                      ''Y'');',
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
'            SET wfdc_admin_select_flag = 0,',
'                wfdc_act = ''W'',',
'                wfdc_mail_send_flag = ''N'',',
'                wfdc_nxt_status = NULL,',
'                wfdc_nxt_fwd_person = NULL,',
'                wfdc_nxt_message = NULL',
'          WHERE wfdc_bu = NVL (cr0.WFDC_SRC_BU, :GLOBAL_BU)',
'            AND wfdc_wf_no = cr1.WFDC_WF_NO;',
'',
'',
'      END LOOP;',
'',
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
'            proc_wf_send_mail (:GLOBAL_bu, :GLOBAL_user);',
'         APEX_APPLICATION.g_print_success_message :=',
'            ''<span style="color:white"> Document is Forwarded.</span>'';',
'      END IF;',
'',
'      IF v_rtn_res = ''Y''',
'      THEN',
'         APEX_APPLICATION.g_print_success_message := ''<span style="color:white"> Document is Returned.</span>'';',
'      END IF;',
'',
'   END;',
'END LOOP;  ',
'    EXCEPTION WHEN OTHERS THEN',
'      proc_apex_err_msg_log(:GLOBAL_PAGE_ID,SQLERRM);',
'END;',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(8124144585244818520)
,p_internal_uid=>2642224951349208125
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8124188749123819176)
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
'	and WFDC_admin_SELECT_FLAG > 0;',
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
,p_process_when_button_id=>wwv_flow_imp.id(8124180566247819085)
,p_internal_uid=>2642226913580208148
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8124187632623819174)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SELECTALL'
,p_static_id=>'selectall'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'       UPDATE work_flow_doc_control',
'          SET WFDC_ADMIN_SELECT_FLAG = 1',
'        WHERE wfdc_bu = :global_bu',
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
,p_internal_uid=>2642225797080208146
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8124188028419819174)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'UNSELECTALL'
,p_static_id=>'unselectall'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--raise_application_error(-20999,''test'');',
'BEGIN',
'       UPDATE work_flow_doc_control',
'          SET WFDC_ADMIN_SELECT_FLAG = 0',
'        WHERE wfdc_bu = :global_bu',
'          and WFDC_ADMIN_SELECT_FLAG = 1;',
'COMMIT;',
'      HTP.P(''success'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>2642226192876208146
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8124189972585819182)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Workflow'
,p_static_id=>'workflow'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--RAISE_APPLICATION_ERROR(-20999,:P236131040_WFDC_TYPE||''/''||:P236131040_WFDC_SEQ_NO);',
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
'   --AND wfdc_wf_no = :P236131040_WFDC_WF_NO;',
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
' WHERE :P236131040_wfdc_act IN (''A'', ''F'')',
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
'                         AND wfdcl_type = c_wfdc_type --AND wfdcl_wf_no = :P236131040_wfdc_wf_no',
'                AND wfdcl_ctrl_person <> c_wfdc_ctrl_person',
'                GROUP BY wfdcl_ctrl_person, wfdcl_auth_type,wfdcl_bu,wfdcl_plnt',
'                ORDER BY 2))',
' WHERE :P236131040_wfdc_act = ''R''',
' )',
' where emp1 = :P236131040_WFDC_NXT_FWD_PERS;',
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
'   --RAISE_APPLICATION_ERROR(-20999,''TEST1''||''person''||:P236131040_FWD_PERSON||''msg''||:wfdc_nxt_message);',
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
'      IF :P236131040_wfdc_act = ''F'' then',
'      UPDATE work_flow_doc_control',
'         SET wfdc_nxt_fwd_person = :P236131040_WFDC_NXT_FWD_PERS,         ',
'                      wfdc_nxt_fwd_entity = cr4.appr_bu1,',
'                      wfdc_nxt_fwd_plnt = cr4.user_unit1,',
'                      wfdc_message = :P236131040_WFDC_NXT_MESSAGE',
'       WHERE wfdc_bu = :global_bu AND wfdc_select_flag = 1 AND wfdc_act = ''F'';',
'End if;',
'',
'      /*Return */',
'      UPDATE work_flow_doc_control',
'         SET wfdc_nxt_fwd_person = :P236131040_WFDC_NXT_FWD_PERS,',
'             wfdc_nxt_message = :P236131040_WFDC_NXT_MESSAGE',
'       WHERE wfdc_bu = :global_bu AND wfdc_select_flag = 1 AND wfdc_act = ''R'';',
'',
'      --RAISE_APPLICATION_ERROR(-20999,''''||''person''||:P236131040_WFDC_NXT_FWD_PERS);',
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
'   :P236131040_MSG :=  v_err;',
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
,p_process_success_message=>'&P236131040_MSG.'
,p_internal_uid=>2642228137042208154
);
wwv_flow_imp.component_end;
end;
/
