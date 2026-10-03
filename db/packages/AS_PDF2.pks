CREATE OR REPLACE
"package as_pdf2
"
"is
"
"--
"
"  procedure init;
"
"--
"
"  function get_pdf
"
"  return blob;
"
"--
"
"  procedure save_pdf
"
"    ( p_dir varchar2 := 'MY_DIR'
"
"    , p_filename varchar2 := 'my.pdf'
"
"    );
"
"--
"
"  procedure set_page_size
"
"    ( p_width number
"
"    , p_height number
"
"    , p_unit varchar2 := 'cm'
"
"    );
"
"--
"
"  procedure set_page_format( p_format varchar2 := 'A4' );
"
"--
"
"  procedure set_page_orientation( p_orientation varchar2 := 'PORTRAIT' );
"
"--
"
"  procedure set_margins
"
"    ( p_top number := null
"
"    , p_left number := null
"
"    , p_bottom number := null
"
"    , p_right number := null
"
"    , p_unit varchar2 := 'cm'
"
"    );
"
"--
"
"  procedure new_page;
"
"--
"
"  procedure put_txt( p_x number, p_y number, p_txt varchar2 );
"
"--
"
"  procedure write
"
"    ( p_txt in varchar2
"
"    , p_x in number := null
"
"    , p_y in number := null
"
"    , p_line_height in number := null
"
"    , p_start in number := null -- left side of the available text box
"
"    , p_width in number := null -- width of the available text box
"
"    , p_alignment in varchar2 := null
"
"    );
"
"--
"
"  function str_len( p_txt varchar2 )
"
"  return number;
"
"--
"
"  procedure set_font( p_fontname varchar2, p_fontsize_pt pls_integer );
"
"--
"
"  procedure set_font
"
"    ( p_family varchar2
"
"    , p_style varchar2 := 'N'
"
"    , p_fontsize_pt pls_integer := null
"
"    );
"
"--
"
"  function load_ttf_font
"
"    ( p_font blob
"
"    , p_encoding varchar2 := 'WINDOWS-1252'
"
"    , p_embed boolean := false
"
"    , p_compress boolean := true
"
"    , p_offset number := 1
"
"    )
"
"  return varchar2;
"
"--
"
"  procedure load_ttf_font
"
"    ( p_font blob
"
"    , p_encoding varchar2 := 'WINDOWS-1252'
"
"    , p_embed boolean := false
"
"    , p_compress boolean := true
"
"    , p_offset number := 1
"
"    );
"
"--
"
"  procedure load_ttf_font
"
"    ( p_dir varchar2 := 'MY_FONTS'
"
"    , p_filename varchar2 := 'BAUHS93.TTF'
"
"    , p_encoding varchar2 := 'WINDOWS-1252'
"
"    , p_embed boolean := false
"
"    , p_compress boolean := true
"
"    );
"
"--
"
"  procedure load_ttc_fonts
"
"    ( p_ttc blob
"
"    , p_encoding varchar2 := 'WINDOWS-1252'
"
"    , p_embed boolean := false
"
"    , p_compress boolean := true
"
"    );
"
"--
"
"  procedure load_ttc_fonts
"
"    ( p_dir varchar2 := 'MY_FONTS'
"
"    , p_filename varchar2 := 'CAMBRIA.TTC'
"
"    , p_encoding varchar2 := 'WINDOWS-1252'
"
"    , p_embed boolean := false
"
"    , p_compress boolean := true
"
"    );
"
"--
"
"  procedure horizontal_line
"
"    ( p_x in number
"
"    , p_y in number
"
"    , p_width in number
"
"    , p_line_width in number := 0.5
"
"    , p_line_color in varchar2 := '000000'
"
"    );
"
"--
"
"  procedure vertical_line
"
"    ( p_x in number
"
"    , p_y in number
"
"    , p_height in number
"
"    , p_line_width in number := 0.5
"
"    , p_line_color in varchar2 := '000000'
"
"    );
"
"--
"
"  procedure rect
"
"    ( p_x in number
"
"    , p_y in number
"
"    , p_width in number
"
"    , p_height in number
"
"    , p_line_color in varchar2 := null
"
"    , p_fill_color in varchar2 := null
"
"    , p_line_width in number := 0.5
"
"    );
"
"--
"
"  function get( p_what in pls_integer )
"
"  return number;
"
"--
"
"end;"
/
