prompt --application/shared_components/plugins/dynamic_action/nl_smart4solutions_tabular_cascading_lov
begin
--   Manifest
--     PLUGIN: NL.SMART4SOLUTIONS.TABULAR_CASCADING_LOV
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>70183973784188715
,p_default_application_id=>9100
,p_default_id_offset=>70189399542726671
,p_default_owner=>'RMQC27_AI'
);
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(11160987281328878984)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'NL.SMART4SOLUTIONS.TABULAR_CASCADING_LOV'
,p_display_name=>'SMART4SOLUTIONS Tabular Cascading LOV'
,p_apexlang_name=>'smart4solutionsTabularCascadingLov'
,p_category=>'COMPONENT'
,p_image_prefix=>nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','NL.SMART4SOLUTIONS.TABULAR_CASCADING_LOV'),'')
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function render_code',
'  ( p_dynamic_action in apex_plugin.t_dynamic_action',
'  , p_plugin         in apex_plugin.t_plugin',
'  ) return apex_plugin.t_dynamic_action_render_result',
'is',
'  l_render_result apex_plugin.t_dynamic_action_render_result;',
'  l_elem          apex_application_page_da_acts.attribute_01%type := p_dynamic_action.attribute_01; -- the triggering element ie "f03"',
'  l_key           apex_application_page_da_acts.attribute_02%type := p_dynamic_action.attribute_02; -- the hidden element containing the row key ie "f02"',
'  l_child         apex_application_page_da_acts.attribute_03%type := p_dynamic_action.attribute_03; -- the element that must be populated ie "f04"',
'  crlf            char(1) := chr(10);',
'  l_ajaxid        varchar2(255) := apex_plugin.get_ajax_identifier;',
'begin',
'',
'  apex_javascript.add_library',
'    ( p_name                  => ''s4s_casclov.min''',
'    , p_directory             => p_plugin.file_prefix',
'    , p_check_to_add_minified => false );',
'',
'  apex_javascript.add_onload_code(''$(document).on("change", "select[name='''''' || l_elem || '''''']", function() { s4s_casclov(this, "'' || l_key || ''", "'' || l_child || ''", "'' || l_ajaxid || ''") })'');',
'  apex_javascript.add_onload_code(''$("select[name='''''' || l_elem || '''''']").each( function() { s4s_casclov(this, "'' || l_key || ''", "'' || l_child || ''", "'' || l_ajaxid || ''") } )'');',
'  apex_javascript.add_onload_code(''$(document).on("apexafterrefresh", function() {$("select[name='''''' || l_elem || '''''']").each( function() { s4s_casclov(this, "'' || l_key || ''", "'' || l_child || ''", "'' || l_ajaxid || ''") } )});'');',
'  ',
'  l_render_result.javascript_function := ''void(0)'';',
'  ',
'  return(l_render_result);',
'  ',
'end render_code;',
'',
'function get_options',
'  ( p_dynamic_action in apex_plugin.t_dynamic_action',
'  , p_plugin         in apex_plugin.t_plugin',
'  ) return apex_plugin.t_dynamic_action_ajax_result',
'is',
'  l_noselect         apex_application_page_da_acts.attribute_04%type := p_dynamic_action.attribute_04; -- what should be displayed when nothing is selected ie "Select employee"',
'  l_sql              apex_application_page_da_acts.attribute_05%TYPE := p_dynamic_action.attribute_05; -- the select statement responsible for population the child LOV',
'  l_sql_childval     apex_application_page_da_acts.attribute_06%TYPE := p_dynamic_action.attribute_06; -- the select statement to find the current childs value',
'  l_parent_val       varchar2(255)    := apex_application.g_x01;',
'  l_key_val          varchar2(255)    := apex_application.g_x02;',
'  l_child_val        varchar2(255)    := coalesce(apex_application.g_x03, ''#$%NOTHINGSELECTED%$#'');',
'  l_json             varchar2(32767)  := ''{"KEY0": {"DISPVAL":"'' || l_noselect || ''","RETVAL":"","SELECTED":""},'';',
'  l_json_record      varchar2(2000);',
'  l_count            pls_integer      := 0;',
'  type query_curtype is ref cursor;',
'  c_cursor query_curtype;',
'  type t_option is record ( display_value varchar(255), return_value varchar2(255) );',
'  l_option t_option;',
'  l_retval apex_plugin.t_dynamic_action_ajax_result;',
'begin',
'',
'  if l_key_val is not null and l_sql_childval is not null',
'  then',
'    execute immediate l_sql_childval into l_child_val using l_key_val;',
'  end if;',
'  ',
'  open c_cursor for l_sql using l_parent_val;',
'  loop',
'    -- reset the json_record',
'    l_json_record := ''"KEY#COUNT#": {"DISPVAL":"#DISPVAL#","RETVAL":"#RETVAL#","SELECTED":"#SELECTED#"},'';',
'    -- fetch first record',
'    fetch c_cursor into l_option;',
'    exit when c_cursor%notfound;',
'    -- create the json-record',
'    l_count := l_count + 1;',
'    l_json_record := replace( l_json_record, ''#COUNT#''  , l_count                );',
'    l_json_record := replace( l_json_record, ''#DISPVAL#'', l_option.display_value );',
'    l_json_record := replace( l_json_record, ''#RETVAL#'' , l_option.return_value  );',
'    case',
'      when l_child_val = l_option.return_value',
'      then',
'        l_json_record := replace(l_json_record, ''#SELECTED#'', l_option.return_value);',
'      else',
'        l_json_record := replace(l_json_record, ''#SELECTED#'', null);',
'    end case;',
'    -- append the json-record to the return value',
'    l_json := l_json || l_json_record;',
'  end loop;',
'  ',
'  l_json := trim('','' from l_json) || ''}'';',
'  ',
'  -- send the return value',
'  htp.p( l_json );',
'  ',
'  return l_retval;',
'  ',
'exception',
'  when others then',
'    htp.p( ''sql = '' || l_sql );',
'    htp.p( ''key_val = '' || l_key_val );',
'    return l_retval;',
'  ',
'end get_options;',
''))
,p_api_version=>1
,p_render_function=>'render_code'
,p_ajax_function=>'get_options'
,p_substitute_attributes=>true
,p_version_identifier=>'1.1'
,p_about_url=>'https://apex.oracle.com/pls/apex/f?p=SMART4SOLUTIONS:230:0::NO:::'
,p_files_version=>7
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(11160987558690878987)
,p_plugin_id=>wwv_flow_imp.id(11160987281328878984)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_static_id=>'attribute_01'
,p_prompt=>'triggering element'
,p_apexlang_name=>'triggeringElement'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_text_case=>'LOWER'
,p_examples=>'f03'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter the name of the parent element (the element that triggers the update of the child element)',
'You can find the correct name by inspecting the element in your browsers'' inspector. ',
'Look for the "name" attribute, this is the value you should enter here.',
'for example "f03"'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(11160987974285878987)
,p_plugin_id=>wwv_flow_imp.id(11160987281328878984)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_static_id=>'attribute_02'
,p_prompt=>'row key'
,p_apexlang_name=>'rowKey'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_examples=>'f02'
,p_help_text=>'hidden element containing the row key'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(11160988385747878987)
,p_plugin_id=>wwv_flow_imp.id(11160987281328878984)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_static_id=>'attribute_03'
,p_prompt=>'child element'
,p_apexlang_name=>'childElement'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_examples=>'f04'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter the name of the parent element (the element that triggers the update of the child element)',
'You can find the correct name by inspecting the element in your browsers'' inspector. ',
'Look for the "name" attribute, this is the value you should enter here.',
'for example "f03"'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(11160988802940878989)
,p_plugin_id=>wwv_flow_imp.id(11160987281328878984)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_static_id=>'attribute_04'
,p_prompt=>'nothing selected text'
,p_apexlang_name=>'nothingSelectedText'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'-- please choose --'
,p_is_translatable=>false
,p_examples=>'-- Select employee --'
,p_help_text=>'What should be displayed when no choice has been made.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(11160989144554878990)
,p_plugin_id=>wwv_flow_imp.id(11160987281328878984)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_static_id=>'attribute_05'
,p_prompt=>'query'
,p_apexlang_name=>'query'
,p_attribute_type=>'SQL'
,p_is_required=>true
,p_default_value=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ename d',
',      empno r',
'from   emp',
'where  deptno = :deptno',
'order by 1'))
,p_sql_min_column_count=>2
,p_sql_max_column_count=>2
,p_is_translatable=>false
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ename d',
',      empno r',
'from   emp',
'where  deptno = :deptno',
'order by 1'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter the query responsible for populating the child element.',
'The query should return two columns: d and r (for display-value and return-value)',
'and contain a where clause that refers to the parent elements value.',
'That parent elements value should be preceded by a colon, as shown in the example:',
'',
'select ename d',
',      empno r',
'from   emp',
'where  deptno = :deptno',
'order by 1'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(11160989564689878990)
,p_plugin_id=>wwv_flow_imp.id(11160987281328878984)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_static_id=>'attribute_06'
,p_prompt=>'Child query'
,p_apexlang_name=>'childQuery'
,p_attribute_type=>'SQL'
,p_is_required=>false
,p_default_value=>'SELECT empno FROM emplog WHERE ID = :l_key_val'
,p_sql_min_column_count=>1
,p_sql_max_column_count=>1
,p_is_translatable=>false
,p_examples=>'SELECT empno FROM emplog WHERE ID = :l_key_val'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter the query that gets the current child elements value from the database.',
'',
'The query should return a single row and a single column and should have a bind variable in the where clause.'))
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '66756E6374696F6E207334735F636173636C6F7628672C662C612C69297B76617220653D242867293B766172206A3D2223222B662B225F222B242865292E617474722822696422292E737562737472696E672834293B76617220623D2223222B612B225F';
wwv_flow_imp.g_varchar2_table(2) := '222B242865292E617474722822696422292E737562737472696E672834293B766172206B3D24286A292E76616C28293B76617220643D242865292E76616C28293B76617220683D22223B76617220633D7B705F726571756573743A22504C5547494E3D22';
wwv_flow_imp.g_varchar2_table(3) := '2B692C705F666C6F775F69643A2476282270466C6F77496422292C705F666C6F775F737465705F69643A2476282270466C6F7753746570496422292C705F696E7374616E63653A2476282270496E7374616E636522292C7830313A642C7830323A6B2C7D';
wwv_flow_imp.g_varchar2_table(4) := '3B242E616A6178287B75726C3A227777765F666C6F772E73686F77222C646174613A632C73657474696E67733A7B747970653A22504F5354222C64617461547970653A226A736F6E227D7D292E646F6E652866756E6374696F6E286D297B766172206C3D';
wwv_flow_imp.g_varchar2_table(5) := '6A51756572792E70617273654A534F4E286D293B242862292E66696E6428226F7074696F6E22292E72656D6F766528293B242E65616368286C2C66756E6374696F6E286E2C6F297B242862292E617070656E6428223C6F7074696F6E2076616C75653D22';
wwv_flow_imp.g_varchar2_table(6) := '2B6F2E52455456414C2B223E222B6F2E4449535056414C2B223C2F6F7074696F6E3E22293B6966286F2E53454C4543544544213D2222297B683D6F2E53454C45435445447D7D293B69662868213D2222297B24282273656C656374222B62292E76616C28';
wwv_flow_imp.g_varchar2_table(7) := '68293B636F6E736F6C652E6C6F67282273656C656374222B62293B636F6E736F6C652E6C6F672868297D242867292E626C757228293B24282273656C656374222B62292E6368616E676528293B617065782E7769646765742E746162756C61722E675461';
wwv_flow_imp.g_varchar2_table(8) := '62466F726D446174613D5B5D3B242E656163682824785F466F726D4974656D7328247828617065782E7769646765742E746162756C61722E67546162466F726D5265706F7274494429292C66756E6374696F6E28297B617065782E7769646765742E7461';
wwv_flow_imp.g_varchar2_table(9) := '62756C61722E67546162466F726D446174612E7075736828242874686973292E76616C2829297D297D297D3B';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(11160990391240879001)
,p_plugin_id=>wwv_flow_imp.id(11160987281328878984)
,p_file_name=>'s4s_casclov.min.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
begin
wwv_flow_imp.component_end;
end;
/
