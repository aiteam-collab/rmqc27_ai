CREATE OR REPLACE
"package wsgjsl is
"
"
"
"   function OpenScript return varchar2;
"
"   function CloseScript return varchar2;
"
"
"
"   function OpenEvent(p_alias in varchar2, p_event in varchar2) return varchar2;
"
"   function CloseEvent return varchar2;
"
"   function CallEvent(p_alias in varchar2, p_event in varchar2) return varchar2;
"
"   function CallValidate(p_alias in varchar2) return varchar2;
"
"
"
"   function RtnNotNull return varchar2;
"
"   function RtnCheckRange return varchar2;
"
"   function RtnCheckCharRange return varchar2;
"
"   function RtnChkMaxLength return varchar2;
"
"   function RtnChkNumPrecision return varchar2;
"
"   function RtnChkNumScale return varchar2;
"
"   function RtnStripMask return varchar2;
"
"   function RtnToNumber return varchar2;
"
"   function RtnMakeUpper return varchar2;
"
"   function RtnChkConstraint return varchar2;
"
"   function RtnRadioValue return varchar2;
"
"   function RtnGetValue return varchar2;
"
"   function RtnRadioChange return varchar2;
"
"   function RtnCheckModified return varchar2;
"
"   function RtnRevertForm return varchar2;
"
"   function RtnOpenLOV return varchar2;
"
"   function RtnFindTargetFrame return varchar2;
"
"   function RtnFlagRow return varchar2;
"
"
"
"   function RtnConcat return varchar2;
"
"   function RtnInitCap return varchar2;
"
"   function RtnInstr return varchar2;
"
"   function RtnLength return varchar2;
"
"   function RtnLower return varchar2;
"
"   function RtnLPad return varchar2;
"
"   function RtnLTrim return varchar2;
"
"   function RtnNVL1 return varchar2;
"
"   function RtnNVL2 return varchar2;
"
"   function RtnReplace return varchar2;
"
"   function RtnRound return varchar2;
"
"   function RtnRPad return varchar2;
"
"   function RtnRTrim return varchar2;
"
"   function RtnSign return varchar2;
"
"   function RtnSubstr return varchar2;
"
"   function RtnTrunc return varchar2;
"
"   function RtnUpper return varchar2;
"
"
"
"   function CallCheckRange(p_ctl in varchar2, p_val in varchar2, p_lowval in number, p_hival in number, p_msg in varchar2, p_scale in number default 0, p_row in boolean default false) return varchar2;
"
"   function CallCheckCharRange(p_ctl in varchar2, p_lowval in varchar2, p_hival in varchar2, p_msg in varchar2, p_row in boolean default false) return varchar2;
"
"   function CallChkMaxLength(p_ctl in varchar2, p_length in number, p_msg in varchar2, p_row in boolean default false) return varchar2;
"
"   function CallChkNumPrecision(p_ctl in varchar2, p_val in varchar2, p_precision in number, p_msg in varchar2, p_row in boolean default false) return varchar2;
"
"   function CallChkNumScale(p_ctl in varchar2, p_val in varchar2, p_scale in number, p_msg in varchar2, p_row in boolean default false) return varchar2;
"
"   function CallChkConstraint(p_constraint in varchar, p_msg in varchar, p_indent in boolean) return varchar2;
"
"   function CallMakeUpper(p_ctl in varchar2) return varchar2;
"
"   function CallNotNull(p_ctl in varchar2, p_msg in varchar2, p_row in boolean default false) return varchar2;
"
"
"
"   function StandardSubmit (set_Z_ACTION boolean default true) return varchar2;
"
"   function VerifyDelete(p_msg in varchar2) return varchar2;
"
"
"
"   function LOVButton(p_alias in varchar2, p_lovbut in varchar2, p_form in varchar2 default 'forms[0]', p_row in number default null) return varchar2;
"
"
"
"   function CALButton (field_name in varchar2,
"
"                       p_calbut in varchar2,
"
"                       field_format in varchar2,
"
"                       p_form in varchar2 default 'forms[0]',
"
"                       p_row in number default null,
"
"                       p_img_path in varchar2 default '/',
"
"                       p_field_prompt in varchar2 default null) return varchar2;
"
"   pragma restrict_references(CALButton, WNDS);
"
"   function CALJavaScript (field_value in varchar2, field_date_format in varchar2, default_format in varchar2 default null) return varchar2;
"
"
"
"   procedure Output_Invoke_CAL_JS (PKG_Name in varchar2, window_props in varchar2);
"
"
"
"   function DerivationField(p_name in varchar2, p_size in varchar2, p_value in varchar2) return varchar2;
"
"
"
"   function AddCode(p_expr in varchar2) return varchar2;
"
"
"
"end;"
/
