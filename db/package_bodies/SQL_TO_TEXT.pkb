CREATE OR REPLACE
"PACKAGE BODY sql_to_text IS
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
"         RETURN v_fileHandle;
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
"
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
"
"
"PROCEDURE write_text_data
"
"    (
"
"     v_fileHandle           IN utl_file.FILE_TYPE
"
"    ,v_text                 IN VARCHAR2
"
"    ,v_head          	    NUMBER
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
"            put_line (v_fileHandle, v_text);
"
"         ELSE
"
"            put_line (v_fileHandle,v_text );
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
"     fclose(v_fileHandle);
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
"END;"
/
