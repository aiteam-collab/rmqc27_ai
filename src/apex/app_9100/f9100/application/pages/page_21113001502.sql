prompt --application/pages/page_21113001502
begin
--   Manifest
--     PAGE: 21113001502
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
 p_id=>21113001502
,p_name=>'Application Users'
,p_alias=>'CREATE-USERS'
,p_step_title=>'Application Users'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function save(a) { ',
'    apex.message.clearErrors();',
'    var verror = validation(); apex.message.alert(''1''+verror);',
'    if (verror !==''undefined''){ apex.message.alert(''2''+verror);',
'    apex.server.process',
'    (  ',
'        "SAVE", ',
'        {     ',
'          x01: a,',
'          pageItems:''#P21113001502_APPLUSER_ID,#P21113001502_PASSWORD,#P21113001502_APPLUSER_USER_TYPE,#P21113001502_APPLUSER_EMP_ID,#P21113001502_APPLUSER_CUST_ID,#P21113001502_APPLUSER_SUPLR_ID,#P21113001502_APPLUSER_MOBILE_NO,#P21113001502_APPLUSE'
||'R_EMAIL_ID,#P21113001502_APPLUSER_EFF_FROM,#P21113001502_APPLUSER_EFF_TO,#P21113001502_APPLUSER_POS_ID,#P21113001502_APPLUSER_DEPT_ID,#P21113001502_APPLUSER_PARTY_ID''',
'        },',
'        {',
'            dataType: ''text'', ',
'            success: function (data) { ',
'                //apex.message.clearErrors();',
'                 if (data.trim() !== ''success'') {',
'                    apex.message.showErrors([{ type: "error", location: "page", message: data.replace(''sqlerrm:ORA-20999: '', ''''), unsafe: false }]);',
'                } ',
'                else {',
'                    console.log(''success'', data);',
'                    apex.region("user").refresh();',
'                    apex.message.showPageSuccess("Record Changed.");',
'                } ',
'            }',
'        }',
'    );',
'    };',
'};',
'',
'function save1(a) { ',
'    apex.message.clearErrors();',
'    apex.server.process',
'    (  ',
'        "SAVE1", ',
'        { },',
'        {dataType: ''text'', ',
'            success: function (data) { ',
'               if (data){ apex.message.alert(data);',
'               apex.message.showErrors([{ type: "error", ',
'                        location: ["page", "inline"],',
'                        pageItem: ''P21113001502_APPLUSER_ID'',',
'                        message: data, ',
'                        unsafe: false }]);  ',
'               }',
'',
'            } ',
'            }',
'    );',
'};',
'',
'',
'function validation() {',
'   var errorval ;',
'    /*User Id*/',
'    apex.server.process(''USER_NAME_VALID'',{  ',
'          pageItems:''#P21113001502_APPLUSER_ID,#P21113001502_ROWID''',
'        },',
'    {',
'    dataType: ''text'', ',
'    success: function (data) { ',
'       if (data.trim() !== ''success'') { ',
'          showError("P21113001502_APPLUSER_ID",data);',
'          errorval = 1;',
'       }',
'    }',
'    }',
'    );',
'   ',
'    /*Password*/',
'    apex.server.process(''PASSWORD_VALID'',{  ',
'          pageItems:''#P21113001502_PASSWORD,#P21113001502_ROWID''',
'        },',
'    {',
'    dataType: ''text'', ',
'    success: function (data) { ',
'       if (data.trim() !== ''success'') { ',
'          errorval = 1;',
'          showError("P21113001502_PASSWORD",data);',
'       }',
'    }',
'    }',
'    );',
'',
'    /*Confirm Password*/',
'    apex.server.process(''CONFRIM_PASSWORD_VALID'',{  ',
'          pageItems:''#P21113001502_PASSWORD_2,#P21113001502_ROWID''',
'        },',
'    {',
'    dataType: ''text'', ',
'    success: function (data) { ',
'       if (data.trim() !== ''success'') { ',
'          errorval = 1;',
'          showError("P21113001502_PASSWORD_2",data);',
'       }',
'    }',
'    }',
'    );',
'',
'    /*Employee*/',
'    apex.server.process(''EMPLOYEE_VALID'',{  ',
'          pageItems:''#P21113001502_APPLUSER_EMP_ID,#P21113001502_APPLUSER_SUPLR_ID,#P21113001502_APPLUSER_CUST_ID,#P21113001502_ROWID,#P21113001502_APPLUSER_USER_TYPE''',
'        },',
'    {',
'    dataType: ''text'', ',
'    success: function (data) { ',
'       if (data.trim() !== ''success'') { ',
'          errorval = 1;',
'          var utype = $v(''P21113001502_APPLUSER_USER_TYPE'');',
'          if (utype === ''S'') {showError("P21113001502_APPLUSER_SUPLR_ID",data);}',
'          else if (utype === ''C'') {showError("P21113001502_APPLUSER_CUST_ID",data);}',
'          else {showError("P21113001502_APPLUSER_EMP_ID",data);}',
'       }',
'    }',
'    }',
'    );',
'',
'    /*Mobile No.*/',
'    apex.server.process(''MOBILE_VALID'',{  ',
'          pageItems:''#P21113001502_APPLUSER_EMP_ID,#P21113001502_APPLUSER_MOBILE_NO''',
'        },',
'    {',
'    dataType: ''text'', ',
'    success: function (data) { ',
'       if (data.trim() !== ''success'') { ',
'          errorval = 1;',
'          showError("P21113001502_APPLUSER_MOBILE_NO",data);',
'       }',
'    }',
'    }',
'    );',
'',
'    /*Email Id*/',
'    apex.server.process(''EMAIL_VALID'',{  ',
'          pageItems:''#P21113001502_APPLUSER_EMP_ID,#P21113001502_APPLUSER_EMAIL_ID''',
'        },',
'    {',
'    dataType: ''text'', ',
'    success: function (data) { ',
'       if (data.trim() !== ''success'') { ',
'          errorval = 1;',
'          showError("P21113001502_APPLUSER_EMAIL_ID",data); ',
'       }',
'    }',
'    }',
'    );',
'     ',
'    return (errorval); ',
'};',
'',
'function showError(a,b) {',
'   apex.message.showErrors([{ type: "error", ',
'                              location: ["page", "inline"],',
'                              pageItem: a,',
'                              message: b, ',
'                              unsafe: false }]);  ',
'   apex.da.cancelEvent.call(this);                              ',
'}; ',
'',
'',
'/*Password View*/',
'function viewPassword()',
'{',
'  var passwordInput = document.getElementById(''P21113001502_PASSWORD'');',
'  var passStatus = document.getElementById(''pass-status'');',
'',
'  if (passwordInput.type == ''password''){',
'    passwordInput.type=''text'';',
'    passStatus.className=''fa fa-eye-slash field-icon'';',
'    ',
'  }',
'  else{',
'    passwordInput.type=''password'';',
'    passStatus.className=''fa fa-eye field-icon'';',
'  }',
'}',
'',
'',
'/*Password View*/',
'function viewPassword2()',
'{',
'  var passwordInput = document.getElementById(''P21113001502_PASSWORD_2'');',
'  var passStatus = document.getElementById(''pass2-status'');',
'',
'  if (passwordInput.type == ''password''){',
'    passwordInput.type=''text'';',
'    passStatus.className=''fa fa-eye-slash field-icon'';',
'    ',
'  }',
'  else{',
'    passwordInput.type=''password'';',
'    passStatus.className=''fa fa-eye field-icon'';',
'  }',
'}',
'',
'/*User Activate*/',
'function activate() {',
'    /*User Id*/',
'    apex.server.process(''ACTIVATE'',{  ',
'          pageItems:''#P21113001502_WF_COUNT,#P21113001502_APPLUSER_PARTY_ID,#P21113001502_APPLUSER_ID''',
'        },',
'    {',
'    dataType: ''text'', ',
'    success: function (data) { ',
'                if (data.trim() !== ''success'') {',
'                    apex.message.showErrors([{ type: "error", location: "page", message: data.replace(''sqlerrm:ORA-20999: '', ''''), unsafe: false }]);',
'                } ',
'                else {',
'                    console.log(''success'', data);',
'                    apex.region("user").refresh();',
'                    apex.item("P21113001502_APPLUSER_STATUS").refresh();',
'                    apex.message.showPageSuccess("User Activated.");',
'                } ',
'            }',
'    }',
'    );  ',
'}          ',
'',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Region--accent6 > .t-Region-header {',
'    background-color: #dec553de;',
'    color: #2a2a08;',
'}',
'',
'.t-Form--labelsAbove .t-Form-fieldContainer .apex-item-select, .t-Form-fieldContainer--stacked .apex-item-select {',
'    max-width: 123%;',
'}',
'/* .t-Region-body {',
'    color: #6a3ebd;',
'    line-height: 0rem;',
'    font-size: 1rem;',
'} */',
'.t-Cards--cols .t-Cards-item {',
'    width: 109%;',
'}',
'.t-Cards--basic .t-Card-desc {',
'    font-size: 1.4rem;',
'    line-height: 20px;',
'    text-align: -webkit-center;',
'    color: darkcyan;',
'    font-weight: bold;',
'}',
'.t-Region-title {',
'    font-size: larger;',
'}',
'.t-Region-title {',
'    font-size: small;',
'    line-height: inherit;',
'    font-weight: 400;',
'    color: #fff;',
'}',
'',
'/* ',
'.t-Form--stretchInputs .t-Form-fieldContainer .apex-item-select, .t-Form--stretchInputs .t-Form-fieldContainer .apex-item-text, .t-Form-fieldContainer--stretchInputs .apex-item-select, .t-Form-fieldContainer--stretchInputs .apex-item-text {',
'    flex-grow: 1;',
'    min-width: 0;',
'    padding-left: 0px;',
'    margin-right: -21PX;',
'} */',
'',
'.t-Form--stretchInputs .t-Form-fieldContainer .apex-item-select, .t-Form--stretchInputs .t-Form-fieldContainer .apex-item-text, .t-Form-fieldContainer--stretchInputs .apex-item-select, .t-Form-fieldContainer--stretchInputs .apex-item-text {',
'    flex-grow: 1;',
'    min-width: 0px;',
'    padding-left: 6px;',
'    margin-right: -21PX;',
'}',
'',
'span#pass2-status {',
'    position: absolute;',
'    right: 10px;',
'}',
'',
'span#pass-status {',
'    position: absolute;',
'    right: 10px;',
'}',
'',
'.t-Form--stretchInputs .t-Form-fieldContainer .apex-item-text {',
'    margin-right: 0px !important;',
'}',
''))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6002037554106838939)
,p_plug_name=>'Back_WF'
,p_static_id=>'back-wf'
,p_parent_plug_id=>wwv_flow_imp.id(7602443587339528369)
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--slimPadding:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650491255404505325)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(10650463632707505295)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(10650581164484505434)
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P21113001502_WF_NO'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8319507127544816864)
,p_plug_name=>'ContainerCUST'
,p_static_id=>'containercust'
,p_region_name=>'ContainerCUST'
,p_parent_plug_id=>wwv_flow_imp.id(10920590333888929337)
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>80
,p_plug_item_display_point=>'BELOW'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8319507191115816865)
,p_plug_name=>'ContainerEMP'
,p_static_id=>'containeremp'
,p_region_name=>'ContainerEMP'
,p_parent_plug_id=>wwv_flow_imp.id(10920590333888929337)
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>70
,p_plug_item_display_point=>'BELOW'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8319507987877816873)
,p_plug_name=>'ContainerEMPname'
,p_static_id=>'containerempname'
,p_parent_plug_id=>wwv_flow_imp.id(10920590333888929337)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>100
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8319507793501816871)
,p_plug_name=>'ContainerFirst'
,p_static_id=>'containerfirst'
,p_parent_plug_id=>wwv_flow_imp.id(10920590333888929337)
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8319507933568816872)
,p_plug_name=>'ContainerSec'
,p_static_id=>'containersec'
,p_parent_plug_id=>wwv_flow_imp.id(10920590333888929337)
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>120
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8319507326719816866)
,p_plug_name=>'ContainerSUP'
,p_static_id=>'containersup'
,p_region_name=>'ContainerSUP'
,p_parent_plug_id=>wwv_flow_imp.id(10920590333888929337)
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>90
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_item_display_point=>'BELOW'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10920590333888929337)
,p_plug_name=>'Create User '
,p_static_id=>'create-user'
,p_region_name=>'user'
,p_parent_plug_id=>wwv_flow_imp.id(7602443587339528369)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       APPLUSER_BU,',
'       APPLUSER_ID,',
'       APPLUSER_PASSWORD,',
'       APPLUSER_EFF_FROM,',
'       APPLUSER_EFF_TO,',
'       APPLUSER_EMP_ID,',
'       APPLUSER_STATUS,',
'       APPLUSER_USER_TYPE,',
'       APPLUSER_CUST_ID,',
'       APPLUSER_SUPLR_ID,',
'       APPLUSER_PWD_EXP_DUE,',
'       APPLUSER_PW_EXP_RQRD,',
'       APPLUSER_PW_EXP_DAYS,',
'       APPLUSER_CRE_BY,',
'       APPLUSER_CRE_IP_ADDR,',
'       APPLUSER_CRE_OS_USER,',
'       APPLUSER_CRE_DATE,',
'       APPLUSER_UPD_BY,',
'       APPLUSER_UPD_IP_ADDR,',
'       APPLUSER_UPD_OS_USER,',
'       APPLUSER_UPD_DATE,',
'       APPLUSER_CRE_EMP_ID,',
'       APPLUSER_UPD_EMP_ID,',
'       APPLUSER_EMAIL_ID,',
'       APPLUSER_MOBILE_NO,',
'       APPLUSER_PARTY_ID,',
'       APPLUSER_POS_ID,',
'       APPLUSER_DEPT_ID,',
'       APPLUSER_JRNL_POST',
'  from APPL_USERS',
' where APPLUSER_BU =:GLOBAL_BU'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_read_only_when_type=>'EXPRESSION'
,p_plug_read_only_when=>':P21113001502_APPLUSER_STATUS in(''A'',''D'')'
,p_plug_read_only_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10227852876546374502)
,p_plug_name=>'Create Users'
,p_static_id=>'create-users'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--accent8:t-Region--scrollBody:t-Form--leftLabels'
,p_region_attributes=>'style="box-shadow: 0px 1px 16px 0 rgba(0,0,0,0.36);"'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>8
,p_plug_display_column=>3
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7602443587339528369)
,p_plug_name=>'Header'
,p_static_id=>'header'
,p_parent_plug_id=>wwv_flow_imp.id(10227852876546374502)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>90
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7280714333519747869)
,p_plug_name=>'Header Option'
,p_static_id=>'header-option'
,p_parent_plug_id=>wwv_flow_imp.id(7602443587339528369)
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noBorder:margin-top-none:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650491255404505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(10650463632707505295)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(10650581164484505434)
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P21113001502_WF_NO'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(8383496757491682682)
,p_name=>'Load Image'
,p_static_id=>'load-image'
,p_parent_plug_id=>wwv_flow_imp.id(7602443587339528369)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>50
,p_region_template_options=>'#DEFAULT#:t-Form--large:margin-top-md:margin-left-none:margin-right-none'
,p_component_template_options=>'#DEFAULT#:t-Cards--basic:t-Cards--spanHorizontally:t-Cards--animColorFill:t-Report--hideNoPagination'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'       ''<center><img alt="''||apex_escape.html_attribute(:P21113001502_APPLUSER_EMP_ID)||''"style="border: 0px; -moz-border-radius: 70px; -webkit-border-radius: 70px;" ''||'' src=''''#APP_IMAGES#women.png'''' height = "110" width = "110"/></center>''    CARD_'
||'TITLE,',
'       NULL CARD_SUBTITLE,',
'       ''Unknown'' CARD_TEXT,',
'       ''Unknown'' CARD_SUBTEXT',
' FROM DUAL ',
' WHERE 0 = (SELECT',
'    SUM(cnt) found',
'FROM',
'    (',
'        SELECT',
'            COUNT(*) cnt',
'        FROM',
'            doc_mgmt',
'        WHERE',
'                dm_bu = :global_bu',
'            AND dm_vou_no = :p21113001502_appluser_emp_id',
'            AND dm_vou_type = ''E_IMG''',
'        UNION ALL',
'        SELECT',
'            COUNT(*) cnt',
'        FROM',
'            employees',
'        WHERE',
'                emp_bu = :global_bu',
'            AND emp_emp_id = :p21113001502_appluser_emp_id',
'    ))',
''))
,p_display_when_condition=>'P21113001502_ROWID'
,p_display_condition_type=>'ITEM_IS_NULL'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P21113001502_APPLUSER_ID,P21113001502_APPLUSER_EMP_ID,P21113001502_APPLUSER_POS_ID,P21113001502_APPLUSER_USER_TYPE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650533555536505382)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7116790285635660934)
,p_query_column_id=>4
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7116790680868660934)
,p_query_column_id=>2
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7116789836927660934)
,p_query_column_id=>3
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>20
,p_column_heading=>'Card Text'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7116789474484660932)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>10
,p_column_heading=>'Card Title'
,p_column_format=>'PCT_GRAPH:#f9f9f9::'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(8951386737693813966)
,p_name=>'Load Image'
,p_static_id=>'load-image-2'
,p_parent_plug_id=>wwv_flow_imp.id(7602443587339528369)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#:t-Form--large:margin-top-md:margin-left-none:margin-right-none'
,p_component_template_options=>'#DEFAULT#:t-Cards--basic:t-Cards--spanHorizontally:t-Cards--animColorFill:t-Report--hideNoPagination'
,p_new_grid_row=>false
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DECODE(NVL(dbms_lob.getlength(dm_blob),0),0,null,',
'        ''<center><img alt="''||apex_escape.html_attribute(dm_vou_no)||''"style="border: 0px; -moz-border-radius: 70px; -webkit-border-radius: 70px;" ''||'' src = "''||apex_util.get_blob_file_src(''P6_DM_BLOB'', ROWID)||''" height = "110" width = "110"/></cen'
||'ter>'')',
'        CARD_TITLE,',
'        ROWID CARD_SUBTITLE,',
'        (select APPLUSER_EMP_ID||''-''||',
'                (SELECT  emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1 emp_name',
'                  FROM EMPLOYEES ',
'                  WHERE EMP_BU=APPLUSER_BU',
'                    AND EMP_EMP_ID=APPLUSER_EMP_ID)',
'           FROM APPL_USERS',
'          WHERE APPLUSER_ID=:P21113001502_APPLUSER_ID',
'            AND APPLUSER_USER_TYPE = :P21113001502_APPLUSER_USER_TYPE',
'            AND APPLUSER_EMP_ID = :P21113001502_APPLUSER_EMP_ID)CARD_TEXT,',
'       (SELECT INITCAP(HRPOS_POS_NAME1)',
'          FROM HR_POSITIONS',
'         WHERE HRPOS_BU = :GLOBAL_BU',
'           AND HRPOS_POS_ID = :P21113001502_APPLUSER_POS_ID',
'           )',
'       CARD_SUBTEXT',
'FROM doc_mgmt',
'WHERE dm_bu = :Global_bu',
'AND dm_vou_no =:P21113001502_APPLUSER_EMP_ID',
'AND dm_vou_type =''E_IMG''',
'UNION ALL',
'SELECT CASE WHEN  EMP_GENDER=''F'' ',
'            THEN ''<center><img alt="''||apex_escape.html_attribute(:P21113001502_APPLUSER_EMP_ID)||''"style="border: 0px; -moz-border-radius: 70px; -webkit-border-radius: 70px;" ''||'' src=''''#APP_IMAGES#women.png'''' height = "110" width = "110"/></center>'
||'''',
'            ELSE ''<center><img alt="''||apex_escape.html_attribute(:P21113001502_APPLUSER_EMP_ID)||''"style="border: 0px; -moz-border-radius: 70px; -webkit-border-radius: 70px;" ''||'' src=''''#APP_IMAGES#profile (1).png'''' height = "110" width = "110"/></c'
||'enter>''',
'       END ',
'       CARD_TITLE,',
'       NULL CARD_SUBTITLE,',
'       (SELECT APPLUSER_EMP_ID||''-''||',
'                (SELECT  emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1 emp_name',
'                  FROM EMPLOYEES ',
'                  WHERE EMP_BU=APPLUSER_BU',
'                    AND EMP_EMP_ID=APPLUSER_EMP_ID)',
'           FROM APPL_USERS',
'          WHERE APPLUSER_ID=:P21113001502_APPLUSER_ID',
'            AND APPLUSER_USER_TYPE = :P21113001502_APPLUSER_USER_TYPE',
'            AND APPLUSER_EMP_ID = :P21113001502_APPLUSER_EMP_ID)CARD_TEXT,',
'       (SELECT INITCAP(HRPOS_POS_NAME1)',
'          FROM HR_POSITIONS',
'         WHERE HRPOS_BU = :GLOBAL_BU',
'           AND HRPOS_POS_ID = :P21113001502_APPLUSER_POS_ID)',
'       CARD_SUBTEXT',
'  FROM EMPLOYEES',
' WHERE EMP_BU = :GLOBAL_BU',
'   AND EMP_EMP_ID = :P21113001502_APPLUSER_EMP_ID',
'   AND EMP_EMP_ID NOT IN (SELECT DM_VOU_NO',
'                            FROM DOC_MGMT',
'                           WHERE DM_BU = :GLOBAL_BU',
'                             AND DM_VOU_TYPE = ''E_IMG''',
'                             AND DM_VOU_NO IS NOT NULL)',
'UNION ALL',
'SELECT ''<center><img alt="''||apex_escape.html_attribute(:P21113001502_APPLUSER_EMP_ID)||''"style="border: 0px; -moz-border-radius: 70px; -webkit-border-radius: 70px;" ''||'' src=''''#APP_FILES#profile (1).png'''' height = "110" width = "110"/></center>''',
'       CARD_TITLE,',
'       NULL CARD_SUBTITLE,',
'       NULL CARD_TEXT,',
'       NULL CARD_SUBTEXT',
'  FROM suppliers',
' WHERE suplr_bu       = :GLOBAL_BU',
'   AND (suplr_suplr_id  = :P21113001502_APPLUSER_SUPLR_ID  OR suplr_suplr_id  = :P21113001502_APPLUSER_CUST_ID)',
'   AND suplr_suplr_id  NOT IN (SELECT DM_VOU_NO',
'                            FROM DOC_MGMT',
'                           WHERE DM_BU = :GLOBAL_BU',
'                             AND DM_VOU_TYPE = ''E_IMG''',
'                             AND DM_VOU_NO IS NOT NULL)'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P21113001502_APPLUSER_ID,P21113001502_APPLUSER_EMP_ID,P21113001502_APPLUSER_POS_ID,P21113001502_APPLUSER_USER_TYPE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650533555536505382)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7116788638905660929)
,p_query_column_id=>4
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>200
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7116787487383660918)
,p_query_column_id=>2
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>210
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7116787897118660923)
,p_query_column_id=>3
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>180
,p_column_heading=>'Card Text'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7116788246977660924)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>170
,p_column_heading=>'Card Title'
,p_column_format=>'PCT_GRAPH:#f9f9f9::'
,p_column_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.::P6_ROWID,P6_EMP_ROWID,P6_DM_VOU_NO,P6_TITLE,P6_TYPE,P6_RETURN_PAGE_NO:#CARD_SUBTITLE#,&P21113001502_ROWID.,&P21113001502_APPLUSER_EMP_ID.,&P21113001502_EMP_NAME.,IMG,21113001502'
,p_column_linktext=>'#CARD_TITLE#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8160962399118461020)
,p_plug_name=>'Region'
,p_static_id=>'region'
,p_parent_plug_id=>wwv_flow_imp.id(7602443587339528369)
,p_region_template_options=>'#DEFAULT#:margin-top-md'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>60
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_read_only_when_type=>'EXPRESSION'
,p_plug_read_only_when=>':P21113001502_APPLUSER_STATUS IN (''A'',''D'')'
,p_plug_read_only_when2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7116757319630660678)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(7280714333519747869)
,p_button_name=>'Activate'
,p_static_id=>'activate'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Activate'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(SELECT',
'    appluser_status',
'FROM',
'    appl_users',
'WHERE',
'        appluser_bu = :global_bu',
'    AND appluser_id = :P21113001502_APPLUSER_ID',
'    AND appluser_user_type = :P21113001502_APPLUSER_USER_TYPE',
'    AND appluser_party_id  = :P21113001502_APPLUSER_PARTY_ID ) = ''N'''))
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-badge-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7116758008839660684)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(7280714333519747869)
,p_button_name=>'Add'
,p_static_id=>'add'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:21113001502:&SESSION.::&DEBUG.:::'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6002037709673838940)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6002037554106838939)
,p_button_name=>'BACK'
,p_static_id=>'back'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Back'
,p_button_redirect_url=>'Javascript:history.back();'
,p_button_condition=>'P21113001502_WF_NO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-arrow-left-alt'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7116756083417660676)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7280714333519747869)
,p_button_name=>'Close'
,p_static_id=>'close'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:21113001503:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-left-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7116756844199660676)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(7280714333519747869)
,p_button_name=>'Inactivate'
,p_static_id=>'inactivate'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Inactivate'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(SELECT',
'    appluser_status',
'FROM',
'    appl_users',
'WHERE',
'        appluser_bu = :global_bu',
'    AND appluser_id = :P21113001502_APPLUSER_ID',
'    AND appluser_user_type = :P21113001502_APPLUSER_USER_TYPE',
'    AND appluser_party_id  = :P21113001502_APPLUSER_PARTY_ID ) = ''A'''))
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7116757720209660678)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(7280714333519747869)
,p_button_name=>'Insert'
,p_static_id=>'insert'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insert'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P21113001502_ROWID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7116756494922660676)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(7280714333519747869)
,p_button_name=>'Update'
,p_static_id=>'update'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insert'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>':P21113001502_ROWID IS NOT NULL AND :P21113001502_APPLUSER_STATUS IN(''N'',''A'')'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7116813910791661056)
,p_branch_name=>'workflow self-Approve'
,p_branch_action=>'f?p=&APP_ID.:21113001502:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>70
,p_branch_condition_type=>'EXPRESSION'
,p_branch_condition=>':P21113001502_WF_COUNT = ''WFM1091'''
,p_branch_condition_text=>'PLSQL'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7116814269116661065)
,p_branch_name=>'Workflow(236131090)'
,p_branch_action=>'f?p=&APP_ID.:236131090:&SESSION.::&DEBUG.::P236131090_P_WF_TYPE,P236131090_FWD_ENTITY,P236131090_P_DOC_NO,P236131090_P_PAGE_ID,P236131090_P_DOC_PFX:WF_USER,&GLOBAL_BU.,&P21113001502_APPLUSER_PARTY_ID.,21113001503,N'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>70
,p_branch_condition_type=>'EXPRESSION'
,p_branch_condition=>':P21113001502_WF_COUNT =''WFM1090'''
,p_branch_condition_text=>'PLSQL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8797447848908000850)
,p_name=>'P21113001502_APPLUSER_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(8319507933568816872)
,p_item_source_plug_id=>wwv_flow_imp.id(10920590333888929337)
,p_item_default=>':GLOBAL_BU'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'APPLUSER_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8569845798392173990)
,p_name=>'P21113001502_APPLUSER_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(8160962399118461020)
,p_item_source_plug_id=>wwv_flow_imp.id(10920590333888929337)
,p_source=>'APPLUSER_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8569846056939173993)
,p_name=>'P21113001502_APPLUSER_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(8160962399118461020)
,p_item_source_plug_id=>wwv_flow_imp.id(10920590333888929337)
,p_format_mask=>'DD-MON-RRRR HH24:MI:SS'
,p_source=>'APPLUSER_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8569846675546173999)
,p_name=>'P21113001502_APPLUSER_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(8160962399118461020)
,p_item_source_plug_id=>wwv_flow_imp.id(10920590333888929337)
,p_source=>'APPLUSER_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8569845894750173991)
,p_name=>'P21113001502_APPLUSER_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(8160962399118461020)
,p_item_source_plug_id=>wwv_flow_imp.id(10920590333888929337)
,p_source=>'APPLUSER_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8569845943235173992)
,p_name=>'P21113001502_APPLUSER_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(8160962399118461020)
,p_item_source_plug_id=>wwv_flow_imp.id(10920590333888929337)
,p_source=>'APPLUSER_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8797455719321000869)
,p_name=>'P21113001502_APPLUSER_CUST_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8319507127544816864)
,p_item_source_plug_id=>wwv_flow_imp.id(10920590333888929337)
,p_prompt=>'Emp./Party'
,p_source=>'APPLUSER_CUST_ID'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_USER_CRE_CUST1'
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P21113001502_APPLUSER_USER_TYPE,P21113001502_APPLUSER_ID'
,p_ajax_items_to_submit=>'P21113001502_APPLUSER_USER_TYPE,P21113001502_APPLUSER_ID'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_cMaxlength=>10
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
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
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8797446273837000847)
,p_name=>'P21113001502_APPLUSER_DEPT_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(8319507933568816872)
,p_item_source_plug_id=>wwv_flow_imp.id(10920590333888929337)
,p_source=>'APPLUSER_DEPT_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8797481037047000846)
,p_name=>'P21113001502_APPLUSER_EFF_FROM'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8160962399118461020)
,p_item_source_plug_id=>wwv_flow_imp.id(10920590333888929337)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Eff. From'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source=>'APPLUSER_EFF_FROM'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8797481391504000846)
,p_name=>'P21113001502_APPLUSER_EFF_TO'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(8160962399118461020)
,p_item_source_plug_id=>wwv_flow_imp.id(10920590333888929337)
,p_item_default=>'31-DEC-2099'
,p_prompt=>'Eff. To'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source=>'APPLUSER_EFF_TO'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'null',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8797408705108000615)
,p_name=>'P21113001502_APPLUSER_EMAIL_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8160962399118461020)
,p_item_source_plug_id=>wwv_flow_imp.id(10920590333888929337)
,p_prompt=>'Email'
,p_source=>'APPLUSER_EMAIL_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>50
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'EMAIL',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8797446438694000848)
,p_name=>'P21113001502_APPLUSER_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8319507191115816865)
,p_item_source_plug_id=>wwv_flow_imp.id(10920590333888929337)
,p_prompt=>'Emp./Party'
,p_source=>'APPLUSER_EMP_ID'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_USER_CRE_EMP2'
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P21113001502_APPLUSER_USER_TYPE'
,p_ajax_items_to_submit=>'P21113001502_APPLUSER_USER_TYPE'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_cMaxlength=>10
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Emp./Party',
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8797439793651000835)
,p_name=>'P21113001502_APPLUSER_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8319507793501816871)
,p_item_source_plug_id=>wwv_flow_imp.id(10920590333888929337)
,p_prompt=>'Username'
,p_source=>'APPLUSER_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>67
,p_cMaxlength=>15
,p_tag_css_classes=>' autocomplete="off"'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5628973251291381735)
,p_name=>'P21113001502_APPLUSER_JRNL_POST'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(8160962399118461020)
,p_item_source_plug_id=>wwv_flow_imp.id(10920590333888929337)
,p_item_default=>'N'
,p_source=>'APPLUSER_JRNL_POST'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8797409527048000615)
,p_name=>'P21113001502_APPLUSER_MOBILE_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8160962399118461020)
,p_item_source_plug_id=>wwv_flow_imp.id(10920590333888929337)
,p_prompt=>'Mobile No.'
,p_source=>'APPLUSER_MOBILE_NO'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>10
,p_cMaxlength=>10
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8797410338509000618)
,p_name=>'P21113001502_APPLUSER_PARTY_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(8160962399118461020)
,p_item_source_plug_id=>wwv_flow_imp.id(10920590333888929337)
,p_item_default=>'P21113001502_APPLUSER_EMP_ID'
,p_item_default_type=>'ITEM'
,p_source=>'APPLUSER_PARTY_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8797448225229000853)
,p_name=>'P21113001502_APPLUSER_PASSWORD'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(8319507933568816872)
,p_item_source_plug_id=>wwv_flow_imp.id(10920590333888929337)
,p_source=>'APPLUSER_PASSWORD'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8797446602688000849)
,p_name=>'P21113001502_APPLUSER_POS_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(8319507933568816872)
,p_item_source_plug_id=>wwv_flow_imp.id(10920590333888929337)
,p_source=>'APPLUSER_POS_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8797496855485000892)
,p_name=>'P21113001502_APPLUSER_PWD_EXP_DUE'
,p_source_data_type=>'DATE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(8160962399118461020)
,p_item_source_plug_id=>wwv_flow_imp.id(10920590333888929337)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'APPLUSER_PWD_EXP_DUE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8797496437353000890)
,p_name=>'P21113001502_APPLUSER_PW_EXP_DAYS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(8160962399118461020)
,p_item_source_plug_id=>wwv_flow_imp.id(10920590333888929337)
,p_item_default=>'0'
,p_source=>'APPLUSER_PW_EXP_DAYS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8797495994979000890)
,p_name=>'P21113001502_APPLUSER_PW_EXP_RQRD'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(8160962399118461020)
,p_item_source_plug_id=>wwv_flow_imp.id(10920590333888929337)
,p_item_default=>'N'
,p_source=>'APPLUSER_PW_EXP_RQRD'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8797518046988000968)
,p_name=>'P21113001502_APPLUSER_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(8160962399118461020)
,p_item_source_plug_id=>wwv_flow_imp.id(10920590333888929337)
,p_item_default=>'N'
,p_prompt=>'Status'
,p_source=>'APPLUSER_STATUS'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Draft;N,Pending for Active;E,Active;A,Pending for Deactive;I,Deactive;D'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8797454643862000864)
,p_name=>'P21113001502_APPLUSER_SUPLR_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8319507326719816866)
,p_item_source_plug_id=>wwv_flow_imp.id(10920590333888929337)
,p_prompt=>'Emp./Party'
,p_source=>'APPLUSER_SUPLR_ID'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_USER_CRE_SUP1'
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P21113001502_APPLUSER_USER_TYPE,P21113001502_APPLUSER_ID'
,p_ajax_items_to_submit=>'P21113001502_APPLUSER_USER_TYPE,P21113001502_APPLUSER_ID'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_cMaxlength=>10
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
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
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8569846193866173994)
,p_name=>'P21113001502_APPLUSER_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(8160962399118461020)
,p_item_source_plug_id=>wwv_flow_imp.id(10920590333888929337)
,p_source=>'APPLUSER_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8569846479013173997)
,p_name=>'P21113001502_APPLUSER_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(8160962399118461020)
,p_item_source_plug_id=>wwv_flow_imp.id(10920590333888929337)
,p_format_mask=>'DD-MON-RRRR HH24:MI:SS'
,p_source=>'APPLUSER_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8569846729702174000)
,p_name=>'P21113001502_APPLUSER_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(8160962399118461020)
,p_item_source_plug_id=>wwv_flow_imp.id(10920590333888929337)
,p_source=>'APPLUSER_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8569846256242173995)
,p_name=>'P21113001502_APPLUSER_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(8160962399118461020)
,p_item_source_plug_id=>wwv_flow_imp.id(10920590333888929337)
,p_source=>'APPLUSER_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8569846308101173996)
,p_name=>'P21113001502_APPLUSER_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(8160962399118461020)
,p_item_source_plug_id=>wwv_flow_imp.id(10920590333888929337)
,p_source=>'APPLUSER_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8797442647812000841)
,p_name=>'P21113001502_APPLUSER_USER_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(8319507793501816871)
,p_item_source_plug_id=>wwv_flow_imp.id(10920590333888929337)
,p_item_default=>'E'
,p_prompt=>'User Type'
,p_source=>'APPLUSER_USER_TYPE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Admin;R,Functional;E,Module Specific;D,Management;G,Mobile App;M,ESS Portal;U,Supplier  Portal;S,Customer  Portal;C,Subcontract  Portal;T'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8160999597522461538)
,p_name=>'P21113001502_DEPARTMENT_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8319507933568816872)
,p_prompt=>'Department'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8797437849369000817)
,p_name=>'P21113001502_EMP_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8319507987877816873)
,p_prompt=>'Emp./Party Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8797440612828000836)
,p_name=>'P21113001502_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8319507793501816871)
,p_item_default=>'P21113001502_APPLUSER_PASSWORD'
,p_item_default_type=>'ITEM'
,p_prompt=>'Password'
,p_placeholder=>'********************'
,p_post_element_text=>'<span id="pass-status"  style="line-height: 0.5rem;" class="fa fa-eye field-icon" aria-hidden="true" onClick="viewPassword()"></span>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>67
,p_cMaxlength=>200
,p_tag_attributes=>'autocomplete = "new-password"'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_icon_css_classes=>'fa-key'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8054125588682159116)
,p_name=>'P21113001502_PASSWORD_2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(8319507793501816871)
,p_item_default=>'P21113001502_APPLUSER_PASSWORD'
,p_item_default_type=>'ITEM'
,p_prompt=>'Confirm Password'
,p_placeholder=>'********************'
,p_post_element_text=>'<span id="pass2-status"  style="line-height: 0.5rem;" class="fa fa-eye field-icon" aria-hidden="true" onClick="viewPassword2()"></span>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>67
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_icon_css_classes=>'fa-key'
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8160999693729461539)
,p_name=>'P21113001502_POSITION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8319507933568816872)
,p_prompt=>'Designation'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly tabindex="-1"'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8797471785198000881)
,p_name=>'P21113001502_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(8319507933568816872)
,p_item_source_plug_id=>wwv_flow_imp.id(10920590333888929337)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8476521150340120514)
,p_name=>'P21113001502_WF_COUNT'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(8160962399118461020)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6002037252728838936)
,p_name=>'P21113001502_WF_NO'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(8160962399118461020)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7116796654349660956)
,p_validation_name=>'APPLUSER_CUST_ID'
,p_static_id=>'appluser-cust-id'
,p_validation_sequence=>130
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P21113001502_APPLUSER_USER_TYPE IN (''C'') THEN    ',
'      IF :P21113001502_APPLUSER_CUST_ID IS NULL THEN',
'         RETURN(''Emp./Party must be entered.'');      ',
'      ELSIF :P21113001502_APPLUSER_CUST_ID IS NOT NULL THEN',
'      	 DECLARE',
'      	 	  CURSOR c2',
'      	 	      IS',
'      	 	  SELECT * ',
'                FROM appl_users ',
'               WHERE appluser_bu = :GLOBAL_bu ',
'                 AND appluser_cust_id = :P21113001502_APPLUSER_CUST_ID',
'                 AND (ROWID <> :P21113001502_ROWID OR  :P21113001502_ROWID IS NULL)',
'                 AND appluser_status NOT IN (''D''); ',
'      	 	     cr2	c2%ROWTYPE;',
'      	 BEGIN',
'           	  OPEN c2;',
'           	  FETCH c2 INTO cr2;',
'           	     IF c2%FOUND THEN',
'           	     	  RETURN(''Customer already linked with another user. Username : ''||cr2.appluser_id);',
'                 END IF; ',
'              CLOSE c2;',
'          END;',
'      END IF;   ',
'   END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'Insert,Update,Activate'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_imp.id(8797455719321000869)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7116797043109660956)
,p_validation_name=>'APPLUSER_SUPLR_ID'
,p_static_id=>'appluser-suplr-id'
,p_validation_sequence=>140
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P21113001502_APPLUSER_USER_TYPE IN (''S'',''T'') then',
'IF :P21113001502_APPLUSER_SUPLR_ID is null  THEN',
'   RETURN(''Emp./Party must be entered.'');',
'ELSIF :P21113001502_APPLUSER_SUPLR_ID IS NOT NULL THEN',
'	 DECLARE',
'	 	  CURSOR c2',
'	 	      IS',
'	 	  SELECT * ',
'          FROM appl_users ',
'         WHERE appluser_bu = :GLOBAL_bu ',
'           AND appluser_suplr_id = :P21113001502_APPLUSER_SUPLR_ID',
'           AND (ROWID <> :P21113001502_ROWID OR  :P21113001502_ROWID IS NULL)',
'           AND appluser_status NOT IN (''D''); ',
'	 	     cr2	c2%ROWTYPE;',
'	 BEGIN',
'     	  OPEN c2;',
'     	  FETCH c2 INTO cr2;',
'     	     IF c2%FOUND THEN',
'     	     	  RETURN(''Supplier already linked with another user. Username : ''||cr2.appluser_id);',
'           END IF; ',
'        CLOSE c2;',
'    END;',
'END IF;  ',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'Insert,Update,Activate'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_imp.id(8797454643862000864)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7116794713053660946)
,p_validation_name=>'Check_emp_id'
,p_static_id=>'check-emp-id'
,p_validation_sequence=>80
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P21113001502_APPLUSER_USER_TYPE NOT IN (''S'',''C'',''T'') then',
'',
'   IF :P21113001502_APPLUSER_EMP_ID is null THEN',
'      RETURN(''Emp./Party must be entered.'');',
'   ELSIF :P21113001502_APPLUSER_EMP_ID  is not null then',
'      DECLARE',
'          v_count number(10);',
'      BEGIN',
'',
'          SELECT count(*) into v_count',
'            FROM appl_users ',
'           WHERE appluser_bu = :GLOBAL_bu',
'             AND appluser_emp_id = :P21113001502_APPLUSER_EMP_ID ',
'             AND (ROWID <> :P21113001502_ROWID OR :P21113001502_ROWID IS NULL)',
'             AND appluser_status NOT IN (''D'');',
'',
'       	IF v_count > 0 THEN',
'       	    RETURN(''Employee already linked with another user.'');',
'       	END IF;',
'       ',
'      END;    ',
'   END IF;',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_always_execute=>'Y'
,p_validation_condition=>'Insert,Update,Activate'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_imp.id(8797446438694000848)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7116795860717660954)
,p_validation_name=>'Confirm_password_val'
,p_static_id=>'confirm-password-val'
,p_validation_sequence=>90
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_err_msg      VARCHAR2(1000);',
'   ',
'	 v_ascii_val								NUMBER(5);',
'    v_pwd_exp_days							NUMBER(5);',
'    v_rules									   VARCHAR2(100);',
'    v_upc									   VARCHAR2(100);',
'    v_lc									      VARCHAR2(100);',
'    v_num									   VARCHAR2(100);',
'    v_spc									   VARCHAR2(100);',
'BEGIN',
'   IF :P21113001502_PASSWORD_2 IS NULL AND :P21113001502_ROWID IS NULL THEN',
'    	 RETURN(''Confirm Password must be entered.'');',
'   END IF;',
'',
'   IF :P21113001502_PASSWORD_2 IS NOT NULL THEN',
'',
'		proc_check_pass_complex (:P21113001502_PASSWORD_2,v_rules,v_upc,v_lc,v_num,v_spc);  ',
'',
'      IF v_rules = ''N'' THEN',
'         RETURN(''Confirm Password must contain atleast one upper case letter , one lower case letter, one number and one special character.'');',
'		END IF;',
'	   ',
'      IF LENGTH(:P21113001502_PASSWORD_2) NOT BETWEEN 3 AND 15 THEN',
'	  	   RETURN(''You must provide 3 to 15 characters for Password.'');',
'	   END IF;',
'   ',
'   END IF;',
'  ',
'   IF :P21113001502_PASSWORD <> :P21113001502_PASSWORD_2 then',
'        RETURN(''New Password and Confirm Password does not match'');',
'   END IF;',
'END;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_always_execute=>'Y'
,p_validation_condition=>'Insert,Update,Activate'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_imp.id(8054125588682159116)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7116793456554660945)
,p_validation_name=>'Mail_id_validation'
,p_static_id=>'mail-id-validation'
,p_validation_sequence=>120
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P21113001502_APPLUSER_EMAIL_ID IS NULL THEN',
'    RETURN(''Email Id must be entered.'');',
'END IF;',
'',
'IF :P21113001502_APPLUSER_EMAIL_ID IS NOT NULL THEN',
'',
'    DECLARE',
'  	 	CURSOR C1',
'            IS ',
'        SELECT emp_off_email_id,',
'               emp_emp_id,',
'               emp_first_name1',
'          FROM employees',
'         WHERE emp_bu         = :GLOBAL_bu ',
'           AND emp_emp_id     <> :P21113001502_APPLUSER_EMP_ID',
'           AND emp_off_email_id = :P21113001502_APPLUSER_EMAIL_ID;',
'',
'           cr1			c1%ROWTYPE;',
'    BEGIN',
'        OPEN c1;',
'        FETCH c1 INTO cr1;',
'            IF c1%FOUND THEN ',
'                return(''Email Id already linked with another Employee.'');',
'            END IF;',
'        CLOSE c1;',
'    END;',
'',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_always_execute=>'Y'
,p_validation_condition=>'Insert,Update,Activate'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_imp.id(8797408705108000615)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7116796247620660954)
,p_validation_name=>'Mobile_no_validation'
,p_static_id=>'mobile-no-validation'
,p_validation_sequence=>110
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P21113001502_APPLUSER_MOBILE_NO IS NULL THEN',
'    RETURN(''Mobile No. must be entered.'');',
'',
'END IF;',
'',
'IF :P21113001502_APPLUSER_MOBILE_NO IS NOT NULL THEN',
'',
'    DECLARE',
'  	 	CURSOR C1',
'            IS ',
'        SELECT emp_off_mobile_no,',
'               emp_emp_id,',
'               emp_first_name1',
'          FROM employees',
'         WHERE emp_bu         = :GLOBAL_bu ',
'           AND emp_emp_id     <> :P21113001502_APPLUSER_EMP_ID',
'           AND emp_off_mobile_no = :P21113001502_APPLUSER_MOBILE_NO;',
'',
'           cr1			c1%ROWTYPE;',
'    BEGIN',
'        OPEN c1;',
'        FETCH c1 INTO cr1;',
'            IF c1%FOUND THEN ',
'                return(''Mobile Number already linked with another Employee.'');',
'            END IF;',
'        CLOSE c1;',
'    END;',
'',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_always_execute=>'Y'
,p_validation_condition=>'Insert,Update,Activate'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_imp.id(8797409527048000615)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7116795095865660953)
,p_validation_name=>'Password Val.'
,p_static_id=>'password-val'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_err_msg      VARCHAR2(1000);',
'   ',
'	 v_ascii_val								NUMBER(5);',
'    v_pwd_exp_days							NUMBER(5);',
'    v_rules									   VARCHAR2(100);',
'    v_upc									   VARCHAR2(100);',
'    v_lc									      VARCHAR2(100);',
'    v_num									   VARCHAR2(100);',
'    v_spc									   VARCHAR2(100);',
'BEGIN',
'   IF :P21113001502_PASSWORD IS NULL AND :P21113001502_ROWID IS NULL THEN',
'    	 RETURN(''Password must be entered.'');',
'   END IF;',
'',
'   IF :P21113001502_PASSWORD IS NOT NULL THEN',
'',
'		proc_check_pass_complex (:P21113001502_PASSWORD,v_rules,v_upc,v_lc,v_num,v_spc);  ',
'',
'      IF v_rules = ''N'' THEN',
'         RETURN(''Password must contain atleast one upper case letter , one lower case letter, one number and one special character.'');',
'		END IF;',
'',
'      IF LENGTH(:P21113001502_PASSWORD) NOT BETWEEN 3 AND 15 THEN',
'	  	   RETURN(''You must provide 3 to 15 characters for Password.'');',
'	   END IF;',
'   ',
'   END IF;',
'',
'END;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_always_execute=>'Y'
,p_validation_condition=>'Insert,Update,Activate'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_imp.id(8797440612828000836)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7116795455696660954)
,p_validation_name=>'USERNAME VAL.'
,p_static_id=>'username-val'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   v_err_msg            VARCHAR2(1000);',
'   v_alphanum_flag      VARCHAR2(1000);',
'BEGIN',
'   IF :P21113001502_APPLUSER_ID IS NULL THEN',
'       RETURN(''User name must be entered.'');  ',
'   END IF;',
'',
'    IF :P21113001502_APPLUSER_ID IS NOT NULL THEN',
'        IF length(:P21113001502_APPLUSER_ID) < 3 THEN',
'           RETURN (''Username must be atleast 3 characters'');',
'        END IF;',
'        IF length(:P21113001502_APPLUSER_ID) > 14 THEN',
'            RETURN (''Username Should not exceed 14 characters'');',
'        END IF;',
'',
'        proc_user_cre_isalphanumeric(upper(:P21113001502_APPLUSER_ID),v_alphanum_flag);',
'',
'        IF v_alphanum_flag = ''Y'' THEN',
'            RETURN (''Special characters not allowed.'');',
'        END IF;',
'',
'    END IF;',
'',
'   IF :P21113001502_APPLUSER_ID IS NOT NULL THEN',
'   	 ',
'   DECLARE',
'	 	  v_ascii_val									NUMBER(5);',
'	 	  p_pwd_exp_days								NUMBER(5);',
'        p_bu											VARCHAR2(50);',
'		  p_user_name									VARCHAR2(50);',
'		  p_password									VARCHAR2(50);',
' ',
'        CURSOR c1',
'             IS',
'         SELECT COUNT(*) v_user_cnt ',
'           FROM appl_users',
'          WHERE appluser_bu = p_bu',
'            AND appluser_id NOT IN (''ERPADMIN'', ''SYSADMIN'')',
'            AND appluser_status NOT IN (''D'');',
'            ',
'      cr1															c1%ROWTYPE;',
'      ',
'      v_named_user								NUMBER(5)   := 200;			',
'      v_user_min_len							  	NUMBER(5)   := 3;			',
'      v_user_max_len								NUMBER(5)   := 15;			',
'      v_user_an_allow							VARCHAR2(2) := ''AN'';	  --User character type ''AA'' - Alphabet Only ''AN'' - Aplha Numeric',
'      v_user_an_res								VARCHAR2(1) := ''N'';	    --User character type ''AA'' - Alphabet Only ''AN'' - Aplha Numeric',
'',
'         ',
'   BEGIN',
'   ',
'   	 OPEN c1;',
'   	 FETCH c1 INTO cr1;',
'   	    ',
'   	    IF cr1.v_user_cnt > v_named_user THEN',
'             RETURN(''No. of Users exceeded than the Limit.'');  ',
'   	    END IF;',
'   	    ',
'   	 CLOSE c1;',
'',
'      IF :P21113001502_APPLUSER_ID IS NOT NULL THEN',
'',
'      	  IF TO_NUMBER(LENGTH(:P21113001502_APPLUSER_ID)) NOT BETWEEN v_user_min_len AND v_user_max_len THEN ',
'             RETURN(''You must provide 3 to 15 characters for Username.'');    ',
'      	  END IF;',
'',
'      END IF;',
'   END;        ',
'   ',
'   END IF;',
'',
'END;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_always_execute=>'Y'
,p_validation_condition=>'Insert,Update,Activate'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_imp.id(8797439793651000835)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7116793912381660945)
,p_validation_name=>'Validation_for_efffrom'
,p_static_id=>'validation-for-efffrom'
,p_validation_sequence=>60
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
' if :P21113001502_APPLUSER_EFF_FROM is not null then',
'    if to_date(:P21113001502_APPLUSER_EFF_FROM,func_find_date_format(:GLOBAL_BU)) > to_date(:P21113001502_APPLUSER_EFF_TO,func_find_date_format(:GLOBAL_BU)) THEN',
'            RETURN(''Effective from date should be lesser than Effective To date'');',
'    end if;',
' end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_always_execute=>'Y'
,p_validation_condition=>'Insert,Update,Activate'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_imp.id(8797481037047000846)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7116794248563660945)
,p_validation_name=>'validation_for_effto'
,p_static_id=>'validation-for-effto'
,p_validation_sequence=>70
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
' if :P21113001502_APPLUSER_EFF_TO is not null then',
'    if to_date(:P21113001502_APPLUSER_EFF_TO,func_find_date_format(:GLOBAL_BU)) < to_date(:P21113001502_APPLUSER_EFF_FROM,func_find_date_format(:GLOBAL_BU)) THEN',
'            RETURN(''Effective To date should be greater than Effective From date'');',
'    end if;',
' end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_always_execute=>'Y'
,p_validation_condition=>'Insert,Update,Activate'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_imp.id(8797481391504000846)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7116805115147661003)
,p_name=>'Assign_user'
,p_static_id=>'assign-user'
,p_event_sequence=>170
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P21113001502_USER_NAME'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7116805563259661003)
,p_event_id=>wwv_flow_imp.id(7116805115147661003)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P21113001502_USER_NAME,P21113001502_APPLUSER_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P21113001502_USER_NAME IS NOT NULL THEN',
    '',
    '   IF :P21113001502_USER_NAME = :P21113001502_APPLUSER_ID THEN',
    '	    raise_application_error(-20999,''From and To Username should not be same.'');',
    '   END IF;',
    '	 ',
    '	 DECLARE',
    '	 	  ',
    '	 	  CURSOR c1',
    '	 	      IS',
    '	 	  SELECT *',
    '	 	    FROM appl_users',
    '	 	   WHERE appluser_bu = :GLOBAL_bu',
    '	 	     AND appluser_id = :P21113001502_USER_NAME;',
    '	 	     ',
    '	 	     cr1       c1%ROWTYPE;',
    '	 	     	 	  ',
    '	 BEGIN',
    '	 	  ',
    '	 	  OPEN c1;',
    '	 	  FETCH c1 INTO cr1;',
    '	 	     ',
    '	 	     IF c1%NOTFOUND THEN',
    '                  raise_application_error(-20999,''User not found.'');',
    '	 	     ELSE',
    '	 	     	  ',
    '	 	     	  IF cr1.appluser_status IN (''N'', ''D'') THEN',
    '	 	     	  	 raise_application_error(-20999,''User not in active status.'');',
    '	 	     	  END IF;',
    '	 	     	  ',
    '	 	     	  IF TRUNC(SYSDATE) NOT BETWEEN TRUNC(cr1.appluser_eff_from) AND TRUNC(cr1.appluser_eff_to) THEN',
    '	 	     	  	 raise_application_error(-20999,''Check To User Eff. From and Eff. To.'');',
    '	 	     	  END IF;',
    '	 	     	  ',
    '	 	     END IF;',
    '	 	     ',
    '	 	  CLOSE c1;',
    '	 	  ',
    '	 END;',
    '	 ',
    'END IF;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7116812387925661035)
,p_name=>'EMP/SUP/CUST'
,p_static_id=>'emp-sup-cust'
,p_event_sequence=>250
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P21113001502_APPLUSER_USER_TYPE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7116813421073661054)
,p_event_id=>wwv_flow_imp.id(7116812387925661035)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P21113001502_APPLUSER_PARTY_ID,P21113001502_EMP_NAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7116812896417661054)
,p_event_id=>wwv_flow_imp.id(7116812387925661035)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if($v("P21113001502_APPLUSER_USER_TYPE") == ''R'' || ',
    '   $v("P21113001502_APPLUSER_USER_TYPE") == ''E'' || ',
    '   $v("P21113001502_APPLUSER_USER_TYPE") == ''U'' || ',
    '   $v("P21113001502_APPLUSER_USER_TYPE") == ''P'' ||',
    '   $v("P21113001502_APPLUSER_USER_TYPE") == ''O''){',
    '    apex.item( "ContainerEMP" ).show();',
    '    apex.item( "ContainerCUST").hide();',
    '    apex.item( "ContainerSUP" ).hide();',
    '}else if ($v("P21113001502_APPLUSER_USER_TYPE") == ''C''){',
    '    apex.item( "ContainerEMP" ).hide();',
    '    apex.item( "ContainerCUST").show();',
    '    apex.item( "ContainerSUP" ).hide();',
    '}else if ($v("P21113001502_APPLUSER_USER_TYPE") == ''S''){',
    '    apex.item( "ContainerEMP" ).hide();',
    '    apex.item( "ContainerCUST").hide();',
    '    apex.item( "ContainerSUP" ).show();',
    '}',
    'else if ($v("P21113001502_APPLUSER_USER_TYPE") == ''T''){',
    '    apex.item( "ContainerEMP" ).hide();',
    '    apex.item( "ContainerCUST").hide();',
    '    apex.item( "ContainerSUP" ).show();',
    '}')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7116811445226661034)
,p_name=>'EMP/SUP/CUST_PL'
,p_static_id=>'emp-sup-cust-pl'
,p_event_sequence=>260
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7116811965321661035)
,p_event_id=>wwv_flow_imp.id(7116811445226661034)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if($v("P21113001502_APPLUSER_USER_TYPE") == ''R'' || ',
    '   $v("P21113001502_APPLUSER_USER_TYPE") == ''E'' || ',
    '   $v("P21113001502_APPLUSER_USER_TYPE") == ''U'' || ',
    '   $v("P21113001502_APPLUSER_USER_TYPE") == ''P'' ||',
    '   $v("P21113001502_APPLUSER_USER_TYPE") == ''O''){',
    '    apex.item( "ContainerEMP" ).show();',
    '    apex.item( "ContainerCUST").hide();',
    '    apex.item( "ContainerSUP" ).hide();',
    '}else if ($v("P21113001502_APPLUSER_USER_TYPE") == ''C''){',
    '    apex.item( "ContainerEMP" ).hide();',
    '    apex.item( "ContainerCUST").show();',
    '    apex.item( "ContainerSUP" ).hide();',
    '}else if ($v("P21113001502_APPLUSER_USER_TYPE") == ''S''){',
    '    apex.item( "ContainerEMP" ).hide();',
    '    apex.item( "ContainerCUST").hide();',
    '    apex.item( "ContainerSUP" ).show();',
    '}')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7116806882689661004)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>210
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P21113001502_APPLUSER_PW_EXP_RQRD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7116807370802661007)
,p_event_id=>wwv_flow_imp.id(7116806882689661004)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P21113001502_APPLUSER_PW_EXP_DAYS',
  'items_to_submit', 'P21113001502_APPLUSER_PW_EXP_RQRD',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if :P21113001502_APPLUSER_PW_EXP_RQRD =''N'' then',
    '    :P21113001502_APPLUSER_PW_EXP_DAYS :=0;',
    '    :P21113001502_APPLUSER_PW_EXP_DAYS_1 :=0;',
    'end if;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7116809713331661024)
,p_name=>'P21113001502_APPLUSER_CUST_ID'
,p_static_id=>'p21113001502-appluser-cust-id'
,p_event_sequence=>230
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P21113001502_APPLUSER_CUST_ID'
,p_condition_element=>'P21113001502_APPLUSER_CUST_ID'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7116810138340661031)
,p_event_id=>wwv_flow_imp.id(7116809713331661024)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P21113001502_EMP_NAME,P21113001502_APPLUSER_PARTY_ID',
  'items_to_submit', 'P21113001502_APPLUSER_USER_TYPE,P21113001502_APPLUSER_ID,P21113001502_APPLUSER_CUST_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P21113001502_APPLUSER_CUST_ID IS NOT NULL THEN',
    '	 DECLARE',
    '      CURSOR c1',
    '          IS',
    '	 	SELECT suplr_suplr_id,suplr_name1',
    '	 	  FROM suppliers',
    '	 	 WHERE suplr_bu         = :GLOBAL_bu',
    '	 	   AND suplr_suplr_id   = :P21113001502_APPLUSER_CUST_ID',
    '         AND SUPLR_PARTY_TYPE = ''C''',
    '	 	   AND suplr_status     = ''A'';',
    '         ',
    '         cr1            c1%ROWTYPE;',
    '	 BEGIN',
    '     	  OPEN c1;',
    '     	  FETCH c1 INTO cr1;',
    '     	     IF c1%FOUND THEN ',
    '             :P21113001502_EMP_NAME             := cr1.suplr_name1;',
    '             :P21113001502_APPLUSER_PARTY_ID := :P21113001502_APPLUSER_CUST_ID;',
    '           END IF; ',
    '        CLOSE c1;',
    '    END;',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7116803422601660988)
,p_name=>'P21113001502_APPLUSER_EMP_ID'
,p_static_id=>'p21113001502-appluser-emp-id'
,p_event_sequence=>220
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P21113001502_APPLUSER_EMP_ID'
,p_condition_element=>'P21113001502_APPLUSER_EMP_ID'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7116803824990660993)
,p_event_id=>wwv_flow_imp.id(7116803422601660988)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P21113001502_APPLUSER_POS_ID,P21113001502_EMP_NAME,P21113001502_APPLUSER_DEPT_ID,P21113001502_POSITION,P21113001502_APPLUSER_MOBILE_NO,P21113001502_DEPARTMENT_NAME,P21113001502_APPLUSER_EMAIL_ID,P21113001502_APPLUSER_PARTY_ID',
  'items_to_submit', 'P21113001502_APPLUSER_USER_TYPE,P21113001502_APPLUSER_EMP_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P21113001502_APPLUSER_EMP_ID IS NOT NULL AND :P21113001502_APPLUSER_USER_TYPE IN (''E'',''D'',''G'',''M'',''R'',''U'',''P'',''O'') THEN',
    '	 DECLARE  ',
    '	 	  CURSOR c1',
    '	 	      IS',
    '	 	  SELECT emp_emp_id, emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1 emp_name,empai_dept_id,(SELECT dept_name1 FROM departments WHERE dept_bu = emp_bu AND dept_id = empai_dept_id)dept_name,empai_pos_id,(SELECT hrpos_pos_name1 FROM hr_p'
||'ositions WHERE hrpos_bu = emp_bu AND hrpos_pos_id = empai_pos_id)pos_name,emp_start_date, emp_off_email_id,emp_off_mobile_no',
    '	 	    FROM employees,emp_active_infos WHERE emp_bu  = empai_bu AND emp_emp_id = empai_emp_id AND emp_bu     = :GLOBAL_bu AND emp_emp_id = :P21113001502_APPLUSER_EMP_ID AND emp_status = ''A'';',
    '	 	     cr1													c1%ROWTYPE;',
    '	 BEGIN',
    '	 	  OPEN c1;',
    '	 	  FETCH c1 INTO cr1;',
    '	 	    IF c1%FOUND THEN	 	     ',
    '            :P21113001502_APPLUSER_POS_ID :=cr1.empai_pos_id;',
    '            :P21113001502_EMP_NAME:=cr1.emp_name;',
    '            :P21113001502_APPLUSER_DEPT_ID :=cr1.empai_dept_id; ',
    '            :P21113001502_POSITION:=cr1.pos_name;',
    '            :P21113001502_APPLUSER_MOBILE_NO :=cr1.emp_off_mobile_no;',
    '            :P21113001502_DEPARTMENT_NAME :=cr1.dept_name;',
    '            :P21113001502_APPLUSER_EMAIL_ID :=cr1.emp_off_email_id;',
    '            :P21113001502_APPLUSER_PARTY_ID := :P21113001502_APPLUSER_EMP_ID;',
    '	 	     END IF; CLOSE c1; END;',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7116807773650661007)
,p_name=>'P21113001502_APPLUSER_PW_EXP_RQRD'
,p_static_id=>'p21113001502-appluser-pw-exp-rqrd'
,p_event_sequence=>200
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P21113001502_APPLUSER_PW_EXP_RQRD'
,p_condition_element=>'P21113001502_APPLUSER_PW_EXP_RQRD'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'N'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7116808264034661009)
,p_event_id=>wwv_flow_imp.id(7116807773650661007)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P21113001502_APPLUSER_PW_EXP_DAYS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7116808816040661009)
,p_event_id=>wwv_flow_imp.id(7116807773650661007)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P21113001502_APPLUSER_PW_EXP_DAYS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7116809331272661010)
,p_event_id=>wwv_flow_imp.id(7116807773650661007)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P21113001502_APPLUSER_PW_EXP_DAYS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', '0')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7116810631871661032)
,p_name=>'P21113001502_APPLUSER_SUPLR_ID'
,p_static_id=>'p21113001502-appluser-suplr-id'
,p_event_sequence=>240
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P21113001502_APPLUSER_SUPLR_ID'
,p_condition_element=>'P21113001502_APPLUSER_SUPLR_ID'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7116811086000661034)
,p_event_id=>wwv_flow_imp.id(7116810631871661032)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P21113001502_EMP_NAME,P21113001502_APPLUSER_PARTY_ID',
  'items_to_submit', 'P21113001502_APPLUSER_USER_TYPE,P21113001502_APPLUSER_ID,P21113001502_APPLUSER_SUPLR_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P21113001502_APPLUSER_SUPLR_ID IS NOT NULL AND :P21113001502_APPLUSER_USER_TYPE IN (''S'',''T'') THEN ',
    '	 DECLARE',
    '	 	  CURSOR c1',
    '	 	      IS',
    '	 	  SELECT suplr_suplr_id,suplr_name1',
    '	 	    FROM suppliers',
    '	 	   WHERE suplr_bu          = :GLOBAL_bu',
    '	 	     AND suplr_suplr_id    = :P21113001502_APPLUSER_SUPLR_ID',
    '           AND SUPLR_PARTY_TYPE  = ''S''',
    '	 	     AND suplr_status      = ''A'';',
    '	 	     cr1													c1%ROWTYPE;',
    '	 BEGIN',
    '	 	  OPEN c1;',
    '	 	  FETCH c1 INTO cr1;',
    '	 	     IF c1%FOUND THEN',
    '             :P21113001502_EMP_NAME :=cr1.suplr_name1;',
    '             :P21113001502_APPLUSER_PARTY_ID := :P21113001502_APPLUSER_SUPLR_ID;',
    '	 	     END IF;',
    '        CLOSE c1;',
    '    END;',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7116804155890660995)
,p_name=>'PASSWORD'
,p_static_id=>'password'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P21113001502_PASSWORD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7116804721968660996)
,p_event_id=>wwv_flow_imp.id(7116804155890660995)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P21113001502_APPLUSER_PASSWORD',
  'items_to_submit', 'P21113001502_APPLUSER_ID,P21113001502_PASSWORD',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    ':P21113001502_APPLUSER_PASSWORD := func_get_hash(:P21113001502_APPLUSER_ID,:P21113001502_PASSWORD);',
    'END;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7116805954766661003)
,p_name=>'pw_exp_days'
,p_static_id=>'pw-exp-days'
,p_event_sequence=>180
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P21113001502_APPLUSER_PW_EXP_DAYS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7116806484935661004)
,p_event_id=>wwv_flow_imp.id(7116805954766661003)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P21113001502_APPLUSER_PWD_EXP_DUE',
  'items_to_submit', 'P21113001502_APPLUSER_PW_EXP_DAYS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if :P21113001502_APPLUSER_PW_EXP_DAYS is not null then',
    'IF :P21113001502_APPLUSER_PW_EXP_DAYS > 0 THEN',
    '   :P21113001502_APPLUSER_PWD_EXP_DUE := (TRUNC(SYSDATE) + :P21113001502_APPLUSER_PWD_EXP_DUE) - 1;',
    'ELSE',
    '	 :P21113001502_APPLUSER_PWD_EXP_DUE:= NULL;',
    'END IF;',
    ' end if;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7116797429297660957)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Activate'
,p_static_id=>'activate'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_appr_res					VARCHAR2(1);',
'    v_appr_msg					VARCHAR2(1000);',
'    v_erp_admin   	    VARCHAR2(15);',
'    v_erp_user			    VARCHAR2(15);',
'       ',
'BEGIN	',
'	 ',
'	 SELECT appluser_id',
'	   INTO v_erp_admin',
'	   FROM appl_users',
'	  WHERE appluser_bu        = :Global_bu',
'	    AND appluser_user_type = ''R''',
'	    AND appluser_status    = ''A'';',
'      ',
'',
'    SELECT COUNT(*)',
'      INTO v_erp_user',
'      FROM appl_users',
'     WHERE appluser_bu        = :Global_bu',
'       AND appluser_user_type = ''E''',
'       AND appluser_status    = ''A'';	    ',
'	 ',
'	 IF :Global_user = v_erp_admin AND v_erp_user = 0 THEN',
'',
'	 	UPDATE appl_users',
'         SET appluser_status         = ''A'',',
'             appluser_erp_admin_user = ''Y'',',
'             appluser_active_date = TRUNC(SYSDATE),',
'             appluser_upd_by      = :GLOBAL_user,',
'             appluser_upd_date    = SYSDATE',
'       WHERE appluser_bu          = :GLOBAL_bu',
'         AND appluser_party_id    = :P21113001502_APPLUSER_PARTY_ID;',
'',
'',
'   	INSERT INTO appl_users_vw(appluser_bu,',
'											appluser_id,',
'											appluser_password,',
'											appluser_eff_from,',
'											appluser_eff_to,',
'											appluser_emp_id,',
'											appluser_status,',
'											appluser_lock_chk,',
'											appluser_user_type,',
'											appluser_cre_by,',
'											appluser_cre_date,',
'											appluser_cre_ip_addr,',
'											appluser_cre_os_user,',
'											appluser_excel_opoff_flag,',
'											appluser_sys_admin,',
'											appluser_email_id,',
'											appluser_mobile_no,',
'											appluser_pw_exp_rqrd, ',
'											appluser_pw_exp_days)',
'                         (SELECT appluser_bu,',
'											appluser_id,',
'											appluser_password,',
'											appluser_eff_from,',
'											appluser_eff_to,',
'											appluser_emp_id,',
'											appluser_status,',
'											appluser_lock_chk,',
'											appluser_user_type,',
'											appluser_cre_by,',
'											appluser_cre_date,',
'											appluser_cre_ip_addr,',
'											appluser_cre_os_user,',
'											appluser_excel_opoff_flag,',
'											appluser_sys_admin,',
'											appluser_email_id,',
'											appluser_mobile_no,',
'											appluser_pw_exp_rqrd, ',
'											appluser_pw_exp_days ',
'	       				       FROM appl_users',
'	      				      WHERE appluser_bu 	     = :GLOBAL_bu',
'	     				           AND appluser_id         = :P21113001502_APPLUSER_ID',
'	     				           AND appluser_party_id   = :P21113001502_APPLUSER_PARTY_ID);',
'',
'		 	INSERT INTO wf_direct_authorization(wfda_bu, wfda_type, wfda_position, wfda_date_from, wfda_date_to, wfda_seq_no, wfda_value, wfda_sub_seq_no, wfda_appr_bu, ',
'		                      wfda_dflt_flag, wfda_cre_by, wfda_cre_date,wfda_mail_opt_flag, wfda_doc_no, wfda_doc_rev)',
'		               VALUES(:GLOBAL_bu, ''WF_EMPPRO'', :P21113001502_APPLUSER_PARTY_ID, TO_DATE(''01-APR-2023''), TO_DATE(''12-DEC-2999''), 1, NULL, 1, :GLOBAL_bu, ''Y'', :GLOBAL_user, SYSDATE, ''N'', ''1000000002'', 0);   ',
'              				                 ',
'		 	INSERT INTO wf_direct_authorization(wfda_bu, wfda_type, wfda_position, wfda_date_from, wfda_date_to, wfda_seq_no, wfda_value, wfda_sub_seq_no, wfda_appr_bu, ',
'		                      wfda_dflt_flag, wfda_cre_by, wfda_cre_date,wfda_mail_opt_flag, wfda_doc_no, wfda_doc_rev)',
'		               VALUES(:GLOBAL_bu, ''WF_USER'', :P21113001502_APPLUSER_PARTY_ID, TO_DATE(''01-APR-2023''), TO_DATE(''12-DEC-2999''), 1, NULL, 1, :GLOBAL_bu, ''Y'', :GLOBAL_user, SYSDATE, ''N'', ''1000000004'', 0);   ',
'',
'		 	INSERT INTO wf_direct_authorization(wfda_bu, wfda_type, wfda_position, wfda_date_from, wfda_date_to, wfda_seq_no, wfda_value, wfda_sub_seq_no, wfda_appr_bu, ',
'		                      wfda_dflt_flag, wfda_cre_by, wfda_cre_date,wfda_mail_opt_flag, wfda_doc_no, wfda_doc_rev)',
'		               VALUES(:GLOBAL_bu, ''WF_BUS_FUN_ACCS'', :P21113001502_APPLUSER_PARTY_ID, TO_DATE(''01-APR-2023''), TO_DATE(''12-DEC-2999''), 1, NULL, 1, :GLOBAL_bu, ''Y'', :GLOBAL_user, SYSDATE, ''N'', ''1000000001'', 0);   ',
'                          ',
'		 	INSERT INTO wf_direct_authorization(wfda_bu, wfda_type, wfda_position, wfda_date_from, wfda_date_to, wfda_seq_no, wfda_value, wfda_sub_seq_no, wfda_appr_bu, ',
'		                      wfda_dflt_flag, wfda_cre_by, wfda_cre_date,wfda_mail_opt_flag, wfda_doc_no, wfda_doc_rev)',
'		               VALUES(:GLOBAL_bu, ''WF_UNIT_ACCS'', :P21113001502_APPLUSER_PARTY_ID, TO_DATE(''01-APR-2023''), TO_DATE(''12-DEC-2999''), 1, NULL, 1, :GLOBAL_bu, ''Y'', :GLOBAL_user, SYSDATE, ''N'', ''1000000003'', 0);   ',
'          ',
'		 	INSERT INTO wf_direct_authorization(wfda_bu, wfda_type, wfda_position, wfda_date_from, wfda_date_to, wfda_seq_no, wfda_value, wfda_sub_seq_no, wfda_appr_bu, ',
'		                      wfda_dflt_flag, wfda_cre_by, wfda_cre_date,wfda_mail_opt_flag, wfda_doc_no, wfda_doc_rev)',
'		               VALUES(:GLOBAL_bu, ''WF_WORK_FLOW'', :P21113001502_APPLUSER_PARTY_ID, TO_DATE(''01-APR-2023''), TO_DATE(''12-DEC-2999''), 1, NULL, 1, :GLOBAL_bu, ''Y'', :GLOBAL_user, SYSDATE, ''N'', ''1000000005'', 0);   ',
'                          ',
'                          ',
'      IF :P21113001502_APPLUSER_USER_TYPE IN (''E'') THEN',
'',
'	       proc_ins_erp_sys_user(:GLOBAL_bu,',
'	                             :P21113001502_APPLUSER_ID,',
'	                             :GLOBAL_user,',
'	                             ''ERPADMIN'');',
'  ',
'      END IF;',
'',
'      COMMIT;',
'            ',
'	 ELSE',
'',
'     ---raise_application_error(-20999,:P21113001502_APPLUSER_PARTY_ID);',
'       proc_self_wf_appr(:GLOBAL_bu,',
'						     ''WF_USER'',',
'						     :GLOBAL_user,',
'						     1,',
'						     v_appr_res,',
'						     v_appr_msg,',
'						     p_plnt => NULL,',
'						     p_doc_date => NULL,',
'						     p_doc_pfx => ''N'',',
'						     p_doc_no => :P21113001502_APPLUSER_PARTY_ID',
'						     );',
'',
'-- raise_application_error(-20999,v_appr_res);',
'      IF v_appr_res = ''Y'' THEN',
'        :P21113001502_WF_COUNT := ''WFM1091'';  ',
'        apex_application.g_print_success_message := ''User Activated Successfully.'';	 ',
'      ELSE',
'        :P21113001502_WF_COUNT  := ''WFM1090'';',
'      END IF;',
'	 END IF;',
'	-- EXCEPTION WHEN OTHERS THEN proc_apex_err_msg_log(:app_page_id,sqlerrm); ',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7116757319630660678)
,p_internal_uid=>1634835593754049929
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7116802207665660976)
,p_process_sequence=>90
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ACTIVATE'
,p_static_id=>'activate-2'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_appr_res					VARCHAR2(1);',
'    v_appr_msg					VARCHAR2(1000);',
'    v_erp_admin   	    VARCHAR2(15);',
'    v_erp_user			    VARCHAR2(15);',
'       ',
'BEGIN	',
'	 ',
'	 SELECT appluser_id',
'	   INTO v_erp_admin',
'	   FROM appl_users',
'	  WHERE appluser_bu        = :Global_bu',
'	    AND appluser_user_type = ''R''',
'	    AND appluser_status    = ''A'';',
'',
'    SELECT COUNT(*)',
'      INTO v_erp_user',
'      FROM appl_users',
'     WHERE appluser_bu        = :Global_bu',
'       AND appluser_user_type = ''E''',
'       AND appluser_status    = ''A'';	    ',
'	 ',
'	 IF :Global_user = v_erp_admin AND v_erp_user = 0 THEN',
'',
'	 	UPDATE appl_users',
'         SET appluser_status         = ''A'',',
'             appluser_erp_admin_user = ''Y'',',
'             appluser_active_date = TRUNC(SYSDATE),',
'             appluser_upd_by      = :GLOBAL_user,',
'             appluser_upd_date    = SYSDATE',
'       WHERE appluser_bu          = :GLOBAL_bu',
'         AND appluser_party_id    = :P21113001502_APPLUSER_PARTY_ID;',
'',
'      IF :P21113001502_APPLUSER_USER_TYPE IN (''E'') THEN',
'',
'	       proc_ins_erp_sys_user(:GLOBAL_bu,',
'	                             :P21113001502_APPLUSER_ID,',
'	                             :GLOBAL_user,',
'	                             ''ERPADMIN'');',
'  ',
'      END IF;',
'',
'      COMMIT;',
'            ',
'	 ELSE',
'       proc_self_wf_appr(:GLOBAL_bu,',
'						     ''WF_USER'',',
'						     :GLOBAL_user,',
'						     1,',
'						     v_appr_res,',
'						     v_appr_msg,',
'						     p_plnt => NULL,',
'						     p_doc_date => NULL,',
'						     p_doc_pfx => ''N'',',
'						     p_doc_no => :P21113001502_APPLUSER_PARTY_ID',
'						     );',
'',
'      IF v_appr_res = ''Y'' THEN  ',
'        HTP.P(''success'');',
'      ELSE',
'        :P21113001502_WF_COUNT  := ''WFM1090'';',
'      END IF;',
'	 END IF;',
'	 ',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_internal_uid=>1634840372122049948
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7116800604922660971)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CONFRIM_PASSWORD_VALID'
,p_static_id=>'confrim-password-valid'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_err_msg      VARCHAR2(1000);',
'   ',
'	 v_ascii_val								NUMBER(5);',
'    v_pwd_exp_days							NUMBER(5);',
'    v_rules									   VARCHAR2(100);',
'    v_upc									   VARCHAR2(100);',
'    v_lc									      VARCHAR2(100);',
'    v_num									   VARCHAR2(100);',
'    v_spc									   VARCHAR2(100);',
'BEGIN',
'   IF :P21113001502_PASSWORD_2 IS NULL AND :P21113001502_ROWID IS NULL THEN',
'    	 v_err_msg := ''Confirm Password must be entered.'';',
'   END IF;',
'',
'   IF :P21113001502_PASSWORD_2 IS NOT NULL THEN',
'',
'		proc_check_pass_complex (:P21113001502_PASSWORD_2,v_rules,v_upc,v_lc,v_num,v_spc);  ',
'',
'      IF v_rules = ''N'' THEN',
'         v_err_msg := ''Confirm Password must contain atleast one upper case letter , one lower case letter, one number and one special character.'';',
'		END IF;',
'	   ',
'      IF LENGTH(:P21113001502_PASSWORD_2) NOT BETWEEN 3 AND 15 THEN',
'	  	   v_err_msg := ''You must provide 3 to 15 characters for Password.'';',
'	   END IF;',
'   ',
'   END IF;',
'',
'   IF v_err_msg IS NULL THEN',
'      HTP.P(''success'');',
'   ELSE',
'      HTP.P(v_err_msg);',
'   END IF;',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_internal_uid=>1634838769379049943
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7116776936326660860)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(10920590333888929337)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Create User Initilization'
,p_static_id=>'create-user-initilization'
,p_internal_uid=>1634815100783049832
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7116801757433660976)
,p_process_sequence=>60
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'EMAIL_VALID'
,p_static_id=>'email-valid'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_err_msg      VARCHAR2(1000);',
'BEGIN    ',
'',
'   IF :P21113001502_APPLUSER_EMAIL_ID IS NULL THEN',
'       v_err_msg := ''Email Id must be entered.'';',
'   END IF;',
'',
'   IF :P21113001502_APPLUSER_EMAIL_ID IS NOT NULL THEN',
'',
'       DECLARE',
'     	 	CURSOR C1',
'               IS ',
'           SELECT emp_off_email_id,',
'                  emp_emp_id,',
'                  emp_first_name1',
'             FROM employees',
'            WHERE emp_bu         = :GLOBAL_bu ',
'              AND emp_emp_id     <> :P21113001502_APPLUSER_EMP_ID',
'              AND emp_off_email_id = :P21113001502_APPLUSER_EMAIL_ID;',
'',
'              cr1			c1%ROWTYPE;',
'       BEGIN',
'           OPEN c1;',
'           FETCH c1 INTO cr1;',
'               IF c1%FOUND THEN ',
'                   v_err_msg := ''Email Id already linked with another Employee.'';',
'               END IF;',
'           CLOSE c1;',
'       END;',
'',
'   END IF;',
'',
'   IF v_err_msg IS NULL THEN',
'      HTP.P(''success'');',
'   ELSE',
'      HTP.P(v_err_msg);',
'   END IF;',
'',
'END;   '))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_internal_uid=>1634839921890049948
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7116800990677660973)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'EMPLOYEE_VALID'
,p_static_id=>'employee-valid'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_err_msg      VARCHAR2(1000);',
'BEGIN    ',
'   IF :P21113001502_APPLUSER_USER_TYPE NOT IN (''S'',''C'') then',
'',
'      IF :P21113001502_APPLUSER_EMP_ID is null THEN',
'         v_err_msg := ''Emp./Party must be entered.'';',
'      ELSIF :P21113001502_APPLUSER_EMP_ID  is not null then',
'         DECLARE',
'             v_count number(10);',
'         BEGIN',
'',
'             SELECT count(*) into v_count',
'               FROM appl_users ',
'              WHERE appluser_bu = :GLOBAL_bu',
'                AND appluser_emp_id = :P21113001502_APPLUSER_EMP_ID ',
'                AND (ROWID <> :P21113001502_ROWID OR :P21113001502_ROWID IS NULL)',
'                AND appluser_status NOT IN (''D'');',
'',
'          	IF v_count > 0 THEN',
'          	    v_err_msg := ''Employee already linked with another user.'';',
'          	END IF;',
'          ',
'         END;    ',
'      END IF;',
'   END IF;',
'',
'   IF :P21113001502_APPLUSER_USER_TYPE IN (''S'') then',
'      IF :P21113001502_APPLUSER_SUPLR_ID is null  THEN',
'         v_err_msg := ''Emp./Party must be entered.'';',
'      ELSIF :P21113001502_APPLUSER_SUPLR_ID IS NOT NULL THEN',
'      	 DECLARE',
'      	 	  CURSOR c2',
'      	 	      IS',
'      	 	  SELECT * ',
'                FROM appl_users ',
'               WHERE appluser_bu = :GLOBAL_bu ',
'                 AND appluser_suplr_id = :P21113001502_APPLUSER_SUPLR_ID',
'                 AND (ROWID <> :P21113001502_ROWID OR  :P21113001502_ROWID IS NULL)',
'                 AND appluser_status NOT IN (''D''); ',
'      	 	     cr2	c2%ROWTYPE;',
'      	 BEGIN',
'           	  OPEN c2;',
'           	  FETCH c2 INTO cr2;',
'           	     IF c2%FOUND THEN',
'           	     	  v_err_msg := ''Supplier already linked with another user. Username : ''||cr2.appluser_id;',
'                 END IF; ',
'              CLOSE c2;',
'          END;',
'      END IF;  ',
'     END IF;',
'',
'     IF :P21113001502_APPLUSER_USER_TYPE IN (''C'') THEN    ',
'      IF :P21113001502_APPLUSER_CUST_ID IS NULL THEN',
'         v_err_msg := ''Emp./Party must be entered.'';      ',
'      ELSIF :P21113001502_APPLUSER_CUST_ID IS NOT NULL THEN',
'      	 DECLARE',
'      	 	  CURSOR c2',
'      	 	      IS',
'      	 	  SELECT * ',
'                FROM appl_users ',
'               WHERE appluser_bu = :GLOBAL_bu ',
'                 AND appluser_cust_id = :P21113001502_APPLUSER_CUST_ID',
'                 AND (ROWID <> :P21113001502_ROWID OR  :P21113001502_ROWID IS NULL)',
'                 AND appluser_status NOT IN (''D''); ',
'      	 	     cr2	c2%ROWTYPE;',
'      	 BEGIN',
'           	  OPEN c2;',
'           	  FETCH c2 INTO cr2;',
'           	     IF c2%FOUND THEN',
'           	     	  v_err_msg := ''Customer already linked with another user. Username : ''||cr2.appluser_id;',
'                 END IF; ',
'              CLOSE c2;',
'          END;',
'      END IF;   ',
'   END IF;',
' ',
'      ',
'   IF v_err_msg IS NULL THEN',
'      HTP.P(''success'');',
'   ELSE',
'      HTP.P(v_err_msg);',
'   END IF;',
'',
'END;   '))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_internal_uid=>1634839155134049945
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7116797823368660957)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Inactivate'
,p_static_id=>'inactivate'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'	 CURSOR c1',
'	     IS',
'	 SELECT *',
'	   FROM wf_emp_hierarchy',
'	  WHERE weh_bu     = :GLOBAL_bu',
'	    AND weh_emp_id = :P21113001502_APPLUSER_EMP_ID;',
'	    ',
'	    cr1																	c1%ROWTYPE;',
'	    ',
'	 CURSOR c2',
'	     IS',
'	 SELECT *',
'	   FROM wf_emp_hierarchy',
'	  WHERE weh_bu         = :GLOBAL_bu',
'	    AND weh_par_emp_id = :P21113001502_APPLUSER_EMP_ID;',
'	    ',
'	    cr2																	c2%ROWTYPE;',
'	    ',
'	 CURSOR c3',
'	     IS',
'	 SELECT *',
'	   FROM wf_direct_authorization',
'	  WHERE wfda_bu       = :GLOBAL_bu',
'	    AND wfda_position = :P21113001502_APPLUSER_EMP_ID',
'	    AND EXISTS (SELECT wf_auth_type',
'							      FROM work_flow',
'							     WHERE wf_bu 	        = wfda_bu',
'							       AND wf_bus_proc_id = wfda_type',
'							       AND wf_auth_type   = ''E'');',
'	    ',
'	    cr3																	c3%ROWTYPE;',
'	    ',
'	 CURSOR c4',
'	     IS',
'	 SELECT *',
'	   FROM work_flow_doc_control',
'	  WHERE wfdc_bu          = :GLOBAL_bu',
'	    AND wfdc_ctrl_person = :P21113001502_APPLUSER_EMP_ID',
'	    AND wfdc_frwd_rtn    NOT IN (''R'')',
'	    AND EXISTS (SELECT wf_auth_type',
'							      FROM work_flow',
'							     WHERE wf_bu 	        = wfdc_bu',
'							       AND wf_bus_proc_id = wfdc_type',
'							       AND wf_auth_type   = ''E'');',
'	    ',
'	    cr4																	c4%ROWTYPE;',
'	    ',
'	 CURSOR c5',
'	     IS',
'	 SELECT *',
'	   FROM wf_doc_control_log',
'	  WHERE wfdcl_bu               = :GLOBAL_bu',
'	    AND wfdcl_prev_ctrl_person = :P21113001502_APPLUSER_EMP_ID',
'	    AND EXISTS (SELECT wf_auth_type',
'							      FROM work_flow',
'							     WHERE wf_bu 	        = wfdcl_bu',
'							       AND wf_bus_proc_id = wfdcl_type',
'							       AND wf_auth_type   = ''E'');',
'	    ',
'	    cr5																	c5%ROWTYPE;',
'	 ',
'	    v_alert						NUMBER;    ',
'       v_appr_res					VARCHAR2(1);',
'       v_appr_msg					VARCHAR2(1000);',
'       v_erp_admin   	      VARCHAR2(15);',
'       v_erp_user			      VARCHAR2(15);',
'BEGIN',
'	 ',
'	 IF :P21113001502_APPLUSER_EMP_ID IS NOT NULL THEN',
'	 	  ',
'	 	  OPEN c1;',
'	 	  FETCH c1 INTO cr1;',
'	 	     ',
'	 	     IF c1%FOUND THEN',
'	 	     	  raise_application_error(-20999,''Employee Linked in workflow Hierarchy.'');',
'	 	     END IF;',
'	 	     ',
'	 	  CLOSE c1;',
'	 	  ',
'	 	  OPEN c2;',
'	 	  FETCH c2 INTO cr2;',
'	 	     ',
'	 	     IF c2%FOUND THEN',
'	 	     	  raise_application_error(-20999,''Employee Linked in workflow Hierarchy.'');',
'	 	     END IF;',
'	 	     ',
'	 	  CLOSE c2;',
'	 	  ',
'	 	  OPEN c3;',
'	 	  FETCH c3 INTO cr3;',
'	 	     ',
'	 	     IF c3%FOUND THEN',
'	 	     	  raise_application_error(-20999,''Employee Linked in workflow Authorization.'');',
'	 	     END IF;',
'	 	     ',
'	 	  CLOSE c3;',
'	 	  ',
'	 	  OPEN c4;',
'	 	  FETCH c4 INTO cr4;',
'	 	     ',
'	 	     IF c4%FOUND THEN',
'	 	     	  raise_application_error(-20999,''Employee Linked in workflow Document control.'');',
'	 	     END IF;',
'	 	     ',
'	 	  CLOSE c4;',
'',
'	 	  ',
'	 END IF;',
'',
'     proc_self_wf_appr(:GLOBAL_bu,',
'						     ''WF_USER'',',
'						     :GLOBAL_user,',
'						     1,',
'						     v_appr_res,',
'						     v_appr_msg,',
'						     p_plnt => NULL,',
'						     p_doc_date => NULL,',
'						     p_doc_pfx => ''D'',',
'						     p_doc_no => :P21113001502_APPLUSER_ID',
'						     );',
'',
'      IF v_appr_res = ''Y'' THEN',
'        :P21113001502_WF_COUNT := ''WFM1091'';  ',
'        apex_application.g_print_success_message := ''User Deactivated Successfully.'';	 ',
'      ELSE',
'        :P21113001502_WF_COUNT  := ''WFM1090'';',
'      END IF;    ',
'',
'	 ',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7116756844199660676)
,p_internal_uid=>1634835987825049929
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7116801415506660974)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'MOBILE_VALID'
,p_static_id=>'mobile-valid'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_err_msg      VARCHAR2(1000);',
'BEGIN    ',
'   IF :P21113001502_APPLUSER_MOBILE_NO IS NULL THEN',
'       v_err_msg := ''Mobile No. must be entered.'';',
'',
'   END IF;',
'',
'   IF :P21113001502_APPLUSER_MOBILE_NO IS NOT NULL THEN',
'',
'       DECLARE',
'     	 	CURSOR C1',
'               IS ',
'           SELECT emp_off_mobile_no,',
'                  emp_emp_id,',
'                  emp_first_name1',
'             FROM employees',
'            WHERE emp_bu         = :GLOBAL_bu ',
'              AND emp_emp_id     <> :P21113001502_APPLUSER_EMP_ID',
'              AND emp_off_mobile_no = :P21113001502_APPLUSER_MOBILE_NO;',
'',
'              cr1			c1%ROWTYPE;',
'       BEGIN',
'           OPEN c1;',
'           FETCH c1 INTO cr1;',
'               IF c1%FOUND THEN ',
'                   v_err_msg := ''Mobile Number already linked with another Employee.'';',
'               END IF;',
'           CLOSE c1;',
'       END;',
'',
'   END IF;',
'',
'   IF v_err_msg IS NULL THEN',
'      HTP.P(''success'');',
'   ELSE',
'      HTP.P(v_err_msg);',
'   END IF;',
'',
'END;   '))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_internal_uid=>1634839579963049946
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7116800167320660970)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PASSWORD_VALID'
,p_static_id=>'password-valid'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_err_msg      VARCHAR2(1000);',
'   ',
'	 v_ascii_val								NUMBER(5);',
'    v_pwd_exp_days							NUMBER(5);',
'    v_rules									   VARCHAR2(100);',
'    v_upc									   VARCHAR2(100);',
'    v_lc									      VARCHAR2(100);',
'    v_num									   VARCHAR2(100);',
'    v_spc									   VARCHAR2(100);',
'BEGIN',
'   IF :P21113001502_PASSWORD IS NULL AND :P21113001502_ROWID IS NULL THEN',
'    	 v_err_msg := ''Password must be entered.'';',
'   END IF;',
'',
'   IF :P21113001502_PASSWORD IS NOT NULL THEN',
'',
'		proc_check_pass_complex (:P21113001502_PASSWORD,v_rules,v_upc,v_lc,v_num,v_spc);  ',
'',
'      IF v_rules = ''N'' THEN',
'         v_err_msg := ''Password must contain atleast one upper case letter , one lower case letter, one number and one special character.'';',
'		END IF;',
'	   ',
'      IF LENGTH(:P21113001502_PASSWORD) NOT BETWEEN 3 AND 15 THEN',
'	  	   v_err_msg := ''You must provide 3 to 15 characters for Password.'';',
'	   END IF;',
'   ',
'   END IF;',
'',
'   IF v_err_msg IS NULL THEN',
'      HTP.P(''success'');',
'   ELSE',
'      HTP.P(v_err_msg);',
'   END IF;',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_internal_uid=>1634838331777049942
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7116798615693660960)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Post Query'
,p_static_id=>'post-query'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P21113001502_APPLUSER_EMP_ID IS NOT NULL AND :P21113001502_APPLUSER_USER_TYPE IN (''E'',''R'',''U'',''P'',''O'',''D'',''G'',''M'') THEN',
'	 DECLARE  ',
'	 	  CURSOR c1',
'	 	      IS',
'	 	  SELECT emp_emp_id, emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1 emp_name,empai_dept_id,(SELECT dept_name1 FROM departments WHERE dept_bu = emp_bu AND dept_id = empai_dept_id)dept_name,empai_pos_id,(SELECT hrpos_pos_name1 FROM hr_p'
||'ositions WHERE hrpos_bu = emp_bu AND hrpos_pos_id = empai_pos_id)pos_name,emp_start_date, emp_email_id,emp_mobile_no',
'	 	    FROM employees,emp_active_infos WHERE emp_bu  = empai_bu AND emp_emp_id = empai_emp_id AND emp_bu     = :GLOBAL_bu AND emp_emp_id = :P21113001502_APPLUSER_EMP_ID AND emp_status = ''A'';',
'	 	     cr1													c1%ROWTYPE;',
'	 	  CURSOR c4',
'	 	      IS',
'	 	  SELECT *',
'	 	    FROM appl_users WHERE appluser_bu = :GLOBAL_bu AND appluser_id <> :P21113001502_APPLUSER_USER_TYPE AND appluser_emp_id = :P21113001502_APPLUSER_EMP_ID AND appluser_status NOT IN (''D'');	     ',
'	 	     cr4 c4%ROWTYPE; 	  ',
'	 BEGIN',
'	 	  OPEN c1;',
'	 	  FETCH c1 INTO cr1;',
'	 	    IF c1%FOUND THEN',
'            :P21113001502_EMP_NAME:=cr1.emp_name;',
'            :P21113001502_POSITION:=cr1.pos_name;',
'            :P21113001502_DEPARTMENT_NAME :=cr1.dept_name;',
'	 	     END IF; CLOSE c1; END;',
'',
'ELSIF :P21113001502_APPLUSER_CUST_ID IS NOT NULL AND :P21113001502_APPLUSER_USER_TYPE IN (''C'') THEN',
'	 ',
'	 DECLARE',
'	 	  ',
'	 	  CURSOR c1',
'	 	      IS',
'	 	  SELECT suplr_name1',
'	 	    FROM suppliers',
'	 	   WHERE suplr_bu      = :GLOBAL_bu',
'	 	     AND suplr_suplr_id = :P21113001502_APPLUSER_CUST_ID;',
'	 	     ',
'	 	     cr1													c1%ROWTYPE;',
'	 	  ',
'	 BEGIN',
'	 	  ',
'	 	  OPEN c1;',
'	 	  FETCH c1 INTO cr1;',
'	 	     ',
'	 	     IF c1%FOUND THEN',
'	 	     	  :P21113001502_EMP_NAME := cr1.suplr_name1;',
'	 	     END IF;',
'	 	     ',
'	 	  CLOSE c1;',
'	 	  ',
'	 END;',
'	 ',
'ELSIF :P21113001502_APPLUSER_SUPLR_ID IS NOT NULL AND :P21113001502_APPLUSER_USER_TYPE IN (''S'',''T'') THEN',
'	 ',
'	 DECLARE',
'	 	  ',
'	 	  CURSOR c1',
'	 	      IS',
'	 	  SELECT suplr_name1',
'	 	    FROM suppliers',
'	 	   WHERE suplr_bu      = :GLOBAL_bu',
'	 	     AND suplr_suplr_id = :P21113001502_APPLUSER_SUPLR_ID;',
'	 	     ',
'	 	     cr1													c1%ROWTYPE;',
'	 	  ',
'	 BEGIN',
'	 	  ',
'	 	  OPEN c1;',
'	 	  FETCH c1 INTO cr1;',
'	 	     ',
'	 	     IF c1%FOUND THEN',
'	 	     	  :P21113001502_EMP_NAME := cr1.suplr_name1;',
'	 	     END IF;',
'	 	     ',
'	 	  CLOSE c1;',
'	 	  ',
'	 END;',
'	 ',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1634836780150049932
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7116802553195660979)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Pre Insert Update'
,p_static_id=>'pre-insert-update'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P21113001502_ROWID IS NULL THEN',
'   :P21113001502_APPLUSER_CRE_BY       := :GLOBAL_USER;',
'   :P21113001502_APPLUSER_CRE_IP_ADDR  := :GLOBAL_IP;',
'   :P21113001502_APPLUSER_CRE_EMP_ID   := :GLOBAL_EMP_ID;',
'   :P21113001502_APPLUSER_CRE_DATE     := TO_CHAR(SYSDATE,''DD-MON-RRRR HH24:MI:SS'');',
'ELSE',
'   :P21113001502_APPLUSER_UPD_BY       := :GLOBAL_USER;',
'   :P21113001502_APPLUSER_UPD_IP_ADDR  := :GLOBAL_IP;',
'   :P21113001502_APPLUSER_UPD_EMP_ID   := :GLOBAL_EMP_ID;',
'   :P21113001502_APPLUSER_UPD_DATE     := TO_CHAR(SYSDATE,''DD-MON-RRRR HH24:MI:SS'');',
'END IF;      ',
'',
'IF :P21113001502_APPLUSER_USER_TYPE NOT IN (''S'',''C'',''T'') THEN',
'  :P21113001502_APPLUSER_PARTY_ID := :P21113001502_APPLUSER_EMP_ID;',
'ELSIF :P21113001502_APPLUSER_USER_TYPE in (''S'',''T'') THEN',
'  :P21113001502_APPLUSER_PARTY_ID := :P21113001502_APPLUSER_SUPLR_ID;',
'ELSIF :P21113001502_APPLUSER_USER_TYPE = ''C'' THEN',
'  :P21113001502_APPLUSER_PARTY_ID := :P21113001502_APPLUSER_CUST_ID;',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Insert,Update,Activate'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>1634840717652049951
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7116776635348660859)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(10920590333888929337)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Create User'
,p_static_id=>'process-form-create-user'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Insert,Update'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>1634814799805049831
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7116798193912660959)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process from Mobile and email Update '
,p_static_id=>'process-from-mobile-and-email-update'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P21113001502_APPLUSER_ID IS NOT NULL AND :P21113001502_APPLUSER_MOBILE_NO IS NOT NULL  THEN',
'    ',
'    UPDATE employees',
'       SET emp_off_mobile_no = :P21113001502_APPLUSER_MOBILE_NO,',
'           emp_upd_by    = :Global_user,',
'           emp_upd_date  = SYSDATE,',
'           emp_upd_emp_id= :Global_emp_id',
'     WHERE emp_bu         = :GLOBAL_bu ',
'       AND emp_emp_id     = :P21113001502_APPLUSER_EMP_ID;',
'END IF;',
'',
'IF :P21113001502_APPLUSER_ID IS NOT NULL AND :P21113001502_APPLUSER_EMAIL_ID IS NOT NULL  THEN',
'    UPDATE employees',
'       SET emp_off_email_id = :P21113001502_APPLUSER_EMAIL_ID,',
'           emp_upd_by    = :Global_user,',
'           emp_upd_date  = SYSDATE,',
'           emp_upd_emp_id= :Global_emp_id',
'     WHERE emp_bu         = :GLOBAL_bu ',
'       AND emp_emp_id     = :P21113001502_APPLUSER_EMP_ID;',
'END IF;',
'',
'COMMIT;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Insert,Update,Activate'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>1634836358369049931
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6691652558200653204)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process Insert Validate'
,p_static_id=>'process-insert-validate'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'',
'    CURSOR c1',
'        IS  ',
'    SELECT COUNT(*) v_cnt',
'      FROM appl_users',
'     WHERE appluser_id     = :P21113001502_APPLUSER_ID',
'       AND appluser_emp_id = :P21113001502_APPLUSER_EMP_ID',
'     GROUP BY appluser_id,',
'  	       appluser_emp_id;  ',
'',
'   cr1            c1%ROWTYPE;',
'',
'BEGIN',
'    OPEN c1;',
'    FETCH c1 INTO cr1;',
'     	IF c1%FOUND THEN',
'      	   RAISE_APPLICATION_ERROR(-20999,''Username already exists.'');',
'       	END IF;',
'    CLOSE c1; ',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7116757720209660678)
,p_internal_uid=>1212131574415733002
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7116799342099660967)
,p_process_sequence=>70
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SAVE'
,p_static_id=>'save'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  ',
'  CURSOR c1',
'      IS',
'  SELECT *',
'    FROM appl_users',
'   WHERE appluser_id = :P21113001502_APPLUSER_ID',
'     AND (ROWID <> APEX_APPLICATION.G_X01 OR APEX_APPLICATION.G_X01 IS NULL);',
'  ',
'  cr1											c1%ROWTYPE;',
'',
'   CURSOR c2',
'       IS',
'   SELECT *',
'     FROM appl_users',
'    WHERE appluser_bu = :Global_bu',
'      AND appluser_user_type <> ''O''',
'      AND appluser_id = :P21113001502_APPLUSER_ID',
'      AND (ROWID <> APEX_APPLICATION.G_X01 OR APEX_APPLICATION.G_X01 IS NULL);',
'',
'   cr2            c2%ROWTYPE;',
'',
'   v_rules											VARCHAR2(100);',
'   v_rules1											VARCHAR2(100);',
'   v_upc												VARCHAR2(100);',
'   v_lc												VARCHAR2(100);',
'   v_num												VARCHAR2(100);',
'   v_spc												VARCHAR2(100);',
'BEGIN',
'    IF :P21113001502_APPLUSER_USER_TYPE <> ''O'' THEN ',
'      OPEN c1;',
'      FETCH c1 INTO cr1;	 	     ',
'         IF c1%FOUND THEN',
'        	  /* APEX_JSON.OPEN_OBJECT;',
'              APEX_JSON.WRITE(''P21113001502_APPLUSER_ID'',''Username already exists.'');',
'            APEX_JSON.CLOSE_OBJECT;*/',
'            null;',
'         END IF;',
'      CLOSE c1;',
'   ',
'   ELSE',
'      OPEN c2;',
'      FETCH c2 INTO cr2;	 	     ',
'         IF c2%FOUND THEN',
'        	   RAISE_APPLICATION_ERROR(-20999,''Username already exists.'');',
'        	   /*APEX_JSON.OPEN_OBJECT;',
'              APEX_JSON.WRITE(''P21113001502_APPLUSER_ID'',''Username already exists.'');',
'            APEX_JSON.CLOSE_OBJECT;              */',
'         END IF;',
'      CLOSE c2;',
'   END IF;       ',
'END;',
'',
'IF :P21113001502_APPLUSER_EMAIL_ID IS NOT NULL OR :P21113001502_APPLUSER_MOBILE_NO IS NOT NULL  THEN',
'    ',
'    UPDATE employees',
'       SET emp_off_mobile_no = :P21113001502_APPLUSER_MOBILE_NO,',
'           emp_off_email_id  = :P21113001502_APPLUSER_EMAIL_ID,',
'           emp_upd_by        = :Global_user,',
'           emp_upd_date      = SYSDATE,',
'           emp_upd_emp_id    = :Global_emp_id',
'     WHERE emp_bu            = :GLOBAL_bu ',
'       AND emp_emp_id        = :P21113001502_APPLUSER_EMP_ID;',
'END IF;',
'',
'IF APEX_APPLICATION.G_X01 IS NULL THEN',
'',
'   INSERT INTO APPL_USERS (APPLUSER_BU,',
'                           APPLUSER_ID,',
'                           APPLUSER_PASSWORD,',
'                           APPLUSER_EFF_FROM,',
'                           APPLUSER_EFF_TO,',
'                           APPLUSER_EMP_ID,',
'                           APPLUSER_STATUS,',
'                           APPLUSER_LOCK_CHK,',
'                           APPLUSER_USER_TYPE,',
'                           APPLUSER_EXCEL_OPOFF_FLAG,',
'                           APPLUSER_PW_LUD,',
'                           APPLUSER_SYS_ADMIN,',
'                           APPLUSER_PW_EXP_RQRD,',
'                           APPLUSER_SEARCH_LOV,',
'                           APPLUSER_LABEL_CTRL,',
'                           APPLUSER_CRE_BY,',
'                           APPLUSER_CRE_IP_ADDR,',
'                           APPLUSER_CRE_OS_USER,',
'                           APPLUSER_CRE_DATE,',
'                           APPLUSER_MOBILE_USER,',
'                           APPLUSER_APPR_USER,',
'                           APPLUSER_CSD_USER,',
'                           APPLUSER_CUST_PORT_USER,',
'                           APPLUSER_DASHBOARD_USER,',
'                           APPLUSER_ERP_ADMIN_USER,',
'                           APPLUSER_ERP_USER,',
'                           APPLUSER_ESS_USER,',
'                           APPLUSER_HRMS_USER,',
'                           APPLUSER_MKTG_USER,',
'                           APPLUSER_PROD_USER,',
'                           APPLUSER_SMW_USER,',
'                           APPLUSER_SUBCONTR_PORT_USER,',
'                           APPLUSER_SUPLR_PORT_USER,',
'                           APPLUSER_SYS_ADMIN_USER,',
'                           APPLUSER_EMAIL_ID,',
'                           APPLUSER_MOBILE_NO,',
'                           APPLUSER_PARTY_TYPE,',
'                           APPLUSER_PARTY_ID,',
'                           APPLUSER_POS_ID,',
'                           APPLUSER_DEPT_ID,',
'                           APPLUSER_PWD_EXPIRED,',
'                           APPLUSER_MGMT_TYPE,',
'                           APPLUSER_APEX_LANG,',
'                           APPLUSER_OTP_FLAG,',
'                           APPLUSER_OTP_SOURCE,',
'                           APPLUSER_ALLOW_CC_USER)',
'                 VALUES (:GLOBAL_BU,',
'                         :P21113001502_APPLUSER_ID,',
'                         :P21113001502_APPLUSER_PASSWORD,',
'                         TO_DATE(:P21113001502_APPLUSER_EFF_FROM,:GLOBAL_DATE_FORMAT),',
'                         TO_DATE(:P21113001502_APPLUSER_EFF_TO,:GLOBAL_DATE_FORMAT),',
'                         :P21113001502_APPLUSER_EMP_ID,',
'                         ''N'',',
'                         ''N'',',
'                         :P21113001502_APPLUSER_USER_TYPE,',
'                         ''Y'',',
'                         NULL,',
'                         ''N'',',
'                         ''N'',',
'                         ''S'',',
'                         ''S'',',
'                         :GLOBAL_USER,',
'                         :GLOBAL_IP,',
'                         NULL,',
'                         SYSDATE,',
'                         ''N'',',
'                         ''N'',',
'                         ''N'',',
'                         ''N'',',
'                         ''N'',',
'                         ''N'',',
'                         ''N'',',
'                         ''N'',',
'                         ''N'',',
'                         ''N'',',
'                         ''N'',',
'                         ''N'',',
'                         ''N'',',
'                         ''N'',',
'                         ''N'',',
'                         :P21113001502_APPLUSER_EMAIL_ID,',
'                         :P21113001502_APPLUSER_MOBILE_NO,',
'                         ''E'',',
'                         :P21113001502_APPLUSER_PARTY_ID,',
'                         :P21113001502_APPLUSER_POS_ID,',
'                         :P21113001502_APPLUSER_DEPT_ID,',
'                         ''N'',',
'                         ''S'',',
'                         ''en'',',
'                         ''N'',',
'                         ''S'',',
'                         ''N'');',
'    COMMIT;',
'    HTP.P(''success'');',
'ELSE',
' ',
'   UPDATE APPL_USERS',
'      SET APPLUSER_ID         =  :P21113001502_APPLUSER_ID,',
'          APPLUSER_PASSWORD   =  :P21113001502_APPLUSER_PASSWORD,',
'          APPLUSER_USER_TYPE  =  :P21113001502_APPLUSER_USER_TYPE,',
'          APPLUSER_EMP_ID     =  :P21113001502_APPLUSER_EMP_ID,',
'          APPLUSER_CUST_ID    =  :P21113001502_APPLUSER_CUST_ID,',
'          APPLUSER_SUPLR_ID   =  :P21113001502_APPLUSER_SUPLR_ID,',
'          APPLUSER_MOBILE_NO  =  :P21113001502_APPLUSER_MOBILE_NO,',
'          APPLUSER_EMAIL_ID   =  :P21113001502_APPLUSER_EMAIL_ID,',
'          APPLUSER_EFF_FROM   =  TO_DATE(:P21113001502_APPLUSER_EFF_FROM,:GLOBAL_DATE_FORMAT),',
'          APPLUSER_EFF_TO     =  TO_DATE(:P21113001502_APPLUSER_EFF_TO,:GLOBAL_DATE_FORMAT),',
'          APPLUSER_POS_ID     =  :P21113001502_APPLUSER_POS_ID,',
'          APPLUSER_DEPT_ID    =  :P21113001502_APPLUSER_DEPT_ID,      ',
'          APPLUSER_PARTY_ID   =  :P21113001502_APPLUSER_PARTY_ID',
'    WHERE ROWID   = APEX_APPLICATION.G_X01;',
'    ',
'    COMMIT;',
'    HTP.P(''success'');',
'',
'END IF;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_internal_uid=>1634837506556049939
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7116802976477660981)
,p_process_sequence=>80
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SAVE1'
,p_static_id=>'save-2'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_json.open_object();',
'',
'apex_json.write(''message'',''User Name already exists.'');',
'',
'apex_json.close_object();'))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_internal_uid=>1634841140934049953
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7116799739309660970)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'USER_NAME_VALID'
,p_static_id=>'user-name-valid'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   v_err_msg   VARCHAR2(1000);',
'BEGIN   ',
'   IF :P21113001502_APPLUSER_ID IS NULL THEN',
'       v_err_msg := ''User name must be entered.'';  ',
'   END IF;',
'',
'   IF :P21113001502_APPLUSER_ID IS NOT NULL THEN',
'   	 ',
'   DECLARE',
'	 	  v_ascii_val									NUMBER(5);',
'	 	  p_pwd_exp_days								NUMBER(5);',
'        p_bu											VARCHAR2(50);',
'		  p_user_name									VARCHAR2(50);',
'		  p_password									VARCHAR2(50);',
' ',
'        CURSOR c1',
'             IS',
'         SELECT COUNT(*) v_user_cnt ',
'           FROM appl_users',
'          WHERE appluser_bu = p_bu',
'            AND appluser_id NOT IN (''ERPADMIN'', ''SYSADMIN'')',
'            AND appluser_status NOT IN (''D'');',
'            ',
'      cr1															c1%ROWTYPE;',
'      ',
'      v_named_user								NUMBER(5)   := 200;			',
'      v_user_min_len							  	NUMBER(5)   := 3;			',
'      v_user_max_len								NUMBER(5)   := 15;			',
'      v_user_an_allow							VARCHAR2(2) := ''AN'';	  --User character type ''AA'' - Alphabet Only ''AN'' - Aplha Numeric',
'      v_user_an_res								VARCHAR2(1) := ''N'';	    --User character type ''AA'' - Alphabet Only ''AN'' - Aplha Numeric',
'',
'         ',
'   BEGIN',
'   ',
'   	 OPEN c1;',
'   	 FETCH c1 INTO cr1;',
'   	    ',
'   	    IF cr1.v_user_cnt > v_named_user THEN',
'             v_err_msg := ''No. of Users exceeded than the Limit.'';  ',
'   	    END IF;',
'   	    ',
'   	 CLOSE c1;',
'',
'      IF :P21113001502_APPLUSER_ID IS NOT NULL THEN',
'',
'      	  IF TO_NUMBER(LENGTH(:P21113001502_APPLUSER_ID)) NOT BETWEEN v_user_min_len AND v_user_max_len THEN ',
'             v_err_msg := ''You must provide 3 to 15 characters for Username.'';    ',
'      	  END IF;',
'',
'      END IF;',
'   END;        ',
'   ',
'   END IF;',
'   --raise_application_error(-20010,v_err_msg);',
'   IF v_err_msg IS NULL THEN',
'      HTP.P(''success'');',
'   ELSE',
'      HTP.P(v_err_msg);',
'   END IF;',
'',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_internal_uid=>1634837903766049942
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7116798990816660963)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'User Validate'
,p_static_id=>'user-validate'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  ',
'  CURSOR c1',
'      IS',
'  SELECT *',
'    FROM appl_users',
'   WHERE appluser_id = :P21113001502_APPLUSER_ID',
'     AND (ROWID <> :P21113001502_ROWID OR :P21113001502_ROWID IS NULL);',
'  ',
'  cr1											c1%ROWTYPE;',
'',
'   CURSOR c2',
'       IS',
'   SELECT *',
'     FROM appl_users',
'    WHERE appluser_bu = :Global_bu',
'      AND appluser_user_type <> ''O''',
'      AND appluser_id = :P21113001502_APPLUSER_ID',
'      AND (ROWID <> :P21113001502_ROWID OR :P21113001502_ROWID IS NULL);',
'',
'   cr2            c2%ROWTYPE;',
'',
'   CURSOR c3',
'       IS',
'   SELECT COUNT(*) v_cnt',
'     FROM appl_users',
'    WHERE appluser_bu <> :Global_bu',
'      AND appluser_id = :P21113001502_APPLUSER_ID;   ',
'   ',
'   cr3            c3%ROWTYPE;',
'',
'   CURSOR c4',
'       IS  ',
'   SELECT COUNT(*) v_cnt',
'     FROM appl_users',
'    WHERE appluser_id 			= :P21113001502_APPLUSER_ID',
'      AND appluser_emp_id 	   = :P21113001502_APPLUSER_EMP_ID',
'   GROUP BY appluser_id,',
'  	         appluser_emp_id;  ',
'',
'   cr4            c4%ROWTYPE;',
'   ',
'BEGIN',
'   IF :P21113001502_APPLUSER_USER_TYPE <> ''O'' THEN ',
'      OPEN c1;',
'      FETCH c1 INTO cr1;	 	     ',
'         IF c1%FOUND THEN',
'        	   RAISE_APPLICATION_ERROR(-20999,''Username already exists.'');',
'         END IF;',
'      CLOSE c1;',
'   ',
'   ELSE',
'      OPEN c2;',
'      FETCH c2 INTO cr2;	 	     ',
'         IF c2%FOUND THEN',
'        	   RAISE_APPLICATION_ERROR(-20999,''Username already exists.'');',
'         END IF;',
'      CLOSE c2;',
'',
'      OPEN c3;',
'      FETCH c3 INTO cr3;',
'         IF cr3.v_cnt > 0 THEN',
'            RAISE_APPLICATION_ERROR(-20999,''Username already exists.'');',
'         END IF;',
'      CLOSE c3;',
'',
'      OPEN c4;',
'      FETCH c4 INTO cr4;',
'        	IF cr4.v_cnt > 1 THEN',
'        	   RAISE_APPLICATION_ERROR(-20999,''Same Username and Employee already exists.'');',
'        	END IF;',
'      CLOSE c4; ',
'   END IF;   ',
'',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Insert,Update,Activate'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>1634837155273049935
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6002037136709838935)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'WORKFLOW'
,p_static_id=>'workflow'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'IF :P21113001502_WF_NO IS NOT NULL THEN',
'    SELECT wfdc_doc_no',
'      INTO :P21113001502_APPLUSER_EMP_ID',
'      FROM work_flow_doc_control',
'     WHERE wfdc_wf_no = :P21113001502_WF_NO;',
'END IF;',
'EXCEPTION WHEN NO_DATA_FOUND THEN',
'    NULL;',
'END;',
'',
'BEGIN',
'SELECT ROWID',
'  INTO :P21113001502_ROWID',
'  FROM APPL_USERS',
' WHERE APPLUSER_BU = :GLOBAL_bu',
'   AND APPLUSER_EMP_ID = :P21113001502_APPLUSER_EMP_ID;',
'EXCEPTION WHEN NO_DATA_FOUND THEN',
'    NULL;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>520075301166227907
);
wwv_flow_imp.component_end;
end;
/
