CREATE OR REPLACE
"PACKAGE  ""XML_TO_XSLX""
"
"  AUTHID CURRENT_USER
"
"IS
"
"  WIDTH_COEFFICIENT CONSTANT NUMBER := 6;
"
"
"
"  procedure download_file(p_app_id       IN NUMBER,
"
"                          p_page_id      IN NUMBER,
"
"                          p_region_id    IN NUMBER,
"
"                          p_col_length   IN VARCHAR2 DEFAULT NULL,
"
"                          p_max_rows     IN NUMBER
"
"                         );
"
"
"
"  function convert_date_format(p_format IN VARCHAR2)
"
"  return varchar2;
"
"  function convert_number_format(p_format IN VARCHAR2)
"
"  return varchar2;
"
"
"
"  function get_max_rows (p_app_id      IN NUMBER,
"
"                         p_page_id     IN NUMBER,
"
"                         p_region_id   IN NUMBER)
"
"  return number;
"
"  /*
"
"  -- format test cases
"
"  select xml_to_xslx.convert_date_format('dd.mm.yyyy hh24:mi:ss'),to_char(sysdate,'dd.mm.yyyy hh24:mi:ss') from dual
"
"  union
"
"  select xml_to_xslx.convert_date_format('dd.mm.yyyy hh12:mi:ss'),to_char(sysdate,'dd.mm.yyyy hh12:mi:ss') from dual
"
"  union
"
"  select xml_to_xslx.convert_date_format('day-mon-yyyy'),to_char(sysdate,'day-mon-yyyy') from dual
"
"  union
"
"  select xml_to_xslx.convert_date_format('month'),to_char(sysdate,'month') from dual
"
"  union
"
"  select xml_to_xslx.convert_date_format('RR-MON-DD'),to_char(sysdate,'RR-MON-DD') from dual
"
"  union
"
"  select xml_to_xslx.convert_number_format('FML999G999G999G999G990D0099'),to_char(123456789/451,'FML999G999G999G999G990D0099') from dual
"
"  union
"
"  select xml_to_xslx.convert_date_format('DD-MON-YYYY HH:MIPM'),to_char(sysdate,'DD-MON-YYYY HH:MIPM') from dual
"
"  union
"
"  select xml_to_xslx.convert_date_format('fmDay, fmDD fmMonth, YYYY'),to_char(sysdate,'fmDay, fmDD fmMonth, YYYY') from dual
"
"  */
"
"
"
"end;"
/
