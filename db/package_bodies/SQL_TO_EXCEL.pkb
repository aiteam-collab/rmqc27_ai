CREATE OR REPLACE
"PACKAGE BODY sql_to_excel IS
"
"
"
"    v_package_name          CONSTANT VARCHAR2(40) := 'sql_to_excel';
"
"    e_invalidPath           EXCEPTION;
"
"
"
"/*-----------------------------------------------------------------------------
"
"*  Name:         fopen
"
"*  Description:  Open new file
"
"*  Parameter:    v_path - valid directory_path
"
"*                v_filename - file name
"
"-----------------------------------------------------------------------------*/
"
"FUNCTION fopen
"
"    (
"
"     v_path                 IN VARCHAR2
"
"    ,v_filename             IN VARCHAR2
"
"    )
"
"    RETURN utl_file.FILE_TYPE
"
"IS
"
"
"
"    v_fileHandle            utl_file.FILE_TYPE;
"
"
"
"    v_argsstr               VARCHAR2(500) := SUBSTR('v_path '||v_path||','||'v_filename '||v_filename,1,500);
"
"
"
"BEGIN
"
"
"
"    v_fileHandle := utl_file.fopen (v_path, v_filename, 'W');
"
"
"
"    RETURN v_fileHandle;
"
"
"
"EXCEPTION
"
"    WHEN utl_file.INVALID_PATH THEN
"
"        dbms_output.put_line(
"
"                 'Error in '||v_package_name||'.fopen: ' ||v_argsstr ||' invalid_path');
"
"        RAISE;
"
"    WHEN utl_file.INVALID_MODE THEN
"
"        dbms_output.put_line(
"
"                 'Error in '||v_package_name||'.fopen: ' ||v_argsstr ||' invalid_mode');
"
"        RAISE;
"
"    WHEN utl_file.INVALID_FILEHANDLE THEN
"
"        dbms_output.put_line(
"
"                 'Error in '||v_package_name||'.fopen: ' ||v_argsstr ||' invalid_filehandle');
"
"        RAISE;
"
"    WHEN utl_file.INVALID_OPERATION THEN
"
"        dbms_output.put_line(
"
"                 'Error in '||v_package_name||'.fopen: ' ||v_argsstr ||' invalid_operation');
"
"        RAISE;
"
"    WHEN utl_file.READ_ERROR THEN
"
"        dbms_output.put_line(
"
"                 'Error in '||v_package_name||'.fopen: ' ||v_argsstr ||' read_error');
"
"        RAISE;
"
"    WHEN utl_file.WRITE_ERROR THEN
"
"        dbms_output.put_line(
"
"                 'Error in '||v_package_name||'.fopen: ' ||v_argsstr ||' write_error');
"
"        RAISE;
"
"    WHEN utl_file.INTERNAL_ERROR THEN
"
"        dbms_output.put_line(
"
"                 'Error in '||v_package_name||'.fopen: ' ||v_argsstr ||' internal_error');
"
"        RAISE;
"
"    WHEN OTHERS THEN
"
"        dbms_output.put_line(
"
"                 'Error in '||v_package_name||'.fopen: ' ||v_argsstr ||' ' ||SQLERRM);
"
"        RAISE;
"
"END fopen;
"
"
"
"/*-----------------------------------------------------------------------------
"
"*  Name:         put_line
"
"*  Description:  write a line into an open file
"
"*  Parameter:    v_fileHandle - file handle from 'fopen'
"
"*                v_line - string to be written
"
"-----------------------------------------------------------------------------*/
"
"PROCEDURE put_line
"
"    (
"
"     v_fileHandle           IN utl_file.FILE_TYPE
"
"    ,v_line                 IN VARCHAR2
"
"    )
"
"IS
"
"BEGIN
"
"
"
"   utl_file.put_line (v_fileHandle, v_line);
"
"
"
"EXCEPTION
"
"    WHEN OTHERS THEN
"
"        dbms_output.put_line(
"
"                 'Error in '||v_package_name||'.put_line: ' ||SQLERRM);
"
"        RAISE;
"
"END put_line;
"
"
"
"/*-----------------------------------------------------------------------------
"
"*  Name:         create_new_file
"
"*  Description:  Create a new Excel file
"
"*  Parameter:    v_path - valid DIRECTORY_NAME from database
"
"*                v_filename - file name
"
"-----------------------------------------------------------------------------*/
"
"FUNCTION create_new_file
"
"    (
"
"     v_path                 IN VARCHAR2
"
"    ,v_filename             IN VARCHAR2
"
"    )
"
"    RETURN utl_file.FILE_TYPE
"
"IS
"
"
"
"    v_fileHandle            utl_file.FILE_TYPE;
"
"    v_lastSaved             VARCHAR2(22);
"
"    v_argsstr               VARCHAR2(500)   := SUBSTR('v_path '||v_path||','||'v_filename '||v_filename||',',1,500);
"
"
"
"BEGIN
"
"
"
"        -- open file
"
"        v_fileHandle    := fopen(v_path, v_filename);
"
"        v_lastSaved     := TO_CHAR(SYSDATE,'yyyy-mm-dd')||'T'||TO_CHAR(SYSDATE,'hh24:mi:ss')||'Z';
"
"
"
"        -- Header
"
"        put_line(v_fileHandle,'<html xmlns:o=""urn:schemas-microsoft-com:office:office""');
"
"        put_line(v_fileHandle,'xmlns:x=""urn:schemas-microsoft-com:office:excel""');
"
"        put_line(v_fileHandle,'xmlns=""http://www.w3.org/TR/REC-html40"">');
"
"        put_line(v_fileHandle,'<head>');
"
"        put_line(v_fileHandle,'<meta http-equiv=Content-Type content=""text/html; charset=UTF-8"">');
"
"        put_line(v_fileHandle,'<meta name=ProgId content=Excel.Sheet>');
"
"        put_line(v_fileHandle,'<meta name=Generator content=""Microsoft Excel 10"">');
"
"        put_line(v_fileHandle,'<!--[if gte mso 9]><xml>');
"
"        put_line(v_fileHandle,' <o:DocumentProperties>');
"
"        put_line(v_fileHandle,'  <o:LastAuthor>'||LOWER(USER)||'</o:LastAuthor>');
"
"        put_line(v_fileHandle,'  <o:LastSaved>'||v_lastSaved||'</o:LastSaved>');
"
"        put_line(v_fileHandle,'  <o:Version>10.6626</o:Version>');
"
"        put_line(v_fileHandle,' </o:DocumentProperties>');
"
"        put_line(v_fileHandle,' <o:OfficeDocumentSettings>');
"
"        put_line(v_fileHandle,'  <o:DownloadComponents/>');
"
"        put_line(v_fileHandle,' </o:OfficeDocumentSettings>');
"
"        put_line(v_fileHandle,'</xml><![endif]-->');
"
"
"
"        -- Style
"
"        put_line(v_fileHandle,'<style>');
"
"        put_line(v_fileHandle,'<!--');
"
"        put_line(v_fileHandle,'[if gte mso 9]><xml>');
"
"        put_line(v_fileHandle,'table');
"
"        put_line(v_fileHandle,' {mso-displayed-decimal-separator:""\,"";');
"
"        put_line(v_fileHandle,' mso-displayed-thousand-separator:""\."";}');
"
"        put_line(v_fileHandle,'@page');
"
"        put_line(v_fileHandle,' {margin:.98in .79in .98in .79in;');
"
"        put_line(v_fileHandle,' mso-header-margin:.49in;');
"
"        put_line(v_fileHandle,' mso-footer-margin:.49in;}');
"
"        put_line(v_fileHandle,'tr');
"
"        put_line(v_fileHandle,' {mso-height-source:auto;}');
"
"        put_line(v_fileHandle,'col');
"
"        put_line(v_fileHandle,' {mso-width-source:auto;}');
"
"        put_line(v_fileHandle,'br');
"
"        put_line(v_fileHandle,' {mso-data-placement:same-cell;}');
"
"
"
"        -- general sheet formating
"
"        put_line(v_fileHandle,'.style0');
"
"        put_line(v_fileHandle,' {mso-number-format:General;');
"
"        put_line(v_fileHandle,' text-align:general;');
"
"        put_line(v_fileHandle,' vertical-align:top;');
"
"        put_line(v_fileHandle,' mso-rotate:0;');
"
"        put_line(v_fileHandle,' mso-background-source:auto;');
"
"        put_line(v_fileHandle,' mso-pattern:auto;');
"
"        put_line(v_fileHandle,' color:windowtext;');
"
"        put_line(v_fileHandle,' mso-generic-font-family:auto;');
"
"        put_line(v_fileHandle,' mso-font-charset:0;');
"
"        put_line(v_fileHandle,' mso-protection:locked visible;');
"
"        put_line(v_fileHandle,' mso-style-name:Standard;');
"
"        put_line(v_fileHandle,' border-top:none;');
"
"        put_line(v_fileHandle,' border-right:.5pt solid silver;');
"
"        put_line(v_fileHandle,' border-bottom:.5pt solid silver;');
"
"        put_line(v_fileHandle,' border-left:none;');
"
"        put_line(v_fileHandle,' mso-style-id:0;}');
"
"
"
"        -- general cell formating
"
"        put_line(v_fileHandle,'td');
"
"        put_line(v_fileHandle,' {mso-style-parent:style0;');
"
"        put_line(v_fileHandle,' mso-ignore:padding;');
"
"        put_line(v_fileHandle,' mso-generic-font-family:auto;');
"
"        put_line(v_fileHandle,' mso-number-format:General;}');
"
"
"
"        -- cell with text
"
"        put_line(v_fileHandle,'.styleText '); --Text
"
"        put_line(v_fileHandle,' {mso-style-parent:style0;');
"
"        put_line(v_fileHandle,' vertical-align:top;');
"
"        put_line(v_fileHandle,' white-space:normal;}');
"
"        --
"
"        put_line(v_fileHandle,'-->');
"
"        put_line(v_fileHandle,'</style>');
"
"        --
"
"        put_line(v_fileHandle,'</head>');
"
"        put_line(v_fileHandle,'<body>');
"
"        put_line(v_fileHandle,'<table x:str>');
"
"
"
"       RETURN v_fileHandle;
"
"
"
"EXCEPTION
"
"    WHEN e_invalidPath THEN
"
"        dbms_output.put_line(
"
"                 'Error in '||v_package_name||'.createNewFile: ' ||v_argsstr ||' ' ||'invalid path');
"
"        RAISE;
"
"    WHEN OTHERS THEN
"
"        dbms_output.put_line(
"
"                 'Error in '||v_package_name||'.createNewFile: ' ||v_argsstr ||' ' ||SQLERRM);
"
"        RAISE;
"
"END create_new_file;
"
"
"
"/*-----------------------------------------------------------------------------
"
"*  Name:         initial_settings
"
"*  Description:  Initialize the required font, font size, font weight,
"
"*                font style, width. After creating a new file, this
"
"*                procedure needs to be called so that the required
"
"*                settings is set. Otherwise default settings will be set.
"
"*  Parameter:    v_fileHandle - file handle from 'create_new_file'
"
"*                v_font_family - font name
"
"*                v_font_size   - size of the font
"
"*                v_font_weight - weight of 400 is normal. To achieve Boldness,
"
"*                                use weight of 700
"
"*                v_font_style  - use 'Normal' or 'Italic'. Note to achieve
"
"*                                Boldness, use font weight of 700
"
"*                v_font_color  - color of the font
"
"*                v_width_cell  - width of the cell
"
"*                v_border_column - border column color
"
"*                v_bkgrd_color   - background color
"
"-----------------------------------------------------------------------------*/
"
"
"
"PROCEDURE initial_settings
"
"    (
"
"     v_fileHandle          IN utl_file.FILE_TYPE
"
"     ,i_font_family        IN VARCHAR2
"
"     ,i_font_size          IN NUMBER
"
"     ,i_font_weight        IN NUMBER
"
"     ,i_font_style         IN VARCHAR2
"
"     ,i_font_color         IN VARCHAR2
"
"     ,i_width_cell         IN VARCHAR2
"
"     ,i_border_column      IN VARCHAR2
"
"     ,i_bkgrd_color        IN VARCHAR2
"
"     )
"
"IS
"
"BEGIN
"
"
"
"    IF i_width_cell IS NOT NULL THEN
"
"       FOR j IN 1..256 LOOP
"
"            utl_file.put_line(v_fileHandle,'<col style=''mso-width-source:userset;mso-width-alt:'||i_width_cell||';''>');
"
"       END LOOP;
"
"    END IF;
"
"
"
"    IF i_font_family IS NOT NULL THEN
"
"       v_font_family := i_font_family;
"
"    END IF;
"
"
"
"    IF i_font_size IS NOT NULL THEN
"
"       n_font_size := i_font_size;
"
"    END IF;
"
"
"
"    IF i_font_weight IS NOT NULL THEN
"
"       n_font_weight := i_font_weight;
"
"    END IF;
"
"
"
"    IF i_font_style IS NOT NULL THEN
"
"       v_font_style := i_font_style;
"
"    END IF;
"
"
"
"    IF i_font_color IS NOT NULL THEN
"
"       v_font_color := i_font_color;
"
"    END IF;
"
"
"
"    IF i_border_column IS NOT NULL THEN
"
"       v_border_column := i_border_column;
"
"    END IF;
"
"
"
"    IF i_bkgrd_color IS NOT NULL THEN
"
"       v_bkgrd_color := i_bkgrd_color;
"
"    END IF;
"
"
"
"    v_settings := 'font-family:'||v_font_family||';'||'font-size:'||TO_CHAR(n_font_size)||'pt;'||
"
"                  'font-weight:'||TO_CHAR(n_font_weight)||';'||'font-style:'||v_font_style||';'||
"
"                  'color:'||v_font_color||';'||v_border_column||';'||'background:'||v_bkgrd_color||';';
"
"
"
"END initial_settings;
"
"
"
"/*-----------------------------------------------------------------------------
"
"*  Name:         getexcelcol_fromcolnumber
"
"*  Description:  Gets the Excel column identifier from the current column number
"
"*                e.g. 1 -> A, 10 -> J
"
"*  Parameter:    p_number - current column number with 1 <= p_number <= 256
"
"-----------------------------------------------------------------------------*/
"
"
"
"FUNCTION getexcelcol_fromcolnumber
"
"    (
"
"     p_number               IN PLS_INTEGER
"
"    )
"
"    RETURN VARCHAR2
"
"IS
"
"    v_ascii                 VARCHAR2(2);
"
"    e_outOfRange            EXCEPTION;
"
"    v_argsstr               VARCHAR2(500)   := SUBSTR('p_number '||TO_CHAR(p_number),1,500);
"
"
"
"BEGIN
"
"    IF p_number NOT BETWEEN 1 AND 256 THEN
"
"        RAISE e_outOfRange;
"
"    END IF;
"
"
"
"    v_ascii := CHR(MOD(p_number,26) + 64);
"
"
"
"    IF p_number > 26 THEN
"
"        v_ascii := CHR(FLOOR(p_number / 26) + 64)||v_ascii;
"
"    END IF;
"
"
"
"    RETURN v_ascii;
"
"
"
"EXCEPTION
"
"    WHEN e_outOfRange THEN
"
"        dbms_output.put_line(
"
"                 'Error in '||v_package_name||'.getexcelcol_fromcolnumber: ' ||v_argsstr ||' ' ||'Value out of range 1 - 256');
"
"        RAISE;
"
"    WHEN OTHERS THEN
"
"        dbms_output.put_line(
"
"                 'Error in '||v_package_name||'.getexcelcol_fromcolnumber: ' ||v_argsstr ||' ' ||SQLERRM);
"
"        RAISE;
"
"
"
"END getexcelcol_fromcolnumber;
"
"
"
"/*-----------------------------------------------------------------------------
"
"*  Name:         fclose
"
"*  Description:  Close a file
"
"*  Parameter:    p_fileHandle - file handle from 'fopen'
"
"-----------------------------------------------------------------------------*/
"
"PROCEDURE fclose
"
"    (
"
"     p_fileHandle           IN utl_file.FILE_TYPE
"
"    )
"
"IS
"
"
"
"    v_fileHandle            utl_file.FILE_TYPE := p_fileHandle;
"
"
"
"BEGIN
"
"
"
"    IF utl_file.is_open (v_fileHandle) THEN
"
"        utl_file.fclose (v_fileHandle);
"
"    END IF;
"
"
"
"EXCEPTION
"
"    WHEN OTHERS THEN
"
"        dbms_output.put_line(
"
"                 'Error in '||v_package_name||'.fclose: ' ||SQLERRM);
"
"        RAISE;
"
"END fclose;
"
"
"
"/*-----------------------------------------------------------------------------
"
"*  Name:         add_new_row
"
"*  Description:  Close previous row and open a new one
"
"*  Parameter:    v_fileHandle - file handle from 'create_new_file'
"
"-----------------------------------------------------------------------------*/
"
"PROCEDURE add_new_row
"
"    (
"
"     v_fileHandle          IN utl_file.FILE_TYPE
"
"    )
"
"IS
"
"
"
"BEGIN
"
"    put_line(v_fileHandle,'</tr>');
"
"    put_line(v_fileHandle,'<tr>');
"
"
"
"EXCEPTION
"
"    WHEN OTHERS THEN
"
"        dbms_output.put_line('Error in '||v_package_name||'.newDatarow: ' ||SQLERRM);
"
"        RAISE;
"
"END add_new_row;
"
"
"
"/*-----------------------------------------------------------------------------
"
"*  Name:         getstyle
"
"*  Description:  User defined cell style
"
"*  Parameter:    p_cssStyle - Cell formatting.
"
"-----------------------------------------------------------------------------*/
"
"FUNCTION getstyle
"
"    (
"
"     p_cssStyle             IN VARCHAR2 := NULL
"
"    )
"
"    RETURN VARCHAR2
"
"IS
"
"
"
"    v_style                 VARCHAR(1000);
"
"    v_argsstr               VARCHAR2(500)   := SUBSTR('p_cssStyle '||p_cssStyle,1,500);
"
"
"
"BEGIN
"
"
"
"    IF p_cssStyle IS NOT NULL THEN
"
"        v_style := ' style=""'||p_cssStyle||'"" ';
"
"    END IF;
"
"
"
"    RETURN v_style;
"
"
"
"EXCEPTION
"
"    WHEN OTHERS THEN
"
"        dbms_output.put_line(
"
"                 'Error in '||v_package_name||'.getStyle: ' ||v_argsstr ||' ' ||SQLERRM);
"
"        RAISE;
"
"END getstyle;
"
"
"
"/*-----------------------------------------------------------------------------
"
"*  Name:         write_text_data
"
"*  Description:  write text
"
"*  Parameter:    v_fileHandle - file handle from 'create_new_file'
"
"*                v_text - string to be written
"
"*                v_cssStyle - cell formatting.
"
"-----------------------------------------------------------------------------*/
"
"PROCEDURE write_text_data
"
"    (
"
"     v_fileHandle           IN utl_file.FILE_TYPE
"
"    ,v_text                 IN VARCHAR2
"
"    ,v_head                  NUMBER
"
"    ,v_cssStyle             IN VARCHAR2 := v_settings
"
"    )
"
"IS
"
"
"
"    v_style                 VARCHAR(1000);
"
"    v_argsstr               VARCHAR2(500)   := SUBSTR(
"
"                                                'v_text '||v_text||','||
"
"                                                'v_cssStyle '||v_cssStyle
"
"                                                ,1,500);
"
"BEGIN
"
"
"
"      IF v_head = 1
"
"         THEN
"
"            put_line (v_fileHandle,
"
"                  '<td '
"
"               || 'class=""styleText"" '
"
"               || getStyle (v_cssStyle)
"
"               || '>'
"
"               || v_text
"
"               || '</td>');
"
"         ELSE
"
"            put_line (v_fileHandle,'<td ' --|| 'class=""styleText"" '
"
"                             --|| getStyle (v_cssStyle)
"
"                      || '>' || v_text || '</td>');
"
"      END IF;
"
"
"
"EXCEPTION
"
"    WHEN OTHERS THEN
"
"        dbms_output.put_line(
"
"                 'Error in '||v_package_name||'.writeData: ' ||v_argsstr ||' ' ||SQLERRM);
"
"        RAISE;
"
"END write_text_data;
"
"
"
"/*-----------------------------------------------------------------------------
"
"*  Name:         write_number_data
"
"*  Description:  Write number
"
"*  Parameter:    v_fileHandle - file handle from 'createNewFile'
"
"*                n_number - number to be written
"
"*                v_cssStyle - cell formatting.
"
"-----------------------------------------------------------------------------*/
"
"PROCEDURE write_number_data
"
"    (
"
"     v_fileHandle           IN utl_file.FILE_TYPE
"
"    ,n_number               IN NUMBER
"
"    ,v_cssStyle             IN VARCHAR2 := v_settings
"
"    )
"
"IS
"
"
"
"    v_argsstr               VARCHAR2(500)   := SUBSTR('n_number '||LTRIM(TO_CHAR(n_number,'9,99,99,99,99,990.999'))||','||
"
"                                                      'v_cssStyle '||v_cssStyle,1,500);
"
"BEGIN
"
"
"
"    put_line(
"
"             v_fileHandle
"
"            ,'<td '||
"
"             'class=2decimal '||
"
"             getStyle(v_cssStyle)||
"
"             'x:num=""'||LTRIM(TO_CHAR(n_number,'9,99,99,99,99,990.999'))||'"">'||
"
"             '</td>'
"
"            );
"
"
"
"EXCEPTION
"
"    WHEN OTHERS THEN
"
"        dbms_output.put_line(
"
"                 'Error in '||v_package_name||'.writeData: ' ||v_argsstr ||' ' ||SQLERRM);
"
"        RAISE;
"
"END write_number_data;
"
"
"
"/*-----------------------------------------------------------------------------
"
"*  Name:         write_formula
"
"*  Description:  write formula
"
"*  Parameter:    p_fileHandle - file handle from 'createNewFile'
"
"*                p_formel - formula to be written
"
"*                The syntax is
"
"*                e.g. =SUM(B5:B6)
"
"*                     =IF(B6>0,""T"",""H"")
"
"*                     =AVERAGE(B6,B5,B7)
"
"*                     =COUNT(B5:B7)
"
"*                the Excel column identifier can be determined by
"
"*                getexcelcol_fromcolnumber
"
"-----------------------------------------------------------------------------*/
"
"PROCEDURE write_formula
"
"    (
"
"     v_fileHandle           IN utl_file.FILE_TYPE
"
"    ,v_formel               IN VARCHAR2
"
"    ,v_cssStyle             IN VARCHAR2 := v_settings
"
"    )
"
"IS
"
"    v_argsstr               VARCHAR2(500)   := SUBSTR('v_formel '||v_formel||',',1,500);
"
"
"
"BEGIN
"
"
"
"    put_line(
"
"             v_fileHandle
"
"            ,'<td '||
"
"             'class=style2decimal '||
"
"             getStyle(v_cssStyle)||
"
"             'x:fmla=""'||v_formel||'"">'||
"
"             '</td>'
"
"            );
"
"
"
"EXCEPTION
"
"    WHEN OTHERS THEN
"
"        dbms_output.put_line(
"
"                 'Error in '||v_package_name||'.writeFormula: ' ||v_argsstr ||' ' ||SQLERRM);
"
"        RAISE;
"
"
"
"END write_formula;
"
"
"
"/*-----------------------------------------------------------------------------
"
"*  Name:         close_file
"
"*  Description:  close last data row and close file
"
"*  Parameter:    v_fileHandle - file handle from 'createNewFile'
"
"-----------------------------------------------------------------------------*/
"
"PROCEDURE close_file
"
"    (
"
"     v_fileHandle          IN utl_file.FILE_TYPE
"
"    )
"
"IS
"
"
"
"BEGIN
"
"    put_line(v_fileHandle,'</tr>');
"
"    put_line(v_fileHandle,'</table>');
"
"    put_line(v_fileHandle,'</body>');
"
"    put_line(v_fileHandle,'</html>');
"
"
"
"    fclose(v_fileHandle);
"
"
"
"EXCEPTION
"
"    WHEN OTHERS THEN
"
"        dbms_output.put_line(
"
"                 'Error in '||v_package_name||'.closeFile: ' ||SQLERRM);
"
"        RAISE;
"
"END close_file;
"
"
"
"END sql_to_excel;"
/
