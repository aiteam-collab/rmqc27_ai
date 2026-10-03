prompt --application/pages/page_00103
begin
--   Manifest
--     PAGE: 00103
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
 p_id=>103
,p_name=>'Roadmap ERP'
,p_alias=>'ROADMAP-ERP'
,p_step_title=>'Roadmap ERP'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_FILES#expandRegion.js',
'#APP_FILES#RMWEB.js'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(document).ready(function () {',
'    $("#NOT").hide();',
'    updateFullClass();',
'    updateTreeUIStyles();',
'    // toggleTreeNodes();',
'});',
'$(function () {',
'    // Cache frequently used elements',
'    const $treeView = $(''.a-TreeView'');',
'    const $collapseButton = $(''#collapse'');',
'    const $selectFlagInput = $("#P165_SEL_FLAG input[type=checkbox]");',
'    const $collapseButtonQuery = document.querySelector("#collapse");',
'',
'    // Update full class and tree UI styles (helper function)',
'    const updateAllClasses = () => {',
'        updateFullClass();',
'        updateTreeUIStyles();',
'        //toggleTreeNodes();',
'    };',
'',
'    // Event listener for tree view label click',
'    $treeView.on(''click'', ''.a-TreeView-label'', function () {',
'        $(this).parents().eq(1).find(".a-TreeView-toggle").click();',
'        updateAllClasses();',
'    });',
'',
'    // Event listener for expand/collapse buttons',
'    // $(document).on(''click'', ''#expand, #collapse, #INFO'', function () {',
'    //     updateFullClass();',
'    //     addCardStyle();',
'    // });',
'    $(document).on(''click'', ''#expand, #collapse, #INFO'', function () {',
'        updateFullClass();',
'        addCardStyle();',
'',
'        if (this.id === ''INFO'') {',
'            const $notify = $(''#NOT'').parent(''.col.col-9.col-end'');',
'            $notify.show();',
'            apex.item("NOT").show();',
'            apex.item("expand").show();',
'            apex.item("collapse").hide();',
'        }',
'    });',
'',
'    // Event listener for toggle and label click with delay',
'    $treeView.on(''click'', ''.a-TreeView-toggle, .a-TreeView-label'', function () {',
'        setTimeout(() => {',
'            updateFullClass();',
'            setTimeout(() => {',
'                updateTreeUIStyles();',
'                addCardStyle();',
'            }, 0);',
'        }, 0);',
'    });',
'',
'    // Initial function calls',
'    updateFullClass();',
'    updateTreeUIStyles();',
'    toggleTreeNodes();',
'    apex.region("Tree").refresh();',
'    tree();',
'    initializeTreeState();',
'    // setTimeout(initializeTreeState, 1000);',
'',
'    // Collapse the tree after refresh',
'    setTimeout(() => {',
'        if ($collapseButtonQuery) {',
'            $collapseButtonQuery.click();',
'            console.log("Collapse triggered after tree refresh.");',
'        } else {',
'            console.warn("Collapse button not found after refresh.");',
'        }',
'    }, 50);',
'',
'    // Checkbox click handler for selection changes',
'    $selectFlagInput.on("click", function () {',
'        const clickedVal = $(this).val();',
'        const isChecked = $(this).prop("checked");',
'        let finalVals = [];',
'',
'        console.log("Clicked:", clickedVal, "Checked?", isChecked);',
'',
'        // Handle "ALL" selection logic',
'        if (clickedVal === "ALL") {',
'            finalVals = isChecked ? ["FAV", "SET", "FRM", "REP", "RPT", "MIG", "ALL"] : [];',
'        } else {',
'            finalVals = $v("P165_SEL_FLAG") ? $v("P165_SEL_FLAG").split(":") : [];',
'            const allValues = ["FAV", "SET", "FRM", "REP", "RPT", "MIG"];',
'',
'            if (finalVals.includes("ALL") && !isChecked) finalVals = finalVals.filter(v => v !== "ALL");',
'            if (allValues.every(v => finalVals.includes(v)) && !finalVals.includes("ALL")) finalVals.push("ALL");',
'        }',
'',
'        // Update P165_SEL_FLAG and P165_SEL_ALL',
'        $s("P165_SEL_FLAG", finalVals);',
'        $s("P165_SEL_ALL", finalVals.join(":"));',
'',
'        // Update UI and refresh tree',
'        updateAllClasses();',
'        updateFullClass();',
'        updateTreeUIStyles();',
'        toggleTreeNodes();',
'        tree();',
'        apex.region("Tree").refresh();',
'',
'        // Trigger collapse button click and refresh',
'        if ($collapseButton.length) {',
'            $collapseButton.click();',
'            apex.region("Tree").refresh();',
'        }',
'',
'        setTimeout(() => {',
'            if ($collapseButtonQuery) {',
'                $collapseButtonQuery.click();',
'                console.log("Collapse triggered after tree refresh.");',
'            } else {',
'                console.warn("Collapse button not found after refresh.");',
'            }',
'        }, 100);',
'    });',
'});',
'',
'//for drill throw page ',
'//localStorage.removeItem("modalURL");'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.tree-toggle {',
'    color: #888;',
'}',
'',
'.a-TreeView .is-collapsible>.a-TreeView-toggle {',
'    position: relative;',
'}',
'',
'.a-TreeView .is-collapsible>.a-TreeView-toggle:before {',
'    content: "-";',
'    color: white;',
'    font-weight: 400;',
'    position: relative;',
'    z-index: 1;',
'    left: 2px;',
'    top: -1px;',
'    font-size: 16px;',
'}',
'',
'.a-TreeView .is-expandable>.a-TreeView-toggle:before {',
'    content: "+";',
'    color: white;',
'    font-weight: 400;',
'    position: relative;',
'    z-index: 1;',
'    left: 2px;',
'    top: 1px;',
'    font-size: 16px;',
'}',
'',
'.a-TreeView .is-collapsible>.a-TreeView-toggle::after,',
'.a-TreeView .is-expandable>.a-TreeView-toggle::after {',
'    content: "";',
'    position: absolute;',
'    top: 0;',
'    left: 0;',
'    background-color: #397c91;',
'    width: 18px;',
'    display: block;',
'    aspect-ratio: 1;',
'    border-radius: 50%;',
'    color: white;',
'    z-index: -1;',
'}',
'',
'.a-TreeView-toggle {',
'    color: black !important;',
'    font-weight: bolder !important;',
'    font-size: 18px;',
'}',
'',
'.a-TreeView-label {',
'    -webkit-margin-start: var(--a-treeview-node-padding-x, 4px);',
'    color: inherit;',
'    font-weight: var(--a-treeview-node-font-weight);',
'    margin-inline-start: var(--a-treeview-node-padding-x, 4px);',
'    text-decoration: none;',
'    font-size: 14px;',
'    margin-left: 12px;',
'}',
'/* ',
'#Tree ul li.is-collapsible>ul>li.is-collapsible>.a-TreeView-toggle::after {',
'    background-color: #d78054;',
'} */',
'',
'.t-Header-logo-link {',
'    text-decoration: none;',
'    color: #fff;',
'    /* background-image: linear-gradient(45deg, #C9F2E7, #E6FFF6 50%, #EDED6D 100%);',
'    background-clip: text;',
'    -webkit-background-clip: text;',
'    -webkit-text-fill-color: transparent; */',
'    text-shadow: 2px 5px 3px #322f2f !important;',
'}',
'',
'.a-TreeView-toggle {',
'    color: var(--a-treeview-toggle-text-color, inherit);',
'    cursor: var(--a-treeview-toggle-cursor);',
'    float: left;',
'    font-family: apex-5-icon-font !important;',
'    font-style: normal !important;',
'    font-variant: normal !important;',
'    font-weight: 400 !important;',
'    height: var(--a-treeview-toggle-size, 11px);',
'    margin-block-start: var(--a-treeview-node-padding-y, 4px);',
'    margin-inline-start: calc(var(--a-treeview-toggle-size, 11px) * -1);',
'    opacity: var(--a-treeview-toggle-opacity, .5);',
'    position: relative;',
'    text-transform: none !important;',
'    width: var(--a-treeview-toggle-size, 16px);',
'    font-size: var(--a-treeview-toggle-size, 16px);',
'    line-height: var(--a-treeview-toggle-size, 14px);',
'    text-align: center;',
'    padding-right: 1px;',
'}',
'',
'a:hover {',
'    color: unset !important;',
'}',
'.t-MediaList-icon {',
'    background-color: #9cbdc8;',
'    color: #ffffff;',
'}'))
,p_step_template=>wwv_flow_imp.id(5950304360493412392)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(16569469589388081355)
,p_name=>'Announcement'
,p_static_id=>'announcement'
,p_region_name=>'ANC'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>60
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h480:t-Region--textContent:t-Region--scrollBody:t-Form--slimPadding'
,p_component_template_options=>'#DEFAULT#:t-MediaList--stack'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select GN_BU,',
'       GN_DOC_NO,',
'       GN_DOC_DATE ,',
'		 to_char(GN_DOC_DATE,''Mon DD, YYYY HH:MI AM'') list_text,',
'        to_char(GN_DOC_DATE,''Mon DD YYYY HH:MI AM'')   list_badge,',
'		  ''fa fa-bullhorn'' icon_class  ,',
'       ''<style>',
'            #more''',
'|| GN_DOC_NO',
'|| ''{',
'                display: none;',
'            }',
'        </style>    ',
'        <script>',
'            function myFunction(GN_DOC_NO) {',
'            var dots = document.getElementById("dots" + GN_DOC_NO);',
'            var moreText = document.getElementById("more" + GN_DOC_NO);',
'            var btnText = document.getElementById("myBtn" + GN_DOC_NO);',
'                ',
'            if (dots.style.display === "none") {',
'                dots.style.display = "inline";',
'                btnText.innerHTML = "Read More"; ',
'                moreText.style.display = "none";',
'            } else {',
'                dots.style.display = "none";',
'                btnText.innerHTML = "Read Less"; ',
'                moreText.style.display = "inline";',
'            }',
'            }',
'            </script>''',
'|| ''<div class="a"><SPAN STYLE="font-size:12px; "> ''',
'||',
'CASE',
'    WHEN length(initcap(GN_NOTI)) > 100 THEN',
'            substr(initcap(GN_NOTI), 1, 100)',
'            || ''<span id="dots''',
'            || GN_DOC_NO',
'            || ''">..</span><span id="more''',
'            || GN_DOC_NO',
'            || ''">''',
'            || substr(initcap(GN_NOTI), 51, length(initcap(GN_NOTI)))',
'            || ''</span><p id="myBtn''',
'            || GN_DOC_NO',
'            || ''"  onclick="myFunction(''',
'            || GN_DOC_NO',
'            || '')" style="color:green; cursor: pointer;font-weight: 900;" >Read more</button>''',
'    ELSE',
'        initcap(GN_NOTI)',
'END',
'|| ''</SPAN></DIV>''  list_title,',
'       GN_NOTI_BY,',
'       GN_EFF_TO,',
'       GN_EFF_FROM,',
'       GN_DUE_DATE,',
'       GN_STATUS,',
'       GN_VISIBLITY,',
'       GN_CRE_BY,',
'       GN_CRE_IP_ADDR,',
'       GN_CRE_OS_USER,',
'       GN_CRE_DATE,',
'       GN_UPD_BY,',
'       GN_UPD_IP_ADDR,',
'       GN_UPD_OS_USER,',
'       GN_UPD_DATE,',
'       GN_CRE_EMP_ID,',
'       GN_UPD_EMP_ID,',
'       GN_ATTACH,',
'       GN_FILE_NAME,',
'       GN_MIME_TYPE',
'  from GROUP_NOTIFICATION'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650543409268505393)
,p_query_num_rows=>5
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5564621473816859062)
,p_query_column_id=>24
,p_column_alias=>'GN_ATTACH'
,p_column_display_sequence=>240
,p_column_heading=>'Gn Attach'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5564612252322859055)
,p_query_column_id=>1
,p_column_alias=>'GN_BU'
,p_column_display_sequence=>10
,p_column_heading=>'Gn Bu'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5564617470818859058)
,p_query_column_id=>14
,p_column_alias=>'GN_CRE_BY'
,p_column_display_sequence=>140
,p_column_heading=>'Gn Cre By'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5564618671376859059)
,p_query_column_id=>17
,p_column_alias=>'GN_CRE_DATE'
,p_column_display_sequence=>170
,p_column_heading=>'Gn Cre Date'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5564620615413859061)
,p_query_column_id=>22
,p_column_alias=>'GN_CRE_EMP_ID'
,p_column_display_sequence=>220
,p_column_heading=>'Gn Cre Emp Id'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5564617838473859059)
,p_query_column_id=>15
,p_column_alias=>'GN_CRE_IP_ADDR'
,p_column_display_sequence=>150
,p_column_heading=>'Gn Cre Ip Addr'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5564618245258859059)
,p_query_column_id=>16
,p_column_alias=>'GN_CRE_OS_USER'
,p_column_display_sequence=>160
,p_column_heading=>'Gn Cre Os User'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5564613013355859056)
,p_query_column_id=>3
,p_column_alias=>'GN_DOC_DATE'
,p_column_display_sequence=>30
,p_column_heading=>'Gn Doc Date'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5564612636934859056)
,p_query_column_id=>2
,p_column_alias=>'GN_DOC_NO'
,p_column_display_sequence=>20
,p_column_heading=>'Gn Doc No'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5564616249414859058)
,p_query_column_id=>11
,p_column_alias=>'GN_DUE_DATE'
,p_column_display_sequence=>110
,p_column_heading=>'Gn Due Date'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5564615850898859058)
,p_query_column_id=>10
,p_column_alias=>'GN_EFF_FROM'
,p_column_display_sequence=>100
,p_column_heading=>'Gn Eff From'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5564615405008859058)
,p_query_column_id=>9
,p_column_alias=>'GN_EFF_TO'
,p_column_display_sequence=>90
,p_column_heading=>'Gn Eff To'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5564621858451859062)
,p_query_column_id=>25
,p_column_alias=>'GN_FILE_NAME'
,p_column_display_sequence=>250
,p_column_heading=>'Gn File Name'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5564622223298859062)
,p_query_column_id=>26
,p_column_alias=>'GN_MIME_TYPE'
,p_column_display_sequence=>260
,p_column_heading=>'Gn Mime Type'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5564615078794859056)
,p_query_column_id=>8
,p_column_alias=>'GN_NOTI_BY'
,p_column_display_sequence=>80
,p_column_heading=>'Gn Noti By'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5564616629190859058)
,p_query_column_id=>12
,p_column_alias=>'GN_STATUS'
,p_column_display_sequence=>120
,p_column_heading=>'Gn Status'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5564618991171859059)
,p_query_column_id=>18
,p_column_alias=>'GN_UPD_BY'
,p_column_display_sequence=>180
,p_column_heading=>'Gn Upd By'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5564620203874859061)
,p_query_column_id=>21
,p_column_alias=>'GN_UPD_DATE'
,p_column_display_sequence=>210
,p_column_heading=>'Gn Upd Date'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5564621075220859061)
,p_query_column_id=>23
,p_column_alias=>'GN_UPD_EMP_ID'
,p_column_display_sequence=>230
,p_column_heading=>'Gn Upd Emp Id'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5564619414321859061)
,p_query_column_id=>19
,p_column_alias=>'GN_UPD_IP_ADDR'
,p_column_display_sequence=>190
,p_column_heading=>'Gn Upd Ip Addr'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5564619789547859061)
,p_query_column_id=>20
,p_column_alias=>'GN_UPD_OS_USER'
,p_column_display_sequence=>200
,p_column_heading=>'Gn Upd Os User'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5564617007957859058)
,p_query_column_id=>13
,p_column_alias=>'GN_VISIBLITY'
,p_column_display_sequence=>130
,p_column_heading=>'Gn Visiblity'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5564614274052859056)
,p_query_column_id=>6
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>60
,p_column_heading=>'Icon Class'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5564613873037859056)
,p_query_column_id=>5
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>50
,p_column_heading=>'List Badge'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5564613403599859056)
,p_query_column_id=>4
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'List Text'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5564614645272859056)
,p_query_column_id=>7
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>70
,p_column_heading=>'List Title'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6381579354010325569)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--hiddenOverflow:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_column=>3
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6414173070584769023)
,p_plug_name=>'EC'
,p_static_id=>'ec'
,p_region_name=>'EC'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>2
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(9741480160820648788)
,p_name=>'Notification List'
,p_static_id=>'notification-list'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>50
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--hiddenOverflow:margin-right-lg'
,p_component_template_options=>'#DEFAULT#:t-Cards--basic:t-Cards--3cols:t-Cards--animColorFill'
,p_region_attributes=>'style="display:none";'
,p_new_grid_row=>false
,p_grid_column_span=>9
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''Purchase GRN'' name,',
'       COUNT(*) VALUE,',
'       1 seq_no,',
'       ''fa-cart-plus'' card_icon,',
'       ''#2874F0'' card_color,       ',
'	    APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:11613102801:&APP_SESSION.:&DEBUG.:::P11613102801_TYPE,P11613102801_MODE,P11613102801_STATUS:SB,PRW,N'')card_link',
'  FROM suplr_doc_hd',
' WHERE suphd_bu = :global_bu ',
'   AND suphd_status = ''N''',
'   AND suphd_grn_refer = ''PR''   ',
'   AND suphd_pur_type = ''W'' ',
'   AND suphd_doc_type = ''SB''',
'UNION ALL',
'SELECT ''Subcontract GRN'' name,',
'       COUNT(*) VALUE,',
'       2 seq_no,',
'       ''fa-user-wrench'' card_icon,',
'       ''#8cbd30d1'' card_color,',
'       APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:11613102801:&APP_SESSION.:&DEBUG.:::P11613102801_TYPE,P11613102801_MODE,P11613102801_STATUS:SB,SCOW,N'')card_link',
'  FROM suplr_doc_hd',
' WHERE suphd_bu = :global_bu ',
'   AND suphd_status = ''N''',
'   AND suphd_grn_refer = ''SCO''',
'   AND suphd_pur_type = ''W''  ',
'   AND suphd_doc_type = ''SB''',
'UNION ALL',
'SELECT ''Stock Transfer'' name,',
'       COUNT(*) VALUE,',
'       3 seq_no,',
'       ''fa-truck'' card_icon,',
'       ''#7d9bcecc'' card_color,',
'       APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:11613102801:&APP_SESSION.:&DEBUG.:::P11613102801_TYPE,P11613102801_MODE,P11613102801_STATUS:SB,STW,N'')card_link',
'  FROM suplr_doc_hd',
' WHERE suphd_bu = :global_bu ',
'   AND suphd_status = ''N''',
'   AND suphd_grn_refer = ''ST''',
'   AND suphd_pur_type = ''W''   ',
'   AND suphd_doc_type = ''SB''',
'UNION ALL',
'SELECT ''Landed Cost'' name,',
'       COUNT(*) VALUE,',
'       4 seq_no,',
'       ''fa-ship'' card_icon,',
'       ''#6D8BD3'' card_color,',
'       APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:11613102801:&APP_SESSION.:&DEBUG.:::P11613102801_TYPE,P11613102801_MODE,P11613102801_STATUS:SB,LCW,N'')card_link',
'  FROM suplr_doc_hd',
' WHERE suphd_bu = :global_bu ',
'   AND suphd_status = ''N''',
'   AND suphd_grn_refer = ''LC''',
'   AND suphd_pur_type = ''W''    ',
'   AND suphd_doc_type = ''SB''',
'UNION ALL',
'SELECT ''Unapproved Purchase Bills'' name,',
'       COUNT(*) VALUE,',
'       5 seq_no,',
'       ''fa-cart-plus'' card_icon,',
'       ''#49c146'' card_color,',
'       APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:11613102801:&APP_SESSION.:&DEBUG.:::P11613102801_TYPE,P11613102801_MODE,P11613102801_STATUS:SB,NULL,O'')card_link',
'  FROM suplr_doc_hd',
' WHERE suphd_bu = :global_bu ',
'   AND suphd_status = ''O''  ',
'   AND suphd_doc_type = ''SB''',
'UNION ALL',
'SELECT ''Unapproved Bank/Cash Payments'' name,',
'       COUNT(*) VALUE,',
'       6 seq_no,',
'       ''fa-cart-plus'' card_icon,',
'       ''#d58989'' card_color,',
'       APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:11613102801:&APP_SESSION.:&DEBUG.:::P11613102801_TYPE,P11613102801_MODE,P11613102801_STATUS:BP,BPV,O'')card_link',
'  FROM bank_trans',
' WHERE btrans_bu = :global_bu ',
'   AND btrans_status = ''O''',
'   AND btrans_trans_mode = ''P''',
'   AND btrans_type IN(''CT'',''BT'')   ',
'UNION ALL',
'SELECT ''Unapproved Bank/Cash Receipts'' name,',
'       COUNT(*) VALUE,',
'       7 seq_no,',
'       ''fa-cart-plus'' card_icon,',
'       ''#35c8d5'' card_color,',
'       APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:11613102801:&APP_SESSION.:&DEBUG.:::P11613102801_TYPE,P11613102801_MODE,P11613102801_STATUS:BP,BRV,O'')card_link',
'  FROM bank_trans',
' WHERE btrans_bu = :global_bu ',
'   AND btrans_status = ''O''',
'   AND btrans_trans_mode = ''R''',
'   AND btrans_type IN(''CT'',''BT'')      ',
'UNION ALL',
'SELECT ''Unapproved Journal Voucher'' name,',
'       COUNT(*) VALUE,',
'       8 seq_no,',
'       ''fa-cart-plus'' card_icon,',
'       ''#35d5ae'' card_color,',
'       APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:11613102801:&APP_SESSION.:&DEBUG.:::P11613102801_TYPE,P11613102801_MODE,P11613102801_STATUS:BP,JV,O'')card_link',
'  FROM bank_trans',
' WHERE btrans_bu = :global_bu ',
'   AND btrans_status = ''O''',
'   AND btrans_trans_mode = ''P''',
'   AND btrans_type IN(''JT'')    ',
'UNION ALL',
'SELECT ''Unapproved Contra Voucher'' name,',
'       COUNT(*) VALUE,',
'       9 seq_no,',
'       ''fa-cart-plus'' card_icon,',
'       ''#2874F0'' card_color,',
'       APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:11613102801:&APP_SESSION.:&DEBUG.:::P11613102801_TYPE,P11613102801_MODE,P11613102801_STATUS:BP,CV,O'')card_link',
'  FROM bank_trans',
' WHERE btrans_bu = :global_bu ',
'   AND btrans_status = ''O''',
'   AND btrans_trans_mode IN(''I'',''O'')',
'   AND btrans_type IN(''CV'')          ',
'UNION ALL',
'SELECT ''MSME Expiry'' name,',
'       COUNT(*) VALUE,',
'       10 seq_no,',
'       ''fa-cart-plus'' card_icon,',
'       ''#ffc107'' card_color,',
'       APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:11613102801:&APP_SESSION.:&DEBUG.:::P11613102801_TYPE:S'')card_link',
'  FROM suppliers',
' WHERE suplr_bu = :global_bu  ',
'   AND suplr_status = ''A''',
'   AND suplr_msme_appl_flag = ''Y''  ',
'   AND --TRUNC(SYSDATE) - TRUNC(suplr_msme_date_to)>=10    ',
'   (TRUNC(suplr_msme_date_to) - TRUNC(SYSDATE)) BETWEEN 0 AND 10 ',
'UNION ALL',
'SELECT ''MSME Invoices'' name,',
'       COUNT(*) VALUE,',
'       11 seq_no,',
'       ''fa-cart-plus'' card_icon,',
'       ''#17a2b8'' card_color,',
'       APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:11613102801:&APP_SESSION.:&DEBUG.:::P11613102801_TYPE,P11613102801_MODE,P11613102801_STATUS:SB,Y,N'')card_link',
'  FROM suplr_doc_hd',
' WHERE suphd_bu = :global_bu  ',
'   AND suphd_status = ''N''',
'   AND suphd_msme_flag = ''Y''',
'UNION ALL/*',
'SELECT ''Expiry Documents'' name,',
'       COUNT(*)  VALUE,',
'       12 seq_no,',
'       ''fa-cart-plus'' card_icon,',
'       ''#17a2b8'' card_color,',
'       APEX_UTIL.PREPARE_URL (''f?p=9007:59:&APP_SESSION.'') CARD_LINK',
'  FROM doc_mgmt_doc_type,',
'       doc_mgmt',
'WHERE dm_bu = :global_bu',
'  AND dmdt_desc = dm_type_desc',
'  AND dmdt_exp_flag = ''Y''',
'  AND dmdt_type in (SELECT wudal_type',
'                    FROM wapl_user_dashboard_accs_ln',
'                   WHERE wudal_bu = :global_bu',
'                       AND wudal_user_id = :global_user)',
'  AND dm_to_date <= (dm_from_date+dmdt_exp_days)',
'  AND dm_status = ''A''',
'  AND dmdt_exp_days is not null ',
'UNION ALL*/',
'SELECT ''Budget Exceed'' name,',
'       COUNT(*) VALUE,',
'       13 seq_no,',
'       ''fa-cart-plus'' card_icon,',
'       ''#17a2b8'' card_color,',
'       APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:11613102801:&APP_SESSION.:&DEBUG.:::P11613102801_TYPE:BE'')card_link',
'  FROM fin_bud_notification',
' WHERE fbn_bu = :global_bu   ',
' ORDER BY seq_no asc '))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6369030531772063800)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5564629952562859081)
,p_query_column_id=>5
,p_column_alias=>'CARD_COLOR'
,p_column_display_sequence=>50
,p_column_heading=>'Card Color'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5564629500434859081)
,p_query_column_id=>4
,p_column_alias=>'CARD_ICON'
,p_column_display_sequence=>40
,p_column_heading=>'Card Icon'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5564630320928859081)
,p_query_column_id=>6
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>60
,p_column_heading=>'Card Link'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5564630699918859081)
,p_query_column_id=>1
,p_column_alias=>'NAME'
,p_column_display_sequence=>70
,p_column_heading=>'Name'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5564629148475859081)
,p_query_column_id=>3
,p_column_alias=>'SEQ_NO'
,p_column_display_sequence=>30
,p_column_heading=>'Seq No'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5564631126130859083)
,p_query_column_id=>2
,p_column_alias=>'VALUE'
,p_column_display_sequence=>10
,p_column_heading=>'Value'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(10842293725399389367)
,p_name=>'Notification List'
,p_static_id=>'notification-list-2'
,p_region_name=>'NOT'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--hiddenOverflow:margin-right-lg'
,p_component_template_options=>'#DEFAULT#:t-Cards--basic:t-Cards--5cols:t-Cards--animColorFill:t-Report--hideNoPagination'
,p_region_attributes=>'style="display:none";'
,p_new_grid_row=>false
,p_grid_column_span=>9
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH notif_accs AS (SELECT *',
'                      FROM wapl_user_notif_accs ',
'                     WHERE wuna_bu = :global_bu',
'                       AND wuna_user_id = :Global_user)',
'SELECT (SELECT wnl_bus_fun_name',
'          FROM wapl_notify_list',
'         WHERE wnl_bus_fun_id = nfv_bus_fun_id)NAME,',
'       VALUE,',
'       CARD_ICON,',
'       CARD_COLOR,',
'       CARD_LINK               ',
'  FROM(',
'SELECT  NFV_NAME NAME,',
'        NFV_VALUE VALUE,',
'        NFV_CARD_ICON CARD_ICON,',
'        NFV_CARD_COLOR CARD_COLOR,',
'        NFV_CARD_LINK CARD_LINK,',
'        NFV_BUS_FUN_ID        ',
'  FROM not_fin_vw,notif_accs',
' WHERE NFV_BU = :global_bu  ',
'   AND WUNA_BU = NFV_BU',
'   AND NFV_BUS_FUN_ID = WUNA_BUS_FUN_ID',
'   AND WUNA_USER_ID = :Global_user',
'   AND TRUNC(SYSDATE) BETWEEN WUNA_DATE_FROM AND WUNA_DATE_TO',
' /* Plant Maintenance */  ',
'UNION ALL',
'SELECT NPMV_NAME NAME,',
'       NPMV_VALUE VALUE,',
'       NPMV_CARD_ICON CARD_ICON,',
'       NPMV_CARD_COLOR CARD_COLOR,',
'       NPMV_CARD_LINK CARD_LINK,',
'       NPMV_BUS_FUN_ID',
'  FROM NOT_PM_VW,notif_accs',
' WHERE NPMV_BU=:global_bu   ',
'   AND WUNA_BU = NPMV_BU',
'   AND NPMV_BUS_FUN_ID = WUNA_BUS_FUN_ID',
'   AND WUNA_USER_ID = :Global_user',
'   AND (NPMV_USER_ID = WUNA_USER_ID OR NPMV_USER_ID IS NULL)',
'   AND TRUNC(SYSDATE) BETWEEN WUNA_DATE_FROM AND WUNA_DATE_TO',
' /* Production */  ',
'UNION ALL ',
'SELECT NPDV_NAME NAME,',
'       NPDV_VALUE VALUE,',
'       NPDV_CARD_ICON CARD_ICON,',
'       NPDV_CARD_COLOR CARD_COLOR,',
'       NPDV_CARD_LINK CARD_LINK,',
'       NPDV_BUS_FUN_ID',
'  FROM NOT_PROD_VW,notif_accs',
' WHERE NPDV_BU=:global_bu   ',
'   AND WUNA_BU = NPDV_BU',
'   AND NPDV_BUS_FUN_ID = WUNA_BUS_FUN_ID',
'   AND WUNA_USER_ID = :Global_user',
'   AND (NPDV_USER_ID=WUNA_USER_ID OR NPDV_USER_ID IS NULL)',
'   AND TRUNC(SYSDATE) BETWEEN WUNA_DATE_FROM AND WUNA_DATE_TO  ',
'/* Quality */',
'UNION ALL ',
'SELECT NQCV_NAME NAME,',
'       NQCV_VALUE VALUE,',
'       NQCV_CARD_ICON CARD_ICON,',
'       NQCV_CARD_COLOR CARD_COLOR,',
'       NQCV_CARD_LINK CARD_LINK,',
'       NQCV_BUS_FUN_ID',
'  FROM NOT_QC_VW,notif_accs',
' WHERE NQCV_BU=:global_bu   ',
'   AND WUNA_BU = NQCV_BU',
'   AND NQCV_BUS_FUN_ID = WUNA_BUS_FUN_ID',
'   AND WUNA_USER_ID = :Global_user',
'   AND (NQCV_USER_ID= WUNA_USER_ID OR NQCV_USER_ID IS NULL)',
'   AND TRUNC(SYSDATE) BETWEEN WUNA_DATE_FROM AND WUNA_DATE_TO     ',
'/* Inventory */',
'UNION ALL ',
'SELECT NIV_NAME NAME,',
'       NIV_VALUE VALUE,',
'       NIV_CARD_ICON CARD_ICON,',
'       NIV_CARD_COLOR CARD_COLOR,',
'       NIV_CARD_LINK CARD_LINK,',
'       NIV_BUS_FUN_ID',
'  FROM NOT_INV_VW,notif_accs',
' WHERE NIV_BU=:global_bu   ',
'   AND WUNA_BU = NIV_BU',
'   AND NIV_BUS_FUN_ID = WUNA_BUS_FUN_ID',
'   AND WUNA_USER_ID = :Global_user',
'   AND (NIV_USER_ID = WUNA_USER_ID OR NIV_USER_ID IS NULL)',
'   AND TRUNC(SYSDATE) BETWEEN WUNA_DATE_FROM AND WUNA_DATE_TO',
'UNION ALL ',
'SELECT NPV_NAME NAME,',
'       NPV_VALUE VALUE,',
'       NPV_CARD_ICON CARD_ICON,',
'       NPV_CARD_COLOR CARD_COLOR,',
'       NPV_CARD_LINK CARD_LINK,',
'       NPV_BUS_FUN_ID',
'  FROM NOT_PUR_VW,notif_accs',
' WHERE NPV_BU=:global_bu   ',
'   AND WUNA_BU = NPV_BU',
'   AND NPV_BUS_FUN_ID = WUNA_BUS_FUN_ID',
'   AND WUNA_USER_ID = :Global_user',
'   AND (NPV_USER_ID = WUNA_USER_ID OR NPV_USER_ID IS NULL)',
'   AND TRUNC(SYSDATE) BETWEEN WUNA_DATE_FROM AND WUNA_DATE_TO',
'',
');',
''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6369030531772063800)
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5564623455300859070)
,p_query_column_id=>4
,p_column_alias=>'CARD_COLOR'
,p_column_display_sequence=>50
,p_column_heading=>'Card Color'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5564623051471859070)
,p_query_column_id=>3
,p_column_alias=>'CARD_ICON'
,p_column_display_sequence=>40
,p_column_heading=>'Card Icon'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5564623791334859070)
,p_query_column_id=>5
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>60
,p_column_heading=>'Card Link'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5564624283382859070)
,p_query_column_id=>1
,p_column_alias=>'NAME'
,p_column_display_sequence=>70
,p_column_heading=>'Name'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5564624627472859072)
,p_query_column_id=>2
,p_column_alias=>'VALUE'
,p_column_display_sequence=>10
,p_column_heading=>'Value'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6348447458798768925)
,p_plug_name=>'Tree'
,p_static_id=>'tree'
,p_region_name=>'Tree'
,p_region_template_options=>'#DEFAULT#:margin-top-none:margin-right-none'
,p_plug_template=>wwv_flow_imp.id(10650490475667505325)
,p_plug_display_sequence=>30
,p_plug_grid_column_span=>3
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Formatted on 9/15/2025 3:26:22 PM (QP5 v5.163.1008.3004) */',
'           SELECT CASE',
'                     WHEN CONNECT_BY_ISLEAF = 1 THEN 0',
'                     WHEN LEVEL = 1 THEN 1',
'                     ELSE -1',
'                  END',
'                     status,',
'                  LEVEL,',
'                  fun_id,',
'                  parent_id,',
'                  name,',
'                  icon icon_class,',
'                  link,',
'                  wbf_node_type,',
'                  wbf_visible,',
'                  wbf_seq_no',
'             FROM (    SELECT DISTINCT *',
'                         FROM (SELECT wbf_bus_fun_id AS fun_id,',
'                                      wbf_par_fun_id AS parent_id,',
'                                      wbf_node_type,',
'                                      NVL (',
'                                         (SELECT albfn_target',
'                                            FROM apex_lang_bus_fun_name',
'                                           WHERE albfn_lang_type = :global_lang',
'                                                 AND albfn_id = wbf_bus_fun_id),',
'                                         wbf_bus_fun_name)',
'                                         AS name,',
'                                      DECODE (',
'                                         wbf_node_type,',
'                                         ''MOD'', NULL,',
'                                            ''f?p=''',
'                                         || NVL (wbf_appl_no, :APP_ID)',
'                                         || '':''',
'                                         || NVL (wbf_page_no, 1)',
'                                         || '':''',
'                                         || :APP_SESSION',
'                                         || ''::::'')',
'                                         AS link,',
'                                      ''fa '' || wbf_icon AS icon,',
'                                      DECODE (wbf_node_type,',
'                                              ''MOD'', 0,',
'                                              ''SET'', 2,',
'                                              ''FRM'', 3,',
'                                              ''REP'', 4,',
'                                              ''RPT'', 5)',
'                                         AS node_seq,',
'                                      wbf_seq_no,',
'                                      wbf_visible',
'                                 FROM wapl_bus_fun',
'                                WHERE wbf_active_flag = ''Y''',
'                               UNION',
'                               SELECT wbf_bus_fun_id AS fun_id,',
'                                      --''1000200''',
'                                      ubff_par_bus_fun_id AS parent_id,',
'                                      ''FAV''wbf_node_type,',
'                                      NVL (',
'                                         (SELECT albfn_target',
'                                            FROM apex_lang_bus_fun_name',
'                                           WHERE albfn_lang_type = :global_lang',
'                                                 AND albfn_id = wbf_bus_fun_id),',
'                                         wbf_bus_fun_name)',
'                                         AS name,',
'                                      DECODE (',
'                                         wbf_node_type,',
'                                         ''MOD'', NULL,',
'                                            ''f?p=''',
'                                         || NVL (wbf_appl_no, :APP_ID)',
'                                         || '':''',
'                                         || NVL (wbf_page_no, 1)',
'                                         || '':''',
'                                         || :APP_SESSION',
'                                         || ''::::'')',
'                                         AS link,',
'                                      ''fa '' || wbf_icon AS icon,',
'                                      DECODE (wbf_node_type,',
'                                              ''MOD'', 0,',
'                                              ''SET'', 2,',
'                                              ''FRM'', 3,',
'                                              ''REP'', 4,',
'                                              ''RPT'', 5)',
'                                         AS node_seq,',
'                                      wbf_seq_no,',
'                                      wbf_visible',
'                                 FROM wapl_bus_fun,user_bus_fun_favourites_apex',
'                                WHERE wbf_active_flag = ''Y''',
'                                  AND ubff_bu = :global_bu',
'                                  AND ubff_user_id = :global_user',
'                                  AND ubff_bus_fun_id = wbf_bus_fun_id)',
'                   START WITH fun_id IN',
'                                 (SELECT DISTINCT wubfa_bus_fun_id',
'                                    FROM wapl_user_bus_fun_accs',
'                                   WHERE wubfa_bu = :global_bu',
'                                     AND wubfa_user_id = :global_user',
'                                     AND SYSDATE BETWEEN wubfa_date_from AND wubfa_date_to',
'                                     AND fun_id <>''1000200'')',
'                        AND (INSTR(:P103_SEL_ALL || '':'', wbf_node_type || '':'') > 0 OR :P103_SEL_ALL IS NULL)                                        ',
'                   CONNECT BY NOCYCLE fun_id = PRIOR parent_id)',
'       WHERE wbf_visible = ''Y''                ',
'       START WITH parent_id IS NULL',
'       CONNECT BY NOCYCLE parent_id = PRIOR fun_id',
'ORDER SIBLINGS BY wbf_seq_no,node_seq'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_JSTREE'
,p_ajax_items_to_submit=>'P103_SEL_ALL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'activate_node_link_with', 'S',
  'default_icon_css_class', 'icon-tree-folder',
  'icon_css_class_column', 'ICON_CLASS',
  'icon_type_css_class', 'a-Icon',
  'link_column', 'LINK',
  'node_id_column', 'FUN_ID',
  'node_label_column', 'NAME',
  'node_value_column', 'NAME',
  'order_siblings_by', 'WBF_SEQ_NO',
  'parent_key_column', 'PARENT_ID',
  'start_tree_with', 'NULL',
  'tree_hierarchy', 'SQL',
  'tree_tooltip', 'N')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5564626161199859075)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(6381579354010325569)
,p_button_name=>'Announcement'
,p_static_id=>'announcement'
,p_button_static_id=>'ANN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--link:t-Button--gapTop'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Announcement'
,p_icon_css_classes=>'fa-bullhorn'
,p_button_cattributes=>'onclick="annShow();"'
,p_grid_new_row=>'N'
,p_grid_column=>12
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5564628358496859080)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6414173070584769023)
,p_button_name=>'Collapse'
,p_static_id=>'collapse'
,p_button_static_id=>'collapse'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Collapse <span aria-hidden="true" class="fa fa-sort"></span>'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-sort'
,p_button_cattributes=>'style=display:none;'
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5564627942249859078)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6414173070584769023)
,p_button_name=>'Expand'
,p_static_id=>'expand'
,p_button_static_id=>'expand'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Expand <span class="fa fa-sort" aria-hidden="true"></span>'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-sort'
,p_grid_new_row=>'Y'
,p_grid_column_span=>2
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5564626564125859077)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(6381579354010325569)
,p_button_name=>'Notification'
,p_static_id=>'notification'
,p_button_static_id=>'INFO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link:t-Button--gapLeft:t-Button--gapTop'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Notification'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'N'
,p_grid_column=>11
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6381588921720325578)
,p_name=>'P103_DUMMY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6348447458798768925)
,p_item_default=>'0'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6381594338892325623)
,p_name=>'P103_SEL_ALL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6381579354010325569)
,p_item_default=>'FAV:SET:FRM:REP:RPT:MIG:ALL'
,p_source=>'FAV:SET:FRM:REP:RPT:MIG:ALL'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6381593690832325616)
,p_name=>'P103_SEL_FLAG'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6381579354010325569)
,p_item_default=>'FAV:SET:FRM:REP:RPT:MIG:ALL'
,p_prompt=>'New'
,p_source=>'P103_SEL_ALL'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC2:All;ALL,Favourites;FAV,Setup;SET,Transaction;FRM,Reports;REP,Analytics;RPT,Data Mgnt.;MIG'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#:margin-left-lg'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '7')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5564640041648859114)
,p_name=>'Collapse'
,p_static_id=>'collapse'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5564628358496859080)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5564640558505859114)
,p_event_id=>wwv_flow_imp.id(5564640041648859114)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P103_DUMMY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', '0')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5564641045901859114)
,p_event_id=>wwv_flow_imp.id(5564640041648859114)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-tree-collapse'
,p_action=>'NATIVE_TREE_COLLAPSE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6348447458798768925)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5564637262573859112)
,p_name=>'Collapse_1'
,p_static_id=>'collapse-2'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5564626564125859077)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5564637706157859112)
,p_event_id=>wwv_flow_imp.id(5564637262573859112)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9741480160820648788)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5564638252010859112)
,p_event_id=>wwv_flow_imp.id(5564637262573859112)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-tree-collapse'
,p_action=>'NATIVE_TREE_COLLAPSE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6348447458798768925)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5564641448487859114)
,p_name=>'Expand'
,p_static_id=>'expand'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5564627942249859078)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5564641906136859114)
,p_event_id=>wwv_flow_imp.id(5564641448487859114)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P103_DUMMY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', '1')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5564642464635859116)
,p_event_id=>wwv_flow_imp.id(5564641448487859114)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-tree-expand'
,p_action=>'NATIVE_TREE_EXPAND'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6348447458798768925)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5564633008299859109)
,p_name=>'Hide/Show'
,p_static_id=>'hide-show'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P103_DUMMY'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5564633527789859109)
,p_event_id=>wwv_flow_imp.id(5564633008299859109)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(5564627942249859078)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P103_DUMMY'
,p_client_condition_expression=>'1'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5564634565870859111)
,p_event_id=>wwv_flow_imp.id(5564633008299859109)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-hide-2'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(5564628358496859080)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P103_DUMMY'
,p_client_condition_expression=>'0'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5564634019484859111)
,p_event_id=>wwv_flow_imp.id(5564633008299859109)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(5564627942249859078)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P103_DUMMY'
,p_client_condition_expression=>'0'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5564635053546859111)
,p_event_id=>wwv_flow_imp.id(5564633008299859109)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-show-2'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(5564628358496859080)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P103_DUMMY'
,p_client_condition_expression=>'1'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5564632122025859108)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>70
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(6348447458798768925)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5564632597904859109)
,p_event_id=>wwv_flow_imp.id(5564632122025859108)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'setTimeout(function () {',
    '    updateFullClass();',
    '    updateTreeUIStyles();',
    '    addCardStyle();',
    '},200)')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5564638651681859112)
,p_name=>'Refresh'
,p_static_id=>'refresh'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P103_FLAG'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5564639122389859114)
,p_event_id=>wwv_flow_imp.id(5564638651681859112)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '// Initial run',
    '// toggleTreeNodes();',
    'tree();')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5564639627865859114)
,p_event_id=>wwv_flow_imp.id(5564638651681859112)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6348447458798768925)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5564635454157859111)
,p_name=>'Refresh1'
,p_static_id=>'refresh-2'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P103_SEL_ALL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5564636482087859111)
,p_event_id=>wwv_flow_imp.id(5564635454157859111)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'tree();',
    'updateTreeUIStyles();',
    'toggleTreeNodes();',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5564635897843859111)
,p_event_id=>wwv_flow_imp.id(5564635454157859111)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'tree();',
    'toggleTreeNodes();',
    'updateTreeUIStyles();')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5564636900137859112)
,p_event_id=>wwv_flow_imp.id(5564635454157859111)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6348447458798768925)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5564631710468859106)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'PROC_APEX_TREE_NODE_RETURN(:GLOBAL_BU,:GLOBAL_USER,:APP_ID,165,:APP_SESSION);',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>85110726683938904
);
wwv_flow_imp.component_end;
end;
/
