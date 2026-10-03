CREATE OR REPLACE
"package form_help is
"
"--
"
"--  Package to display user help text stored in
"
"--  table CG_FORM_HELP. This package outputs HTML
"
"--  using the PL/SQL Web Toolkit.
"
"--
"
"procedure display( p_help_table in varchar2 default 'CG_FORM_HELP',
"
"                      p_app in varchar2,
"
"                      p_module in varchar2,
"
"                      p_block in varchar2 default null,
"
"                      p_item in varchar2 default null,
"
"                      p_col in varchar2 default null,
"
"                      p_table in varchar2 default null,
"
"                      p_level in varchar2);
"
"--
"
"--
"
"end form_help;"
/
