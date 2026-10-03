prompt --application/shared_components/user_interface/templates/report/bi_card
begin
--   Manifest
--     ROW TEMPLATE: bi-card
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
 p_id=>wwv_flow_imp.id(77760528479222550)
,p_row_template_name=>'BI_CARD'
,p_static_id=>'bi-card'
,p_internal_name=>'BI_CARD'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="bi-card-box" style="width: 100%; background: #ffffff; border: 1px solid #d0d7de; border-radius: 6px; box-shadow: 0 1px 3px rgba(0,0,0,0.06); overflow: hidden; margin: 0; box-sizing: border-box;">',
'  <div class="bi-card-title" style="background: #f8fafc; border-bottom: 2px solid #0D6ABF; padding: 7px 12px; font-size: 13px; font-weight: 700; color: #0D6ABF; text-align: center; text-transform: uppercase; letter-spacing: 0.5px; white-space: nowrap'
||'; overflow: hidden; text-overflow: ellipsis; box-sizing: border-box;">',
'    #NAME#',
'  </div>',
'  <div class="bi-card-metric" style="padding: 10px 12px; display: flex; align-items: center; justify-content: center; gap: 14px; min-height: 42px; text-align: center; box-sizing: border-box; flex-wrap: wrap;">',
'    <div style="background: #e8f5e9; border: 1px solid #a5d6a7; border-radius: 4px; padding: 4px 12px; display: inline-flex; align-items: center; gap: 6px; box-sizing: border-box;">',
'      <span style="font-size: 12px; font-weight: 700; color: #2e7d32;">#LABEL1#:</span>',
'      <span style="font-size: 16px; font-weight: 700; color: #1b5e20;">#TOTAL#</span>',
'    </div>',
'    <div style="background: #ffebee; border: 1px solid #ef9a9a; border-radius: 4px; padding: 4px 12px; display: inline-flex; align-items: center; gap: 6px; box-sizing: border-box;">',
'      <span style="font-size: 12px; font-weight: 700; color: #c62828;">#LABEL2#:</span>',
'      <span style="font-size: 16px; font-weight: 700; color: #b71c1c;">#AVERAGE#</span>',
'    </div>',
'  </div>',
'</div>'))
,p_row_template_before_rows=>'<div class="bi-card-wrapper" style="width: 100%; padding: 0; margin: 0; box-sizing: border-box;">'
,p_row_template_after_rows=>'</div>'
,p_row_template_type=>'NAMED_COLUMNS'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Cards--basic:t-Cards--float:t-Cards--animColorFill'
,p_translate_this_template=>'N'
);
wwv_flow_imp.component_end;
end;
/
