CREATE OR REPLACE
"PACKAGE         sql_to_text IS
"
"
"
"-- Predefined formats
"
"    v_font_family           VARCHAR2(50)   := 'Verdana';
"
"    n_font_size             NUMBER(5)      := 8;
"
"    n_font_weight           NUMBER(10)     := 400;
"
"    v_font_style            VARCHAR2(20)   := 'Normal';
"
"    v_font_color            VARCHAR2(25)   := 'Black';
"
"    v_border_column         VARCHAR2(50)   := 'border:1px solid black';
"
"    v_bkgrd_color           VARCHAR2(50)   := 'white';
"
"    v_settings              VARCHAR2(1000) := 'font-family:'||v_font_family||';'||'font-size:'||TO_CHAR(n_font_size)||'pt;'||
"
"                                              'font-weight:'||TO_CHAR(n_font_weight)||';'||'font-style:'||v_font_style||';'||
"
"                                              'color:'||v_font_color||';'||v_border_column||';'||'background:'||v_bkgrd_color||';';
"
"
"
"/*---------------------------------------------------------------------------
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
"
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
"RETURN utl_file.FILE_TYPE;
"
"
"
"PROCEDURE add_new_row
"
"    (
"
"     v_fileHandle          IN utl_file.FILE_TYPE
"
"    );
"
"
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
"    ,v_head		    IN NUMBER
"
"    ,v_cssStyle             IN VARCHAR2 := v_settings
"
"    );
"
"
"
"PROCEDURE close_file
"
"    (
"
"     v_fileHandle          IN utl_file.FILE_TYPE
"
"    );
"
"
"
"END ;"
/
