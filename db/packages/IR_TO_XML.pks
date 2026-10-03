CREATE OR REPLACE
"PACKAGE  IR_TO_XML
"
"  AUTHID CURRENT_USER
"
"as
"
"
"
"  PROCEDURE get_report_xml(p_app_id          IN NUMBER,
"
"                           p_page_id         IN NUMBER,
"
"                           p_region_id       IN NUMBER,
"
"                           p_return_type     IN CHAR DEFAULT 'X', -- ""Q"" for debug information ""X"" for XML-Data
"
"                           p_get_page_items  IN CHAR DEFAULT 'N', -- Y,N - include page items in XML
"
"                           p_items_list      IN VARCHAR2,         -- "","" delimetered list of items that for including in XML
"
"                           p_collection_name IN VARCHAR2,         -- name of APEX COLLECTION to save XML, when null - download as file
"
"                           p_max_rows        IN NUMBER            -- maximum rows for export
"
"                          );
"
"
"
"  --return debug information
"
"  function get_log return clob;
"
"
"
"  -- get XML
"
"  function get_report_xml(p_app_id          IN NUMBER,
"
"                          p_page_id         IN NUMBER,
"
"                          p_region_id       IN NUMBER,
"
"                          p_get_page_items  IN CHAR DEFAULT 'N', -- Y,N - include page items in XML
"
"                          p_items_list      IN VARCHAR2,         -- "","" delimetered list of items that for including in XML
"
"                          p_max_rows        IN NUMBER            -- maximum rows for export
"
"                         )
"
"  return xmltype;
"
"  /*
"
"    function to handle cases of 'in' and 'not in' conditions for highlights
"
"   	used in cursor cur_highlight
"
"
"
"    Author: Srihari Ravva
"
"  */
"
"  function get_highlight_in_cond_sql(p_condition_expression  in APEX_APPLICATION_PAGE_IR_COND.CONDITION_EXPRESSION%TYPE,
"
"                                     p_condition_sql         in APEX_APPLICATION_PAGE_IR_COND.CONDITION_SQL%TYPE,
"
"                                     p_condition_column_name in APEX_APPLICATION_PAGE_IR_COND.CONDITION_COLUMN_NAME%TYPE)
"
"  return varchar2;
"
"
"
"END IR_TO_XML;"
/
