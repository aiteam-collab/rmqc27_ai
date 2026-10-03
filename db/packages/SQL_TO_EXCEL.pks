CREATE OR REPLACE
"PACKAGE sql_to_excel IS
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
"     );
"
"
"
" /*-----------------------------------------------------------------------------
"
" *  Name:         getexcelcol_fromcolnumber
"
" *  Description:  Gets the Excel column identifier from the current column number
"
" *                e.g. 1 -> A, 10 -> J
"
" *  Parameter:    s_number - current column number with 1 <= s_number <= 256
"
" -----------------------------------------------------------------------------*/
"
"
"
"FUNCTION getexcelcol_fromcolnumber
"
"     (
"
"      p_number               IN PLS_INTEGER
"
"     )
"
"RETURN VARCHAR2;
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
"/*-----------------------------------------------------------------------------
"
"*  Name:         write_text_data
"
"*  Description:  Write text data
"
"*  Parameter:    v_fileHandle - file handle from 'create_new_file'
"
"*                v_text - string to be written
"
"*                v_cssStyle - cell formatting. Values according to constants
"
"*                  in package header. Declarations can be combined by
"
"*                  concatenating.
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
"    ,v_head            IN NUMBER
"
"    ,v_cssStyle             IN VARCHAR2 := v_settings
"
"    );
"
"
"
"/*-----------------------------------------------------------------------------
"
"*  Name:         write_number_data
"
"*  Description:  Write number data
"
"*  Parameter:    v_fileHandle - file handle from 'create_new_file'
"
"*                n_number - number to be written
"
"*                v_format - Formatting of the number Values according to constants
"
"*                  in package header.
"
"*                v_cssStyle - cell formatting. Values according to constants
"
"*                  in package header. Declarations can be combined by
"
"*                  concatenating.
"
"-----------------------------------------------------------------------------*/
"
"
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
"    );
"
"
"
"/*------------------------------------------------------------------------------
"
"*  Name:         write_formula
"
"*  Description:  Write formula such as Sum, Average, Count, Minimum and Maximum
"
"*  Parameter:    v_fileHandle - file handle from 'create_new_file'
"
"*                v_formel - formula to be written
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
"-------------------------------------------------------------------------------*/
"
"
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
"    );
"
"
"
"/*-----------------------------------------------------------------------------
"
"*  Name:         close_file
"
"*  Description:  Close last data row and close file
"
"*  Parameter:    v_fileHandle - file handle from 'create_new_file'
"
"-----------------------------------------------------------------------------*/
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
"END sql_to_excel;"
/
