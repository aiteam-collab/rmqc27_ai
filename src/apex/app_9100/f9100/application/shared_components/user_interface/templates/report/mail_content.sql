prompt --application/shared_components/user_interface/templates/report/mail_content
begin
--   Manifest
--     ROW TEMPLATE: mail-content
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
 p_id=>wwv_flow_imp.id(11681328573160747232)
,p_row_template_name=>'Mail Content'
,p_static_id=>'mail-content'
,p_internal_name=>'MAIL_CONTENT'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'hr.new3 ',
'{',
' border-top: 1px dotted #7F8C8D;',
'}',
'',
'pre',
'{',
' font-family: Arial;',
' font-size: 1.2rem;',
'}',
'</style>',
'<table width="100%" border="0">',
'<tr>',
'<td></td>',
'<td><h3>#SUBJECT#<h3></td>',
'<td></td>',
'</tr>',
'<tr>',
'<td width="3%">#ICON#</td>',
'<td><b>#SENDER#</b><br><span style="font-size: 1rem;letter-spacing: .3px;color: #5f6368;line-height: 10px;">#SEND_TO#</span></td>',
'<td align="right"><span style="font-size: 11px; color:#2980B9">#DATE_SINCE#</span></td>',
'</tr>',
'<tr>',
'<td></td>',
'<td colspan="2"><span style="font-size: 13px; color:#1C2833"><pre style="white-space:pre-wrap">#MESSAGE#</pre></span></td>',
'</tr>',
'<tr>',
'<td></td>',
'<td colspan="2"><br><hr class="new3"></td>',
'</tr>',
'</table>'))
,p_row_template_before_rows=>' '
,p_row_template_after_rows=>' '
,p_row_template_type=>'NAMED_COLUMNS'
,p_theme_id=>42
,p_theme_class_id=>7
,p_translate_this_template=>'N'
);
wwv_flow_imp.component_end;
end;
/
