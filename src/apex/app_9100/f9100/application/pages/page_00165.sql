prompt --application/pages/page_00165
begin
--   Manifest
--     PAGE: 00165
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
 p_id=>165
,p_name=>'Roadmap ERP'
,p_alias=>'MENU'
,p_step_title=>'Roadmap ERP'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_FILES#expandRegion.js',
'#APP_FILES#RMWEB.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function notification() {',
'    apex.server.process(',
'        "NOTIFICATION",',
'        {',
'            x01: "NOT"   // or any value you want to send',
'        },',
'        {',
'            dataType: "text",',
'            success: function (pData) {',
'                if (pData === "success") {',
'                    apex.region("NOT").refresh();',
'                    apex.item("INFO").enable();',
'                }',
'            },',
'            error: function (xhr, status, error) {',
'                console.error("Error:", error);',
'            }',
'        }',
'    );',
'}'))
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
'            finalVals = isChecked ? ["FAV", "SET", "FRM", "REP", "RPT", "DMM", "ALL"] : [];',
'        } else {',
'            finalVals = $v("P165_SEL_FLAG") ? $v("P165_SEL_FLAG").split(":") : [];',
'            const allValues = ["FAV", "SET", "FRM", "REP", "RPT", "DMM"];',
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
'        //apex.region("Tree").refresh();',
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
'});'))
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
'',
'.t-Header-logo-link {',
'    text-decoration: none;',
'    color: #fff;',
'    text-shadow: 2px 5px 3px #322f2f !important;',
'}',
'',
'.a-TreeView-toggle {',
'    color: var(--a-treeview-toggle-text-color, inherit);',
'    cursor: var(--a-treeview-toggle-cursor);',
'    float: left;',
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
'}',
'.py-1 {',
'    padding-top: .25rem !important;',
'    padding-bottom: 1rem !important;',
'}    '))
,p_step_template=>wwv_flow_imp.id(5950304360493412392)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'13'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(16484378978998142537)
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
'  from GROUP_NOTIFICATION',
' WHERE GN_BU = :global_bu '))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>true
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
 p_id=>wwv_flow_imp.id(6391679850150320037)
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
 p_id=>wwv_flow_imp.id(6391670713216320031)
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
 p_id=>wwv_flow_imp.id(6391675972940320034)
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
 p_id=>wwv_flow_imp.id(6391677017249320036)
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
 p_id=>wwv_flow_imp.id(6391679076608320037)
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
 p_id=>wwv_flow_imp.id(6391676356578320034)
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
 p_id=>wwv_flow_imp.id(6391676662000320036)
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
 p_id=>wwv_flow_imp.id(6391671554883320031)
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
 p_id=>wwv_flow_imp.id(6391671137298320031)
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
 p_id=>wwv_flow_imp.id(6391674729634320034)
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
 p_id=>wwv_flow_imp.id(6391674371623320034)
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
 p_id=>wwv_flow_imp.id(6391673933196320033)
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
 p_id=>wwv_flow_imp.id(6391680189879320037)
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
 p_id=>wwv_flow_imp.id(6391680670474320037)
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
 p_id=>wwv_flow_imp.id(6391673567042320033)
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
 p_id=>wwv_flow_imp.id(6391675103098320034)
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
 p_id=>wwv_flow_imp.id(6391677470934320036)
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
 p_id=>wwv_flow_imp.id(6391678600092320036)
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
 p_id=>wwv_flow_imp.id(6391679408600320037)
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
 p_id=>wwv_flow_imp.id(6391677830290320036)
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
 p_id=>wwv_flow_imp.id(6391678209332320036)
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
 p_id=>wwv_flow_imp.id(6391675572409320034)
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
 p_id=>wwv_flow_imp.id(6391672720402320033)
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
 p_id=>wwv_flow_imp.id(6391672288177320033)
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
 p_id=>wwv_flow_imp.id(6391671941817320031)
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
 p_id=>wwv_flow_imp.id(6391673138418320033)
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
 p_id=>wwv_flow_imp.id(6296488743620386751)
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
 p_id=>wwv_flow_imp.id(6329082460194830205)
,p_plug_name=>'EC'
,p_static_id=>'ec'
,p_region_name=>'EC'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--hiddenOverflow'
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
 p_id=>wwv_flow_imp.id(10757203115009450549)
,p_name=>'Notification List'
,p_static_id=>'notification-list'
,p_region_name=>'NOT'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>50
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--hiddenOverflow:margin-right-lg'
,p_component_template_options=>'#DEFAULT#:t-Cards--basic:t-Cards--5cols:t-Cards--animColorFill:t-Report--hideNoPagination'
,p_region_attributes=>'style="display:none";'
,p_new_grid_row=>false
,p_grid_column_span=>9
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT wnd_name AS NAME,',
'       wnd_value AS VALUE,',
'       wnd_icon AS CARD_ICON,',
'       wnd_color AS CARD_COLOR,',
'       APEX_UTIL.PREPARE_URL(',
'                ''f?p='' ||NVL(wnd_icon, :app_id) || '':'' ||wnd_color|| '':'' ||:app_session ||',
'                CASE ',
'                    WHEN wnd_link IS NOT NULL THEN',
'                    ''::NO:'' || TRIM(wnd_color) || '':'' ||REGEXP_SUBSTR(wnd_link, ''^[^:]+'') || '':'' ||APEX_UTIL.URL_ENCODE(REGEXP_SUBSTR(wnd_link, ''[^:]+$'', 1, 1))',
'                    ELSE',
'                        NULL',
'                END',
'            ) AS CARD_LINK',
' FROM wapl_notify_dashboard',
'WHERE wnd_bu   = :global_bu',
'  AND wnd_user = :global_user;'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P165_RUN_RPT'
,p_lazy_loading=>true
,p_query_row_template=>wwv_flow_imp.id(6369030531772063800)
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6580335854062660794)
,p_query_column_id=>4
,p_column_alias=>'CARD_COLOR'
,p_column_display_sequence=>50
,p_column_heading=>'Card Color'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6580335408361660794)
,p_query_column_id=>3
,p_column_alias=>'CARD_ICON'
,p_column_display_sequence=>40
,p_column_heading=>'Card Icon'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6580336218569660794)
,p_query_column_id=>5
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>60
,p_column_heading=>'Card Link'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6580336646599660794)
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
 p_id=>wwv_flow_imp.id(6580337082737660794)
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
 p_id=>wwv_flow_imp.id(6263356848408830107)
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
'WITH bus_fun AS (SELECT * FROM wapl_bus_fun WHERE wbf_active_flag = ''Y''),',
'     bus_fun_accs AS (SELECT wubfa_bus_fun_id',
'                        FROM wapl_user_bus_fun_accs',
'                       WHERE wubfa_bu = :global_bu ',
'                         AND wubfa_user_id = :global_user',
'                         AND SYSDATE BETWEEN wubfa_date_from AND wubfa_date_to)',
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
'                                            wbf_node_type,',
'                                            ''MOD'', NULL,',
'                                               ''f?p=''',
'                                            || NVL(wbf_appl_no, :APP_ID)',
'                                            || '':''',
'                                            || NVL(wbf_page_no, 1)',
'                                            || '':''',
'                                            || :APP_SESSION',
'                                            || '':::''',
'                                            || NVL(wbf_page_no,1)',
'                                        )   ',
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
'                                 FROM bus_fun',
'                                WHERE wbf_std_vert_type = ''S''',
'                               UNION ',
'                               SELECT wbf_bus_fun_id AS fun_id,',
'                                      wbf_par_fun_id AS parent_id,',
'                                      wbf_node_type,',
'                                      NVL (',
'                                         (SELECT albfn_target',
'                                            FROM apex_lang_bus_fun_name',
'                                           WHERE albfn_lang_type = :global_lang',
'                                                 AND albfn_id = wbf_bus_fun_id),',
'                                         wbf_bus_fun_name)',
'                                         AS name,',
'                                     DECODE (',
'                                            wbf_node_type,',
'                                            ''MOD'', NULL,',
'                                               ''f?p=''',
'                                            || NVL(wbf_appl_no, :APP_ID)',
'                                            || '':''',
'                                            || NVL(wbf_page_no, 1)',
'                                            || '':''',
'                                            || :APP_SESSION',
'                                            || '':::''',
'                                            || NVL(wbf_page_no,1)',
'                                        ) ',
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
'                                 FROM bus_fun,business_vertical',
'                                WHERE wbf_std_vert_type = ''V''   ',
'                                  AND wbf_vertical_id = bv_vert_id',
'                                  AND bv_bu = :global_bu',
'                               UNION',
'                               SELECT wbf_bus_fun_id AS fun_id,',
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
'                                 FROM bus_fun,user_bus_fun_favourites_apex',
'                                WHERE ubff_bu = :global_bu',
'                                  AND ubff_user_id = :global_user',
'                                  AND ubff_bus_fun_id = wbf_bus_fun_id)',
'                   START WITH fun_id IN',
'                                 (SELECT DISTINCT wubfa_bus_fun_id',
'                                    FROM bus_fun_accs',
'                                   WHERE fun_id <>''1000200'')                        ',
'                        --AND (wbf_node_type in (select column_value from apex_string.split ( :P165_SEL_ALL, '':'' )) OR :P165_SEL_ALL IS NULL)',
'                        AND (:P165_SEL_ALL IS NULL OR wbf_node_type IN (SELECT REGEXP_SUBSTR(:P165_SEL_ALL, ''[^:]+'', 1, LEVEL) FROM dual CONNECT BY REGEXP_SUBSTR(:P165_SEL_ALL, ''[^:]+'', 1, LEVEL) IS NOT NULL))',
'                   CONNECT BY NOCYCLE fun_id = PRIOR parent_id)',
'       WHERE wbf_visible = ''Y''                          ',
'       START WITH parent_id IS NULL',
'       CONNECT BY NOCYCLE parent_id = PRIOR fun_id',
'ORDER SIBLINGS BY wbf_seq_no,node_seq'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_JSTREE'
,p_ajax_items_to_submit=>'P165_SEL_ALL'
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
 p_id=>wwv_flow_imp.id(6357303777665995105)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(6296488743620386751)
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
 p_id=>wwv_flow_imp.id(6263361066924830149)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6329082460194830205)
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
 p_id=>wwv_flow_imp.id(6263360923614830148)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6329082460194830205)
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
 p_id=>wwv_flow_imp.id(6395796870202664205)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(6296488743620386751)
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
 p_id=>wwv_flow_imp.id(6296484443967386708)
,p_name=>'P165_DUMMY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6263356848408830107)
,p_item_default=>'0'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6664480860517371703)
,p_name=>'P165_RUN_RPT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(10757203115009450549)
,p_item_default=>'0'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6296488403774386748)
,p_name=>'P165_SEL_ALL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6296488743620386751)
,p_item_default=>'FAV:SET:FRM:REP:RPT:DMM:ALL'
,p_source=>'FAV:SET:FRM:REP:RPT:DMM:ALL'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6296487755714386741)
,p_name=>'P165_SEL_FLAG'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6296488743620386751)
,p_item_default=>'FAV:SET:FRM:REP:RPT:DMM:ALL'
,p_prompt=>'New'
,p_source=>'P165_SEL_ALL'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC2:All;ALL,Favourites;FAV,Setup;SET,Transaction;FRM,Reports;REP,Analytics;RPT,Data Mgnt.;DMM'
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
 p_id=>wwv_flow_imp.id(6844273414248470704)
,p_name=>'After Refresh Enable'
,p_static_id=>'after-refresh-enable'
,p_event_sequence=>80
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(10757203115009450549)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6844273495461470705)
,p_event_id=>wwv_flow_imp.id(6844273414248470704)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(6395796870202664205)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6263361374115830152)
,p_name=>'Collapse'
,p_static_id=>'collapse'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6263361066924830149)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6296484663258386710)
,p_event_id=>wwv_flow_imp.id(6263361374115830152)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P165_DUMMY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', '0')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6296483896535386703)
,p_event_id=>wwv_flow_imp.id(6263361374115830152)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-tree-collapse'
,p_action=>'NATIVE_TREE_COLLAPSE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6263356848408830107)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6490783980469511940)
,p_name=>'Collapse_1'
,p_static_id=>'collapse-2'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6395796870202664205)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6664481028534371705)
,p_event_id=>wwv_flow_imp.id(6490783980469511940)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(6395796870202664205)
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6753171851646705403)
,p_event_id=>wwv_flow_imp.id(6490783980469511940)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'notification();')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6490784048778511941)
,p_event_id=>wwv_flow_imp.id(6490783980469511940)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-tree-collapse'
,p_action=>'NATIVE_TREE_COLLAPSE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6263356848408830107)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6263361128298830150)
,p_name=>'Expand'
,p_static_id=>'expand'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6263360923614830148)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6296484503085386709)
,p_event_id=>wwv_flow_imp.id(6263361128298830150)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P165_DUMMY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', '1')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6263361261351830151)
,p_event_id=>wwv_flow_imp.id(6263361128298830150)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-tree-expand'
,p_action=>'NATIVE_TREE_EXPAND'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6263356848408830107)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6296485746571386721)
,p_name=>'Hide/Show'
,p_static_id=>'hide-show'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P165_DUMMY'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6296486101050386725)
,p_event_id=>wwv_flow_imp.id(6296485746571386721)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(6263360923614830148)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P165_DUMMY'
,p_client_condition_expression=>'1'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6296485970024386723)
,p_event_id=>wwv_flow_imp.id(6296485746571386721)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-hide-2'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(6263361066924830149)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P165_DUMMY'
,p_client_condition_expression=>'0'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6296485808208386722)
,p_event_id=>wwv_flow_imp.id(6296485746571386721)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(6263360923614830148)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P165_DUMMY'
,p_client_condition_expression=>'0'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6296486033746386724)
,p_event_id=>wwv_flow_imp.id(6296485746571386721)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-show-2'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(6263361066924830149)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P165_DUMMY'
,p_client_condition_expression=>'1'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6326558310557947403)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>70
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(6263356848408830107)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6326558435231947404)
,p_event_id=>wwv_flow_imp.id(6326558310557947403)
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
 p_id=>wwv_flow_imp.id(6296484134437386705)
,p_name=>'Refresh'
,p_static_id=>'refresh'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P165_FLAG'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6296484335213386707)
,p_event_id=>wwv_flow_imp.id(6296484134437386705)
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6296487849833386742)
,p_name=>'Refresh1'
,p_static_id=>'refresh-2'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P165_SEL_ALL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6296488280374386746)
,p_event_id=>wwv_flow_imp.id(6296487849833386742)
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
 p_id=>wwv_flow_imp.id(6322248767239060306)
,p_event_id=>wwv_flow_imp.id(6296487849833386742)
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
 p_id=>wwv_flow_imp.id(6296488128761386745)
,p_event_id=>wwv_flow_imp.id(6296487849833386742)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6263356848408830107)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(3656933465275407931)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'NOTIFICATION'
,p_static_id=>'notification'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'   proc_ins_notify_dtls(:global_bu,:global_user);',
'   HTP.P(''success'');',
'EXCEPTION WHEN OTHERS THEN HTP.P(SQLERRM);',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>3584829692947220601
);
wwv_flow_imp.component_end;
end;
/
