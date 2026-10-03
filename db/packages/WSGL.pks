CREATE OR REPLACE
"package wsgl is
"
"
"
"--------------------------------------------------------------------------------
"
"-- Declare constants for use in Layout procedures
"
"   LAYOUT_TABLE      constant number(1) := 1;
"
"   LAYOUT_PREFORMAT  constant number(1) := 2;
"
"   LAYOUT_BULLET     constant number(1) := 3;
"
"   LAYOUT_NUMBER     constant number(1) := 4;
"
"   LAYOUT_CUSTOM     constant number(1) := 5;
"
"   LAYOUT_WRAP       constant number(1) := 6;
"
"
"
"   MENU_LONG         constant number(1) := 1;
"
"   MENU_SHORT        constant number(1) := 2;
"
"
"
"   TYPE_CHAR         constant number(1) := 1;
"
"   TYPE_CHAR_UPPER   constant number(1) := 2;
"
"   TYPE_DATE         constant number(1) := 3;
"
"   TYPE_NUMBER       constant number(1) := 4;
"
"
"
"-------------------------------------------------------------------------------
"
"-- Declare constants used for system images
"
"   IMG_TYPE_TICK     constant number(1) := 1;
"
"   IMG_TYPE_RADIO    constant number(1) := 2;
"
"
"
"   IMG_TICK          constant varchar2(50) := 'cg_tick.gif';
"
"   IMG_BLANK         constant varchar2(50) := 'cg_blnk.gif';
"
"
"
"   IMG_RADIO_SEL     constant varchar2(50) := 'cg_rad_s.gif';
"
"   IMG_RADIO_UNSEL   constant varchar2(50) := 'cg_rad_u.gif';
"
"
"
"--------------------------------------------------------------------------------
"
"-- Declare constant for Max number of rows which can be returned
"
"   MAX_ROWS          constant number(4) := 1000;
"
"
"
"--------------------------------------------------------------------------------
"
"-- Declare types used in Domain Validation
"
"
"
"   DV_TEXT            constant number(1) := 1;
"
"   DV_CHECK           constant number(1) := 2;
"
"   DV_RADIO           constant number(1) := 3;
"
"   DV_LIST            constant number(1) := 4;
"
"   DV_RADIO_ACROSS    constant number(1) := 5;
"
"   DV_PASSWORD        constant number(1) := 6;
"
"
"
"   type typString240Table is table of varchar2(240)
"
"                          index by binary_integer;
"
"
"
"   type typDVRecord is record
"
"        (ColAlias    varchar2(30) := null,
"
"         Initialised boolean      := false,
"
"         ControlType number(1)    := DV_TEXT,
"
"         DispWidth   number(5)    := 30,
"
"         DispHeight  number(5)    := 1,
"
"         MaxWidth    number(5)    := 30,
"
"         UseMeanings boolean      := false,
"
"         ColOptional boolean      := false,
"
"         NumOfVV     integer      := 0,
"
"         Vals typString240Table,
"
"         Meanings typString240Table,
"
"         Abbreviations typString240Table);
"
"
"
"   EmptyStringTable  typString240Table;
"
"   EmptyVCArr        owa.vc_arr;
"
"   EmptyVCArrLong    owa_text.vc_arr;
"
"
"
"--------------------------------------------------------------------------------
"
"-- Declare types used in building controls
"
"   CTL_READONLY     constant number(1) := 1;
"
"   CTL_UPDATABLE    constant number(1) := 2;
"
"   CTL_INSERTABLE   constant number(1) := 3;
"
"   CTL_QUERY        constant number(1) := 4;
"
"
"
"--------------------------------------------------------------------------------
"
"-- Declare constants for form status
"
"   FORM_STATUS_OK      constant number(1) := 0;
"
"   FORM_STATUS_ERROR   constant number(1) := 1;
"
"   FORM_STATUS_INS     constant number(1) := 2;
"
"   FORM_STATUS_UPD     constant number(1) := 3;
"
"   FORM_STATUS_NO_UPD  constant number(1) := 4;
"
"
"
"--------------------------------------------------------------------------------
"
"-- Declare constants message types
"
"   MESS_INFORMATION    constant number(1) := 1;
"
"   MESS_SUCCESS        constant number(1) := 2;
"
"   MESS_WARNING        constant number(1) := 3;
"
"   MESS_ERROR          constant number(1) := 4;
"
"   MESS_ERROR_QRY      constant number(1) := 5;
"
"   MESS_EXCEPTION      constant number(1) := 6;
"
"
"
"
"
"--------------------------------------------------------------------------------
"
"-- Declare security constants and exceptions
"
"   WSG_CLIENTID_COOKIE constant varchar(30) := 'WSGSEC$WSGSECCLIENTID';
"
"   invalid_user exception;
"
"--------------------------------------------------------------------------------
"
"-- Declare WebServer Generator Library procedures and functions
"
"
"
"   function IsSupported (feature in varchar2) return boolean;
"
"   pragma restrict_references(IsSupported, WNDS);
"
"
"
"   procedure LayoutOpen(p_layout_style in number,
"
"                        p_border in boolean default false,
"
"                        p_custom_bullet in varchar2 default null,
"
"                        p_no_spacing in boolean default false);
"
"
"
"   procedure LayoutClose;
"
"
"
"   procedure LayoutRowStart(p_valign in varchar2 default null,
"
"                            p_attrs  in varchar2 default null);
"
"   pragma restrict_references(LayoutRowStart, WNDS);
"
"
"
"   procedure LayoutRowEnd;
"
"
"
"   procedure LayoutHeader(p_width in number,
"
"                          p_align in varchar2,
"
"                          p_title in varchar2,
"
"                          p_id    in varchar2 DEFAULT null);
"
"   pragma restrict_references(LayoutHeader, WNDS);
"
"
"
"   procedure LayoutData(p_text in varchar2,
"
"                        p_align in varchar2 DEFAULT null,
"
"                        p_id in varchar2 DEFAULT null);
"
"   pragma restrict_references(LayoutData, WNDS);
"
"
"
"   procedure LayoutData(p_date in date);
"
"   pragma restrict_references(LayoutData, WNDS);
"
"
"
"   procedure LayoutData(p_number in number);
"
"   pragma restrict_references(LayoutData, WNDS);
"
"
"
"   procedure LayoutComputed ( p_prompt_col   in   number,
"
"                              p_prompt       in   varchar2,
"
"                              p_item_col     in   number,
"
"                              p_item         in   varchar2,
"
"                              p_total_cols   in   number,
"
"                              p_row_attrs    in   varchar2 default null);
"
"
"
"   procedure LayoutTextLine ( p_text  in  varchar2 );
"
"
"
"   procedure Separator ( p_from_col   in   number,
"
"                         p_to_col     in   number,
"
"                         p_total      in   number,
"
"                         p_attrs      in   varchar2 default null);
"
"
"
"   procedure Separator (p_attrs      in   varchar2);
"
"
"
"   procedure SkipData;
"
"   pragma restrict_references(SkipData, WNDS);
"
"
"
"   procedure DefinePageHead(p_title in varchar2 default null,
"
"                            p_bottomframe in boolean default false);
"
"
"
"   procedure StylesheetLink(p_stylesheetURL in varchar2);
"
"
"
"   procedure OpenPageHead(p_title in varchar2 default null,
"
"                          p_bottomframe in boolean default false);
"
"
"
"   procedure METATag;
"
"
"
"   procedure ClosePageHead;
"
"
"
"   procedure OpenPageBody(p_center in boolean default false,
"
"                          p_attributes in varchar2 default null);
"
"
"
"   procedure ClosePageBody;
"
"
"
"   function  InBottomFrame return boolean;
"
"   pragma restrict_references(InBottomFrame, WNDS, WNPS);
"
"
"
"   function  Preformat(p_text in varchar2) return varchar2;
"
"   pragma restrict_references(Preformat, WNDS, WNPS);
"
"
"
"   procedure DefaultPageCaption(p_caption in varchar2 default null,
"
"                                p_headlevel in number default null);
"
"
"
"   procedure BuildWhere(p_field1   in varchar2,
"
"                        p_field2   in varchar2,
"
"                        p_sli      in varchar2,
"
"                        p_datatype in number,
"
"                        p_where    in out varchar2,
"
"                        p_date_format in varchar2 default null,
"
"                        p_outerjoin in boolean default false);
"
"   pragma restrict_references(BuildWhere, WNDS);
"
"
"
"   procedure BuildWhere(p_field    in varchar2,
"
"                        p_sli      in varchar2,
"
"                        p_datatype in number,
"
"                        p_where    in out varchar2,
"
"                        p_date_format in varchar2 default null,
"
"                        p_caseinsensitive in boolean default true,
"
"                        p_outerjoin in boolean default false);
"
"   pragma restrict_references(BuildWhere, WNDS);
"
"
"
"   procedure BuildWhere(p_field    in typString240Table,
"
"                        p_sli      in varchar2,
"
"                        p_datatype in number,
"
"                        p_where    in out varchar2,
"
"                        p_date_format in varchar2 default null,
"
"                        p_outerjoin in boolean default false);
"
"   pragma restrict_references(BuildWhere, WNDS);
"
"
"
"   function SearchComponents(p_search in varchar2,
"
"                             p_uu in out varchar2,
"
"                             p_ul in out varchar2,
"
"                             p_lu in out varchar2,
"
"                             p_ll in out varchar2) return number;
"
"   pragma restrict_references(SearchComponents, WNDS);
"
"
"
"   procedure NavLinks(p_style in number default null,
"
"                      p_caption in varchar2 default null,
"
"                      p_menu_level in number default 0,
"
"                      p_proc in varchar2 default null,
"
"                      p_target in varchar2 default '_top',
"
"                      p_attributes in varchar2 default null,
"
"                      p_img in varchar2 default null,
"
"                      p_img_height  in number default 0,
"
"                      p_img_width   in number default 0,
"
"                      p_output_line in boolean default TRUE,
"
"                      p_list_item   in boolean default TRUE,
"
"                      p_menu_required in boolean default TRUE);
"
"
"
"   function  TablesSupported return boolean;
"
"   pragma restrict_references(TablesSupported, WNDS, WNPS);
"
"
"
"   procedure Info(p_full in boolean default true,
"
"                  p_app in varchar2 default null,
"
"                  p_mod in varchar2 default null,
"
"                  p_usr in varchar2 default null);
"
"
"
"   procedure EmptyPage(p_attributes in varchar2 default null);
"
"
"
"   function  EmptyPageURL(p_attributes in varchar2 default null) return varchar2;
"
"   pragma restrict_references(EmptyPageURL, WNDS, WNPS);
"
"
"
"   procedure SubmitButton(p_name in varchar2,
"
"                          p_title in varchar2,
"
"                          p_type in varchar2,
"
"                          buttonJS in varchar2 default null,
"
"                          p_target in varchar2 default null);
"
"
"
"   function ReturnSubmitButton(p_name in varchar2,
"
"                               p_title in varchar2,
"
"                               p_type in varchar2,
"
"                               buttonJS in varchar2 default null,
"
"                               p_target in varchar2 default null,
"
"                               p_index in number default 0) return varchar2;
"
"   pragma restrict_references(ReturnSubmitButton, WNDS);
"
"
"
"   procedure ResetForMultipleForms;
"
"   pragma restrict_references(ResetForMultipleForms, WNDS);
"
"
"
"   procedure RecordListButton(p_reqd in boolean,
"
"                              p_name in varchar2,
"
"                              p_title in varchar2,
"
"                              p_mess in varchar2 default null,
"
"                              p_dojs in boolean default false,
"
"                              buttonJS in varchar2 default null,
"
"                              p_type_button in boolean default false
"
"                             );
"
"
"
"   function  CountHits(
"
"             P_SQL in varchar2) return number;
"
"
"
"   procedure LoadDomainValues(
"
"             P_REF_CODE_TABLE in varchar2,
"
"             P_DOMAIN in varchar2,
"
"             P_DVREC in out typDVRecord);
"
"
"
"   function ValidDomainValue(
"
"            P_DVREC in typDVRecord,
"
"            P_VALUE in out varchar2) return boolean;
"
"   pragma restrict_references(ValidDomainValue, WNDS);
"
"
"
"   function DomainMeaning(
"
"            P_DVREC in typDVRecord,
"
"            P_VALUE in varchar2) return varchar2;
"
"   pragma restrict_references(DomainMeaning, WNDS);
"
"
"
"   function DomainValue(
"
"            P_DVREC in typDVRecord,
"
"            P_MEANING in varchar2) return varchar2;
"
"   pragma restrict_references(DomainValue, WNDS);
"
"
"
"   function DomainValue(
"
"            P_DVREC in typDVRecord,
"
"            P_MEANING in typString240Table) return typString240Table;
"
"   pragma restrict_references(DomainValue, WNDS);
"
"
"
"   function BuildDVControl(
"
"            P_DVREC in typDVRecord,
"
"            P_CTL_STYLE in number,
"
"            P_CURR_VAL in varchar2 default null,
"
"            p_onclick in boolean default false,
"
"            p_onchange in boolean default false,
"
"            p_onblur in boolean default false,
"
"            p_onfocus in boolean default false,
"
"            p_onselect in boolean default false,
"
"            p_row in number default null,
"
"            p_multirow in boolean default false,
"
"            p_alwaysquery in boolean default false,
"
"            p_img_path in varchar2 default '/') return varchar2;
"
"   pragma restrict_references(BuildDVControl, WNDS);
"
"
"
"   function BuildTextControl(
"
"            p_alias in varchar2,
"
"            p_size in varchar2 default null,
"
"            p_height in varchar2 default null,
"
"            p_maxlength in varchar2 default null,
"
"            p_value in varchar2 default null,
"
"            p_onclick in boolean default false,
"
"            p_onchange in boolean default false,
"
"            p_onblur in boolean default false,
"
"            p_onfocus in boolean default false,
"
"            p_onselect in boolean default false,
"
"            p_cal_but_text    in varchar2 default null,
"
"            p_cal_date_format in varchar2 default null,
"
"            p_form in varchar2 default 'forms[0]',
"
"            p_row in number default null,
"
"            p_img_path in varchar2 default '/',
"
"            p_cal_prompt in varchar2 default null) return varchar2;
"
"   pragma restrict_references(BuildTextControl, WNDS);
"
"
"
"   function BuildPasswordTextControl(p_alias in varchar2,
"
"            p_size in varchar2 default null,
"
"            p_height in varchar2 default null,
"
"            p_maxlength in varchar2 default null,
"
"            p_password in boolean default false,
"
"            p_value in varchar2 default null,
"
"            p_onclick in boolean default false,
"
"            p_onchange in boolean default false,
"
"            p_onblur in boolean default false,
"
"            p_onfocus in boolean default false,
"
"            p_onselect in boolean default false,
"
"            p_cal_but_text    in varchar2 default null,
"
"            p_cal_date_format in varchar2 default null,
"
"            p_form in varchar2 default 'forms[0]',
"
"            p_row in number default null,
"
"            p_img_path in varchar2 default '/',
"
"            p_cal_prompt in varchar2 default null) return varchar2;
"
"   pragma restrict_references(BuildPasswordTextControl, WNDS);
"
"
"
"   function BuildQueryControl(
"
"            p_alias in varchar2,
"
"            p_size in varchar2 default null,
"
"            p_range in boolean default false,
"
"            p_onclick in boolean default false,
"
"            p_onchange in boolean default false,
"
"            p_onblur in boolean default false,
"
"            p_onfocus in boolean default false,
"
"            p_onselect in boolean default false,
"
"            p_cal_but_text    in varchar2 default null,
"
"            p_cal_date_format in varchar2 default null,
"
"            p_form in varchar2 default 'forms[0]',
"
"            p_maxlength in varchar2 default null,
"
"            p_cal_prompt in varchar2 default null) return varchar2;
"
"   pragma restrict_references(BuildQueryControl, WNDS);
"
"
"
"   function BuildPasswordQueryControl(
"
"            p_alias in varchar2,
"
"            p_size in varchar2 default null,
"
"            p_password in boolean default false,
"
"            p_range in boolean default false,
"
"            p_onclick in boolean default false,
"
"            p_onchange in boolean default false,
"
"            p_onblur in boolean default false,
"
"            p_onfocus in boolean default false,
"
"            p_onselect in boolean default false,
"
"            p_cal_but_text    in varchar2 default null,
"
"            p_cal_date_format in varchar2 default null,
"
"            p_form in varchar2 default 'forms[0]',
"
"            p_maxlength in varchar2 default null,
"
"            p_cal_prompt in varchar2 default null) return varchar2;
"
"   pragma restrict_references(BuildPasswordQueryControl, WNDS);
"
"
"
"   function BuildDerivationControl(p_name in varchar2,
"
"                                   p_size in varchar2,
"
"                                   p_value in varchar2,
"
"                                   p_onclick in boolean default false,
"
"                                   p_onblur in boolean default false,
"
"                                   p_onfocus in boolean default false,
"
"                                   p_onselect in boolean default false,
"
"                                   p_row in number default null) return varchar2;
"
"   pragma restrict_references(BuildDerivationControl, WNDS);
"
"
"
"   function InitSysImage(p_image_type in number,
"
"                         p_image_path in varchar2,
"
"                         p_image_name in varchar2,
"
"                         p_initial_val in varchar2) return varchar2;
"
"   pragma restrict_references(InitSysImage, WNDS, WNPS);
"
"
"
"   procedure HiddenField(p_paramname in varchar2,
"
"                         p_paramval in varchar2);
"
"
"
"   procedure HiddenField(p_paramname in varchar2,
"
"                         p_paramval in typString240Table);
"
"
"
"   function GetLayNumberOfPages return number;
"
"
"
"   procedure DisplayMessage(p_type in number,
"
"                            p_mess in varchar2,
"
"                            p_title in varchar2 default null,
"
"                            p_attributes in varchar2 default null,
"
"                            p_location in varchar2 default null,
"
"                            p_context in varchar2 default null,
"
"                            p_action in varchar2 default null);
"
"
"
"   procedure StoreErrorMessage(p_mess in varchar2);
"
"
"
"   function MsgGetText(p_MsgNo in number,
"
"                       p_DfltText in varchar2 default null,
"
"                       p_Subst1 in varchar2 default null,
"
"                       p_Subst2 in varchar2 default null,
"
"                       p_Subst3 in varchar2 default null,
"
"                       p_LangId in number default null) return varchar2;
"
"   pragma restrict_references(MsgGetText, WNDS, WNPS);
"
"
"
"   function EscapeURLParam(p_param in varchar2 ) return varchar2;
"
"   pragma restrict_references(EscapeURLParam, WNDS, WNPS);
"
"
"
"   function GetUser return varchar2;
"
"
"
"   procedure RegisterURL(p_url in varchar2);
"
"
"
"   procedure AddURLParam(p_paramname in varchar2,
"
"                         p_paramval in varchar2);
"
"   pragma restrict_references(AddURLParam, WNDS);
"
"
"
"   procedure AddURLParam(p_paramname in varchar2,
"
"                         p_paramval in typString240Table);
"
"   pragma restrict_references(AddURLParam, WNDS);
"
"
"
"   procedure RefreshURL;
"
"
"
"   function NotLowerCase return boolean;
"
"
"
"   function ExternalCall(p_proc in varchar2) return boolean;
"
"
"
"   function CalledDirect(p_proc in varchar2) return boolean;
"
"
"
"   procedure StoreURLLink(p_level in number,
"
"                          p_caption in varchar2,
"
"                          p_open in boolean default true,
"
"                          p_close in boolean default true);
"
"
"
"   procedure ReturnLinks(p_levels in varchar2,
"
"                         p_style  in number,
"
"                         p_target in varchar2 default '_top',
"
"                         p_menu   in boolean  default true);
"
"
"
"   function Checksum(p_buff in varchar2) return number;
"
"   pragma restrict_references(Checksum, WNDS, WNPS);
"
"
"
"   function ValidateChecksum(p_buff in varchar2, p_checksum in varchar2) return boolean;
"
"
"
"   -- R2.1 Backward compatibility
"
"   function EscapeURLParam(p_param in varchar2,
"
"                           p_space in boolean default true,
"
"                           p_plus in boolean default true,
"
"                           p_percent in boolean,
"
"                           p_doublequote in boolean default true,
"
"                           p_hash in boolean default true,
"
"                           p_ampersand in boolean ) return varchar2;
"
"   pragma restrict_references(EscapeURLParam, WNDS, WNPS);
"
"
"
"
"
"   -- R1.3 Backward compatibility
"
"   procedure RowContext(p_context in varchar2);
"
"
"
"   procedure PageHeader(p_title in varchar2,
"
"                        p_header in varchar2,
"
"                        p_background in varchar2 default null,
"
"                        p_center in boolean default false);
"
"
"
"   procedure PageFooter;
"
"
"
"   function  MAX_ROWS_MESSAGE return varchar2;
"
"   pragma restrict_references(MAX_ROWS_MESSAGE, WNDS, WNPS);
"
"
"
"  procedure Output_Calendar
"
"    (
"
"     Z_FIELD_NAME      in VarChar2,
"
"     Z_FIELD_VALUE     in Varchar2,
"
"     Z_FIELD_FORMAT    in Varchar2,
"
"     Page_Header       in Varchar2,
"
"     Body_Attributes   in Varchar2,
"
"     PKG_Name          in Varchar2,
"
"     Close_But_Caption in Varchar2,
"
"     First_Part        in Boolean,
"
"     Z_DEFAULT_FORMAT  in varchar2 default null
"
"    );
"
"
"
"  procedure Output_Format_Cal_JS
"
"    (
"
"     Page_Header     in Varchar2,
"
"     Body_Attributes in Varchar2,
"
"     Chosen_Date     in Varchar2,
"
"     Field_Format    in Varchar2
"
"    );
"
"
"
"
"
"  procedure StoreClientID( p_client_id_str  in  varchar2,
"
"                           p_open_header    in  boolean   default true,
"
"                           p_close_header   in  boolean   default true );
"
"
"
"  function GetClientID return varchar2;
"
"
"
"  -- version to get around bug 872931
"
"  function Anchor2
"
"    ( curl           in       varchar2,
"
"      ctext          in       varchar2,
"
"      cname          in       varchar2   DEFAULT NULL,
"
"      ctarget        in       varchar2   DEFAULT NULL,
"
"      cattributes    in       varchar2   DEFAULT NULL
"
"    ) return varchar2;
"
"  pragma restrict_references(Anchor2, WNDS, WNPS);
"
"
"
"  -- version to get around bug 965862
"
"  function img (
"
"   curl           in       varchar2,
"
"   calign         in       varchar2   DEFAULT NULL,
"
"   calt           in       varchar2   DEFAULT NULL,
"
"   cismap         in       varchar2   DEFAULT NULL,
"
"   cattributes    in       varchar2   DEFAULT NULL
"
"  ) return varchar2;
"
"  pragma restrict_references(img, WNDS, WNPS);
"
"
"
"  function EscapeItem( z_item_text in varchar2 ) return varchar2;
"
"  pragma restrict_references( EscapeItem, WNDS, WNPS );
"
"END WSGL;"
/
