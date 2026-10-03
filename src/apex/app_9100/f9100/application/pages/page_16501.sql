prompt --application/pages/page_16501
begin
--   Manifest
--     PAGE: 16501
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
 p_id=>16501
,p_name=>'Roadmap ERP'
,p_alias=>'MENU-WORKING'
,p_step_title=>'Roadmap ERP'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">',
'<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>'))
,p_javascript_file_urls=>'#APP_FILES#expandRegion.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function tree() {',
'    updateTreeUIStyles();',
'    if (!$(''style#treeStyles'').length) {',
'        $("<style id=''treeStyles''>")',
'            .prop("type", "text/css")',
'            .html(`',
'                #Tree ul .a-TreeView-node.is-collapsible ul .a-TreeView-node.a-TreeView-node--leaf {',
'                    background-color: white !important;',
'                    padding: 0rem 0.4rem !important;',
'                    box-shadow: 1px 1px 1px 3px #dbf7f36b !important;',
'                    border-radius: 5px !important;',
'                    margin-top: 2px !important;',
'                    width: 219px;',
'                    min-height: 35px;',
'                    position: relative;',
'                    display: flex;',
'                    align-items: center;',
'                    border: 1px dotted transparent;',
'                    position: relative;',
'                    z-index: 1;',
'                }',
'               #Tree ul .a-TreeView-node.is-collapsible ul .a-TreeView-node.a-TreeView-node--leaf::before {',
'                    content: '''';',
'                    position: absolute;',
'                    top: 0; ',
'                    left: 0;',
'                    width: 0%;',
'                    height: 100%;',
'                    background: #d9f3ef6b;',
'                    z-index: -1;',
'                    transition: width 0.3s ease; /* smooth sliding */',
'                }',
'',
'                #Tree ul .a-TreeView-node.is-collapsible ul .a-TreeView-node.a-TreeView-node--leaf:hover::before {',
'                    width: 100%; /* slides in horizontally */',
'                }',
'                #Tree ul .a-TreeView-node.is-collapsible ul .a-TreeView-node.a-TreeView-node--leaf .a-TreeView-label {',
'                    font-size: 1.2rem;',
'                }',
'                #Tree .a-TreeView-content.is-selected {',
'                    color: #282828;',
'                }',
'                #Tree .a-TreeView-content.is-hover {',
'                    background-color: transparent !important;',
'                }',
'                #Tree .a-TreeView-row:hover,',
'                #Tree .a-TreeView-row.is-hover,',
'                #Tree .a-TreeView-row.is-selected {',
'                    background-color: transparent !important;',
'                    cursor: pointer;',
'                }',
'                #Tree ul .a-TreeView-node.is-collapsible .a-TreeView-node.is-expandable ul::before {',
'                    content: '''';',
'                    position: absolute;',
'                    border-radius: 20px;',
'                    width: 100%;',
'                    height: 100%;',
'                    padding: 8px 7px;',
'                }',
'                #Tree ul .a-TreeView-node.is-collapsible .a-TreeView-node.is-expandable ul a.a-TreeView-label {',
'                    margin-left:10px;',
'                }',
'                #Tree .a-TreeView-node.a-TreeView-node--topLevel.is-collapsible>.a-TreeView-row:not(#Tree .a-TreeView-node.a-TreeView-node--leaf>.a-TreeView-row) {',
'                    margin-left: 2%;',
'                    max-width: 1180px;',
'                    margin: 0 4px !important;',
'                    background: #f2fff6;',
'                    background: -webkit-linear-gradient(280deg, rgba(242, 255, 246, 1) 0%, rgba(223, 238, 242, 1) 58%, rgba(230, 247, 255, 1) 100%);',
'                    background: -moz-linear-gradient(280deg, rgba(242, 255, 246, 1) 0%, rgba(223, 238, 242, 1) 58%, rgba(230, 247, 255, 1) 100%);',
'                    background: linear-gradient(280deg, rgba(242, 255, 246, 1) 0%, rgba(223, 238, 242, 1) 58%, rgba(230, 247, 255, 1) 100%);',
'                    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#F2FFF6", endColorstr="#E6F7FF", GradientType=0);',
'                }',
'                #Tree ul .a-TreeView-node.is-collapsible .a-TreeView-node.is-expandable {',
'                    position: relative;',
'                }',
'                #Tree .a-TreeView-node.is-collapsible .a-TreeView-content .fa:not(#Tree .a-TreeView-node.a-TreeView-node--leaf .a-TreeView-content .fa),',
'                #Tree .a-TreeView-node.is-collapsible .a-TreeView-content .a-TreeView-label:not(#Tree .a-TreeView-node.a-TreeView-node--leaf .a-TreeView-content .a-TreeView-label),',
'                #Tree .a-TreeView-node .a-TreeView-content .a-TreeView-label:hover:not(#Tree .a-TreeView-node.a-TreeView-node--leaf .a-TreeView-content .a-TreeView-label) {',
'                    color: #5e92b6;',
'                    font-weight: 600;',
'                    filter: drop-shadow(0px 2px 0px #FFF);',
'                }',
'                #Tree .a-TreeView-node.is-collapsible .a-TreeView-row.is-focused {',
'                    box-shadow: unset;',
'                }',
'                #Tree .last-ul-style {',
'                    display: flex;',
'                    flex-wrap: wrap;',
'                    column-gap: 10px;',
'                    position: relative;',
'                    padding: 5px 5px 5px 10px;',
'                    margin-bottom: 10px;',
'                    overflow: hidden;',
'                    transition: all 1s ease;',
'                }',
'',
'                #Tree .a-TreeView-row.is-focused {',
'                    background-color: transparent !important;',
'                    color: black !important;',
'                    box-shadow: unset !important;',
'                }',
'                #Tree .a-TreeView-content {',
'                    color: black !important;',
'                    cursor: pointer;',
'                }',
'                .tree-toggle-checkbox:checked + span {',
'                    background-color: #e6f2ff;',
'                    border-radius: 4px;',
'                    padding: 2px 6px;',
'                }',
'                #Tree .a-TreeView-node.a-TreeView-node--leaf .a-TreeView-content .fa {',
'                    color: #a1b8bb !important;',
'                }',
'                #Tree .a-TreeView-node.a-TreeView-node--leaf .a-TreeView-content .fa:after {',
'                    content: '''';',
'                    position: absolute;',
'                    background-color: #edfbf96b;',
'                    top: 0;',
'                    left: 0;',
'                    width: 100%;',
'                    height: 100%;',
'                    border-radius: 20px !important;',
'                    z-index: -1;',
'                    transform: scale(1.7);',
'                }',
'                #noCheckboxModal .modal-header {',
'                    background-color: rgb(228, 249, 255);',
'                }',
'                #Tree .a-Icon:not(#Tree .a-TreeView-node.a-TreeView-node--leaf .a-TreeView-content .a-Icon) {',
'                    display: none !important;',
'                } ',
'                #Tree .a-TreeView-label:not(#Tree .a-TreeView-node.a-TreeView-node--leaf .a-TreeView-content .a-TreeView-label) {',
'                    margin-left: 7px !important;',
'                } ',
'                #Tree ul .a-TreeView-node.is-collapsible ul .a-TreeView-node.a-TreeView-node--leaf:hover,                   ',
'                #Tree ul .a-TreeView-node.is-collapsible ul .a-TreeView-node.a-TreeView-node--leaf.is-active-card {',
'                    border: 1px dotted #004153;',
'                    cursor: pointer;',
'                }',
'                .t-Form-itemWrapper {',
'                    float: right;',
'                }',
'                .checkbox_group input:checked + label:before,',
'                .checkbox_group input:checked + label:hover:before,',
'                input:checked + label#P16501_SEL_FLAG_6:before,',
'                input:checked + label#P16501_SEL_FLAG_6:hover:before {',
'                    background-color: #fff;',
'                }',
'                label.u-checkbox#P16501_SEL_FLAG_6 {',
'                    background-color: rgb(228, 249, 255) !important;',
'                    padding: 4px 8px 4px 28px !important;',
'                    margin-right: 11px !important;',
'                    border-radius: 5px !important;',
'                }',
'                .apex-item-checkbox .apex-item-option input+label:before,',
'                input+label#P16501_SEL_FLAG_6:before {',
'                    display:none;',
'                    margin-top: 4px;',
'                    margin-left: 4px;',
'                    height: var(--a-checkbox-size, 15px);',
'                    width: var(--a-checkbox-size, 15px);',
'                    border-radius: 50%;',
'                    background-color: #fff;',
'                    border: 1px solid #689381;',
'                }',
'                .apex-item-checkbox .apex-item-option input+label:after,',
'                input+label#P165_SEL_ALL_LABEL:after {',
'                    display:none;',
'                    margin-top: 4px;',
'                    margin-left: 6px;',
'                    height: calc(var(--a-checkbox-size, 5px) - var(--a-checkbox-border-width, 1px)*2);',
'                    width: calc(var(--a-checkbox-size, 7px) - var(--a-checkbox-border-width, 1px)*2);',
'                    color: #689381;',
'                }',
'                .apex-item-group--rc input:focus + label:before,',
'                input:focus + label#P165_SEL_ALL_LABEL:before {',
'                    box-shadow: unset !important;',
'                }',
'                .t-Form-inputContainer.col.col-2 {',
'                    padding: 8px 0;',
'                    position: relative;',
'                    width: 45%;',
'                    top: 0px;',
'                    height: 36px;',
'                    display: flex;',
'                    justify-content: center;',
'                }',
'                .t-Body-main {',
'                    margin-top: 37px !important;',
'                }',
'                .t-Body-contentInner {',
'                    padding-top: 0px !important;',
'                }',
'                #Buttons .t-Region-body .row {',
'                    position: relative;',
'                }',
'                #Buttons .t-Region-body .row::before {',
'                    // border: 1px solid #469d90;',
'                    border-top: 0px !important;',
'                    position: absolute;',
'                    content: '''';',
'                    width: 100%;',
'                    height: 47px;',
'                    margin-top: 3px;',
'                    border-radius: 0px 0px 10px 10px !important;',
'                    top: -21px;',
'                    right: 0px;',
'                }',
'',
'                #Buttons .t-Region-body .row .t-Form-inputContainer label {',
'                    position: relative;',
'                    top: 3px;',
'                    height: 23px !important;',
'                    border-top-right-radius: 30px !important;',
'                    border-top-left-radius: 30px !important;',
'                    border-bottom-left-radius: 30px !important;',
'                    border-bottom-right-radius: 30px !important;',
'                    padding-top: 0px !important;',
'                    padding-bottom: 0px !important;',
'                    padding-left: 22px !important;',
'                    padding-right: 10px !important;',
'                    overflow: hidden;',
'                    color: #689381;                    ',
'                    font-weight: 600;',
'                    background-color: white;',
'                    align-content: center;',
'                    margin-right: 11px !important;',
'                    transition: all 0.5s ease;',
'                }',
'                #Buttons .t-Region-body .row .t-Form-inputContainer label:hover {',
'                    outline-bottom: 5px solid #689381 !important;',
'                    border-bottom-radius: 4px !important;',
'                }',
'                #Buttons .t-Region-body .row .t-Form-inputContainer input:checked+label {',
'                    color: #7caba8 !important;',
'                    font-weight: 500;',
'                }',
'                #Buttons .apex-item-grid-row {   ',
'                    background: white;',
'                    padding: 0.5rem 1.5rem 0.75rem 1.5rem;',
'                    display: block;',
'                    box-shadow: 1px 2px 4px 3px #e9e9e9;',
'                    border-radius: 20px;',
'                }',
'                #Buttons .t-Region-body .row .t-Form-inputContainer input:checked+label:hover,                  ',
'                #Buttons .t-Region-body .row .t-Form-inputContainer input:checked+label {                    ',
'                    height: 23px !important;',
'                    border-top-right-radius: 30px !important;',
'                    border-top-left-radius: 30px !important;',
'                    border-bottom-left-radius: 30px !important;',
'                    border-bottom-right-radius: 30px !important;',
'                }',
'                .t-Form-fieldContainer .t-Form-inputContainer.col.col-7 {',
'                    padding-right: 0px !important;',
'                }',
'                #Buttons .col.col-2.col-end {',
'                    position: relative;',
'                    right: 0px;                  ',
'                }',
'                #Buttons .col.col-10.apex-col-auto.col-start {',
'                    width: 80%;',
'                    position: relative;',
'                    right: -52px;',
'                }',
'                #P16501_SEL_ALL.t-Form-fieldContainer{',
'                    display: flex;',
'                    justify-content: right;',
'                }',
'                #P16501_SEL_FLAG.u-checkbox {',
'                    width: 50px !important;',
'                    text-align: center;',
'                }',
'                #Buttons .t-Region-body .row .t-Form-inputContainer #P165_SEL_FLAG_6:checked+label {',
'                    // border-top-left-radius: 5px !important;',
'                    // border-bottom-left-radius: 5px !important; ',
'                    border-radius: 5px !important;   ',
'                    margin-right: 0px !important;',
'                    width: 50px !important;',
'                    background-color: #db9e9e !important;',
'                }',
'                #Buttons .t-Region-body .row .t-Form-inputContainer #P165_SEL_FLAG_6+label {   ',
'                    margin-right: 0px !important;',
'                    width: 50px !important;',
'                    text-align: center;',
'                }',
'                #EC .t-Region-bodyWrap .t-Region-body .col.col-2.col-start {',
'                    height: 50px;',
'                }',
'                #main .t-Body-contentInner {',
'                    padding-left: 0px;',
'                }',
'                #main .t-Body-contentInner .row .col.col-2.col-start {',
'                    padding-left: 0px;',
'                }',
'                #Tree > #Tree_tree > ul {',
'                    width: 305px;',
'                    max-width: 100%;',
'                    padding-top: 9px;',
'                    padding-left: 13px;',
'                    padding-bottom: 9px;',
'                    /* border: 1px solid #6ca1b1; */',
'                    border-radius: 6px;',
'                    background: white;',
'                    box-shadow: 1px 1px 4px 1px #c1c1c1;',
'                    /* border-right-width: 1px; */',
'                    /* border-right-color: black; */',
'                    /* border-right-style: solid; */',
'                }',
'                #Tree > #Tree_tree > ul.full {',
'                    width: 100%;',
'                }                ',
'                #Tree {',
'                    width: 305px;',
'                }',
'                #Tree.full {',
'                    width: 100%;',
'                }                ',
'                #Tree ul li.is-collapsible>ul>li.is-collapsible>.a-TreeView-content>.a-TreeView-label {',
'                    color: #d78054 !important;',
'                    font-weight: 500 !important;',
'                }',
'                #NOT {',
'                    padding-left: 4rem;',
'                }',
'                #Buttons .t-Region-body .row .t-Form-inputContainer input#P16501_SEL_FLAG_6:checked+label {',
'                    background-color: #cd8876 !important;',
'                    outline: 1px solid #cd8876 !important;',
'                }',
'                #Buttons .t-Region-body .row .t-Form-inputContainer input#P16501_SEL_FLAG_6:checked+label:before {',
'                    border: 1px solid #cd8876 !important;',
'                }',
'                #Buttons .t-Region-body .row .t-Form-inputContainer input#P16501_SEL_FLAG_6:checked+label:after {',
'                    color: #cd8876 !important;',
'                }',
'                #Tree_tree .a-TreeView-node {',
'                    padding-top: 5px;',
'                }',
'            `)',
'            .appendTo("head");',
'    }',
'    // Add last-ul-style class after delay',
'    addCardStyle();',
'',
'    // Tree node function',
'    const $tree = $(''#Tree'');',
'    $tree.find(''.a-TreeView-node'').each(function () {',
'        const $node = $(this);',
'        const $subtree = $node.children(''.last-ul-style'');',
'',
'        if ($subtree.length) {',
'            $subtree.hide();',
'            $node.removeClass(''a-TreeView-node--leaf'').addClass(''is-expandable'');',
'',
'            if ($node.find(''.a-TreeView-toggle'').length === 0) {',
'                $node.find(''.a-TreeView-row'').prepend(''<div class="a-TreeView-toggle"></div>'');',
'            }',
'        }',
'    });',
'',
'    // highlight last click card',
'    if (!sessionStorage.getItem(''treeInit'')) {',
'        localStorage.removeItem(''activeTreeNode'');',
'        localStorage.removeItem(''activeParentNodes'');',
'        sessionStorage.setItem(''treeInit'', ''true'');',
'    }',
'',
'    var $treeNodes = $(''#Tree .a-TreeView-node--leaf'');',
'',
'    function activateNode($node) {',
'        // Remove all active classes first',
'        $treeNodes.removeClass(''is-active-card'');',
'        $(''#Tree .a-TreeView-node.is-collapsible, #Tree .a-TreeView-node.is-expandable'').removeClass(''is-active-parent'');',
'',
'        // Add active class to clicked leaf node',
'        $node.addClass(''is-active-card'');',
'        localStorage.setItem(''activeTreeNode'', $node.attr(''id''));',
'',
'        // Find all ancestor collapsible parents and add active class + expand them',
'        var $ancestors = $node.parents(''.a-TreeView-node.is-collapsible, .a-TreeView-node.is-expandable'');',
'',
'        var parentIds = [];',
'',
'        $ancestors.each(function () {',
'            var $parent = $(this);',
'            $parent.addClass(''is-active-parent'');',
'',
'            // Expand parent node:',
'            $parent.removeClass(''is-expandable'').addClass(''is-collapsible'');',
'            $parent.children(''ul'').css(''display'', '''');',
'',
'            // Update aria-expanded on label',
'            $parent.find(''.a-TreeView-label[aria-expanded]'').attr(''aria-expanded'', ''true'');',
'',
'            parentIds.push($parent.attr(''id''));',
'        });',
'',
'        // Save all parent IDs as JSON string',
'        localStorage.setItem(''activeParentNodes'', JSON.stringify(parentIds));',
'    }',
'',
'    $treeNodes.on(''click'', function () {',
'        activateNode($(this));',
'    });',
'',
'    // On page load, restore the saved leaf and parent nodes',
'    var savedId = localStorage.getItem(''activeTreeNode'');',
'    var savedParentsJSON = localStorage.getItem(''activeParentNodes'');',
'    var savedParents = savedParentsJSON ? JSON.parse(savedParentsJSON) : [];',
'',
'    if (savedId) {',
'        var $savedNode = $(''#'' + savedId);',
'        if ($savedNode.length) {',
'            $savedNode.addClass(''is-active-card'');',
'        }',
'    }',
'',
'    if (savedParents.length > 0) {',
'        savedParents.forEach(function (parentId) {',
'            var $parent = $(''#'' + parentId);',
'            if ($parent.length) {',
'                $parent.addClass(''is-active-parent'');',
'                $parent.removeClass(''is-expandable'').addClass(''is-collapsible'');',
'                $parent.children(''ul'').css(''display'', '''');',
'                $parent.find(''.a-TreeView-label[aria-expanded]'').attr(''aria-expanded'', ''true'');',
'            }',
'        });',
'    }',
'',
'}',
'',
'function toggleTreeNodes() {',
'    // You can add custom logic here for toggling nodes, if needed',
'    $(''.a-TreeView-node--topLevel'').each(function () {',
'        if ($(this).find(''.last-ul-style'').length === 0) {',
'            $(this).hide();',
'        } else {',
'            $(this).show();',
'        }',
'    });',
'}',
'',
'function updateTreeUIStyles() {',
'    // Remove focus box shadows from expand/collapse buttons',
'    $(''<style>'')',
'        .prop(''type'', ''text/css'')',
'        .html(`',
'            button#expand::before,',
'            button#expand::after,',
'            button#collapse::before,',
'            button#collapse::after,',
'            button#expand:focus:before,',
'            button#expand:focus:after,',
'            button#collapse:focus:before,',
'            button#collapse:focus:after {',
'              box-shadow: unset !important;',
'            }',
'        `)',
'        .appendTo(''head'');',
'',
'    // Style expand and collapse buttons',
'    $(''button#expand'').attr(''style'', `',
'        position: absolute;',
'        top: 14px;',
'        left: 0px;',
'        border-top-right-radius: 5px;',
'        border-bottom-right-radius: 5px;',
'        padding: 5px 7px 5px 23px;',
'        font-weight: 100;',
'        font-size: 1.2rem;',
'        background-color: rgb(189 211 229) !important;',
'        color: #000000 !important;',
'    `);',
'',
'    $(''button#collapse'').attr(''style'', `',
'        position: absolute;',
'        top: 14px;',
'        left: -4px;',
'        border-top-right-radius: 5px;',
'        border-bottom-right-radius: 5px;',
'        padding: 5px 7px 5px 23px;',
'        color: white !important;',
'        font-weight: 100;',
'        font-size: 1.2rem;',
'        display: none;',
'        background-color: rgb(189 211 229) !important;',
'        color: #000000 !important;',
'    `);',
'',
'    // Adjust styling if needed for a toggle container (if still used)',
'    $(''.custom-tree-toggle'').css({',
'        ''float'': ''right'',',
'        ''column-gap'': ''10px'',',
'        ''display'': ''flex'',',
'        ''font-size'': ''1.2rem'',',
'        ''align-items'': ''center'',',
'        ''align-content'': ''center'',',
'        ''flex-wrap'': ''wrap''',
'    });',
'}',
'function addCardStyle() {',
'    setTimeout(function () {',
'        const targetUl = $(''#Tree ul > li > ul > li > ul > li.a-TreeView-node.a-TreeView-node--leaf'').closest(''ul'');',
'        targetUl.addClass(''last-ul-style'');',
'    }, 200);',
'    setTimeout(function () {',
'        const targetUlLevel1 = $(''#Tree ul > li.a-TreeView-node.a-TreeView-node--leaf'').closest(''ul'');',
'        targetUlLevel1.addClass(''last-ul-style'');',
'    }, 200);',
'}',
'',
'// function updateFullClass() {',
'//     const $mainTree = $(''#Tree'');',
'//     const $notify = $(''#NOT'').parent(''.col.col-9.apex-col-auto.col-end'');',
'',
'//     $(''#Tree ul'').each(function () {',
'//         const $ul = $(this);',
'//         const hasCollapsible = $ul.find(''> li.is-collapsible'').length > 0;',
'',
'//         if (hasCollapsible) {',
'//             $ul.addClass(''full'');',
'//             $mainTree.addClass(''full'');',
'//             $notify.hide();',
'//             apex.item("NOT").hide();',
'//             $mainTree.parent(''.col'').removeClass(''col-3'');',
'//         } else {',
'//             $ul.removeClass(''full'');',
'//             if ($(''#Tree ul li.is-collapsible'').length === 0) {',
'//                 $mainTree.removeClass(''full'');',
'//                 $notify.show();',
'//                 apex.item("NOT").show();',
'//                 $mainTree.parent(''.col'').addClass(''col-3'');',
'//             }',
'//         }',
'//     });',
'// }',
'// function updateFullClass() {',
'//     const $mainTree = $(''#Tree'');',
'//     const $notify = $(''#NOT'').parent(''.col.col-9.apex-col-auto.col-end'');',
'',
'//     // Check once for any collapsible nodes in the entire tree',
'//     const hasCollapsible = $(''#Tree ul li.is-collapsible'').length > 0;',
'',
'//     if (hasCollapsible) {',
'//         $(''#Tree ul'').addClass(''full'');',
'//         $mainTree.addClass(''full'');',
'//         $notify.hide();',
'//         apex.item("NOT").hide();',
'//         $mainTree.parent(''.col'').removeClass(''col-3'');',
'//     } else {',
'//         $(''#Tree ul'').removeClass(''full'');',
'//         $mainTree.removeClass(''full'');',
'//         $notify.show();',
'//         apex.item("NOT").show();',
'//         $mainTree.parent(''.col'').addClass(''col-3'');',
'//     }',
'// }',
'// function updateFullClass() {',
'//     const $mainTree = $(''#Tree'');',
'//     let anyCollapsible = false;',
'',
'//     $(''#Tree ul'').each(function () {',
'//         const $ul = $(this);',
'//         const hasCollapsible = $ul.find(''> li.is-collapsible'').length > 0;',
'//         const hasCollapsibleNext = $ul.find(''> li > ul > li.is-collapsible'').length > 0;',
'',
'//         if (hasCollapsible || hasCollapsibleNext) {',
'//             $ul.addClass(''full'');',
'//             anyCollapsible = true;',
'//         } else {',
'//             $ul.removeClass(''full'');',
'//         }',
'//     });',
'',
'//     if (anyCollapsible) {',
'//         $mainTree.addClass(''full'');',
'//         apex.item("NOT").hide();',
'//         $mainTree.parent(''.col'').removeClass(''col-3'');',
'//     } else {',
'//         $mainTree.removeClass(''full'');',
'//         apex.item("NOT").show();',
'//         $mainTree.parent(''.col'').addClass(''col-3'');',
'//     }',
'// }',
'function updateFullClass() {',
'    const $mainTree = $(''#Tree'');',
'    const $notify = $(''#NOT'').parent(''.col.col-9.col-end''); // adjust if needed',
'',
'    // Global checks',
'    const anyCollapsible = $mainTree.find(''li.is-collapsible'').length > 0;',
'    const topCollapsible = $(''#Tree'').children().find(''> ul > li.is-collapsible'').length > 0;',
'',
'    // Mark each UL that has at least one collapsible descendant',
'    $(''#Tree ul'').each(function () {',
'        const $ul = $(this);',
'        $ul.toggleClass(''full'', $ul.find(''li.is-collapsible'').length > 0);',
'    });',
'',
'    // Global NOT + parent col adjustment',
'    if (topCollapsible) {',
'        $mainTree.addClass(''full'');',
'        $mainTree.parent(''.col'').removeClass(''col-3'');',
'        apex.item("NOT").hide();',
'        $notify.hide().removeClass(''col-3'');',
'    } else {',
'        $mainTree.removeClass(''full'');',
'        $mainTree.parent(''.col'').addClass(''col-3'');',
'        apex.item("NOT").show();',
'        $notify.show().addClass(''col-3'');',
'    }',
'',
'    console.log("anyCollapsible:", anyCollapsible, "topCollapsible:", topCollapsible);',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''.a-TreeView'').on(''click'', ''.a-TreeView-label'', function () {',
'    $(this).parents().eq(1).find(".a-TreeView-toggle").click();',
'    addCardStyle();',
'    updateFullClass();',
'});',
'updateFullClass();',
'// $(''.a-TreeView'').on(''click'', ''.a-TreeView-toggle'', function () {',
'//     // Re-check after toggle',
'//     addCardStyle();',
'//     updateFullClass();',
'// });',
'$(document).on(''click'', ''#expand, #collapse'', function () {',
'    updateFullClass();',
'});',
'$(''.a-TreeView'').on(''click'', ''.a-TreeView-toggle, .a-TreeView-label'', function () {',
'    setTimeout(updateFullClass, 50); // delay 50ms so APEX can switch classes',
'});',
'updateTreeUIStyles();',
'toggleTreeNodes();',
'apex.region("Tree").refresh();',
'tree();',
'// Replace P16501_SEL_FLAG with your item name',
'// $("#P16501_SEL_FLAG input[type=checkbox]").on("click", function () {',
'//     var clickedVal = $(this).val();       // which value was clicked',
'//     var isChecked = $(this).prop("checked"); // true = checked, false = unchecked',
'',
'//     console.log("Clicked:", clickedVal, "Checked?", isChecked);',
'',
unistr('//     var finalVals = []; // we\2019ll fill this and assign to both items'),
'',
unistr('//     // \2705 If ALL is clicked'),
'//     if (clickedVal === "ALL") {',
'//         if (isChecked) {',
unistr('//             // Check ALL \2192 select all options'),
'//             finalVals = ["FAV", "SET", "FRM", "REP", "RPT", "MIG", "ALL"];',
'//             addCardStyle();',
'//             updateFullClass();',
'//         } else {',
unistr('//             // Uncheck ALL \2192 clear everything'),
'//             finalVals = [];',
'//             addCardStyle();',
'//             updateFullClass();',
'//         }',
'//     } else {',
unistr('//         // \2705 If an individual option is clicked'),
'//         finalVals = $v("P16501_SEL_FLAG") ? $v("P16501_SEL_FLAG").split(":") : [];',
'//         var allValues = ["FAV", "SET", "FRM", "REP", "RPT", "MIG"];',
'',
unistr('//         // If ALL was included but one got unchecked \2192 remove ALL'),
'//         if (finalVals.includes("ALL") && !isChecked) {',
'//             finalVals = finalVals.filter(v => v !== "ALL");',
'//             addCardStyle();',
'//             updateFullClass();',
'//         }',
'',
unistr('//         // If all individual are checked \2192 auto-add ALL'),
'//         var missing = allValues.filter(v => !finalVals.includes(v));',
'//         if (missing.length === 0 && !finalVals.includes("ALL")) {',
'//             finalVals.push("ALL");',
'//             addCardStyle();',
'//             updateFullClass();',
'//         }',
'//     }',
'',
unistr('//     // \2705 Update original item'),
'//     $s("P16501_SEL_FLAG", finalVals);',
'',
unistr('//     // \2705 Also assign final output to another item'),
'//     $s("P16501_SEL_ALL", finalVals.join(":"));',
'//     tree();',
'//     updateTreeUIStyles();',
'//     // toggleTreeNodes();',
'//     apex.region("Tree").refresh();',
'// });',
'$("#P16501_SEL_FLAG input[type=checkbox]").on("click", function () {',
'    var clickedVal = $(this).val();         // which value was clicked',
'    var isChecked = $(this).prop("checked"); // true = checked, false = unchecked',
'',
'    console.log("Clicked:", clickedVal, "Checked?", isChecked);',
'',
'    var finalVals = []; ',
'    var allValues = ["FAV", "SET", "FRM", "REP", "RPT", "MIG"]; // individual options',
'',
unistr('    // \2705 If ALL is clicked'),
'    if (clickedVal === "ALL") {',
'        if (isChecked) {',
unistr('            // Check ALL \2192 select all options including ALL'),
'            finalVals = [...allValues, "ALL"];',
'        } else {',
unistr('            // Uncheck ALL \2192 clear everything'),
'            finalVals = [];',
'        }',
'    } else {',
unistr('        // \2705 If an individual option is clicked'),
'        finalVals = $v("P16501_SEL_FLAG") ? $v("P16501_SEL_FLAG").split(":") : [];',
'',
unistr('        // If ALL was included but one got unchecked \2192 remove ALL'),
'        if (finalVals.includes("ALL") && !isChecked) {',
'            finalVals = finalVals.filter(v => v !== "ALL");',
'        }',
'',
unistr('        // If all individual are checked \2192 auto-add ALL'),
'        var missing = allValues.filter(v => !finalVals.includes(v));',
'        if (missing.length === 0 && !finalVals.includes("ALL")) {',
'            finalVals.push("ALL");',
'        }',
'    }',
'',
unistr('    // \2705 Update APEX items'),
'    $s("P16501_SEL_FLAG", finalVals);',
'    $s("P16501_SEL_ALL", finalVals.join(":"));    ',
'    ',
unistr('    // \2705 Call updates ONCE'),
'    addCardStyle();',
'    updateFullClass();',
'    tree();',
'    updateTreeUIStyles();',
'    // toggleTreeNodes();',
'    apex.region("Tree").refresh();',
unistr('    // \2705 Trigger collapse action whenever checkbox is clicked'),
'    if (clickedVal === "FAV") {',
'        $("#collapse").trigger("click");',
'    }',
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
'    /* content: "-"; */',
'    color: white;',
'    font-weight: 400;',
'    position: relative;',
'    z-index: 1;',
'    left: 1px;',
'    top: 1px;',
'    font-size: 16px;',
'}',
'',
'.a-TreeView .is-expandable>.a-TreeView-toggle:before {',
'    /* content: "+"; */',
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
'#Tree ul li.is-collapsible>ul>li.is-collapsible>.a-TreeView-toggle::after {',
'    background-color: #d78054;',
'}',
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
'.t-Header-branding {',
'    background: #1f6d9b !important;',
'}'))
,p_step_template=>wwv_flow_imp.id(5950304360493412392)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7149068593804499477)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--hiddenOverflow:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_column=>6
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7152296670753367229)
,p_plug_name=>'Checkbox'
,p_static_id=>'checkbox'
,p_parent_plug_id=>wwv_flow_imp.id(7936775899672568467)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="custom-tree-toggle">',
'  <label><input type="checkbox" class="tree-toggle-checkbox" id="all" data-display="All" checked> All</label>',
'  <label><input type="checkbox" class="tree-toggle-checkbox" data-display="Favourites" checked> Favourites</label>',
'  <label><input type="checkbox" class="tree-toggle-checkbox" data-display="SET" checked> Setup</label>  ',
'  <label><input type="checkbox" class="tree-toggle-checkbox" data-display="FRM" checked> Transaction</label>',
'  <label><input type="checkbox" class="tree-toggle-checkbox" data-display="Reports" checked> Reports</label>',
'  <label><input type="checkbox" class="tree-toggle-checkbox" data-display="Analytics" checked> Analytics</label>',
'  <label><input type="checkbox" class="tree-toggle-checkbox" data-display="Data Management" checked> Data Management</label>',
'</div>',
''))
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7181662310378942931)
,p_plug_name=>'EC'
,p_static_id=>'ec'
,p_region_name=>'EC'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody:margin-bottom-none'
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
 p_id=>wwv_flow_imp.id(8799816496656412411)
,p_name=>'FIN'
,p_static_id=>'fin'
,p_region_name=>'NOT'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noUI:t-Region--hiddenOverflow:margin-top-none'
,p_component_template_options=>'#DEFAULT#:t-Cards--basic:t-Cards--4cols:t-Cards--animColorFill'
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
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(8011271552534964784)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6332960737009705170)
,p_query_column_id=>5
,p_column_alias=>'CARD_COLOR'
,p_column_display_sequence=>50
,p_column_heading=>'Card Color'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6332960285457705170)
,p_query_column_id=>4
,p_column_alias=>'CARD_ICON'
,p_column_display_sequence=>40
,p_column_heading=>'Card Icon'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6332961134298705170)
,p_query_column_id=>6
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>60
,p_column_heading=>'Card Link'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6332959137984705169)
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
 p_id=>wwv_flow_imp.id(6332959951850705170)
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
 p_id=>wwv_flow_imp.id(6332959514359705170)
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
 p_id=>wwv_flow_imp.id(7115936698592942833)
,p_plug_name=>'Tree'
,p_static_id=>'tree'
,p_region_name=>'Tree'
,p_region_template_options=>'#DEFAULT#:margin-top-none:margin-right-lg'
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
'                        AND (INSTR(:P16501_SEL_ALL || '':'', wbf_node_type || '':'') > 0 OR :P16501_SEL_ALL IS NULL)                                        ',
'                   CONNECT BY NOCYCLE fun_id = PRIOR parent_id)',
'       WHERE wbf_visible = ''Y''                ',
'       START WITH parent_id IS NULL',
'       CONNECT BY NOCYCLE parent_id = PRIOR fun_id',
'ORDER SIBLINGS BY wbf_seq_no,node_seq'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_JSTREE'
,p_ajax_items_to_submit=>'P16501_SEL_ALL'
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7936775899672568467)
,p_plug_name=>'Tree1'
,p_static_id=>'tree-2'
,p_region_name=>'Tree1'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490475667505325)
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT *',
'  FROM (           SELECT CASE',
'                             WHEN CONNECT_BY_ISLEAF = 1 THEN 0',
'                             WHEN LEVEL = 1 THEN 1',
'                             ELSE -1',
'                          END',
'                             AS status,',
'                          LEVEL,',
'                          id,',
'                          parent_id,',
'                          name,',
'                          icon icon_class,',
'                          CONNECT_BY_ISLEAF is_leaf,',
'                          link,',
'                          wbf_node_type,',
'                          wbf_visible,wbf_seq_no',
'                     FROM (SELECT parent_id,',
'                                  id,',
'                                  name,',
'                                  wbf_node_type,',
'                                  CASE WHEN parent_id IS NULL THEN NULL ELSE link END link,',
'                                  node_seq,',
'                                  wbf_seq_no,',
'                                  icon,',
'                                  wbf_visible',
'                             FROM (SELECT wbf_bus_fun_id AS id,',
'                                          wbf_par_fun_id AS parent_id,',
'                                          wbf_node_type,',
'                                          NVL (',
'                                             (SELECT albfn_target',
'                                                FROM apex_lang_bus_fun_name',
'                                               WHERE     albfn_lang_type = :global_lang',
'                                                     AND albfn_id = wbf_bus_fun_id),',
'                                             wbf_bus_fun_name)',
'                                             AS name, ',
'                                          DECODE (',
'                                             wbf_node_type,',
'                                             ''MOD'', NULL,',
'                                                ''f?p=''',
'                                             || NVL (wbf_appl_no, :APP_ID)',
'                                             || '':''',
'                                             || NVL (wbf_page_no, 1)',
'                                             || '':''',
'                                             || :APP_SESSION',
'                                             || ''::::'')',
'                                           AS link,',
'                                          ''fa '' || wbf_icon AS icon,',
'                                          DECODE (wbf_node_type,',
'                                                  ''MOD'', 0,',
'                                                  ''SET'', 2,                                           ',
'                                                 ''FRM'', 3,',
'                                                  ''REP'', 4,',
'                                                  ''RPT'', 5)',
'                                             AS node_seq,',
'                                          wbf_seq_no,',
'                                          wbf_visible',
'                                     FROM wapl_bus_fun',
'                                    WHERE wbf_active_flag = ''Y''                                           ',
'                                    UNION ALL',
'                                   SELECT wbf_bus_fun_id AS id,',
'                                          ubff_par_bus_fun_id AS parent_id,',
'                                          wbf_node_type,',
'                                          NVL (',
'                                             (SELECT albfn_target',
'                                                FROM apex_lang_bus_fun_name',
'                                               WHERE     albfn_lang_type = :global_lang',
'                                                     AND albfn_id = wbf_bus_fun_id),',
'                                             wbf_bus_fun_name)',
'                                             AS name, ',
'                                          DECODE (',
'                                             wbf_node_type,',
'                                             ''MOD'', NULL,',
'                                                ''f?p=''',
'                                             || NVL (wbf_appl_no, :APP_ID)',
'                                             || '':''',
'                                             || NVL (wbf_page_no, 1)',
'                                             || '':''',
'                                             || :APP_SESSION',
'                                             || ''::::'')',
'                                           AS link,',
'                                          ''fa '' || wbf_icon AS icon,',
'                                          DECODE (wbf_node_type,',
'                                                  ''MOD'', 0,',
'                                                  ''SET'', 2,                                           ',
'                                                 ''FRM'', 3,',
'                                                  ''REP'', 4,',
'                                                  ''RPT'', 5)',
'                                             AS node_seq,',
'                                          wbf_seq_no,',
'                                          wbf_visible',
'                                     FROM wapl_bus_fun, user_bus_fun_favourites_apex',
'                                    WHERE wbf_bus_fun_id = ubff_bus_fun_id',
'                                      AND ubff_bu = :global_bu',
'                                      AND ubff_user_id = :global_user',
'                                      AND wbf_active_flag = ''Y''))',
'               START WITH parent_id IS NULL',
'               CONNECT BY parent_id = PRIOR id               ',
'        ORDER SIBLINGS BY wbf_seq_no,node_seq)',
' WHERE wbf_visible = ''Y''',
'    AND (is_leaf = 0 OR EXISTS(SELECT wubfa_bus_fun_id',
'                        FROM wapl_user_bus_fun_accs',
'                       WHERE wubfa_bu = :global_bu',
'                         AND wubfa_user_id = :global_user',
'                         AND wubfa_bus_fun_id = id',
'                         AND is_leaf = 1',
'                         AND TRUNC (SYSDATE) BETWEEN wubfa_date_from AND wubfa_date_to))'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_JSTREE'
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'activate_node_link_with', 'S',
  'default_icon_css_class', 'icon-tree-folder',
  'icon_css_class_column', 'ICON_CLASS',
  'icon_type_css_class', 'a-Icon',
  'link_column', 'LINK',
  'node_id_column', 'ID',
  'node_label_column', 'NAME',
  'node_value_column', 'NAME',
  'order_siblings_by', 'WBF_SEQ_NO',
  'parent_key_column', 'PARENT_ID',
  'start_tree_with', 'NULL',
  'tree_hierarchy', 'SQL',
  'tree_tooltip', 'N')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6332102595566032947)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(7181662310378942931)
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
 p_id=>wwv_flow_imp.id(6332102202996032945)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7181662310378942931)
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7149067920307499458)
,p_name=>'P16501_DUMMY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7115936698592942833)
,p_item_default=>'0'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7149070847768499493)
,p_name=>'P16501_SEL_ALL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(7149068593804499477)
,p_item_default=>'FAV:SET:FRM:REP:RPT:MIG:ALL'
,p_source=>'FAV:SET:FRM:REP:RPT:MIG:ALL'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7149070199708499486)
,p_name=>'P16501_SEL_FLAG'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(7149068593804499477)
,p_item_default=>'FAV:SET:FRM:REP:RPT:MIG:ALL'
,p_prompt=>'New'
,p_source=>'P16501_SEL_ALL'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC2:Setup;SET,Transaction;FRM,Reports;REP,Analytics;RPT,Data Mgnt.;MIG,Favourites;FAV,All;ALL'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#:margin-right-none'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '7')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6332106770639032972)
,p_name=>'Collapse'
,p_static_id=>'collapse'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6332102595566032947)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6332107777585032972)
,p_event_id=>wwv_flow_imp.id(6332106770639032972)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P16501_DUMMY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', '0')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6332107242695032972)
,p_event_id=>wwv_flow_imp.id(6332106770639032972)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-tree-collapse'
,p_action=>'NATIVE_TREE_COLLAPSE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7115936698592942833)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6332105298946032969)
,p_name=>'Expand'
,p_static_id=>'expand'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6332102202996032945)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6332106319617032970)
,p_event_id=>wwv_flow_imp.id(6332105298946032969)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P16501_DUMMY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', '1')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6332105796967032970)
,p_event_id=>wwv_flow_imp.id(6332105298946032969)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-tree-expand'
,p_action=>'NATIVE_TREE_EXPAND'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7115936698592942833)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6332109548247032972)
,p_name=>'Hide/Show'
,p_static_id=>'hide-show'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P16501_DUMMY'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6332111484573032973)
,p_event_id=>wwv_flow_imp.id(6332109548247032972)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(6332102202996032945)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P16501_DUMMY'
,p_client_condition_expression=>'1'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6332110500986032973)
,p_event_id=>wwv_flow_imp.id(6332109548247032972)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-hide-2'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(6332102595566032947)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P16501_DUMMY'
,p_client_condition_expression=>'0'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6332110000927032973)
,p_event_id=>wwv_flow_imp.id(6332109548247032972)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(6332102202996032945)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P16501_DUMMY'
,p_client_condition_expression=>'0'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6332111070732032973)
,p_event_id=>wwv_flow_imp.id(6332109548247032972)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-show-2'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(6332102595566032947)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P16501_DUMMY'
,p_client_condition_expression=>'1'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6332113841210032975)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>70
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(7115936698592942833)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6332114346198032975)
,p_event_id=>wwv_flow_imp.id(6332113841210032975)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'addCardStyle();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6332108096296032972)
,p_name=>'Refresh'
,p_static_id=>'refresh'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P16501_FLAG'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6332109163570032972)
,p_event_id=>wwv_flow_imp.id(6332108096296032972)
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
 p_id=>wwv_flow_imp.id(6332108633331032972)
,p_event_id=>wwv_flow_imp.id(6332108096296032972)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7115936698592942833)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6332104914972032969)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>'PROC_APEX_TREE_NODE_RETURN(:GLOBAL_BU,:GLOBAL_USER,:APP_ID,165,:APP_SESSION);'
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>852583931187112767
);
wwv_flow_imp.component_end;
end;
/
