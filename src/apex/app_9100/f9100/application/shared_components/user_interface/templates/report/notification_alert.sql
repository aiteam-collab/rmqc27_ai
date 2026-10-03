prompt --application/shared_components/user_interface/templates/report/notification_alert
begin
--   Manifest
--     ROW TEMPLATE: notification-alert
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>70183973784188715
,p_default_application_id=>9100
,p_default_id_offset=>70189399542726671
,p_default_owner=>'RMQC27_AI'
);
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(11675079996724977856)
,p_row_template_name=>'Notification_alert'
,p_static_id=>'notification-alert'
,p_internal_name=>'NOTIFICATION_ALERT'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'      ',
'   .table_all',
'   {',
'      border-collapse: collapse;',
'      border-spacing: 75px;',
'      border: 0px solid #D5DBDB;',
'      padding: 3px;',
'   }    ',
'',
'   .th_all',
'   {',
'      border: 0px solid #D5DBDB;',
'      padding: 5px;',
'   }',
'    ',
'   .td_all ',
'   {',
'      border: 0px solid #D5DBDB;',
'      padding: 5px;',
'   }',
'    ',
'   .tr_all',
'   {',
'       border-left: 5px solid rgb(62, 110, 188);',
'       border-bottom: 1px solid #D5DBDB;',
'   }',
'    ',
'   .tr_all:hover ',
'   {',
'',
'       border-left: 5px solid #AF4B37;',
'   }',
'                ',
'</style>',
'<table width = "100%" border="1" class = "table_all">    ',
'<tr class="tr_all">',
'<td class="td_all" style="vertical-align:top">#ALERT_ICON#</td>',
'<td class="td_all"><h4 style="color:#154360;">#ALERT_SUBJ#</h4>',
'    <p style="font-size:12px;">#ALERT_MSG1#</p>',
'    <p style="font-size:12px;">#ALERT_MSG#</p>',
'    <p style="text-align:right; font-size:9px; color: #2980B9">#ALERT_DATE#</p></td>',
'<td class="td_all">#ALERT_ICON1#</td>',
'</tr>',
'',
'</table>'))
,p_row_template_condition1=>':ALERT_LINK IS NULL'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'      ',
'   .table_all',
'   {',
'      border-collapse: collapse;',
'      border-spacing: 75px;',
'      border: 0px solid #D5DBDB;',
'      padding: 3px;',
'   }    ',
'',
'   .th_all',
'   {',
'      border: 0px solid #D5DBDB;',
'      padding: 5px;',
'   }',
'    ',
'   .td_all ',
'   {',
'      border: 0px solid #D5DBDB;',
'      padding: 5px;',
'   }',
'    ',
'   .tr_all',
'   {',
'       border-left: 5px solid rgb(62, 110, 188);',
'       border-bottom: 1px solid #D5DBDB;',
'   }',
'    ',
'   .tr_all:hover ',
'   {',
'',
'       border-left: 5px solid #AF4B37;',
'   }',
'            ',
'</style>',
'',
'<a href="#ALERT_LINK#">',
'    <table width = "100%" border="1" class = "table_all">    ',
'<tr class="tr_all">',
'<td class="td_all" style="vertical-align:top">#ALERT_ICON#</td>',
'<td class="td_all"><h4 style="color:#154360;">#ALERT_SUBJ#</h4>',
'    <p style="font-size:12px;">#ALERT_MSG1#</p>',
'    <p style="font-size:12px;">#ALERT_MSG#</p>',
'    <p style="text-align:right; font-size:9px; color: #2980B9">#ALERT_DATE#</p></td>',
'<td class="td_all">#ALERT_ICON1#</td>',
'</tr>',
'',
'</table>',
'</a>'))
,p_row_template_condition2=>':ALERT_LINK IS NOT NULL'
,p_row_template_before_rows=>' '
,p_row_template_after_rows=>' '
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_theme_id=>42
,p_theme_class_id=>7
,p_translate_this_template=>'N'
);
wwv_flow_imp.component_end;
end;
/
