prompt --application/pages/page_00191
begin
--   Manifest
--     PAGE: 00191
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
 p_id=>191
,p_name=>'Capture Image'
,p_alias=>'CAPTURE-IMAGE'
,p_page_mode=>'MODAL'
,p_step_title=>'Capture Image'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#APP_IMAGES#spin.min.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* var video = document.getElementbyID(''myVideo'');',
'var streamvideo;',
'var streamvideo = document.getElementbyID(''myCanvas'');',
'var ctx = canvas.getContext(''2d'');',
'var spinner;',
'var spinform =  document.getElementbyID(''wwvFlowform'');',
'var spinAttr = {',
'position: ''absolute'', className: ''spinner'' , lines: 10, width: 10, length: 30, top: ''50%'', left: ''50%'', radius: 40, opacity: 0.10, speed: 1,  color: ''#fffff'', rotate: 0',
'} */',
'',
'var video = document.getElementById(''myVideo'');',
'var canvas = document.getElementById(''myCanvas''); // Fixed spelling of getElementById',
'var ctx = canvas.getContext(''2d'');',
'var spinner;',
'var spinform = document.getElementById(''wwvFlowform'');',
'var spinAttr = {',
'    position: ''absolute'',',
'    className: ''spinner'',',
'    lines: 10,',
'    width: 10,',
'    length: 30,',
'    top: ''50%'',',
'    left: ''50%'',',
'    radius: 40,',
'    opacity: 0.10,',
'    speed: 1,',
'    color: ''#ffffff'', // Fixed hex color code',
'    rotate: 0',
'};',
'',
'// Initialize spinner if needed here',
'// Example: spinner = new Spinner(spinAttr).spin(spinform);',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.webcam-container {',
'    display: flex;',
'    align-items: flex-start;',
'}',
'',
'video {',
'    width: 320px; /* Webcam size */',
'    height: 240px;',
'}',
'',
'#imagePreview {',
'    width: 300px; /* Preview size */',
'    height: 240px;',
'    border: 2px solid #ccc; /* Optional styling */',
'}',
'',
'#captureButton {',
'    /*width: 300px; /* Preview size */',
'    /*height: 240px;',
'    border: 2px solid #ccc; /* Optional styling */',
'    margin-bottom: 0%;',
'}',
'',
'',
'#saveimageButton {',
'    /*width: 300px; /* Preview size */',
'    /*height: 240px;',
'    border: 2px solid #ccc; /* Optional styling */',
'    margin-bottom: 0%;',
'}',
'',
''))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1000'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9460514897514356584)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650491255404505325)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9460516410108356599)
,p_plug_name=>'Camera'
,p_static_id=>'camera'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>1020
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="display: flex;">',
'    <!-- Column 1: Webcam Capture -->',
'    <div style="flex: 1; margin-right: 20px;">',
'        <h3>Capture Image from Webcam</h3>',
'       <!--  <h3 style="font-family: ''Times New Roman''">Capture Image from Webcam</h3> -->',
'        <video id="video" width="320" height="240" autoplay></video>',
'        <div style="margin-top: 10px;">',
'            <button id="captureButton">Capture</button>',
'        </div>',
'        <canvas id="canvas" width="110" height="110" style="display:none;"></canvas>',
'    </div>',
'',
'    <!-- Column 2: Preview and Additional Actions -->',
'     <div style="flex: 1;">',
'        <h3>Preview</h3>',
'         <img id="imagePreview" src="#" alt="Captured Image" width="110" height="110" style="display:none;"></canvas>',
'         <!--  <video id="video" width="320" height="240"></video> -->',
'        <div style="margin-top: 10px;">',
'            <button id="saveButton">Save Image</button>',
'        </div>',
'            ',
'    </div>',
'</div> ',
' ',
'',
'',
'<script>',
'    const video = document.getElementById(''video'');',
'    const canvas = document.getElementById(''canvas'');',
'    const context = canvas.getContext(''2d'');',
'    const captureButton = document.getElementById(''captureButton'');',
'    const imagePreview = document.getElementById(''imagePreview'');',
'    let capturedImageData;',
'',
'    // Start video stream',
'    async function startCamera() {',
'        try {',
'            const stream = await navigator.mediaDevices.getUserMedia({ video: true });',
'            video.srcObject = stream;',
'        } catch (error) {',
'            console.error("Error accessing webcam: ", error);',
'        }',
'    }',
'',
'       // Capture the image',
'    captureButton.addEventListener(''click'', () => {',
'        context.drawImage(video, 0, 0, canvas.width, canvas.height);',
'        event.preventDefault(); // Prevent any default action, such as form submission',
'        capturedImageData = canvas.toDataURL(''image/png'');',
'        imagePreview.src = capturedImageData;',
'        imagePreview.style.display = ''block''; // Show the captured image',
'    });',
'',
'',
'    // Save the image to the database',
'    document.getElementById(''saveButton'').addEventListener(''click'', () => {',
'        if (capturedImageData) {',
'            apex.item("P191_IMG_VALUE").setValue(capturedImageData);                                          ',
'            const xhr = new XMLHttpRequest();',
'            xhr.open("POST", "f?p=:APP_ID:APP_PAGE_ID:SESSION:Upload_Image"); // Replace with your APEX process URL',
'            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");',
'            xhr.send("imageData=" + encodeURIComponent(capturedImageData));           ',
'        } else {',
'            alert("No image captured!");',
'        }',
'    });',
'',
'    // Start the camera on page load',
'    window.onload = startCamera;',
'</script>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9460514532966356581)
,p_plug_name=>'Image'
,p_static_id=>'image'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>1010
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6796219701419815614)
,p_button_sequence=>40
,p_button_name=>'Back'
,p_static_id=>'back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_redirect_url=>'f?p=&APP_ID.:38:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-left-alt'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6796222765791815633)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9460514897514356584)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Cancel'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6796223156494815633)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9460514897514356584)
,p_button_name=>'TAKESNAP'
,p_static_id=>'takesnap'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Take snap'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-camera'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6796228123048815656)
,p_branch_name=>'EMP_MASTER'
,p_branch_action=>'f?p=&APP_ID.:38:&SESSION.::&DEBUG.::P8186111101_EMP_ROWID_3,P38_ROWID:&P191_ROWID.,&P191_ROWID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9463655145332262802)
,p_name=>'P191_IMG_VALUE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(9460514532966356581)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9460515670376356608)
,p_name=>'P191_NEW_FILE_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(9460514532966356581)
,p_item_default=>'EMPLOYEE IMAGE'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9460515600702356607)
,p_name=>'P191_P_EMP_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9460514532966356581)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9485181194366784932)
,p_name=>'P191_P_EMP_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(9460514532966356581)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9510717289252467834)
,p_name=>'P191_ROWID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9460516410108356599)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6796223851009815650)
,p_validation_name=>'P191_NEW_FILE_NAME'
,p_static_id=>'p191-new-file-name'
,p_validation_sequence=>10
,p_validation=>'P191_NEW_FILE_NAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Doc. Type must be entered',
''))
,p_associated_item=>wwv_flow_imp.id(9460515670376356608)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6796226230151815655)
,p_name=>'Camera'
,p_static_id=>'camera'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(9460516410108356599)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6796226710185815656)
,p_event_id=>wwv_flow_imp.id(6796226230151815655)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
,p_server_condition_type=>'ITEM_IS_NOT_NULL'
,p_server_condition_expr1=>'P191_IMG_VALUE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6796227100757815656)
,p_name=>'Start camera'
,p_static_id=>'start-camera'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6796227653810815656)
,p_event_id=>wwv_flow_imp.id(6796227100757815656)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '// use front camera',
    '// check if the browser supports the mediaDevices API',
    'if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia)',
    '// get access to the device''s camera',
    '{ navigator.mediaDevices.getUserMedia({ video: true }).then(function(stream)',
    '   {',
    '    // display the camera stream',
    '       streamVideo = stream;',
    '       video.srcobject = stream;',
    '     video.play() ;',
    '}).catch(error => {',
    '    // handle error',
    '   console.log(error);',
    '});',
    '} else {',
    '    // the browser does not support the mediaDevices API',
    'console.log(" Your browser does not support the MediaDevices API.");',
    '}')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6796225301112815653)
,p_name=>'Take Snap'
,p_static_id=>'take-snap'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6796223156494815633)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6796225784677815655)
,p_event_id=>wwv_flow_imp.id(6796225301112815653)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'myspinner = new Spinner(spinAttr).spin(spinform);',
    'ctx.drawImage(video, 0, 0, 250, 300);',
    'video.style.display = ''none'';',
    'canvas.style.display = ''inline-block'';',
    'streamVideo.getTracks()[0].stop();',
    '',
    'apex.server.process',
    ' (',
    '    ''GRAB_PICTURE'',',
    '    {p_clob_01: canvas.toDataURL().match(/,(.*)$/)[1]},',
    '     {success: function(data)',
    '         {',
    '                if (data.result == ''success'')',
    '           {',
    '               apex.submit{''TAKESNAP''};',
    '           }',
    '         }',
    '  }',
    ');')))).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6796224104343815650)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Create collections'
,p_static_id=>'create-collections'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Declare',
'   product_image constant apex_collections.collection_name%type := ''SNAPSHOT'';',
'BEGIN',
'  if not apex_collection. collection_exists(product_image) then',
'apex_collection.create_collection(p_collection_name => product_image);',
'ELSE',
' apex_collection.delete_collection(p_collection_name => ''SNAPSHOT'');',
'apex_collection.create_collection(p_collection_name => product_image);',
'end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_internal_uid=>1316703120558895448
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6796224890640815652)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'POST_QUEERY'
,p_static_id=>'post-queery'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P191_P_EMP_ID IS NOT NULL THEN',
'   SELECT EMP_FIRST_NAME1||EMP_MIDDLE_NAME1||EMP_LAST_NAME1',
'     INTO :P191_P_EMP_NAME ',
'     FROM employees',
'    WhERE emp_bu = :GLOBAL_BU',
'      AND emp_emp_id = :P191_P_EMP_ID;',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1316703906855895450
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6796224582184815652)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Upload_Image'
,p_static_id=>'upload-image'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_image BLOB;',
'    v_image_data CLOB;',
'    v_image_length INTEGER;',
'    v_doc_no   VARCHAR2(100);',
'BEGIN',
'    -- Get the base64 image data from the request',
'    v_image_data := :P191_IMG_VALUE;',
'    v_image_data := REPLACE(v_image_data, ''data:image/png;base64,'', ''''); -- Remove the header',
'    v_image_length := LENGTH(v_image_data);',
'    ',
'    ',
'    --v_image := UTL_ENCODE.BASE64_DECODE(UTL_RAW.CAST_TO_RAW(v_image_data));',
'',
'     WHILE MOD(LENGTH(v_image_data), 4) != 0 LOOP',
'        v_image_data := v_image_data || ''='';',
'        --raise_application_error(-20999,''HRM'');',
'    END LOOP;',
'',
'    -- Convert base64 to blob',
'    v_image := UTL_ENCODE.BASE64_DECODE(UTL_RAW.CAST_TO_RAW(v_image_data));',
'',
'    -- Insert the image into the database',
'    --INSERT INTO captured_images (image) VALUES (v_image);',
'    /*',
'    INSERT INTO EMPLOYEE_IMAGES(EMPIMG_BU,',
'                              EMPIMG_EMP_ID,',
'                              EMPIMG_IMAGE,',
'                              EMPIMG_MIME_TYPE,',
'                              EMPIMG_FILE_NAME,',
'                              EMPIMG_CRE_BY,',
'                              EMPIMG_CRE_IP_ADDR,',
'                              EMPIMG_CRE_OS_USER,',
'                              EMPIMG_CRE_DATE,',
'                              EMPIMG_UPD_BY,',
'                              EMPIMG_UPD_IP_ADDR,',
'                              EMPIMG_UPD_OS_USER,',
'                              EMPIMG_UPD_DATE,',
'                              EMPIMG_CRE_EMP_ID,',
'                              EMPIMG_UPD_EMP_ID)',
'                       VALUES(:global_bu,',
'                              :P191_P_EMP_ID,',
'                              v_image,',
'                              NULL,--:EMPIMG_MIME_TYPE,',
'                              :P191_P_EMP_ID,--:EMPIMG_FILE_NAME,',
'                              :global_user,',
'                              NULL,--:EMPIMG_CRE_IP_ADDR,',
'                              NULL,--:EMPIMG_CRE_OS_USER,',
'                              sysdate,--:EMPIMG_CRE_DATE,',
'                              NULL,--:EMPIMG_UPD_BY,',
'                              NULL,--:EMPIMG_UPD_IP_ADDR,',
'                              NULL,--:EMPIMG_UPD_OS_USER,',
'                              NULL,--:EMPIMG_UPD_DATE,',
'                              NULL,--:EMPIMG_CRE_EMP_ID,',
'                              NULL);--:EMPIMG_UPD_EMP_ID)*/',
'         ',
'--Raise_Application_error(-20999,:P191_NEW_FILE_NAME||''~''||:P191_P_EMP_ID); ',
'          UPDATE doc_mgmt',
'             SET DM_FILE_NARR = :P191_NEW_FILE_NAME,',
'                 DM_BLOB      = v_image,',
'                 DM_UPD_BY    = :global_user,',
'                 DM_UPD_DATE  = sysdate',
'           WHERE DM_BU = :global_bu',
'             AND DM_VOU_NO = :P191_P_EMP_ID',
'             AND DM_VOU_TYPE = ''E_IMG'';',
'      ',
'      -- IF sql%NOTFOUND THEN',
'         --IF sql%FOUND THEN ',
'--Raise_Application_error(-20999,''test'');  ',
'         SELECT NVL(MAX(DM_DOC_NO),1000000000) + 1',
'           INTO v_doc_no',
'           FROM DOC_MGMT',
'          WHERE DM_BU = :GLOBAL_BU;',
'--raise_application_error(-20999,v_doc_no);',
'         INSERT INTO doc_mgmt(DM_BU,',
'                              DM_DOC_NO,',
'                              DM_VOU_LEVEL,',
'                              DM_VOU_TYPE,',
'                              DM_VOU_PLNT,',
'                              DM_VOU_PFX,',
'                              DM_VOU_NO,',
'                              DM_VOU_SEQ_NO,',
'                              DM_PARTY_TYPE,',
'                              DM_PARTY_ID,',
'                              DM_PROD_ID,',
'                              DM_PROD_REV,',
'                              DM_FILE_NARR,',
'                              DM_DOC_TYPE,',
'                              DM_DOC_NAME,',
'                              DM_BLOB,',
'                              DM_CRE_BY,',
'                              DM_CRE_IP_ADDR,',
'                              DM_CRE_OS_USER,',
'                              DM_CRE_DATE,',
'                              DM_UPD_BY,',
'                              DM_UPD_IP_ADDR,',
'                              DM_UPD_OS_USER,',
'                              DM_UPD_DATE,',
'                              DM_CRE_EMP_ID,',
'                              DM_UPD_EMP_ID,',
'                              DM_ATTACH_ID,',
'                              DM_BUS_FUN_ID,',
'                              DM_BLOCK_NAME,',
'                              DM_TABLE_NAME,',
'                              DM_MIME_TYPE,',
'                              DM_FILE_NAME,',
'                              DM_PARTY_NAME,',
'                              DM_LOC_TYPE,',
'                              DM_ATTACH_DIR,',
'                              DM_MODULE,',
'                              DM_VOU_SEQ2_NO,',
'                              DM_VOU_SEQ3_NO,',
'                              DM_VOU_SEQ4_NO,',
'                              DM_MAIL_FLAG,',
'                              DM_ATT_SEQ_NO,',
'                              DM_VOU_SFX,',
'                              DM_EXP_DATE,',
'                              DM_STATUS,',
'                              DM_LOC_ID,',
'                              DM_TYPE_DESC,',
'                              DM_FROM_DATE,',
'                              DM_TO_DATE,',
'                              DM_SUB_VOU_TYPE,',
'                              DM_EMP_ID)',
'                      VALUES( :global_bu,',
'                              v_doc_no,---:DM_DOC_NO,',
'                              ''O'',--:DM_VOU_LEVEL,',
'                              ''E_IMG'',--:DM_VOU_TYPE,',
'                              NULL,--:DM_VOU_PLNT,',
'                              NULL,--:DM_VOU_PFX,',
'                              :P191_P_EMP_ID,--:DM_VOU_NO,',
'                              1,--:DM_VOU_SEQ_NO,',
'                              ''S'',--:DM_PARTY_TYPE,',
'                              NULL,--:DM_PARTY_ID,',
'                              NULL,--:DM_PROD_ID,',
'                              NULL,--:DM_PROD_REV,',
'                              :P191_P_EMP_ID||''-''||:P191_P_EMP_NAME||''-''||v_doc_no,---:P191_NEW_FILE_NAME,--:DM_FILE_NARR,',
'                              NULL,--:DM_DOC_TYPE,',
'                              :P191_P_EMP_ID||''-''||:P191_P_EMP_NAME||''-''||v_doc_no,--:P191_NEW_FILE_NAME,-- :P191_IMG_VALUE,',
'                              v_image,--:DM_BLOB,',
'                              :global_user,',
'                              NULL,--:DM_CRE_IP_ADDR,',
'                              NULL,--:DM_CRE_OS_USER,',
'                              sysdate,--:DM_CRE_DATE,',
'                              NULL,--:DM_UPD_BY,',
'                              NULL,--:DM_UPD_IP_ADDR,',
'                              NULL,--:DM_UPD_OS_USER,',
'                              NULL,--:DM_UPD_DATE,',
'                              NULL,--:DM_CRE_EMP_ID,',
'                              NULL,--:DM_UPD_EMP_ID,',
'                              NULL,--:DM_ATTACH_ID,',
'                              NULL,--:DM_BUS_FUN_ID,',
'                              NULL,--:DM_BLOCK_NAME,',
'                              NULL,--:DM_TABLE_NAME,',
'                              ''image/jpeg'',--:DM_MIME_TYPE,',
'                              NULL,--:DM_FILE_NAME,',
'                              NULL,--:DM_PARTY_NAME,',
'                              ''D'',--:DM_LOC_TYPE,',
'                              NULL,--:DM_ATTACH_DIR,',
'                              NULL,--:DM_MODULE,',
'                              NULL,--:DM_VOU_SEQ2_NO,',
'                              NULL,--:DM_VOU_SEQ3_NO,',
'                              NULL,--:DM_VOU_SEQ4_NO,',
'                              ''N'',--:DM_MAIL_FLAG,',
'                              NULL,--:DM_ATT_SEQ_NO,',
'                              ''0'',--:DM_VOU_SFX,',
'                              NULL,--:DM_EXP_DATE,',
'                              ''A'',--:DM_STATUS,',
'                              NULL,--:DM_LOC_ID,',
'                              :P191_NEW_FILE_NAME,--:DM_TYPE_DESC,',
'                              NULL,--:DM_FROM_DATE,',
'                              NULL,--:DM_TO_DATE,',
'                              NULL,--:DM_SUB_VOU_TYPE,',
'                              :P191_P_EMP_ID);--:DM_EMP_ID)',
'               --   END IF;',
'',
'    COMMIT;',
'END;',
'',
'',
'',
'  '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1316703598399895450
);
wwv_flow_imp.component_end;
end;
/
