prompt --application/pages/page_09999
begin
--   Manifest
--     PAGE: 09999
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
 p_id=>9999
,p_name=>'Login Page'
,p_alias=>'LOGIN'
,p_step_title=>'Login Page'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let wrongAttempts = 0;',
'',
'function viewPassword()',
'{',
'  var passwordInput = document.getElementById(''P9999_PASSWORD'');',
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
'function viewOTP()',
'{',
'  var passwordInput = document.getElementById(''P9999_OTP'');',
'  var passStatus = document.getElementById(''otp-status'');',
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
'function title (a){',
'    output.innerText = `${a}`;',
'}',
'',
'function note(i){',
'    document.getElementById("note").innerHTML = `${i}`;',
'}',
'',
'',
'function getDeviceSpecificInfo() {',
'  let userAgent = navigator.userAgent.toLowerCase();',
'  const browser =',
'    userAgent.indexOf(''edge'') > -1 ? ''edge''',
'      : userAgent.indexOf(''edg'') > -1 ? ''chromium based edge''',
'      : userAgent.indexOf(''opr'') > -1 && !!window.opr ? ''opera''',
'      : userAgent.indexOf(''chrome'') > -1 && !!window.chrome ? ''chrome''',
'      : userAgent.indexOf(''trident'') > -1 ? ''ie''',
'      : userAgent.indexOf(''firefox'') > -1 ? ''firefox''',
'      : userAgent.indexOf(''safari'') > -1 ? ''safari''',
'      : ''other'';',
'  const deviceSpecificInfo = {',
'    userAgent: navigator.userAgent,',
'    platform: navigator.platform,',
'    screenWidth: window.screen.width,',
'    screenHeight: window.screen.height,',
'    windowWidth: window.innerWidth,',
'    windowHeight: window.innerHeight,',
'    language: navigator.language,',
'    timeZone: Intl.DateTimeFormat().resolvedOptions().timeZone,',
'    isOnline: navigator.onLine,',
'    isMobile: /Mobi/i.test(navigator.userAgent), ',
'    isTouchDevice: ''ontouchstart'' in window || navigator.maxTouchPoints > 0,',
'    deviceType: getDeviceType(),',
'    browser : browser',
'  };',
'',
'  return deviceSpecificInfo;',
'}',
'',
'function getDeviceType() {',
'  if (/iPhone|iPad|iPod/i.test(navigator.userAgent)) {',
'    return ''iOS'';',
'  } else if (/Android/i.test(navigator.userAgent)) {',
'    return ''Android'';',
'  } else if (/Windows/i.test(navigator.userAgent)) {',
'    return ''Windows'';',
'  } else if (/Mac/i.test(navigator.userAgent)) {',
'    return ''Mac'';',
'  } else if (/Linux/i.test(navigator.userAgent)) {',
'    return ''Linux'';',
'  } else {',
'    return ''Unknown'';',
'  }',
'}',
'',
'async function fetchLocalIpAddress() {',
'  const pc = new RTCPeerConnection({ iceServers: [] });',
'  pc.createDataChannel('''');',
'',
'  const offer = await pc.createOffer();',
'  await pc.setLocalDescription(offer);',
'',
'  const ipAddress = await new Promise((resolve, reject) => {',
'    pc.onicecandidate = (event) => {',
'      if (event && event.candidate && event.candidate.candidate) {',
'        const s = event.candidate.candidate.split(''\n'');',
'        const ip = s[0].split('' '')[4];',
'',
'        pc.onicecandidate = null;',
'        pc.close();',
'',
'        resolve(ip);',
'      }',
'    };',
'  });',
'',
'  return ipAddress;',
'}',
'',
'function insertLoginDetails() {  ',
'  const deviceInfo = getDeviceSpecificInfo();',
'  console.log(deviceInfo);',
'',
'  apex.item( "P9999_BROWSER" ).setValue(deviceInfo.browser);',
'  apex.item( "P9999_DEVICETYPE" ).setValue(deviceInfo.deviceType);',
'  apex.item( "P9999_ISMOBILE" ).setValue(deviceInfo.isMobile);',
'  console.log(deviceInfo.isMobile);',
'  apex.item( "P9999_ISTOUCHDEVICE" ).setValue(deviceInfo.isTouchDevice);',
'  apex.item( "P9999_TIMEZONE" ).setValue(deviceInfo.timeZone);',
'  apex.item( "P9999_USER_LANGUAGE" ).setValue(deviceInfo.language);',
'  apex.item( "P9999_SCREENHEIGHT" ).setValue(deviceInfo.screenHeight);',
'  apex.item( "P9999_SCREENWIDTH" ).setValue(deviceInfo.screenWidth);',
'  apex.item( "P9999_PLATFORM" ).setValue(deviceInfo.platform);',
'  apex.item( "P9999_USERAGENT" ).setValue(deviceInfo.userAgent);',
'',
'',
' $(function() {',
'    $.getJSON("https://api64.ipify.org/?format=json",',
'      function(json) {',
'       console.log("My public IP address is: ", json.ip);',
'       apex.item( "P9999_IP_PUBLIC" ).setValue(json.ip);',
'      }',
'    );',
'  });',
'',
'fetchLocalIpAddress()',
'  .then(ip => {',
'    console.log(''Local IP address:'', ip);',
'    apex.item( "P9999_IP_LOCAL" ).setValue(ip);',
'  })',
'  .catch(error => {',
'    console.error(''Error fetching local IP address:'', error);',
'  });',
'',
'    if(navigator.geolocation)',
'            { navigator.geolocation.getCurrentPosition(function(position){',
'                    apex.item( "P9999_LATITUDE" ).setValue(position.coords.latitude);',
'                    apex.item( "P9999_LONGITUDE" ).setValue(position.coords.longitude);',
'                    console.log(position.coords.latitude+'',''+position.coords.longitude);',
'                });',
'            }',
'}',
'',
'function getDeviceID() {',
'    // Check if the device ID is available',
'    if (typeof device !== ''undefined'' && device.uuid) {',
'        console.log(device.uuid);',
'        return device.uuid; // Use the appropriate property for your device ID',
'    } else {',
'        //console.log(device);',
'        console.log(''Device ID not available'');',
'        return ''Device ID not available'';',
'    }',
'}',
'',
'function sendOTP(){',
'    var spinner = apex.util.showSpinner();',
'    apex.server.process("SEND_OTP",  ',
'    { x20: apex.item( "P9999_USERNAME" ).getValue() },',
'    { dataType: ''text'',',
'      success: function( data ) ',
'        { ',
'            spinner.remove();',
'            $s("P9999_OTP_VALIDATION", ''Y'');',
'            apex.item( "Container" ).show();',
'            startCountdown();',
'            title(''Login with OTP'');',
'            console.log(data);',
'        },',
'      error: function(jqXHR, textStatus, errorThrown) {',
'        console.error(''OTP not Sent.'');',
'      }',
'    }',
'  );',
'}',
'',
'',
'function resendOTP(){',
'    var spinner = apex.util.showSpinner();',
'    apex.server.process("SEND_OTP",  ',
'    { x20: apex.item( "P9999_USERNAME" ).getValue() },',
'    { dataType: ''text'',',
'      success: function( data ) ',
'        { ',
'            spinner.remove();',
'            resetTimer();',
'            console.log(data);',
'        },',
'      error: function(jqXHR, textStatus, errorThrown) {',
'        console.error(''OTP not Sent.'');',
'      }',
'    }',
'  );',
'}',
'',
'function otp_validation(username,empid,otp){',
'    return new Promise((resolve, reject) => {',
'        apex.server.process(',
'        "OTPVALIDATION", ',
'        { x01: username,',
'          x02: empid,',
'          x03: otp},',
'        { dataType: ''text'',',
'          success: function(data) {',
'            console.log(''OTP Vaild or not ''+ data);',
'            resolve(data);',
'          }',
'        }',
'      );',
'  });',
'  }',
' ',
'  let countdown =  parseInt(apex.item("P9999_POLICY_MINS").getValue(), 10);',
'  ',
'  let countdownTime = countdown * 60;  ',
'  function updateCountdown() {',
'    const minutes = Math.floor(countdownTime / 60);',
'    const seconds = countdownTime % 60;',
'',
'    document.getElementById(''countdown'').innerHTML = `Time remaining: ${minutes} mins ${Math.abs(seconds)} secs`;',
'    countdownTime--;',
'',
'    if (countdownTime < 0) {',
'      triggerOTPResetReminder();',
'      clearInterval(intervalId);',
'    }',
'  }',
'',
'  function startCountdown() {',
'    intervalId = setInterval(updateCountdown, 1000);',
'    console.log(''Start'');',
'  }',
'',
'  function triggerOTPResetReminder() {',
'    noofattempts($v(''P9999_USERNAME''),$v(''P9999_CC_EMP_ID''),''You have exceeded the time limit'',''F'');',
'    apex.message.alert("You have exceeded the time limit. Please try again later.",function(){apex.submit();});',
'  }',
'function resetTimer() {',
'    clearInterval(intervalId);',
'    countdownTime = countdown * 60;',
'    startCountdown();',
'  }',
'',
'document.addEventListener("keydown", function (event) {',
'    if (event.key === "Enter") {',
'        var btn = document.getElementById("loginbtn");',
'        if (btn) {',
'            btn.click();',
'        }',
'    }',
'});',
'',
'',
'',
'function noofattempts(username,empid,reason,odstatus){',
'    apex.server.process("NOOFATTEMPTS",  ',
'    { x04: username,',
'      x05: empid,',
'      x06: reason,',
'      x07: odstatus },',
'    { dataType: ''text'',',
'      success: function( data ) ',
'        { ',
'            console.log(data);',
'        },',
'      error: function(jqXHR, textStatus, errorThrown) {',
'        console.error(''OTP not Sent.'');',
'      }',
'    }',
'  );',
'}',
'',
'function expdate() {',
'    apex.server.process(',
'        "EXPDATE",',
'        {',
'            pageItems: "#P9999_USERNAME"',
'        },',
'        {',
'            dataType: "text",',
'            success: function(data) {',
'                apex.message.clearErrors();',
'                var result = data.trim().split("|");',
'                var status = result[0];',
'                var expDays = parseInt(result[1], 10);',
'',
'                apex.lang.addMessages({',
'                    "APEX.DIALOG.OK": "Yes",',
'                    "APEX.DIALOG.CANCEL": "No"',
'                });',
'',
'                if (status == "Y") {',
'',
'                    apex.message.confirm(',
'                        "Kindly update the password.",',
'                        function(okPressed) {',
'',
'                            if (okPressed) {',
'                                apex.item("P9999_EXP_ALERT_DATE").setValue("Y");',
'                                document.getElementById("EXPIRY").click();',
'                            } else {',
'                                apex.item("P9999_EXP_ALERT_DATE").setValue("Y");',
'                            }',
'',
'                        }',
'                    );',
'',
'                }',
'                else if (status == "A") {',
'',
'                    var message =',
'                        "Password will expire in " +',
'                        expDays +',
'                        (expDays == 1 ? " day." : " days.") +',
'                        " Do you wish to update the password?";',
'                    apex.message.confirm(',
'                        message,',
'                        function(okPressed) {',
'                            if (okPressed) {',
'                                apex.item("P9999_EXP_ALERT_DATE").setValue("Y");',
'                                document.getElementById("EXPIRY").click();',
'                            } else {',
'                                apex.item("P9999_EXP_ALERT_DATE").setValue("N");',
'                            }',
'                        }',
'                    );',
'',
'                }',
'                else if (status == "B") {',
'                    apex.message.confirm(',
'                        "Password Expired. Kindly update the password.",',
'                        function(okPressed) {',
'                            if (okPressed) {',
'                                apex.item("P9999_EXP_ALERT_DATE").setValue("Y");',
'                                document.getElementById("EXPIRY").click();',
'                            } else {',
'                                apex.item("P9999_EXP_ALERT_DATE").setValue("Y");',
'                            }',
'                        }',
'                    );',
'                }',
'                else {',
'                    apex.item("P9999_EXP_ALERT_DATE").setValue("N");',
'                }',
'            }',
'        }',
'    );',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//apex.item("P9999_USERNAME").isEmpty();',
'//apex.item("P9999_PASSWORD").isEmpty();',
'/*',
'if (document.getElementById("P9999_REMEMBER").value == ''Y''){',
'expdate();',
'}',
'*/',
'insertLoginDetails();',
'getDeviceID();',
'',
'// Clear cookies',
'// Clear sessionStorage',
'// Clear localStorage',
'localStorage.removeItem("openTabs");',
' document.cookie.split(";").forEach(function(c) {',
'     document.cookie = c',
'         .replace(/^ +/, "")',
'         .replace(/=.*/, "=;expires=" + new Date().toUTCString() + ";path=/");',
' });',
' localStorage.clear();',
' sessionStorage.clear();',
' if (''caches'' in window) {',
'     caches.keys().then(function(names) {',
'         names.forEach(function(name) {',
'             caches.delete(name);',
'         });',
'     });',
' }'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*Current*/',
'.t-Login-container {',
'    display: flex;',
'    flex-grow: 1;',
'    flex-shrink: 0;',
'    flex-basis: auto;',
'    flex-direction: column;',
'    padding-left: 8px;',
'    padding-right: 8px;',
'    max-width: 100%;',
'    background-size: cover !important;',
'    /* background: url("#APP_FILES#USHOME.png"); */',
'    background: url("#APP_FILES#RM.gif");',
'    background-position: center;',
'}',
'',
'.t-Login-containerBody {',
'    flex-grow: 0;',
'    flex-shrink: 0;',
'    flex-basis: auto;',
'    display: block;',
'    flex-direction: column;',
'    margin-top: auto;',
'    margin-bottom: auto;',
'    align-items: left;',
'}',
'',
'.t-Login-buttons .t-Button {',
'    display: block;',
'    width: 100%;',
'    padding: 11px 24px;',
'    font-size: 16px;',
'    line-height: 4px;',
'}',
'',
'.t-Login-region {',
'    /* background: url("#APP_FILES#USLOGIN.png"); */',
'    background: rgb(255, 255, 255);',
'    backdrop-filter: blur(1px);',
'    border-style: none;',
'    padding-top: 70px;',
'    padding-left: 30px;',
'    padding-right: 30px;',
'    padding-bottom: 15px;',
'    background-repeat: round;',
'    background-size: cover;',
'    max-width: 290px;',
'    margin-left: 85px;',
'    box-shadow: 1px 2px 7px 1px #f2f2f2;',
'}',
'',
'.field-icon {',
'    right: 16px;',
'    margin-left: -15px;',
'    margin-top: 14px;',
'    position: relative;',
'    z-index: 2;',
'}',
'',
'',
'.row {',
'    margin-right: -8px;',
'    margin-left: 8px;',
'    border-radius: 35px;',
'}',
'',
'.t-Form-radioLabel,',
'.t-Form-inputContainer .radio_group label,',
'.t-Form-checkboxLabel,',
'.t-Form-inputContainer .checkbox_group label,',
'.t-Form-label,',
'.u-Form-label {',
'    color: #f0f0f0;',
'}',
'',
'.a-Button--hot,',
'.t-Button--hot:not(.t-Button--simple),',
'body .ui-button.ui-button--hot,',
'body .ui-state-default.ui-priority-primary {',
'    background-color: #6394a2;',
'    color: #fefefe;',
'    /* width: fit-content;',
'    padding: 0.5rem 3.5rem;',
'    margin: 0 auto; */',
'}',
'',
'.a-Button--hot:hover,',
'.t-Button--hot:not(.t-Button--simple):hover,',
'body .ui-button.ui-button--hot:hover,',
'body .ui-state-default.ui-priority-primary:hover,',
'.a-Button--hot:not(:active):focus,',
'.t-Button--hot:not(.t-Button--simple):not(:active):focus,',
'body .ui-button.ui-button--hot:not(:active):focus,',
'body .ui-state-default.ui-priority-primary:not(:active):focus {',
'    background-color: #6394a2;',
'}',
'',
'.t-Login-region--headerTitle .t-Login-title {',
'    margin-top: 0;',
'    color: white;',
'}',
'',
'.apex-item-checkbox .apex-item-option input+label {',
'    padding-left: 2.2rem;',
'    padding-right: .8rem;',
'    color: #335764;',
'    display: inline-block;',
'}',
'',
'.note {',
'    font-size: 10px;',
'    margin-top: 5px;',
'}',
'',
'#forgotbtn {',
'    font-size: small;',
'    text-decoration-line: none;',
'}',
'',
'.t-Login-region .t-Login-body .t-Form-fieldContainer:not(.t-Form-fieldContainer--floatingLabel) .apex-item-text {',
'    font-size: 11px;',
'    padding: 4px 35px;',
'    height: 32px;',
'}',
'.t-Login-region .t-Login-body .t-Form-fieldContainer:not(.t-Form-fieldContainer--floatingLabel) .apex-item-text:-internal-autofill-selected {',
'    background-color: white !important;',
'}',
'',
'.t-Form--large .apex-item-select,',
'.t-Form--large .apex-item-text,',
'.t-Form--large .apex-item-textarea,',
'.t-Form-fieldContainer--large .apex-item-select,',
'.t-Form-fieldContainer--large .apex-item-text,',
'.t-Form-fieldContainer--large .apex-item-textarea {',
'    font-size: 1.0rem;',
'    padding: .7rem;',
'}',
'.t-Login-body .t-Form-fieldContainer:not(.t-Form-fieldContainer--floatingLabel) .apex-item-icon {',
'    padding: 8px 12px 12px 12px !important;',
'}'))
,p_step_template=>wwv_flow_imp.id(10650470393802505303)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5583609206535820743)
,p_plug_name=>'Alert'
,p_static_id=>'alert'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>wwv_flow_imp.id(10650510175351505351)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<h5>Please contact Administrator to provide DashBoard Access.</h5>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6705283058655192054)
,p_plug_name=>'ALERT'
,p_static_id=>'alert-2'
,p_parent_plug_id=>wwv_flow_imp.id(12343421340544306400)
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<p id="note"></p>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12343421340544306400)
,p_plug_name=>'<center><img src=#APP_IMAGES#RoadmapERP_Logo.png alt="Img" width="220" height="70"></center>'
,p_static_id=>'center-img-src-app-images-roadmaperp-logo-png-alt-img-width-220-height-70-center'
,p_region_name=>'refreshlogin'
,p_icon_css_classes=>'app-icon'
,p_region_template_options=>'#DEFAULT#:t-Login-region--headerHidden:margin-top-none:margin-bottom-none'
,p_region_attributes=>'autocomplete="off"'
,p_plug_template=>wwv_flow_imp.id(10650516346407505362)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6705285929031192083)
,p_plug_name=>'Container'
,p_static_id=>'container'
,p_region_name=>'Container'
,p_parent_plug_id=>wwv_flow_imp.id(12343421340544306400)
,p_region_template_options=>'#DEFAULT#:t-Form--noPadding'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'BELOW'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6380642827377936173)
,p_plug_name=>'ContainerEMP'
,p_static_id=>'containeremp'
,p_region_name=>'ContainerEMP'
,p_parent_plug_id=>wwv_flow_imp.id(12343421340544306400)
,p_region_template_options=>'#DEFAULT#:t-Form--noPadding'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8776270821170332050)
,p_plug_name=>'Language Selector'
,p_static_id=>'language-selector'
,p_parent_plug_id=>wwv_flow_imp.id(12343421340544306400)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5718421724854150638)
,p_plug_name=>'LOGIN'
,p_static_id=>'login'
,p_parent_plug_id=>wwv_flow_imp.id(12343421340544306400)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody:margin-top-none:margin-bottom-md'
,p_region_attributes=>'style="display:none";'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span style="font-size:20px">Login</span><br>',
'<span style="font-size:10px">Welcome Back!</span>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6523936208824549843)
,p_plug_name=>'PASSWORD'
,p_static_id=>'password'
,p_parent_plug_id=>wwv_flow_imp.id(12343421340544306400)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6523936307888549844)
,p_plug_name=>'REMEMBER'
,p_static_id=>'remember'
,p_region_name=>'LOGINRM'
,p_parent_plug_id=>wwv_flow_imp.id(12343421340544306400)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>60
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5700339054603997729)
,p_plug_name=>'UPDATE PASSWORD'
,p_static_id=>'update-password'
,p_title=>'Update Password'
,p_region_name=>'UP'
,p_parent_plug_id=>wwv_flow_imp.id(12343421340544306400)
,p_region_css_classes=>'js-dialog-size300x300'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size600x400'
,p_plug_template=>wwv_flow_imp.id(10650510175351505351)
,p_plug_display_sequence=>300
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6523936128008549842)
,p_plug_name=>'USERNAME'
,p_static_id=>'username'
,p_region_name=>'USERNAME'
,p_parent_plug_id=>wwv_flow_imp.id(12343421340544306400)
,p_region_template_options=>'#DEFAULT#:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5628973064298381733)
,p_button_sequence=>290
,p_button_plug_id=>wwv_flow_imp.id(12343421340544306400)
,p_button_name=>'EXPIRY'
,p_static_id=>'expiry'
,p_button_static_id=>'EXPIRY'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Expiry'
,p_button_redirect_url=>'f?p=&APP_ID.:17011997:&SESSION.::&DEBUG.:::'
,p_button_cattributes=>'style=display:none;'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6192219471685289248)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6523936307888549844)
,p_button_name=>'LOGIN'
,p_static_id=>'login'
,p_button_static_id=>'loginbtn'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'t-Button--small:t-Button--stretch'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'<b id="output">Login</b>'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5700339586820997734)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(5700339054603997729)
,p_button_name=>'UPDATE_PASS_OK'
,p_static_id=>'update-pass-ok'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'OK'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-thumbs-o-up'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6780966846190206150)
,p_name=>'P9999_BROWSER'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(12343421340544306400)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6740190134589521653)
,p_name=>'P9999_BU'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(12343421340544306400)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6380642859452936174)
,p_name=>'P9999_CC_EMP_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6380642827377936173)
,p_prompt=>'Employee'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    (',
'        SELECT',
'            emp_first_name1',
'            || '' - ''',
'            || emp_emp_id',
'        FROM',
'            employees',
'        WHERE',
'                emp_bu = APPLUSER_BU',
'            AND emp_emp_id = APPLUSER_EMP_ID',
'    )          d,',
'    APPLUSER_EMP_ID r',
'FROM',
'    appl_users',
'WHERE',
'    upper(APPLUSER_ID) = upper(:P9999_USERNAME)',
'    and APPLUSER_STATUS = ''A'''))
,p_lov_cascade_parent_items=>'P9999_USERNAME'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6380642953511936175)
,p_name=>'P9999_CC_TYPE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(12343421340544306400)
,p_item_default=>'N'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5700339350622997732)
,p_name=>'P9999_CONFIRM_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(5700339054603997729)
,p_prompt=>'Confirm Password'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6780966966456206151)
,p_name=>'P9999_DEVICETYPE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(12343421340544306400)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6593320304875119456)
,p_name=>'P9999_ERROR_MSG'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(12343421340544306400)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5583608977762820741)
,p_name=>'P9999_EXP_ALERT_DATE'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(12343421340544306400)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6660055844891855672)
,p_name=>'P9999_IP_LOCAL'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(12343421340544306400)
,p_item_default=>'SELECT owa_util.get_cgi_env(''X-Forwarded-For'') IP_ADDESS_APP_USER FROM DUAL'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7099437250417387595)
,p_name=>'P9999_IP_PUBLIC'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(12343421340544306400)
,p_item_default=>'SELECT owa_util.get_cgi_env(''X-Forwarded-For'') IP_ADDESS_APP_USER FROM DUAL'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6780967056654206152)
,p_name=>'P9999_ISMOBILE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(12343421340544306400)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6780967134996206153)
,p_name=>'P9999_ISTOUCHDEVICE'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(12343421340544306400)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8776279802934332082)
,p_name=>'P9999_LANGUAGE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8776270821170332050)
,p_prompt=>'LANGUAGE'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:English;en,French;fr,Chinese (Simplified);zh,Thai;th,Japanese;ja'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_icon_css_classes=>'fa-language'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6780967844222206160)
,p_name=>'P9999_LATITUDE'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(12343421340544306400)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6780967959544206161)
,p_name=>'P9999_LONGITUDE'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(12343421340544306400)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5700339287626997731)
,p_name=>'P9999_NEW_PASSWORD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(5700339054603997729)
,p_prompt=>'New Password'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7175487094464606609)
,p_name=>'P9999_OTP'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6705285929031192083)
,p_prompt=>'OTP'
,p_placeholder=>'OTP'
,p_post_element_text=>'<span id="otp-status" style="line-height: 0.5rem;"class="fa fa-eye field-icon" aria-hidden="true" onClick="viewOTP()"></span>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>6
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_icon_css_classes=>'fa-key'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_inline_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="display: flex; justify-content: space-between;line-height: 0.5rem;">',
'    <div style="color: #f37e20; cursor: pointer;" onClick="resendOTP()">Resend</div>',
'    <div id="countdown" style="color: white; text-align-last: end;"></div>',
'</div>',
''))
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7175479445635606588)
,p_name=>'P9999_OTP_TYPE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(12343421340544306400)
,p_item_default=>'N'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6705284369871192068)
,p_name=>'P9999_OTP_VALIDATION'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(12343421340544306400)
,p_item_default=>'N'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12343423226215306416)
,p_name=>'P9999_PASSWORD'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6523936208824549843)
,p_prompt=>'Password'
,p_placeholder=>'Password'
,p_post_element_text=>'<span id="pass-status"  style="line-height: 0.5rem;" class="fa fa-eye field-icon" aria-hidden="true" onClick="viewPassword()"></span>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_tag_attributes=>'autocomplete = "off"'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_icon_css_classes=>'fa-key'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_inline_help_text=>'<div  style="line-height: 0.2rem; text-align-last: end;"><a tabindex="-1" href="f?p=&APP_ID.:17011997:&APP_SESSION.:::84:::" style="color:black;">Get Password</a></div>'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6780967690513206158)
,p_name=>'P9999_PLATFORM'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(12343421340544306400)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5566784788720288148)
,p_name=>'P9999_POLICY_MINS'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(12343421340544306400)
,p_item_default=>'4'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12343424336288306421)
,p_name=>'P9999_REMEMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6523936307888549844)
,p_prompt=>'Remember Me'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'LOGIN_REMEMBER_USERNAME'
,p_display_when=>'apex_authentication.persistent_cookies_enabled'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#:margin-top-sm:margin-bottom-md'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'If you select this checkbox, the application will save your username in a persistent browser cookie named "LOGIN_USERNAME_COOKIE".',
'When you go to the login page the next time,',
'the username field will be automatically populated with this value.',
'</p>',
'<p>',
'If you deselect this checkbox and your username is already saved in the cookie,',
'the application will overwrite it with an empty value.',
'You can also use your browser''s developer tools to completely remove the cookie.',
'</p>'))
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6780967440927206156)
,p_name=>'P9999_SCREENHEIGHT'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(12343421340544306400)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6780967531110206157)
,p_name=>'P9999_SCREENWIDTH'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(12343421340544306400)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6780967284255206154)
,p_name=>'P9999_TIMEZONE'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(12343421340544306400)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8025272720469270327)
,p_name=>'P9999_TYPE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(12343421340544306400)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6780967712231206159)
,p_name=>'P9999_USERAGENT'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(12343421340544306400)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12343422743135306414)
,p_name=>'P9999_USERNAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6523936128008549842)
,p_prompt=>'Username'
,p_placeholder=>'Username'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_tag_attributes=>'onKeyUP="this.value=this.value.toUpperCase();" autocomplete = "off"'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_icon_css_classes=>'fa-user'
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_is_persistent=>'N'
,p_inline_help_text=>'<div style="line-height: 0.2rem; text-align-last: end;"><a tabindex="-1" href="f?p=&APP_ID.:78:&APP_SESSION.:::78:::" style="color:black;">Get Username</a></div>'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6780967377255206155)
,p_name=>'P9999_USER_LANGUAGE'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(12343421340544306400)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6593320394063119457)
,p_validation_name=>'Account has been locked'
,p_static_id=>'account-has-been-locked'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  v_user   VARCHAR2(20);',
'BEGIN',
'   SELECT DISTINCT APPLUSER_ID INTO v_user',
'     FROM APPL_USERS',
'    WHERE upper(appluser_id) = upper(:P9999_USERNAME) ',
'     AND appluser_user_type IN(''R'',''E'');',
'   EXCEPTION WHEN NO_DATA_FOUND',
'   THEN RETURN (''Invalid Credentials'');',
'END;',
'DECLARE',
'   CURSOR c1',
'            IS',
'   SELECT',
'    ''x''',
'    FROM',
'        appl_users',
'    WHERE',
'        upper(appluser_id)  = upper(:P9999_USERNAME) ',
'         AND appluser_emp_id  = :P9999_CC_EMP_ID',
'        AND appluser_lock_chk = ''Y'';',
'   cr1          c1%ROWTYPE;',
'',
'BEGIN',
'   ',
'   OPEN c1;',
'          FETCH c1 INTO cr1;',
'             IF c1%FOUND THEN',
'              return ''Invalid credentials. Your account is locked. Please reset your password to unlock your account.'';',
'             END IF;',
'   CLOSE C1;',
'END;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(12343422743135306414)
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5700339772915997736)
,p_validation_name=>'CONFIRM_PASSWORD'
,p_static_id=>'confirm-password'
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P9999_CONFIRM_PASSWORD is null then',
'   return (''Confirm password must be entered.'');',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(5700339586820997734)
,p_associated_item=>wwv_flow_imp.id(5700339350622997732)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5700339713865997735)
,p_validation_name=>'NEW_PASSWORD'
,p_static_id=>'new-password'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_err_msg               VARCHAR2(1000);',
'',
'    v_ascii_val             NUMBER(5);',
'    v_pwd_exp_days          NUMBER(5);',
'    v_rules                 VARCHAR2(100);',
'    v_upc                   VARCHAR2(100);',
'    v_lc                    VARCHAR2(100);',
'    v_num                   VARCHAR2(100);',
'    v_spc                   VARCHAR2(100);',
'BEGIN',
'    IF :P9999_NEW_PASSWORD IS NULL THEN',
'       RETURN(''Password must be entered.'');',
'    END IF;',
'',
'    IF :P9999_NEW_PASSWORD IS NOT NULL THEN',
'        proc_check_pass_complex (:P9999_NEW_PASSWORD,v_rules,v_upc,v_lc,v_num,v_spc);',
'        IF v_rules = ''N'' THEN',
'           RETURN(''Password must contain atleast one upper case letter , one lower case letter, one number and one special character.'');',
'        END IF;',
'        IF LENGTH(:P9999_NEW_PASSWORD) NOT BETWEEN 3 AND 15 THEN',
'           RETURN(''You must provide 3 to 15 characters for Password.'');',
'        END IF;',
'    END IF;',
'END;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(5700339586820997734)
,p_associated_item=>wwv_flow_imp.id(5700339287626997731)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6192229250549289270)
,p_validation_name=>'Password Must'
,p_static_id=>'password-must'
,p_validation_sequence=>30
,p_validation=>'P9999_PASSWORD'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Password must be enter.'
,p_associated_item=>wwv_flow_imp.id(12343423226215306416)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6192228908552289270)
,p_validation_name=>'Username Must'
,p_static_id=>'username-must'
,p_validation_sequence=>10
,p_validation=>'P9999_USERNAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'UserName must be enter.'
,p_associated_item=>wwv_flow_imp.id(12343422743135306414)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6523937778136549859)
,p_name=>'ASSIGN VALUE TO GLOBAL'
,p_static_id=>'assign-value-to-global'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9999_DEVICETYPE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6523937855044549860)
,p_event_id=>wwv_flow_imp.id(6523937778136549859)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'GLOBAL_DEVICE_TYPE',
  'items_to_submit', 'P9999_DEVICETYPE',
  'language', 'PLSQL',
  'plsql_code', ' :GLOBAL_DEVICE_TYPE := :P9999_DEVICETYPE;',
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6523938007221549861)
,p_name=>'ASSIGN VALUE TO GLOBAL IP'
,p_static_id=>'assign-value-to-global-ip'
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9999_IP_PUBLIC'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6523938069689549862)
,p_event_id=>wwv_flow_imp.id(6523938007221549861)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'GLOBAL_IP_ADDR',
  'items_to_submit', 'P9999_IP_PUBLIC',
  'language', 'PLSQL',
  'plsql_code', ' :GLOBAL_IP_ADDR := :P9999_IP_PUBLIC;',
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6523935726924549838)
,p_name=>'CHECK 2 STEP AUTH'
,p_static_id=>'check-2-step-auth'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9999_CC_EMP_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6523935850709549840)
,p_event_id=>wwv_flow_imp.id(6523935726924549838)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if($v("P9999_OTP_TYPE") == ''Y''){',
    '    title(''Get OTP'');',
    '    note(''<center class="note"><span aria-hidden="true" class="fa fa-badge-check" style="color: #25d366;"></span> Two Step Authentication enabled</center>'');',
    '}else{',
    '    title(''Login'');',
    '    apex.item( "Container" ).hide();',
    '    note(''<span></span>'');',
    '    $s("P9999_OTP_VALIDATION", ''N'');',
    '}',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6192236771894289284)
,p_name=>'Clear Error'
,p_static_id=>'clear-error'
,p_event_sequence=>31
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9999_USERNAME'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6192237294760289285)
,p_event_id=>wwv_flow_imp.id(6192236771894289284)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '// First clear the errors',
    'apex.message.clearErrors();')))).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6192231991992289274)
,p_name=>'LOGIN'
,p_static_id=>'login'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6192219471685289248)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5607569973418187833)
,p_event_id=>wwv_flow_imp.id(6192231991992289274)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'CHECK Expiry'
,p_static_id=>'check-expiry'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'expdate();')).to_clob
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'apex.item("P9999_EXP_ALERT_DATE").getValue() === ''Y'''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6012723982137583240)
,p_event_id=>wwv_flow_imp.id(6192231991992289274)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P9999_OTP_TYPE,P9999_OTP,P9999_EXP_ALERT_DATE',
  'items_to_submit', 'P9999_USERNAME',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    ' BEGIN',
    '      SELECT DISTINCT appluser_id',
    '        INTO :P9999_ERROR_MSG FROM APPL_USERS',
    '       WHERE upper(appluser_id) = upper(:P9999_USERNAME) ;',
    '            EXCEPTION WHEN NO_DATA_FOUND            ',
    '      THEN :P9999_OTP_TYPE :=''N''; :P9999_OTP :=NULL; :P9999_EXP_ALERT_DATE :=''N'';',
    '   END;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P9999_ERROR_MSG'
,p_client_condition_expression=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6523936621787549847)
,p_event_id=>wwv_flow_imp.id(6192231991992289274)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'otp_validation($v(''P9999_USERNAME''),$v(''P9999_CC_EMP_ID''),$v(''P9999_OTP''))',
    '  .then(result => {',
    '    console.log(''Success '' + result);',
    '    if(result == 0 ){',
    '        wrongAttempts++;',
    '        if (wrongAttempts === 3) {',
    '            noofattempts($v(''P9999_USERNAME''),$v(''P9999_CC_EMP_ID''),''You have exceeded the maximum number of attempts.'',''F'');',
    '            apex.message.alert("You have exceeded the maximum number of attempts. Please try again later.",function(){apex.submit();});',
    '        } else {',
    '            noofattempts($v(''P9999_USERNAME''),$v(''P9999_CC_EMP_ID''),''Wrong OTP'',''F'');',
    '            apex.message.showErrors([ {',
    '                                                type:       "error",',
    '                                                location:   [ "inline" ],',
    '                                                pageItem:   "P9999_OTP",',
    '                                                message:    `Wrong OTP. Attempts left: ${3 - wrongAttempts}`,',
    '                                                unsafe:     false',
    '                                            } ]); ',
    '        }',
    '        apex.da.cancel();',
    '    }else if(result == 1){',
    '        apex.submit(''SUBMIT'');',
    '    }',
    '  })',
    '  .catch(error => {',
    '    console.error(''Error :'', error);',
    '  });',
    '',
    '')))).to_clob
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'apex.item("P9999_OTP_TYPE").getValue() === ''Y'' && apex.item("P9999_OTP").isEmpty() == false && apex.item("P9999_OTP_VALIDATION").getValue() === ''Y'''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6192232480944289276)
,p_event_id=>wwv_flow_imp.id(6192231991992289274)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'sendOTP();')).to_clob
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'apex.item("P9999_OTP_TYPE").getValue() === ''Y'' && apex.item("P9999_OTP").isEmpty() == true && apex.item("P9999_OTP_VALIDATION").getValue() === ''N'''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6012724124261583241)
,p_event_id=>wwv_flow_imp.id(6192231991992289274)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-3'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.message.clearErrors();')).to_clob
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P9999_ERROR_MSG'
,p_client_condition_expression=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6192233469622289279)
,p_event_id=>wwv_flow_imp.id(6192231991992289274)
,p_event_result=>'TRUE'
,p_action_sequence=>110
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'request_button_name', 'SUBMIT',
  'show_processing', 'N')).to_clob
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'apex.item("P9999_OTP_TYPE").getValue() === ''N'' && apex.item("P9999_OTP").isEmpty() == true && apex.item("P9999_EXP_ALERT_DATE").getValue() === ''N'' '
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6192233942046289281)
,p_event_id=>wwv_flow_imp.id(6192231991992289274)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Username validation'
,p_static_id=>'username-validation'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P9999_ERROR_MSG',
  'items_to_submit', 'P9999_USERNAME',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    ' BEGIN',
    '      SELECT DISTINCT ''Y''',
    '        INTO :P9999_ERROR_MSG FROM APPL_USERS',
    '       WHERE upper(appluser_id) = upper(:P9999_USERNAME) ;',
    '            EXCEPTION WHEN NO_DATA_FOUND  THEN :P9999_ERROR_MSG :=''N'';',
    '   END;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6192235825491289284)
,p_name=>'P9999_OTP HIDE'
,p_static_id=>'p9999-otp-hide'
,p_event_sequence=>1
,p_condition_element=>'P9999_OTP_TYPE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'N'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6192236380882289284)
,p_event_id=>wwv_flow_imp.id(6192235825491289284)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6705285929031192083)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6192234388341289281)
,p_name=>'Page Type'
,p_static_id=>'page-type'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9999_USERNAME'
,p_condition_element=>'P9999_USERNAME'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6192234841356289282)
,p_event_id=>wwv_flow_imp.id(6192234388341289281)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P9999_TYPE,P9999_OTP_TYPE,P9999_CC_TYPE,P9999_BU,P9999_POLICY_MINS',
  'items_to_submit', 'P9999_USERNAME',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '  v_workspace  VARCHAR2(100);',
    'BEGIN',
    'BEGIN',
    '   SELECT DISTINCT workspace',
    '     INTO v_workspace',
    '     FROM apex_application_pages',
    '    WHERE application_id = :app_id;',
    'EXCEPTION WHEN OTHERS THEN NULL;    ',
    'END;           ',
    'IF :p9999_username IS NOT NULL THEN',
    '    DECLARE',
    '        CURSOR c1 IS',
    '        SELECT',
    '            *',
    '        FROM',
    '            apex_workspace_sessions',
    '        WHERE',
    '                user_name = :p9999_username',
    '            AND user_name NOT LIKE ''%ADMIN%''',
    '            AND workspace_name = v_workspace;',
    '',
    '        CURSOR c2 IS',
    '        SELECT *',
    '          FROM appl_users',
    '         WHERE upper(appluser_id) = upper(:p9999_username)',
    '           AND appluser_status    = ''A'';',
    '',
    '        CURSOR c3 IS',
    '        SELECT COUNT(*) CNT FROM appl_users WHERE UPPER(appluser_id) = upper(:p9999_username) AND appluser_user_type = ''O'';',
    '',
    '        CURSOR c4(c_bu   VARCHAR2)IS  ',
    '        SELECT pda_otp_flag FROM policy_data WHERE pda_bu = c_bu;',
    '',
    '        cr1 c1%rowtype;',
    '        cr2 c2%rowtype;',
    '        cr3 c3%rowtype;',
    '        cr4 c4%rowtype;',
    '        v_user   VARCHAR2(20);',
    '    BEGIN',
    '        OPEN c1;',
    '        FETCH c1 INTO cr1;',
    '        IF c1%notfound THEN',
    '            :p9999_type := ''S'';',
    '        ELSE',
    '            :p9999_type := ''STOP'';',
    '        END IF;',
    '',
    '        CLOSE c1;',
    '        OPEN c2;',
    '        FETCH c2 INTO cr2;',
    '        IF c2%found THEN',
    '            :P9999_BU := cr2.appluser_bu;',
    '            ',
    '            /*',
    '            IF cr2.appluser_otp_flag = ''Y'' THEN',
    '                :p9999_otp_type := ''Y'';',
    '            ELSE',
    '                :p9999_otp_type := ''N'';',
    '            END IF;',
    '            */',
    '            OPEN c4(cr2.appluser_bu);',
    '            FETCH c4 INTO cr4;',
    '              IF c4%FOUND THEN',
    '                IF cr4.pda_otp_flag = ''Y'' THEN',
    '                    :p9999_otp_type := ''Y'';',
    '                ELSE',
    '                    :p9999_otp_type := ''N'';',
    '                END IF;',
    '              END IF;',
    '            CLOSE c4;            ',
    '        END IF;',
    '',
    '        CLOSE c2;',
    '',
    '        OPEN c3;',
    '        FETCH c3 INTO cr3;',
    '        IF cr3.CNT <= 0 THEN',
    '            :P9999_CC_TYPE := ''N'';',
    '        ELSE',
    '            :P9999_CC_TYPE := ''Y'';',
    '        END IF;',
    '        CLOSE c3;',
    'BEGIN',
    '       SELECT pda_otp_exp_time  ',
    '             into  :P9999_POLICY_MINS',
    '            FROM POLICY_DATA',
    '            WHERE pda_bu in ( SELECT DISTINCT APPLUSER_BU',
    '                               FROM APPL_USERS',
    '                              WHERE upper(appluser_id) = upper(:P9999_USERNAME))',
    '              and pda_otp_flag = ''Y'';',
    '      EXCEPTION WHEN NO_DATA_FOUND            ',
    '      THEN NULL;',
    '   END;',
    '   END;',
    'END IF;',
    'END;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6192235348523289282)
,p_event_id=>wwv_flow_imp.id(6192234388341289281)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '//apex.message.clearErrors();',
    '/*',
    ' if($v(''P9999_ERROR_MSG'') == ''User does not Exist'') {',
    'apex.message.showErrors([',
    '    {',
    '        type:       "error",',
    '        location:   [ "inline" ],',
    '        pageItem:   "P9999_USERNAME",',
    '        message:    "Invalid Username!",',
    '        unsafe:     false',
    '    }',
    ']); ',
    'apex.item("P9999_USERNAME").setFocus();',
    '}  ',
    'else{',
    '   apex.message.clearErrors();',
    '} */',
    '',
    'if($v("P9999_OTP_TYPE") == ''Y''){',
    '    title(''Get OTP'');',
    '    note(''<center class="note"><span aria-hidden="true" class="fa fa-badge-check" style="color: #25d366;"></span> Two Step Authentication enabled</center>'');',
    '}else{',
    '    title(''Login'');',
    '    apex.item( "Container" ).hide();',
    '    note(''<span></span>'');',
    '    $s("P9999_OTP_VALIDATION", ''N'');',
    '}',
    '',
    'if($v("P9999_CC_TYPE") == ''Y''){',
    '    apex.item( "ContainerEMP" ).show();',
    '}else if ($v("P9999_CC_TYPE") == ''N''){',
    '    apex.item( "ContainerEMP" ).hide();',
    '}',
    'expdate();')))).to_clob
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P9999_USERNAME'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5844092732950247829)
,p_name=>'Password_1'
,p_static_id=>'password'
,p_event_sequence=>120
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9999_PASSWORD'
,p_condition_element=>'P9999_USERNAME'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5844092812106247830)
,p_event_id=>wwv_flow_imp.id(5844092732950247829)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P9999_ERROR_MSG',
  'items_to_submit', 'P9999_USERNAME',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    ' BEGIN',
    '      SELECT DISTINCT APPLUSER_ID ',
    '        INTO :P9999_ERROR_MSG FROM APPL_USERS',
    '       WHERE upper(appluser_id) = upper(:P9999_USERNAME) ;',
    '',
    '            EXCEPTION WHEN NO_DATA_FOUND            ',
    '      THEN :P9999_ERROR_MSG:=''N'';',
    '   END;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5844092928597247831)
,p_event_id=>wwv_flow_imp.id(5844092732950247829)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    ' if($v(''P9999_ERROR_MSG'') == ''User does not Exist'') {',
    '// Now show new errors',
    'apex.message.showErrors([',
    '    {',
    '        type:       "error",',
    '        location:   [ "inline" ],',
    '        pageItem:   "P9999_USERNAME",',
    '        message:    "Invalid Username!",',
    '        unsafe:     false',
    '    }',
    ']); ',
    'apex.item("P9999_USERNAME").setFocus();',
    '}')))).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6192231600132289274)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_static_id=>'clear-page-s-cache'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'type', 'CLEAR_CACHE_CURRENT_PAGE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>710269764588678246
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5628972656506381729)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Exp date'
,p_static_id=>'exp-date'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'cursor c1',
'    is',
'       SELECT trunc (appluser_pw_lud) appluser_pw_lud,',
'              trunc (appluser_pwd_exp_due) appluser_pwd_exp_due,',
'              pda_pw_exp_rqrd appluser_pw_exp_rqrd,',
'              appluser_pw_exp_days,',
'              appluser_pwd_expired,',
'              appluser_login_atm,',
'              trunc (appluser_pwd_exp_due) - trunc (sysdate) exp_days',
'         FROM appl_users, ',
'              policy_data',
'        WHERE appluser_bu = pda_bu',
'          AND UPPER(appluser_id) = UPPER(:P9999_USERNAME)',
'          AND UPPER(appluser_emp_id) = UPPER(:P9999_CC_EMP_ID);',
'                          ',
'  cr1                   c1%rowtype;     ',
'  ',
'  ',
'  v_return         varchar2(1);',
'',
'begin',
'',
'    OPEN C1;',
'    FETCH C1 INTO CR1;',
'                      ',
'	IF CR1.appluser_pwd_exp_due <= TRUNC (SYSDATE)',
'					 AND cr1.appluser_pw_exp_rqrd = ''Y''',
'					 AND cr1.appluser_login_atm IS NOT NULL',
'				   THEN',
'          :P9999_EXP_ALERT_DATE := ''Y'';			   ',
'	ELSE',
'	  :P9999_EXP_ALERT_DATE := ''N'';',
'	END IF;			   ',
'    CLOSE c1;			',
'    ',
'end;    '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>147010820962770701
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5628972769769381730)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'EXPDATE'
,p_static_id=>'expdate'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'cursor c0',
'    is',
'       SELECT trunc (appluser_pw_lud) appluser_pw_lud,',
'              trunc (appluser_pwd_exp_due) appluser_pwd_exp_due,',
'              pda_pw_exp_rqrd appluser_pw_exp_rqrd,',
'              appluser_pw_exp_days,',
'              appluser_pwd_expired,',
'              appluser_login_atm,',
'              trunc (appluser_pwd_exp_due) - trunc (sysdate) exp_days',
'         FROM appl_users, ',
'              policy_data',
'        WHERE appluser_bu = pda_bu',
'          AND appluser_status = ''A''',
'          AND UPPER(appluser_id) = UPPER(:P9999_USERNAME)',
'          AND (UPPER(appluser_emp_id) = UPPER(:P9999_CC_EMP_ID) OR UPPER(:P9999_CC_EMP_ID) IS NULL);',
'',
'cursor c1',
'    is ',
'       select appluser_login_atm',
'         from appl_users',
'        where UPPER(appluser_id) = UPPER(:P9999_USERNAME)',
'          and appluser_pw_exp_rqrd = ''Y''',
'          and (UPPER(appluser_emp_id) = UPPER(:P9999_CC_EMP_ID) OR UPPER(:P9999_CC_EMP_ID) IS NULL);',
'',
'  cr1          c1%rowtype;',
'  cr0          c0%rowtype;',
'  v_return     varchar2(30);',
'',
'begin',
'',
'   OPEN C1;',
'',
'   FETCH C1 INTO CR1;',
'',
'   OPEN C0;',
'   ',
'   FETCH C0 INTO CR0;',
'',
'   IF c1%FOUND THEN',
'',
'      IF cr1.appluser_login_atm IS NULL',
'      THEN',
'         v_return := ''Y'';',
'         :P9999_EXP_ALERT_DATE := ''Y'';',
'',
'      ELSIF (cr0.exp_days BETWEEN 1 AND 7)',
'            AND cr0.appluser_pw_exp_rqrd = ''Y''',
'      THEN  ',
'         v_return := ''A|'' || cr0.exp_days;',
'         :P9999_EXP_ALERT_DATE := ''A'';',
'',
'      ELSIF cr0.appluser_pwd_exp_due <= TRUNC(SYSDATE)',
'            AND cr0.appluser_pw_exp_rqrd = ''Y''',
'            AND cr0.appluser_login_atm IS NOT NULL',
'      THEN  ',
'         v_return := ''B'';',
'         :P9999_EXP_ALERT_DATE := ''B'';',
'',
'      ELSE',
'         v_return := ''N'';',
'         :P9999_EXP_ALERT_DATE := ''N'';',
'      END IF;',
'',
'   ELSE',
'      v_return := ''N'';',
'      :P9999_EXP_ALERT_DATE := ''N'';',
'   END IF;',
'    ',
'   CLOSE c0;',
'   CLOSE c1;',
'   HTP.P(v_return); ',
'',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>147010934225770702
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6192231166272289274)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_static_id=>'get-username-cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P9999_OTP_TYPE := ''N'';',
':P9999_OTP_VALIDATION := ''N'';',
':P9999_CC_TYPE := ''N'';',
'--:P9999_USERNAME := apex_authentication.get_login_username_cookie;',
'--:P9999_REMEMBER := case when :P9999_USERNAME is not null then ''Y'' end;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>710269330728678246
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6192230003653289271)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Kill_Session'
,p_static_id=>'kill-session'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P9999_TYPE=''STOP'' THEN',
'DECLARE',
'  v_workspace  VARCHAR2(100);',
'BEGIN',
'BEGIN',
'   SELECT DISTINCT workspace',
'     INTO v_workspace',
'     FROM apex_application_pages',
'    WHERE application_id = :app_id;',
'EXCEPTION WHEN OTHERS THEN NULL;    ',
'END;        ',
'FOR CR1 IN  (SELECT *',
'               FROM apex_workspace_sessions',
'              WHERE user_name = :P9999_USERNAME ',
'                AND user_name NOT LIKE ''%ADMIN%''',
'                AND workspace_name= v_workspace ',
'                AND apex_session_id <> :SESSION)',
'LOOP ',
'DELETE FROM apex_240200.wwv_flow_sessions$ WHERE  id = cr1.apex_session_id;',
'END LOOP;',
'COMMIT;',
'END;',
'',
'END IF;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SUBMIT1'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>710268168109678243
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6192230366309289271)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Login'
,p_static_id=>'login'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'/* procedure proc_noofattempts',
'is',
'BEGIN',
'    UPDATE otp_details',
'    SET',
'        od_no_of_attempts = od_no_of_attempts + 1,',
'        od_status = ''S''',
'    WHERE',
'            od_user = :P9999_USERNAME',
'        AND od_emp_id = :P9999_CC_EMP_ID',
'        AND od_type = ''LOGIN'';',
'commit;',
'END proc_noofattempts; */',
'',
'procedure proc_login_dtls',
'is',
'    v_sid NUMBER(10);',
'    v_serial NUMBER(10);',
'BEGIN',
'',
'  SELECT SYS_CONTEXT (''userenv'', ''SID'') INTO v_sid FROM DUAL;',
'',
'  SELECT serial# INTO v_serial',
'    FROM sys.v_$session',
'   WHERE sid = v_sid;',
'',
'  INSERT INTO wa_user_login_dtls (  wuld_user_id,',
'                                    wuld_apex_workspace_name,',
'                                    wuld_apex_app_id,',
'                                    wuld_apex_session_id,',
'                                    wuld_orcl_sid,',
'                                    wuld_orcl_serialno,',
'                                    wuld_http_host,',
'                                    wuld_loc_ip_addr,',
'                                    wuld_pub_ip_addr,',
'                                    wuld_remote_addr,',
'                                    wuld_browser,',
'                                    wuld_devicetype,',
'                                    wuld_ismobile,',
'                                    wuld_istouchdevice,',
'                                    wuld_language,',
'                                    wuld_platform,',
'                                    wuld_screenheight,',
'                                    wuld_screenwidth,',
'                                    wuld_timezone,',
'                                    wuld_useragent,',
'                                    wuld_lat,',
'                                    wuld_lng,',
'                                    wuld_sess_created,',
'                                    wuld_idle_timeout_on,',
'                                    wuld_life_timeout_on,',
'                                    wuld_login_seq',
'                                ) VALUES (',
'                                    v(''app_user''),',
'                                    (SELECT DISTINCT WORKSPACE_NAME',
'                                       FROM APEX_WORKSPACE_SESSIONS',
'                                      WHERE WORKSPACE_ID = v(''WORKSPACE_ID'')',
'                                        AND APEX_SESSION_ID = v(''session'')),',
'                                    v(''app_id''),',
'                                    v(''session''),',
'                                    v_sid,',
'                                    v_serial,',
'                                    owa_util.get_cgi_env(''HTTP_HOST''),',
'                                    :P9999_IP_LOCAL,',
'                                    :P9999_IP_PUBLIC,',
'                                    owa_util.get_cgi_env(''REMOTE_ADDR''),',
'                                    :P9999_BROWSER,',
'                                    :P9999_DEVICETYPE,',
'                                    :P9999_ISMOBILE,',
'                                    :P9999_ISTOUCHDEVICE,',
'                                    :P9999_USER_LANGUAGE,',
'                                    :P9999_PLATFORM,',
'                                    :P9999_SCREENHEIGHT,',
'                                    :P9999_SCREENWIDTH,',
'                                    :P9999_TIMEZONE,',
'                                    :P9999_USERAGENT,',
'                                    :P9999_LATITUDE,',
'                                    :P9999_LONGITUDE,',
'                                    SYSDATE,',
'                                    NULL,',
'                                    NULL,',
'                                    (SELECT NVL(MAX(wuld_login_seq),0) + 1 ',
'                                       FROM wa_user_login_dtls ',
'                                      WHERE wuld_user_id = v(''app_user'')',
'                                        AND TO_DATE(wuld_sess_created) = TO_DATE(SYSDATE))',
'                                );',
'',
'    commit;',
'END proc_login_dtls;',
'',
'BEGIN',
'',
'        apex_authentication.login (p_username   => :P9999_USERNAME,',
'                                   p_password   => :P9999_PASSWORD); ',
'        proc_login_dtls;',
'        :GLOBAL_CC_EMP_ID := :P9999_CC_EMP_ID;',
'        ',
'',
'    /* MULIT-LANGUAGE */  ---Vijay Raj',
'    APEX_UTIL.SET_SESSION_LANG(:P9999_LANGUAGE);',
'   :P9999_TYPE := NULL;',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SUBMIT'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>710268530765678243
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6523938728234549868)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'NOOFATTEMPTS'
,p_static_id=>'noofattempts'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    UPDATE otp_details',
'    SET',
'        od_no_of_attempts = od_no_of_attempts + 1,',
'        od_failure_reason = apex_application.g_x06,',
'        od_status = apex_application.g_x07',
'    WHERE',
'            od_user = apex_application.g_x04',
'        AND od_emp_id = apex_application.g_x05',
'        AND od_type = ''LOGIN'';',
'',
'    HTP.P(''Success'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1041976892690938840
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6523936507665549846)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'OTPVALIDATION'
,p_static_id=>'otpvalidation'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_count      VARCHAR2(10);',
'BEGIN',
'    ',
'    SELECT',
'               CASE WHEN COUNT(*) > 0 THEN',
'               ''1''',
'               ELSE ''0'' END INTO v_count',
'        FROM',
'            appl_users,',
'            otp_details,',
'            employees',
'        WHERE',
'                appluser_id = od_user',
'            AND od_type = ''LOGIN''',
'            AND appluser_bu = emp_bu',
'            AND appluser_emp_id = emp_emp_id',
'            AND upper(apex_application.g_x01) = upper(appluser_id)',
'            AND appluser_emp_id = apex_application.g_x02',
'            AND trunc(sysdate) BETWEEN trunc(appluser_eff_from) AND trunc(appluser_eff_to)',
'            AND appluser_status = ''A''',
'            AND emp_status = ''A''',
'            AND od_otp = func_get_hash(apex_application.g_x01, apex_application.g_x03)',
'            AND sysdate BETWEEN od_otp_valid_from AND od_otp_valid_to;',
'    ',
'    HTP.P(v_count);',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1041974672121938818
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5566784879449288149)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'POLICY EXP'
,p_static_id=>'policy-exp'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'       ',
'',
'declare',
'cursor c1',
'    is',
'       SELECT pda_otp_exp_time  ',
'            FROM POLICY_DATA',
'            WHERE pda_bu in ( SELECT DISTINCT APPLUSER_BU',
'                               FROM APPL_USERS',
'                              WHERE upper(appluser_id) = upper(:P9999_USERNAME))',
'              and pda_otp_flag = ''Y'';',
'                          ',
'  cr1                   c1%rowtype;     ',
'  ',
'  ',
'  v_return         varchar2(1);',
'',
'begin',
'',
'    OPEN C1;',
'    FETCH C1 INTO CR1;',
'',
'        ',
'         :P9999_POLICY_MINS := cr1.pda_otp_exp_time;',
'',
'        ----- raise_application_error(-20999,''HRM''||''~''||:P9999_POLICY_MINS);',
'    CLOSE c1;			',
'    ',
'end;  '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>84823043905677121
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6192229600474289270)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SEND_OTP'
,p_static_id=>'send-otp'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'',
'    proc_two_step_auth_apex(apex_application.g_x20,',
'                            :P9999_CC_EMP_ID,',
'                            :P9999_DEVICETYPE,',
'                            :P9999_IP_PUBLIC,',
'                             v(''app_id''),',
'                            ''LOGIN'');',
'   ',
'    EXCEPTION WHEN OTHERS THEN HTP.P(SQLERRM);',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>710267764930678242
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6192230787611289273)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Set Username Cookie'
,p_static_id=>'set-username-cookie'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'package', 'APEX_AUTHENTICATION',
  'package_method', 'SEND_LOGIN_USERNAME_COOKIE',
  'type', 'PLSQL_PACKAGE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SUBMIT1'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>710268952067678245
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(6457263491821138821)
,p_page_process_id=>wwv_flow_imp.id(6192230787611289273)
,p_page_id=>9999
,p_name=>'p_consent'
,p_direction=>'IN'
,p_data_type=>'BOOLEAN'
,p_has_default=>false
,p_display_sequence=>30
,p_value_type=>'ITEM'
,p_value=>'P9999_REMEMBER'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(6457263328224138819)
,p_page_process_id=>wwv_flow_imp.id(6192230787611289273)
,p_page_id=>9999
,p_name=>'p_username'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'EXPRESSION'
,p_value_language=>'PLSQL'
,p_value=>'lower( :P9999_USERNAME )'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5700339443884997733)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'UPDATE PASSWORD'
,p_static_id=>'update-password'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P9999_NEW_PASSWORD <> :P9999_CONFIRM_PASSWORD THEN',
'   RAISE_APPLICATION_ERROR(-20999,''Passwords do not match.'');',
'ELSE ',
'      UPDATE appl_users',
'         SET appluser_password = func_get_hash (:P9999_USERNAME,:P9999_CONFIRM_PASSWORD),',
'             appluser_pw_lud   = SYSDATE,',
'             appluser_pwd_exp_due = SYSDATE + 90,',
'             appluser_login_atm = 0',
'       WHERE UPPER(appluser_id) = UPPER(:P9999_USERNAME)',
'       AND UPPER(appluser_emp_id) = UPPER(:P9999_CC_EMP_ID);',
'',
'    APEX_APPLICATION.g_print_success_message := ''Password changed successfully.'';',
'',
'END IF;',
'commit;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5700339586820997734)
,p_internal_uid=>218377608341386705
);
wwv_flow_imp.component_end;
end;
/
