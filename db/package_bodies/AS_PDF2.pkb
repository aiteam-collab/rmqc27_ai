CREATE OR REPLACE
"package body as_pdf2
"
"is
"
"--
"
"  type tp_pls_tab is table of pls_integer index by pls_integer;
"
"  type tp_objects_tab is table of number(10) index by pls_integer;
"
"  type tp_pages_tab is table of blob index by pls_integer;
"
"  type tp_settings is record
"
"    ( page_width number
"
"    , page_height number
"
"    , margin_left number
"
"    , margin_right number
"
"    , margin_top number
"
"    , margin_bottom number
"
"    );
"
"  type tp_font is record
"
"    ( standard boolean
"
"    , family varchar2(100)
"
"    , style varchar2(2)  -- N Normal
"
"                         -- I Italic
"
"                         -- B Bold
"
"                         -- BI Bold Italic
"
"    , subtype varchar2(15)
"
"    , name varchar2(100)
"
"    , fontname varchar2(100)
"
"    , char_width_tab tp_pls_tab
"
"    , encoding varchar2(100)
"
"    , charset varchar2(1000)
"
"    , compress_font boolean := true
"
"    , fontsize number
"
"    , unit_norm number
"
"    , bb_xmin pls_integer
"
"    , bb_ymin pls_integer
"
"    , bb_xmax pls_integer
"
"    , bb_ymax pls_integer
"
"    , flags pls_integer
"
"    , first_char pls_integer
"
"    , last_char pls_integer
"
"    , italic_angle number
"
"    , ascent pls_integer
"
"    , descent pls_integer
"
"    , capheight pls_integer
"
"    , stemv pls_integer
"
"    , diff varchar2(32767)
"
"    , cid boolean := false
"
"    , fontfile2 blob
"
"    , ttf_offset pls_integer
"
"    , used_chars tp_pls_tab
"
"    , numGlyphs pls_integer
"
"    , indexToLocFormat pls_integer
"
"    , loca tp_pls_tab
"
"    , code2glyph tp_pls_tab
"
"    , hmetrics tp_pls_tab
"
"    );
"
"  type tp_font_tab is table of tp_font index by pls_integer;
"
"--
"
"-- globals
"
"  g_pdf_doc blob; -- the PDF-document being constructed
"
"  g_objects tp_objects_tab;
"
"  g_pages tp_pages_tab;
"
"  g_settings tp_settings;
"
"  g_fonts tp_font_tab;
"
"  g_used_fonts tp_pls_tab;
"
"  g_current_font pls_integer;
"
"  g_x number;  -- current x-location of the ""cursor""
"
"  g_y number;  -- current y-location of the ""cursor""
"
"--
"
"  function raw2num( p_value raw )
"
"  return number
"
"  is
"
"  begin -- note: FFFFFFFF => -1
"
"    return utl_raw.cast_to_binary_integer( p_value );
"
"  end;
"
"--
"
"  function to_short( p_val raw, p_factor number := 1 )
"
"  return number
"
"  is
"
"    t_rv number;
"
"  begin
"
"    t_rv := utl_raw.cast_to_binary_integer( p_val );
"
"    if t_rv > 32767
"
"    then
"
"      t_rv := t_rv - 65536;
"
"    end if;
"
"    return t_rv * p_factor;
"
"  end;
"
"--
"
"  function blob2num( p_blob blob, p_len integer, p_pos integer )
"
"  return number
"
"  is
"
"  begin
"
"    return utl_raw.cast_to_binary_integer( dbms_lob.substr( p_blob, p_len, p_pos ) );
"
"  end;
"
"--
"
"  function file2blob( p_dir varchar2, p_file_name varchar2 )
"
"  return blob
"
"  is
"
"  begin
"
"null;
"
"  end;
"
"--
"
"  procedure init_core_fonts
"
"  is
"
"    function uncompress_withs( p_compressed_tab varchar2 )
"
"    return tp_pls_tab
"
"    is
"
"      t_rv tp_pls_tab;
"
"      t_tmp raw(32767);
"
"    begin
"
"      if p_compressed_tab is not null
"
"      then
"
"        t_tmp := utl_compress.lz_uncompress
"
"          ( utl_encode.base64_decode( utl_raw.cast_to_raw( p_compressed_tab ) ) );
"
"        for i in 0 .. 255
"
"        loop
"
"          t_rv( i ) := utl_raw.cast_to_binary_integer( utl_raw.substr( t_tmp, i * 4 + 1, 4 ) );
"
"        end loop;
"
"      end if;
"
"      return t_rv;
"
"    end;
"
"--
"
"    procedure init_core_font
"
"      ( p_ind pls_integer
"
"      , p_family varchar2
"
"      , p_style varchar2
"
"      , p_name varchar2
"
"      , p_compressed_tab varchar2
"
"      )
"
"    is
"
"    begin
"
"      g_fonts( p_ind ).family := p_family;
"
"      g_fonts( p_ind ).style := p_style;
"
"      g_fonts( p_ind ).name := p_name;
"
"      g_fonts( p_ind ).fontname := p_name;
"
"      g_fonts( p_ind ).standard := true;
"
"      g_fonts( p_ind ).encoding := 'WE8MSWIN1252';
"
"      g_fonts( p_ind ).charset := sys_context( 'userenv', 'LANGUAGE' );
"
"      g_fonts( p_ind ).charset := substr( g_fonts( p_ind ).charset
"
"                                        , 1
"
"                                        , instr( g_fonts( p_ind ).charset, '.' )
"
"                                        ) || g_fonts( p_ind ).encoding;
"
"      g_fonts( p_ind ).char_width_tab := uncompress_withs( p_compressed_tab );
"
"    end;
"
"  begin
"
"    init_core_font( 1, 'helvetica', 'N', 'Helvetica'
"
"      ,  'H4sIAAAAAAAAC81Tuw3CMBC94FQMgMQOLAGVGzNCGtc0dAxAT+8lsgE7RKJFomOA'
"
"      || 'SLT4frHjBEFJ8XSX87372C8A1Qr+Ax5gsWGYU7QBAK4x7gTnGLOS6xJPOd8w5NsM'
"
"      || '2OvFvQidAP04j1nyN3F7iSNny3E6DylPeeqbNqvti31vMpfLZuzH86oPdwaeo6X+'
"
"      || '5X6Oz5VHtTqJKfYRNVu6y0ZyG66rdcxzXJe+Q/KJ59kql+bTt5K6lKucXvxWeHKf'
"
"      || '+p6Tfersfh7RHuXMZjHsdUkxBeWtM60gDjLTLoHeKsyDdu6m8VK3qhnUQAmca9BG'
"
"      || 'Dq3nP+sV/4FcD6WOf9K/ne+hdav+DTuNLeYABAAA' );
"
"--
"
"    init_core_font( 2, 'helvetica', 'I', 'Helvetica-Oblique'
"
"      ,  'H4sIAAAAAAAAC81Tuw3CMBC94FQMgMQOLAGVGzNCGtc0dAxAT+8lsgE7RKJFomOA'
"
"      || 'SLT4frHjBEFJ8XSX87372C8A1Qr+Ax5gsWGYU7QBAK4x7gTnGLOS6xJPOd8w5NsM'
"
"      || '2OvFvQidAP04j1nyN3F7iSNny3E6DylPeeqbNqvti31vMpfLZuzH86oPdwaeo6X+'
"
"      || '5X6Oz5VHtTqJKfYRNVu6y0ZyG66rdcxzXJe+Q/KJ59kql+bTt5K6lKucXvxWeHKf'
"
"      || '+p6Tfersfh7RHuXMZjHsdUkxBeWtM60gDjLTLoHeKsyDdu6m8VK3qhnUQAmca9BG'
"
"      || 'Dq3nP+sV/4FcD6WOf9K/ne+hdav+DTuNLeYABAAA' );
"
"--
"
"    init_core_font( 3, 'helvetica', 'B', 'Helvetica-Bold'
"
"      ,  'H4sIAAAAAAAAC8VSsRHCMAx0SJcBcgyRJaBKkxXSqKahYwB6+iyRTbhLSUdHRZUB'
"
"      || 'sOWXLF8SKCn+ZL/0kizZuaJ2/0fn8XBu10SUF28n59wbvoCr51oTD61ofkHyhBwK'
"
"      || '8rXusVaGAb4q3rXOBP4Qz+wfUpzo5FyO4MBr39IH+uLclFvmCTrz1mB5PpSD52N1'
"
"      || 'DfqS988xptibWfbw9Sa/jytf+dz4PqQz6wi63uxxBpCXY7uUj88jNDNy1mYGdl97'
"
"      || '856nt2f4WsOFed4SpzumNCvlT+jpmKC7WgH3PJn9DaZfA42vlgh96d+wkHy0/V95'
"
"      || 'xyv8oj59QbvBN2I/iAuqEAAEAAA=' );
"
"--
"
"    init_core_font( 4, 'helvetica', 'BI', 'Helvetica-BoldOblique'
"
"      ,  'H4sIAAAAAAAAC8VSsRHCMAx0SJcBcgyRJaBKkxXSqKahYwB6+iyRTbhLSUdHRZUB'
"
"      || 'sOWXLF8SKCn+ZL/0kizZuaJ2/0fn8XBu10SUF28n59wbvoCr51oTD61ofkHyhBwK'
"
"      || '8rXusVaGAb4q3rXOBP4Qz+wfUpzo5FyO4MBr39IH+uLclFvmCTrz1mB5PpSD52N1'
"
"      || 'DfqS988xptibWfbw9Sa/jytf+dz4PqQz6wi63uxxBpCXY7uUj88jNDNy1mYGdl97'
"
"      || '856nt2f4WsOFed4SpzumNCvlT+jpmKC7WgH3PJn9DaZfA42vlgh96d+wkHy0/V95'
"
"      || 'xyv8oj59QbvBN2I/iAuqEAAEAAA=' );
"
"--
"
"    init_core_font( 5, 'times', 'N', 'Times-Roman'
"
"      ,  'H4sIAAAAAAAAC8WSKxLCQAyG+3Bopo4bVHbwHGCvUNNT9AB4JEwvgUBimUF3wCNR'
"
"      || 'qAoGRZL9twlQikR8kzTvZBtF0SP6O7Ej1kTnSRfEhHw7+Jy3J4XGi8w05yeZh2sE'
"
"      || '4j312ZDeEg1gvSJy6C36L9WX1urr4xrolfrSrYmrUCeDPGMu5+cQ3Ur3OXvQ+TYf'
"
"      || '+2FGexOZvTM1L3S3o5fJjGQJX2n68U2ur3X5m3cTvfbxsk9pcsMee60rdTjnhNkc'
"
"      || 'Zip9HOv9+7/tI3Oif3InOdV/oLdx3gq2HIRaB1Ob7XPk35QwwxDyxg3e09Dv6nSf'
"
"      || 'rxQjvty8ywDce9CXvdF9R+4y4o+7J1P/I9sABAAA' );
"
"--
"
"    init_core_font( 6, 'times', 'I', 'Times-Italic'
"
"      ,  'H4sIAAAAAAAAC8WSPQ6CQBCFF+i01NB5g63tPcBegYZTeAB6SxNLjLUH4BTEeAYr'
"
"      || 'Kwpj5ezsW2YgoKXFl2Hnb9+wY4x5m7+TOOJMdIFsRywodkfMBX9aSz7bXGp+gj6+'
"
"      || 'R4TvOtJ3CU5Eq85tgGsbxG3QN8iFZY1WzpxXwkckFTR7e1G6osZGWT1bDuBnTeP5'
"
"      || 'KtW/E71c0yB2IFbBphuyBXIL9Y/9fPvhf8se6vsa8nmeQtU6NSf6ch9fc8P9DpqK'
"
"      || 'cPa5/I7VxDwruTN9kV3LDvQ+h1m8z4I4x9LIbnn/Fv6nwOdyGq+d33jk7/cxztyq'
"
"      || 'XRhTz/it7Mscg7fT5CO+9ahnYk20Hww5IrwABAAA' );
"
"--
"
"    init_core_font( 7, 'times', 'B', 'Times-Bold'
"
"      , 'H4sIAAAAAAAAC8VSuw3CQAy9XBqUAVKxAZkgHQUNEiukySxpqOjTMQEDZIrUDICE'
"
"      || 'RHUVVfy9c0IQJcWTfbafv+ece7u/Izs553cgAyN/APagl+wjgN3XKZ5kmTg/IXkw'
"
"      || 'h4JqXUEfAb1I1VvwFYysk9iCffmN4+gtccSr5nlwDpuTepCZ/MH0FZibDUnO7MoR'
"
"      || 'HXdDuvgjpzNxgevG+dF/hr3dWfoNyEZ8Taqn+7d7ozmqpGM8zdMYruFrXopVjvY2'
"
"      || 'in9gXe+5vBf1KfX9E6TOVBsb8i5iqwQyv9+a3Gg/Cv+VoDtaQ7xdPwfNYRDji09g'
"
"      || 'X/FvLNGmO62B9jSsoFwgfM+jf1z/SPwrkTMBOkCTBQAEAAA=' );
"
"--
"
"    init_core_font( 8, 'times', 'BI', 'Times-BoldItalic'
"
"      ,  'H4sIAAAAAAAAC8WSuw2DMBCGHegYwEuECajIAGwQ0TBFBnCfPktkAKagzgCRIqWi'
"
"      || 'oso9fr+Qo5RB+nT2ve+wMWYzf+fgjKmOJFelPhENnS0xANJXHfwHSBtjfoI8nMMj'
"
"      || 'tXo63xKW/Cx9ONRn3US6C/wWvYeYNr+LH2IY6cHGPkJfvsc5kX7mFjF+Vqs9iT6d'
"
"      || 'zwEL26y1Qz62nWlvD5VSf4R9zPuon/ne+C45+XxXf5lnTGLTOZCXPx8v9Qfdjdid'
"
"      || '5vD/f/+/pE/Ur14kG+xjTHRc84pZWsC2Hjk2+Hgbx78j4Z8W4DlL+rBnEN5Bie6L'
"
"      || 'fsL+1u/InuYCdsdaeAs+RxftKfGdfQDlDF/kAAQAAA==' );
"
"--
"
"    init_core_font( 9, 'courier', 'N', 'Courier', null );
"
"    for i in 0 .. 255
"
"    loop
"
"      g_fonts( 9 ).char_width_tab( i ) := 600;
"
"    end loop;
"
"--
"
"    init_core_font( 10, 'courier', 'I', 'Courier-Oblique', null );
"
"    g_fonts( 10 ).char_width_tab := g_fonts( 9 ).char_width_tab;
"
"--
"
"    init_core_font( 11, 'courier', 'B', 'Courier-Bold', null );
"
"    g_fonts( 11 ).char_width_tab := g_fonts( 9 ).char_width_tab;
"
"--
"
"    init_core_font( 12, 'courier', 'BI', 'Courier-BoldOblique', null );
"
"    g_fonts( 12 ).char_width_tab := g_fonts( 9 ).char_width_tab;
"
"--
"
"    init_core_font( 13, 'symbol', 'N', 'Symbol'
"
"      ,  'H4sIAAAAAAAAC82SIU8DQRCFZ28xIE+cqcbha4tENKk/gQCJJ6AweIK9H1CHqKnp'
"
"      || 'D2gTFBaDIcFwCQkJSTG83fem7SU0qYNLvry5nZ25t7NnZkv7c8LQrFhAP6GHZvEY'
"
"      || 'HOB9ylxGubTfNVRc34mKpFonzBQ/gUZ6Ds7AN6i5lv1dKv8Ab1eKQYSV4hUcgZFq'
"
"      || 'J/Sec7fQHtdTn3iqfvdrb7m3e2pZW+xDG3oIJ/Li3gfMr949rlU74DyT1/AuTX1f'
"
"      || 'YGhOzTP8B0/RggsEX/I03vgXPrrslZjfM8/pGu40t2ZjHgud97F7337mXP/GO4h9'
"
"      || '3WmPPaOJ/jrOs9yC52MlrtUzfWupfTX51X/L+13Vl/J/s4W2S3pSfSh5DmeXerMf'
"
"      || '+LXhWQAEAAA=' );
"
"--
"
"    init_core_font( 14, 'zapfdingbats', 'N', 'ZapfDingbats'
"
"      ,  'H4sIAAAAAAAAC83ROy9EQRjG8TkzjdJl163SSHR0EpdsVkSi2UahFhUljUKUIgoq'
"
"      || 'CrvJCtFQyG6EbSSERGxhC0ofQAQFxbIi8T/7PoUPIOEkvzxzzsycdy7O/fUTtToX'
"
"      || 'bnCuvHPOV8gk4r423ovkGQ5od5OTWMeesmBz/RuZIWv4wCAY4z/xjipeqflC9qAD'
"
"      || 'aRwxrxkJievSFzrRh36tZ1zttL6nkGX+A27xrLnttE/IBji9x7UvcIl9nPJ9AL36'
"
"      || 'd1L9hyihoDW10L62cwhNyhntryZVExYl3kMj+zym+CrJv6M8VozPmfr5L8uwJORL'
"
"      || 'tox7NFHG/Obj79FlwhqZ1X292xn6CbAXP/fjjv6rJYyBtUdl1vxEO6fcRB7bMmJ3'
"
"      || 'GYZsTN0GdrDL/Ao5j1GZNr5kwqydX5z1syoiYEq5gCtlSrXi+mVbi3PfVAuhoQAE'
"
"      || 'AAA=' );
"
"--
"
"  end;
"
"--
"
"  function to_char_round
"
"    ( p_value number
"
"    , p_precision pls_integer := 2
"
"    )
"
"  return varchar2
"
"  is
"
"  begin
"
"    return to_char( round( p_value, p_precision ), 'TM9', 'NLS_NUMERIC_CHARACTERS=.,' );
"
"  end;
"
"--
"
"  procedure raw2pdfdoc( p_raw blob )
"
"  is
"
"  begin
"
"    dbms_lob.append( g_pdf_doc, p_raw );
"
"  end;
"
"--
"
"  procedure txt2pdfdoc( p_txt varchar2 )
"
"  is
"
"  begin
"
"    raw2pdfdoc( utl_raw.concat( utl_raw.cast_to_raw( p_txt )
"
"                              , hextoraw( '0D0A' )
"
"                              )
"
"              );
"
"  end;
"
"--
"
"  function add_object( p_txt varchar2 := null )
"
"  return number
"
"  is
"
"    t_self number(10);
"
"  begin
"
"    t_self := g_objects.count( );
"
"    g_objects( t_self ) := dbms_lob.getlength( g_pdf_doc );
"
"    txt2pdfdoc( t_self || ' 0 obj' );
"
"--
"
"    if p_txt is not null
"
"    then
"
"      txt2pdfdoc( '<<' || p_txt || '>>' );
"
"      txt2pdfdoc( 'endobj' );
"
"    end if;
"
"--
"
"    return t_self;
"
"  end;
"
"--
"
"  procedure add_object( p_txt varchar2 := null )
"
"  is
"
"    t_dummy number(10) := add_object( p_txt );
"
"  begin
"
"    null;
"
"  end;
"
"--
"
"  function adler32( p_src in blob )
"
"  return varchar2
"
"  is
"
"    s1 number := 1;
"
"    s2 number := 0;
"
"    step_size number;
"
"    tmp varchar2(32766);
"
"    c65521 constant number := 65521;
"
"  begin
"
"    step_size := trunc( 16383 / dbms_lob.getchunksize( p_src ) ) * dbms_lob.getchunksize( p_src );
"
"    for j in 0 .. trunc( ( dbms_lob.getlength( p_src ) - 1 ) / step_size )
"
"    loop
"
"      tmp := rawtohex( dbms_lob.substr( p_src, step_size, j * step_size + 1 ) );
"
"      for i in 1 .. length( tmp ) / 2
"
"      loop
"
"        s1 := s1 + to_number( substr( tmp, i * 2 - 1, 2 ), 'xx' );
"
"        if s1 >= c65521
"
"        then
"
"          s1 := s1 - c65521;
"
"        end if;
"
"        s2 := s2 + s1;
"
"        if s2 >= c65521
"
"        then
"
"          s2 := s2 - c65521;
"
"        end if;
"
"      end loop;
"
"    end loop;
"
"    return to_char( s2, 'fm0XXX' ) || to_char( s1, 'fm0XXX' );
"
"  end;
"
"--
"
"  function flate_encode( p_val blob )
"
"    return blob
"
"  is
"
"    t_cpr blob;
"
"    t_blob blob;
"
"--
"
"  begin
"
"    t_cpr := utl_compress.lz_compress( p_val );
"
"    t_blob := hextoraw( '789C' );
"
"    dbms_lob.copy( t_blob
"
"                 , t_cpr
"
"                 , dbms_lob.getlength( t_cpr ) - 10 - 8
"
"                 , 3
"
"                 , 11
"
"                 );
"
"    dbms_lob.append( t_blob, hextoraw( adler32( p_val ) ) );
"
"    dbms_lob.freetemporary( t_cpr );
"
"--
"
"    return t_blob;
"
"  end;
"
"--
"
"  procedure put_stream
"
"    ( p_stream blob
"
"    , p_compress boolean := true
"
"    , p_extra varchar2 := ''
"
"    )
"
"  is
"
"    t_blob blob;
"
"  begin
"
"    if p_compress
"
"    then
"
"      t_blob := flate_encode( p_stream );
"
"      txt2pdfdoc( '<</Filter /FlateDecode /Length '
"
"                  || length( t_blob )
"
"                  || p_extra
"
"                  || '>>' );
"
"      txt2pdfdoc( 'stream' );
"
"      raw2pdfdoc( t_blob );
"
"      dbms_lob.freetemporary( t_blob );
"
"    else
"
"      txt2pdfdoc(  '<</Length '
"
"                || dbms_lob.getlength( p_stream )
"
"                || p_extra
"
"                || '>>' );
"
"      txt2pdfdoc( 'stream' );
"
"      raw2pdfdoc( p_stream );
"
"    end if;
"
"    txt2pdfdoc( 'endstream' );
"
"  end;
"
"--
"
"  function add_stream
"
"    ( p_stream blob
"
"    , p_extra varchar2 := ''
"
"    , p_compress boolean := true
"
"    )
"
"  return number
"
"  is
"
"    t_self number(10);
"
"  begin
"
"    t_self := add_object;
"
"    put_stream( p_stream
"
"              , p_compress
"
"              , p_extra
"
"              );
"
"    txt2pdfdoc( 'endobj' );
"
"    return t_self;
"
"  end;
"
"--
"
"  function subset_font( p_index pls_integer )
"
"  return blob
"
"  is
"
"    t_tmp blob;
"
"    t_header blob;
"
"    t_tables blob;
"
"    t_len pls_integer;
"
"    t_code pls_integer;
"
"    t_glyph pls_integer;
"
"    t_offset pls_integer;
"
"    t_factor pls_integer;
"
"    t_unicode pls_integer;
"
"    t_used_glyphs tp_pls_tab;
"
"    t_fmt varchar2(10);
"
"    t_utf16_charset varchar2(1000);
"
"  begin
"
"    if g_fonts( p_index ).cid
"
"    then
"
"      t_used_glyphs := g_fonts( p_index ).used_chars;
"
"      t_used_glyphs( 0 ) := 0;
"
"    else
"
"      t_utf16_charset := substr( g_fonts( p_index ).charset, 1, instr( g_fonts( p_index ).charset, '.' ) ) || 'AL16UTF16';
"
"      t_used_glyphs( 0 ) := 0;
"
"      t_code := g_fonts( p_index ).used_chars.first;
"
"      while t_code is not null
"
"      loop
"
"        t_unicode := utl_raw.cast_to_binary_integer( utl_raw.convert( hextoraw( to_char( t_code, 'fm0x' ) )
"
"                                                                    , t_utf16_charset
"
"                                                                    , g_fonts( p_index ).charset  -- ???? database characterset ?????
"
"                                                                    )
"
"                                                   );
"
"        if g_fonts( p_index ).flags = 4 -- a symbolic font
"
"        then
"
"-- assume code 32, space maps to the first code from the font
"
"          t_used_glyphs( g_fonts( p_index ).code2glyph( g_fonts( p_index ).code2glyph.first + t_unicode - 32 ) ) := 0;
"
"        else
"
"          t_used_glyphs( g_fonts( p_index ).code2glyph( t_unicode ) ) := 0;
"
"        end if;
"
"        t_code := g_fonts( p_index ).used_chars.next( t_code );
"
"      end loop;
"
"    end if;
"
"--
"
"    t_header := hextoraw( '00010000' );
"
"    dbms_lob.append( t_header, dbms_lob.substr( g_fonts( p_index ).fontfile2, 8, g_fonts( p_index ).ttf_offset + 4 ) );
"
"    t_offset := 12 + blob2num( g_fonts( p_index ).fontfile2, 2, g_fonts( p_index ).ttf_offset + 4 ) * 16;
"
"    dbms_lob.createtemporary( t_tables, true );
"
"    for i in 1 .. blob2num( g_fonts( p_index ).fontfile2, 2, g_fonts( p_index ).ttf_offset + 4 )
"
"    loop
"
"      case utl_raw.cast_to_varchar2( dbms_lob.substr( g_fonts( p_index ).fontfile2, 4, g_fonts( p_index ).ttf_offset - 4 + i * 16 ) )
"
"        when 'post'
"
"        then
"
"          dbms_lob.append( t_header, dbms_lob.substr( g_fonts( p_index ).fontfile2, 4, g_fonts( p_index ).ttf_offset - 4 + i * 16 ) ); -- tag
"
"          dbms_lob.append( t_header, hextoraw( '00000000' ) ); -- checksum
"
"          dbms_lob.append( t_header, utl_raw.cast_from_binary_integer( t_offset + dbms_lob.getlength( t_tables ) ) ); -- offset
"
"          dbms_lob.append( t_header, utl_raw.cast_from_binary_integer( 32 ) ); -- length
"
"          dbms_lob.append( t_tables
"
"                         , utl_raw.concat( hextoraw( '00030000' )
"
"                                         , dbms_lob.substr( g_fonts( p_index ).fontfile2
"
"                                                          , 28
"
"                                                          , blob2num( g_fonts( p_index ).fontfile2, 4, g_fonts( p_index ).ttf_offset + 4 + i * 16 ) + 5
"
"                                                          )
"
"                                         )
"
"                         );
"
"        when 'loca'
"
"        then
"
"          if g_fonts( p_index ).indexToLocFormat = 0
"
"          then
"
"            t_fmt := 'fm0XXX';
"
"          else
"
"            t_fmt := 'fm0XXXXXXX';
"
"          end if;
"
"          dbms_lob.createtemporary( t_tmp, true );
"
"          t_len := 0;
"
"          for g in 0 .. g_fonts( p_index ).numGlyphs - 1
"
"          loop
"
"            dbms_lob.append( t_tmp, hextoraw( to_char( t_len, t_fmt ) ) );
"
"            if t_used_glyphs.exists( g )
"
"            then
"
"              t_len := t_len + g_fonts( p_index ).loca( g + 1 ) - g_fonts( p_index ).loca( g );
"
"            end if;
"
"          end loop;
"
"          dbms_lob.append( t_tmp, hextoraw( to_char( t_len, t_fmt ) ) );
"
"          dbms_lob.append( t_header, dbms_lob.substr( g_fonts( p_index ).fontfile2, 4, g_fonts( p_index ).ttf_offset - 4 + i * 16 ) ); -- tag
"
"          dbms_lob.append( t_header, hextoraw( '00000000' ) ); -- checksum
"
"          dbms_lob.append( t_header, utl_raw.cast_from_binary_integer( t_offset + dbms_lob.getlength( t_tables ) ) ); -- offset
"
"          dbms_lob.append( t_header, utl_raw.cast_from_binary_integer( dbms_lob.getlength( t_tmp ) ) ); -- length
"
"          dbms_lob.append( t_tables, t_tmp );
"
"        when 'glyf'
"
"        then
"
"          if g_fonts( p_index ).indexToLocFormat = 0
"
"          then
"
"            t_factor := 2;
"
"          else
"
"            t_factor := 1;
"
"          end if;
"
"          dbms_lob.createtemporary( t_tmp, true );
"
"          for g in 0 .. g_fonts( p_index ).numGlyphs - 1
"
"          loop
"
"            if (   t_used_glyphs.exists( g )
"
"               and g_fonts( p_index ).loca( g + 1 ) > g_fonts( p_index ).loca( g )
"
"               )
"
"            then
"
"              dbms_lob.append( t_tmp
"
"                             , dbms_lob.substr( g_fonts( p_index ).fontfile2
"
"                                              , ( g_fonts( p_index ).loca( g + 1 ) - g_fonts( p_index ).loca( g ) ) * t_factor
"
"                                              , g_fonts( p_index ).loca( g ) * t_factor + blob2num( g_fonts( p_index ).fontfile2, 4, g_fonts( p_index ).ttf_offset + 4 + i * 16 ) + 1
"
"                                              )
"
"                             );
"
"            end if;
"
"          end loop;
"
"          dbms_lob.append( t_header, dbms_lob.substr( g_fonts( p_index ).fontfile2, 4, g_fonts( p_index ).ttf_offset - 4 + i * 16 ) ); -- tag
"
"          dbms_lob.append( t_header, hextoraw( '00000000' ) ); -- checksum
"
"          dbms_lob.append( t_header, utl_raw.cast_from_binary_integer( t_offset + dbms_lob.getlength( t_tables ) ) ); -- offset
"
"          dbms_lob.append( t_header, utl_raw.cast_from_binary_integer( dbms_lob.getlength( t_tmp ) ) ); -- length
"
"          dbms_lob.append( t_tables, t_tmp );
"
"        else
"
"          dbms_lob.append( t_header, dbms_lob.substr( g_fonts( p_index ).fontfile2, 4, g_fonts( p_index ).ttf_offset - 4 + i * 16 ) ); -- tag
"
"          dbms_lob.append( t_header, dbms_lob.substr( g_fonts( p_index ).fontfile2, 4, g_fonts( p_index ).ttf_offset + i * 16 ) ); -- checksum
"
"          dbms_lob.append( t_header, utl_raw.cast_from_binary_integer( t_offset + dbms_lob.getlength( t_tables ) ) ); -- offset
"
"          dbms_lob.append( t_header, dbms_lob.substr( g_fonts( p_index ).fontfile2, 4, g_fonts( p_index ).ttf_offset + 8 + i * 16 ) ); -- length
"
"          dbms_lob.copy( t_tables
"
"                       , g_fonts( p_index ).fontfile2
"
"                       , blob2num( g_fonts( p_index ).fontfile2, 4, g_fonts( p_index ).ttf_offset + 8 + i * 16 )
"
"                       , dbms_lob.getlength( t_tables ) + 1
"
"                       , blob2num( g_fonts( p_index ).fontfile2, 4, g_fonts( p_index ).ttf_offset + 4 + i * 16 ) + 1
"
"                       );
"
"      end case;
"
"    end loop;
"
"    dbms_lob.append( t_header, t_tables );
"
"    return t_header;
"
"    return g_fonts( p_index ).fontfile2;
"
"  end;
"
"--
"
"  function add_font( p_index pls_integer )
"
"  return number
"
"  is
"
"    t_self number(10);
"
"    t_fontfile number(10);
"
"    t_font_subset blob;
"
"    t_used pls_integer;
"
"    t_used_glyphs tp_pls_tab;
"
"    t_w varchar2(32767);
"
"    t_unicode pls_integer;
"
"    t_utf16_charset varchar2(1000);
"
"    t_width number;
"
"  begin
"
"    if g_fonts( p_index ).standard
"
"    then
"
"      return add_object( '/Type/Font'
"
"                       || '/Subtype/Type1'
"
"                       || '/BaseFont/' || g_fonts( p_index ).name
"
"                       || '/Encoding/WinAnsiEncoding' -- code page 1252
"
"                       );
"
"    end if;
"
"--
"
"    if g_fonts( p_index ).cid
"
"    then
"
"      t_self := add_object;
"
"      txt2pdfdoc( '<</Type/Font/Subtype/Type0/Encoding/Identity-H'
"
"                || '/BaseFont/' || g_fonts( p_index ).name
"
"                || '/DescendantFonts ' || to_char( t_self + 1 ) || ' 0 R'
"
"                || '/ToUnicode ' || to_char( t_self + 8 ) || ' 0 R'
"
"                || '>>' );
"
"      txt2pdfdoc( 'endobj' );
"
"      add_object;
"
"      txt2pdfdoc( '[' || to_char( t_self + 2 ) || ' 0 R]' );
"
"      txt2pdfdoc( 'endobj' );
"
"      add_object( '/Type/Font/Subtype/CIDFontType2/CIDToGIDMap/Identity/DW 1000'
"
"                || '/BaseFont/' || g_fonts( p_index ).name
"
"                || '/CIDSystemInfo ' || to_char( t_self + 3 ) || ' 0 R'
"
"                || '/W ' || to_char( t_self + 4 ) || ' 0 R'
"
"                || '/FontDescriptor ' || to_char( t_self + 5 ) || ' 0 R' );
"
"      add_object( '/Ordering(Identity) /Registry(Adobe) /Supplement 0' );
"
"--
"
"      t_utf16_charset := substr( g_fonts( p_index ).charset, 1, instr( g_fonts( p_index ).charset, '.' ) ) || 'AL16UTF16';
"
"      t_used_glyphs := g_fonts( p_index ).used_chars;
"
"      t_used_glyphs( 0 ) := 0;
"
"      t_used := t_used_glyphs.first();
"
"      while t_used is not null
"
"      loop
"
"        if g_fonts( p_index ).hmetrics.exists( t_used )
"
"        then
"
"          t_width := g_fonts( p_index ).hmetrics( t_used );
"
"        else
"
"          t_width := g_fonts( p_index ).hmetrics( g_fonts( p_index ).hmetrics.last() );
"
"        end if;
"
"        t_width := trunc( t_width * g_fonts( p_index ).unit_norm );
"
"        if t_used_glyphs.prior( t_used ) = t_used - 1
"
"        then
"
"          t_w := t_w || ' ' || t_width;
"
"        else
"
"          t_w := t_w || '] ' || t_used || ' [' || t_width;
"
"        end if;
"
"        t_used := t_used_glyphs.next( t_used );
"
"      end loop;
"
"      t_w := '[' || ltrim( t_w, '] ' ) || ']]';
"
"      add_object;
"
"      txt2pdfdoc( t_w );
"
"      txt2pdfdoc( 'endobj' );
"
"      add_object
"
"        (    '/Type/FontDescriptor'
"
"          || '/FontName/' || g_fonts( p_index ).name
"
"          || '/Flags ' || g_fonts( p_index ).flags
"
"          || '/FontBBox [' || g_fonts( p_index ).bb_xmin
"
"          || ' ' || g_fonts( p_index ).bb_ymin
"
"          || ' ' || g_fonts( p_index ).bb_xmax
"
"          || ' ' || g_fonts( p_index ).bb_ymax
"
"          || ']'
"
"          || '/ItalicAngle ' || to_char_round( g_fonts( p_index ).italic_angle )
"
"          || '/Ascent ' || g_fonts( p_index ).ascent
"
"          || '/Descent ' || g_fonts( p_index ).descent
"
"          || '/CapHeight ' || g_fonts( p_index ).capheight
"
"          || '/StemV ' || g_fonts( p_index ).stemv
"
"          || '/FontFile2 ' || to_char( t_self + 6 ) || ' 0 R' );
"
"      t_fontfile := add_stream( g_fonts( p_index ).fontfile2
"
"                              , '/Length1 ' || dbms_lob.getlength( g_fonts( p_index ).fontfile2 )
"
"                              , g_fonts( p_index ).compress_font
"
"                              );
"
"      t_font_subset := subset_font( p_index );
"
"      t_fontfile := add_stream( t_font_subset
"
"                              , '/Length1 ' || dbms_lob.getlength( t_font_subset )
"
"                              , g_fonts( p_index ).compress_font
"
"                              );
"
"      declare
"
"        t_g2c tp_pls_tab;
"
"        t_code     pls_integer;
"
"        t_c_start  pls_integer;
"
"        t_map varchar2(32767);
"
"        t_cmap varchar2(32767);
"
"        t_cor pls_integer;
"
"        t_cnt pls_integer;
"
"      begin
"
"        t_code := g_fonts( p_index ).code2glyph.first;
"
"        if g_fonts( p_index ).flags = 4 -- a symbolic font
"
"        then
"
"-- assume code 32, space maps to the first code from the font
"
"          t_cor := t_code - 32;
"
"        else
"
"          t_cor := 0;
"
"        end if;
"
"        while t_code is not null
"
"        loop
"
"          t_g2c( g_fonts( p_index ).code2glyph( t_code ) ) := t_code - t_cor;
"
"          t_code := g_fonts( p_index ).code2glyph.next( t_code );
"
"        end loop;
"
"        t_cnt := 0;
"
"        t_used_glyphs := g_fonts( p_index ).used_chars;
"
"        t_used := t_used_glyphs.first();
"
"        while t_used is not null
"
"        loop
"
"          t_map := t_map || '<' || to_char( t_used, 'FM0XXX' )
"
"                 || '> <' || to_char( t_g2c( t_used ), 'FM0XXX' )
"
"                 || '>' || chr( 10 );
"
"          if t_cnt = 99
"
"          then
"
"            t_cnt := 0;
"
"            t_cmap := t_cmap || chr( 10 ) || '100 beginbfchar' || chr( 10 ) || t_map || 'endbfchar';
"
"            t_map := '';
"
"          else
"
"            t_cnt := t_cnt + 1;
"
"          end if;
"
"          t_used := t_used_glyphs.next( t_used );
"
"        end loop;
"
"        if t_cnt > 0
"
"        then
"
"          t_cmap := t_cnt || ' beginbfchar' || chr( 10 ) || t_map || 'endbfchar';
"
"        end if;
"
"dbms_output.put_line( t_cmap );
"
"        t_fontfile := add_stream( utl_raw.cast_to_raw(
"
"'/CIDInit /ProcSet findresource begin 12 dict begin
"
"begincmap
"
"/CIDSystemInfo
"
"<< /Registry (Adobe) /Ordering (UCS) /Supplement 0 >> def
"
"/CMapName /Adobe-Identity-UCS def /CMapType 2 def
"
"1 begincodespacerange
"
"<0000> <FFFF>
"
"endcodespacerange
"
"' || t_cmap || '
"
"endcmap
"
"CMapName currentdict /CMap defineresource pop
"
"end
"
"end' ) );
"
"      end;
"
"      return t_self;
"
"    end if;
"
"--
"
"    g_fonts( p_index ).first_char := g_fonts( p_index ).used_chars.first();
"
"    g_fonts( p_index ).last_char := g_fonts( p_index ).used_chars.last();
"
"    t_self := add_object;
"
"    txt2pdfdoc( '<</Type /Font '
"
"              || '/Subtype /' || g_fonts( p_index ).subtype
"
"              || ' /BaseFont /' || g_fonts( p_index ).name
"
"              || ' /FirstChar ' || g_fonts( p_index ).first_char
"
"              || ' /LastChar ' || g_fonts( p_index ).last_char
"
"              || ' /Widths ' || to_char( t_self + 1 ) || ' 0 R'
"
"              || ' /FontDescriptor ' || to_char( t_self + 2 ) || ' 0 R'
"
"              || ' /Encoding ' || to_char( t_self + 3 ) || ' 0 R'
"
"              || ' >>' );
"
"    txt2pdfdoc( 'endobj' );
"
"    add_object;
"
"    txt2pdfdoc( '[' );
"
"      begin
"
"        for i in g_fonts( p_index ).first_char .. g_fonts( p_index ).last_char
"
"        loop
"
"          txt2pdfdoc( g_fonts( p_index ).char_width_tab( i ) );
"
"        end loop;
"
"      exception
"
"        when others
"
"        then
"
"          dbms_output.put_line( '**** ' || g_fonts( p_index ).name );
"
"      end;
"
"      txt2pdfdoc( ']' );
"
"      txt2pdfdoc( 'endobj' );
"
"      add_object
"
"        (    '/Type /FontDescriptor'
"
"          || ' /FontName /' || g_fonts( p_index ).name
"
"          || ' /Flags ' || g_fonts( p_index ).flags
"
"          || ' /FontBBox [' || g_fonts( p_index ).bb_xmin
"
"          || ' ' || g_fonts( p_index ).bb_ymin
"
"          || ' ' || g_fonts( p_index ).bb_xmax
"
"          || ' ' || g_fonts( p_index ).bb_ymax
"
"          || ']'
"
"          || ' /ItalicAngle ' || to_char_round( g_fonts( p_index ).italic_angle )
"
"          || ' /Ascent ' || g_fonts( p_index ).ascent
"
"          || ' /Descent ' || g_fonts( p_index ).descent
"
"          || ' /CapHeight ' || g_fonts( p_index ).capheight
"
"          || ' /StemV ' || g_fonts( p_index ).stemv
"
"          || case
"
"               when g_fonts( p_index ).fontfile2 is not null
"
"                 then ' /FontFile2 ' || to_char( t_self + 4 ) || ' 0 R'
"
"             end );
"
"      add_object(    '/Type /Encoding /BaseEncoding /WinAnsiEncoding '
"
"                         || g_fonts( p_index ).diff
"
"                         || ' ' );
"
"      if g_fonts( p_index ).fontfile2 is not null
"
"      then
"
"        t_font_subset := subset_font( p_index );
"
"        t_fontfile :=
"
"          add_stream( t_font_subset
"
"                    , '/Length1 ' || dbms_lob.getlength( t_font_subset )
"
"                    , g_fonts( p_index ).compress_font
"
"                    );
"
"    end if;
"
"    return t_self;
"
"  end;
"
"--
"
"  function add_resources
"
"  return number
"
"  is
"
"    t_ind pls_integer;
"
"    t_self number(10);
"
"    t_fonts tp_objects_tab;
"
"  begin
"
"--
"
"    t_ind := g_used_fonts.first;
"
"    while t_ind is not null
"
"    loop
"
"      t_fonts( t_ind ) := add_font( t_ind );
"
"      t_ind := g_used_fonts.next( t_ind );
"
"    end loop;
"
"--
"
"    t_self := add_object;
"
"    txt2pdfdoc( '<</ProcSet [/PDF /Text]' );
"
"    txt2pdfdoc( '/Font' );
"
"    txt2pdfdoc( '  <<' );
"
"    t_ind := g_used_fonts.first;
"
"    while t_ind is not null
"
"    loop
"
"      txt2pdfdoc( ' /F'|| to_char( t_ind ) || ' '
"
"                || to_char( t_fonts( t_ind ) ) || ' 0 R'
"
"                );
"
"      t_ind := g_used_fonts.next( t_ind );
"
"    end loop;
"
"    txt2pdfdoc( '  >>' );
"
"    txt2pdfdoc( '>>' );
"
"    txt2pdfdoc( 'endobj' );
"
"--
"
"    return t_self;
"
"  end;
"
"--
"
"  procedure add_page
"
"    ( p_page_ind pls_integer
"
"    , p_parent number
"
"    , p_resources number
"
"    )
"
"  is
"
"    t_content number(10);
"
"  begin
"
"    t_content := add_stream( g_pages( p_page_ind ) );
"
"    add_object;
"
"    txt2pdfdoc( '<< /Type /Page' );
"
"    txt2pdfdoc( '/Parent ' || to_char( p_parent ) || ' 0 R' );
"
"    txt2pdfdoc( '/Contents ' || to_char( t_content ) || ' 0 R' );
"
"    txt2pdfdoc( '/Resources ' || to_char( p_resources ) || ' 0 R' );
"
"    txt2pdfdoc( '>>' );
"
"    txt2pdfdoc( 'endobj' );
"
"  end;
"
"--
"
"  function add_pages
"
"  return number
"
"  is
"
"    t_self number(10);
"
"    t_resources number(10);
"
"  begin
"
"    t_resources := add_resources;
"
"    t_self := add_object;
"
"    txt2pdfdoc( '<</Type/Pages/Kids [' );
"
"--
"
"    for i in g_pages.first .. g_pages.last
"
"    loop
"
"      txt2pdfdoc( to_char( t_self + i * 2 + 2 ) || ' 0 R' );
"
"    end loop;
"
"--
"
"    txt2pdfdoc( ']' );
"
"    txt2pdfdoc( '/Count ' || g_pages.count() );
"
"    txt2pdfdoc(    '/MediaBox [0 0 '
"
"                || to_char_round( g_settings.page_width
"
"                                , 0
"
"                                )
"
"                || ' '
"
"                || to_char_round( g_settings.page_height
"
"                                , 0
"
"                                )
"
"                || ']' );
"
"    txt2pdfdoc( '>>' );
"
"    txt2pdfdoc( 'endobj' );
"
"--
"
"    for i in g_pages.first .. g_pages.last
"
"    loop
"
"      add_page( i, t_self, t_resources );
"
"    end loop;
"
"--
"
"    return t_self;
"
"  end;
"
"--
"
"  function add_catalogue
"
"  return number
"
"  is
"
"  begin
"
"    return add_object( '/Type/Catalog'
"
"                     || '/Pages ' || to_char( add_pages ) || ' 0 R'
"
"                     || '/OpenAction [0 /XYZ null null 0.77]'
"
"                     );
"
"  end;
"
"--
"
"  function add_info
"
"  return number
"
"  is
"
"    t_banner varchar2( 1000 );
"
"  begin
"
"    begin
"
"      select    'running on '
"
"             || replace( replace( replace( substr( banner
"
"                                                 , 1
"
"                                                 , 950
"
"                                                 )
"
"                                         , '\'
"
"                                         , '\\'
"
"                                         )
"
"                                , '('
"
"                                , '\('
"
"                                )
"
"                       , ')'
"
"                       , '\)'
"
"                       )
"
"      into t_banner
"
"      from v$version
"
"      where instr( upper( banner )
"
"                 , 'DATABASE'
"
"                 ) > 0;
"
"      t_banner := '/Producer (' || t_banner || ')';
"
"    exception
"
"      when others
"
"      then
"
"        null;
"
"    end;
"
"--
"
"    return add_object( to_char( sysdate, '""/CreationDate (D:""YYYYMMDDhh24miss"")""' )
"
"                     || '/Creator (AS-PDF 0.2.0 by Anton Scheffer)'
"
"                     || t_banner
"
"                     );
"
"  end;
"
"--
"
"  procedure finish_pdf
"
"  is
"
"    t_xref number;
"
"    t_info number(10);
"
"    t_catalogue number(10);
"
"  begin
"
"    dbms_lob.createtemporary( g_pdf_doc, true );
"
"    txt2pdfdoc( '%PDF-1.3' );
"
"    raw2pdfdoc( hextoraw( '25E2E3CFD30D0A' ) );          -- add a hex comment
"
"    t_info := add_info;
"
"    t_catalogue := add_catalogue;
"
"    t_xref := dbms_lob.getlength( g_pdf_doc );
"
"    txt2pdfdoc( 'xref' );
"
"    txt2pdfdoc( '0 ' || to_char( g_objects.count() ) );
"
"    txt2pdfdoc( '0000000000 65535 f ' );
"
"    for i in 1 .. g_objects.count( ) - 1
"
"    loop
"
"      txt2pdfdoc( to_char( g_objects( i ), 'fm0000000000' ) || ' 00000 n' );
"
"                        -- this line should be exactly 20 bytes, including EOL
"
"    end loop;
"
"    txt2pdfdoc( 'trailer' );
"
"    txt2pdfdoc( '<< /Root ' || to_char( t_catalogue ) || ' 0 R' );
"
"    txt2pdfdoc( '/Info ' || to_char( t_info ) || ' 0 R' );
"
"    txt2pdfdoc( '/Size ' || to_char( g_objects.count() ) );
"
"    txt2pdfdoc( '>>' );
"
"    txt2pdfdoc( 'startxref' );
"
"    txt2pdfdoc( to_char( t_xref ) );
"
"    txt2pdfdoc( '%%EOF' );
"
"--
"
"    g_objects.delete;
"
"    for i in g_pages.first .. g_pages.last
"
"    loop
"
"      dbms_lob.freetemporary( g_pages( i ) );
"
"    end loop;
"
"    g_objects.delete;
"
"    g_pages.delete;
"
"    g_fonts.delete;
"
"    g_used_fonts.delete;
"
"  end;
"
"--
"
"  procedure init
"
"  is
"
"  begin
"
"    g_objects.delete;
"
"    g_pages.delete;
"
"    g_fonts.delete;
"
"    g_used_fonts.delete;
"
"    g_settings := null;
"
"    g_current_font := null;
"
"    g_x := null;
"
"    g_y := null;
"
"    g_objects( 0 ) := 0;
"
"    init_core_fonts;
"
"    set_page_format;
"
"    set_page_orientation;
"
"    set_margins;
"
"  end;
"
"--
"
"  function get_pdf
"
"  return blob
"
"  is
"
"  begin
"
"    finish_pdf;
"
"    return g_pdf_doc;
"
"  end;
"
"--
"
"  procedure save_pdf
"
"    ( p_dir varchar2 := 'MY_DIR'
"
"    , p_filename varchar2 := 'my.pdf'
"
"    )
"
"  is
"
"  begin
"
"null;
"
"  end;
"
"--
"
"  function conv2uu( p_value number, p_unit varchar2 )
"
"  return number
"
"  is
"
"  begin
"
"    return case lower( p_unit )
"
"             when 'mm' then p_value * 72 / 25.4
"
"             when 'cm' then p_value * 72 / 2.54
"
"             when 'pt' then p_value          -- also point
"
"             when 'point' then p_value
"
"             when 'inch'  then p_value * 72
"
"             when 'in'    then p_value * 72  -- also inch
"
"             when 'pica'  then p_value * 12
"
"             when 'p'     then p_value * 12  -- also pica
"
"             when 'pc'    then p_value * 12  -- also pica
"
"             when 'em'    then p_value * 12  -- also pica
"
"             when 'px'    then p_value       -- pixel voorlopig op point zetten
"
"             when 'px'    then p_value * 0.8 -- pixel
"
"             else null
"
"           end;
"
"  end;
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
"    )
"
"  is
"
"  begin
"
"    g_settings.page_width := conv2uu( p_width, p_unit );
"
"    g_settings.page_height := conv2uu( p_height, p_unit );
"
"  end;
"
"--
"
"  procedure set_page_format( p_format varchar2 := 'A4' )
"
"  is
"
"  begin
"
"    case upper( p_format )
"
"      when 'A3'
"
"      then
"
"        set_page_size( 420, 297, 'mm' );
"
"      when 'A4'
"
"      then
"
"        set_page_size( 297, 210, 'mm' );
"
"      when 'A5'
"
"      then
"
"        set_page_size( 210, 148, 'mm' );
"
"      when 'A6'
"
"      then
"
"        set_page_size( 148, 105, 'mm' );
"
"      when 'LEGAL'
"
"      then
"
"        set_page_size( 14, 8.5, 'in' );
"
"      when 'LETTER'
"
"      then
"
"        set_page_size( 11, 8.5, 'in' );
"
"      when 'QUARTO'
"
"      then
"
"        set_page_size( 10, 8, 'in' );
"
"      when 'EXECUTIVE'
"
"      then
"
"        set_page_size( 10.5, 7.25, 'in' );
"
"      else
"
"        null;
"
"    end case;
"
"  end;
"
"--
"
"  procedure set_page_orientation( p_orientation varchar2 := 'PORTRAIT' )
"
"  is
"
"    t_tmp number;
"
"  begin
"
"    if (  (   upper( p_orientation ) in ( 'L', 'LANDSCAPE' )
"
"          and g_settings.page_height > g_settings.page_width
"
"          )
"
"       or ( upper( p_orientation ) in( 'P', 'PORTRAIT' )
"
"          and g_settings.page_height < g_settings.page_width
"
"          )
"
"       )
"
"    then
"
"      t_tmp := g_settings.page_width;
"
"      g_settings.page_width := g_settings.page_height;
"
"      g_settings.page_height := t_tmp;
"
"    end if;
"
"  end;
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
"    )
"
"  is
"
"    t_tmp number;
"
"  begin
"
"    t_tmp := nvl( conv2uu( p_top, p_unit ), -1 );
"
"    if t_tmp < 0 or t_tmp > g_settings.page_height
"
"    then
"
"      t_tmp := conv2uu( 3, 'cm' );
"
"    end if;
"
"    g_settings.margin_top := t_tmp;
"
"    t_tmp := nvl( conv2uu( p_bottom, p_unit ), -1 );
"
"    if t_tmp < 0 or t_tmp > g_settings.page_height
"
"    then
"
"      t_tmp := conv2uu( 4, 'cm' );
"
"    end if;
"
"    g_settings.margin_bottom := t_tmp;
"
"    t_tmp := nvl( conv2uu( p_left, p_unit ), -1 );
"
"    if t_tmp < 0 or t_tmp > g_settings.page_width
"
"    then
"
"      t_tmp := conv2uu( 1, 'cm' );
"
"    end if;
"
"    g_settings.margin_left := t_tmp;
"
"    t_tmp := nvl( conv2uu( p_right, p_unit ), -1 );
"
"    if t_tmp < 0 or t_tmp > g_settings.page_width
"
"    then
"
"      t_tmp := conv2uu( 1, 'cm' );
"
"    end if;
"
"    g_settings.margin_right := t_tmp;
"
"--
"
"    if g_settings.margin_top + g_settings.margin_bottom + conv2uu( 1, 'cm' )> g_settings.page_height
"
"    then
"
"      g_settings.margin_top := 0;
"
"      g_settings.margin_bottom := 0;
"
"    end if;
"
"    if g_settings.margin_left + g_settings.margin_right + conv2uu( 1, 'cm' )> g_settings.page_width
"
"    then
"
"      g_settings.margin_left := 0;
"
"      g_settings.margin_right := 0;
"
"    end if;
"
"  end;
"
"--
"
"  procedure raw2page( p_txt blob )
"
"  is
"
"  begin
"
"    dbms_lob.append( g_pages( g_pages.count( ) - 1 )
"
"                   , p_txt
"
"                   );
"
"    dbms_lob.append( g_pages( g_pages.count( ) - 1 )
"
"                   , hextoraw( '0D0A' )
"
"                   );
"
"  end;
"
"--
"
"  procedure txt2page( p_txt varchar2 )
"
"  is
"
"  begin
"
"    raw2page( utl_raw.cast_to_raw( p_txt ) );
"
"  end;
"
"--
"
"  procedure new_page
"
"  is
"
"  begin
"
"    g_pages( g_pages.count() ) := null;
"
"    dbms_lob.createtemporary( g_pages( g_pages.count() - 1 ), true );
"
"    if g_current_font is not null
"
"    then
"
"      txt2page( 'BT /F' || g_current_font || ' '
"
"              || to_char_round( g_fonts( g_current_font ).fontsize )
"
"              || ' Tf ET'
"
"              );
"
"    end if;
"
"  end;
"
"--
"
"  function pdf_string( p_txt in blob )
"
"  return blob
"
"  is
"
"    t_rv blob;
"
"    t_ind integer;
"
"    type tp_tab_raw is table of raw(1);
"
"    tab_raw tp_tab_raw
"
"      := tp_tab_raw( utl_raw.cast_to_raw( '\' )
"
"                   , utl_raw.cast_to_raw( '(' )
"
"                   , utl_raw.cast_to_raw( ')' )
"
"                   );
"
"  begin
"
"    t_rv := p_txt;
"
"    for i in tab_raw.first .. tab_raw.last
"
"    loop
"
"      t_ind := -1;
"
"      loop
"
"        t_ind := dbms_lob.instr( t_rv
"
"                               , tab_raw( i )
"
"                               , t_ind + 2
"
"                               );
"
"        exit when t_ind <= 0;
"
"        dbms_lob.copy( t_rv
"
"                     , t_rv
"
"                     , dbms_lob.lobmaxsize
"
"                     , t_ind + 1
"
"                     , t_ind
"
"                     );
"
"        dbms_lob.copy( t_rv
"
"                     , utl_raw.cast_to_raw( '\' )
"
"                     , 1
"
"                     , t_ind
"
"                     , 1
"
"                     );
"
"      end loop;
"
"    end loop;
"
"    return t_rv;
"
"  end;
"
"--
"
"  function txt2raw( p_txt varchar2 )
"
"  return raw
"
"  is
"
"    t_rv raw(32767);
"
"    t_unicode pls_integer;
"
"  begin
"
"    if g_fonts( g_current_font ).cid
"
"    then
"
"      for i in 1 .. length( p_txt )
"
"      loop
"
"        t_unicode := utl_raw.cast_to_binary_integer( utl_raw.convert( utl_raw.cast_to_raw( substr( p_txt, i, 1 ) )
"
"                                                                    , 'AMERICAN_AMERICA.AL16UTF16'
"
"                                                                    , sys_context( 'userenv', 'LANGUAGE' )  -- ???? font characterset ?????
"
"                                                                    )
"
"                                                 );
"
"        if g_fonts( g_current_font ).flags = 4 -- a symbolic font
"
"        then
"
"-- assume code 32, space maps to the first code from the font
"
"          t_unicode := g_fonts( g_current_font ).code2glyph.first + t_unicode - 32;
"
"        end if;
"
"        if g_fonts( g_current_font ).code2glyph.exists( t_unicode )
"
"        then
"
"          g_fonts( g_current_font ).used_chars( g_fonts( g_current_font ).code2glyph( t_unicode ) ) := 0;
"
"--dbms_output.put_line( 'put ' || g_fonts( g_current_font ).code2glyph( t_unicode ) );
"
"          t_rv := utl_raw.concat( t_rv
"
"                                , utl_raw.cast_to_raw( to_char( g_fonts( g_current_font ).code2glyph( t_unicode ), 'FM0XXX' ) )
"
"                                );
"
"        else
"
"          t_rv := utl_raw.concat( t_rv, utl_raw.cast_to_raw( '0000' ) );
"
"        end if;
"
"      end loop;
"
"      t_rv := utl_raw.concat( utl_raw.cast_to_raw( '<' )
"
"                            , t_rv
"
"                            , utl_raw.cast_to_raw( '>' )
"
"                            );
"
"    else
"
"      t_rv := utl_raw.convert( utl_raw.cast_to_raw( p_txt )
"
"                             , g_fonts( g_current_font ).charset
"
"                             , sys_context( 'userenv', 'LANGUAGE' )
"
"                             );
"
"      for i in 1 .. utl_raw.length( t_rv )
"
"      loop
"
"        g_fonts( g_current_font ).used_chars( raw2num( utl_raw.substr( t_rv, i, 1 ) ) ) := 0;
"
"      end loop;
"
"      t_rv := utl_raw.concat( utl_raw.cast_to_raw( '(' )
"
"                            , pdf_string( t_rv )
"
"                            , utl_raw.cast_to_raw( ')' )
"
"                            );
"
"    end if;
"
"    return t_rv;
"
"  end;
"
"--
"
"  procedure put_raw( p_x number, p_y number, p_txt raw )
"
"  is
"
"  begin
"
"    raw2page( utl_raw.concat( utl_raw.cast_to_raw( 'BT ' )
"
"                            , utl_raw.cast_to_raw( to_char_round( p_x )
"
"                                                 || ' '
"
"                                                 || to_char_round( p_y )
"
"                                                 )
"
"                            , utl_raw.cast_to_raw( ' Td ' )
"
"                            , p_txt
"
"                            , utl_raw.cast_to_raw( ' Tj ET' )
"
"                            )
"
"            );
"
"  end;
"
"--
"
"  procedure put_txt( p_x number, p_y number, p_txt varchar2 )
"
"  is
"
"  begin
"
"    if p_txt is not null
"
"    then
"
"      if g_current_font is null
"
"      then
"
"        set_font( 'helvetica' );
"
"      end if;
"
"      if g_pages.count() = 0
"
"      then
"
"        new_page;
"
"      end if;
"
"      put_raw( p_x, p_y, txt2raw( p_txt ) );
"
"    end if;
"
"  end;
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
"    , p_start in number := null  -- left side of the available text box
"
"    , p_width in number := null  -- width of the available text box
"
"    , p_alignment in varchar2 := null
"
"    )
"
"  is
"
"    t_line_height number;
"
"    t_x number;
"
"    t_y number;
"
"    t_start number;
"
"    t_width number;
"
"    t_len number;
"
"    t_cnt pls_integer;
"
"    t_ind pls_integer;
"
"    t_alignment varchar2(100);
"
"  begin
"
"    if p_txt is null
"
"    then
"
"      return;
"
"    end if;
"
"--
"
"    if g_current_font is null
"
"    then
"
"      set_font( 'helvetica' );
"
"    end if;
"
"    if g_pages.count() = 0
"
"    then
"
"      new_page;
"
"    end if;
"
"--
"
"    t_line_height := nvl( p_line_height, g_fonts( g_current_font ).fontsize );
"
"    if (  t_line_height < g_fonts( g_current_font ).fontsize
"
"       or t_line_height > ( g_settings.page_height - g_settings.margin_top - t_line_height ) / 4
"
"       )
"
"    then
"
"      t_line_height := g_fonts( g_current_font ).fontsize;
"
"    end if;
"
"    t_start := nvl( p_start, g_settings.margin_left );
"
"    if (  t_start < g_settings.margin_left
"
"       or t_start > g_settings.page_width - g_settings.margin_right - g_settings.margin_left
"
"       )
"
"    then
"
"      t_start := g_settings.margin_left;
"
"    end if;
"
"    t_width := nvl( p_width
"
"                  , g_settings.page_width - g_settings.margin_right - g_settings.margin_left
"
"                  );
"
"    if (  t_width < str_len( '   ' )
"
"       or t_width > g_settings.page_width - g_settings.margin_right - g_settings.margin_left
"
"       )
"
"    then
"
"      t_width := g_settings.page_width - g_settings.margin_right - g_settings.margin_left;
"
"    end if;
"
"    t_x := coalesce( p_x, g_x, g_settings.margin_left );
"
"    t_y := coalesce( p_y
"
"                   , g_y
"
"                   , g_settings.page_height - g_settings.margin_top - t_line_height
"
"                   );
"
"    if t_x > t_start + t_width
"
"    then
"
"      t_x := t_start;
"
"      t_y := t_y - t_line_height;
"
"    elsif t_x < t_start
"
"    then
"
"      t_x := t_start;
"
"    end if;
"
"    if t_y < g_settings.margin_bottom
"
"    then
"
"      new_page;
"
"      t_x := t_start;
"
"      t_y := g_settings.page_height - g_settings.margin_top - t_line_height;
"
"    end if;
"
"--
"
"    t_ind := instr( p_txt, chr(10) );
"
"    if t_ind > 0
"
"    then
"
"      g_x := t_x;
"
"      g_y := t_y;
"
"      write( rtrim( substr( p_txt, 1, t_ind - 1 ), chr(13) ), t_x, t_y, t_line_height, t_start, t_width, p_alignment );
"
"      t_y := g_y - t_line_height;
"
"      if t_y < g_settings.margin_bottom
"
"      then
"
"        new_page;
"
"        t_y := g_settings.page_height - g_settings.margin_top - t_line_height;
"
"      end if;
"
"      g_x := t_start;
"
"      g_y := t_y;
"
"      write( substr( p_txt, t_ind + 1 ), t_start, t_y, t_line_height, t_start, t_width, p_alignment );
"
"      return;
"
"    end if;
"
"--
"
"    t_len := str_len( p_txt );
"
"    if t_len <= t_width - t_x + t_start
"
"    then
"
"      t_alignment := lower( substr( p_alignment, 1, 100 ) );
"
"      if instr( t_alignment, 'right' ) > 0 or instr( t_alignment, 'end' ) > 0
"
"      then
"
"        t_x := t_start + t_width - t_len;
"
"      elsif instr( t_alignment, 'center' ) > 0
"
"      then
"
"        t_x := ( t_width + t_x + t_start - t_len ) / 2;
"
"      end if;
"
"      put_txt( t_x, t_y, p_txt );
"
"      g_x := t_x + t_len + str_len( ' ' );
"
"      g_y := t_y;
"
"      return;
"
"    end if;
"
"--
"
"    t_cnt := 0;
"
"    while (   instr( p_txt, ' ', 1, t_cnt + 1 ) > 0
"
"          and str_len( substr( p_txt, 1, instr( p_txt, ' ', 1, t_cnt + 1 ) - 1 ) ) <= t_width - t_x + t_start
"
"          )
"
"    loop
"
"      t_cnt := t_cnt + 1;
"
"    end loop;
"
"    if t_cnt > 0
"
"    then
"
"      t_ind := instr( p_txt, ' ', 1, t_cnt );
"
"      write( substr( p_txt, 1, t_ind - 1 ), t_x, t_y, t_line_height, t_start, t_width, p_alignment );
"
"      t_y := t_y - t_line_height;
"
"      if t_y < g_settings.margin_bottom
"
"      then
"
"        new_page;
"
"        t_y := g_settings.page_height - g_settings.margin_top - t_line_height;
"
"      end if;
"
"      write( substr( p_txt, t_ind + 1 ), t_start, t_y, t_line_height, t_start, t_width, p_alignment );
"
"      return;
"
"    end if;
"
"--
"
"    if t_x > t_start and t_len < t_width
"
"    then
"
"      t_y := t_y - t_line_height;
"
"      if t_y < g_settings.margin_bottom
"
"      then
"
"        new_page;
"
"        t_y := g_settings.page_height - g_settings.margin_top - t_line_height;
"
"      end if;
"
"      write( p_txt, t_start, t_y, t_line_height, t_start, t_width, p_alignment );
"
"    else
"
"      t_ind := 2; -- start with 2 to make sure we get amaller string!
"
"      while str_len( substr( p_txt, 1, t_ind ) ) <= t_width - t_x + t_start
"
"      loop
"
"        t_ind := t_ind + 1;
"
"      end loop;
"
"      write( substr( p_txt, 1, t_ind - 1 ), t_x, t_y, t_line_height, t_start, t_width, p_alignment );
"
"      t_y := t_y - t_line_height;
"
"      if t_y < g_settings.margin_bottom
"
"      then
"
"        new_page;
"
"        t_y := g_settings.page_height - g_settings.margin_top - t_line_height;
"
"      end if;
"
"      write( substr( p_txt, t_ind ), t_start, t_y, t_line_height, t_start, t_width, p_alignment );
"
"    end if;
"
"  end;
"
"--
"
"  function str_len( p_txt in varchar2 )
"
"  return number
"
"  is
"
"    t_width number;
"
"    t_char pls_integer;
"
"    t_rtxt raw(32767);
"
"    t_tmp number;
"
"    t_font tp_font;
"
"  begin
"
"    if p_txt is null
"
"    then
"
"      return 0;
"
"    end if;
"
"--
"
"    t_width := 0;
"
"    t_font := g_fonts( g_current_font );
"
"    if t_font.cid
"
"    then
"
"      t_rtxt := utl_raw.convert( utl_raw.cast_to_raw( p_txt )
"
"                               , 'AMERICAN_AMERICA.AL16UTF16' -- 16 bit font => 2 bytes per char
"
"                               , sys_context( 'userenv', 'LANGUAGE' )  -- ???? font characterset ?????
"
"                               );
"
"      for i in 1 .. utl_raw.length( t_rtxt ) / 2
"
"      loop
"
"        t_char := utl_raw.cast_to_binary_integer( utl_raw.convert( utl_raw.cast_to_raw( substr( p_txt, i, 1 ) )
"
"                                                                 , 'AMERICAN_AMERICA.AL16UTF16'
"
"                                                                 , sys_context( 'userenv', 'LANGUAGE' )  -- ???? font characterset ?????
"
"                                                                 )
"
"                                               );
"
"        t_char := raw2num( utl_raw.substr( t_rtxt, i * 2 - 1, 2 ) );
"
"        if t_font.flags = 4 -- a symbolic font
"
"        then
"
"-- assume code 32, space maps to the first code from the font
"
"          t_char := t_font.code2glyph.first + t_char - 32;
"
"        end if;
"
"        if (   t_font.code2glyph.exists( t_char )
"
"           and t_font.hmetrics.exists( t_font.code2glyph( t_char ) )
"
"           )
"
"        then
"
"--dbms_output.put_line( 'len ' || t_font.code2glyph( t_char ) );
"
"          t_tmp := t_font.hmetrics( t_font.code2glyph( t_char ) );
"
"        else
"
"          t_tmp := t_font.hmetrics( t_font.hmetrics.last() );
"
"        end if;
"
"        t_width := t_width + t_tmp;
"
"      end loop;
"
"      t_width := t_width * t_font.unit_norm;
"
"      t_width := t_width * t_font.fontsize / 1000;
"
"    else
"
"      t_rtxt := utl_raw.convert( utl_raw.cast_to_raw( p_txt )
"
"                               , t_font.charset
"
"                               , sys_context( 'userenv', 'LANGUAGE' )
"
"                               );
"
"      for i in 1 .. utl_raw.length( t_rtxt )
"
"      loop
"
"        t_char := raw2num( utl_raw.substr( t_rtxt, i, 1 ) );
"
"        t_width := t_width + t_font.char_width_tab( t_char );
"
"      end loop;
"
"      t_width := t_width * t_font.fontsize / 1000;
"
"    end if;
"
"    return t_width;
"
"  end;
"
"--
"
"  procedure set_font
"
"    ( p_fontname varchar2
"
"    , p_fontsize_pt pls_integer
"
"    )
"
"  is
"
"    t_fontname varchar2(100);
"
"  begin
"
"    if p_fontname is null and p_fontsize_pt is null
"
"    then
"
"      return;
"
"    end if;
"
"--
"
"    if (   p_fontname is null
"
"       and p_fontsize_pt is not null
"
"       and g_current_font is not null
"
"       )
"
"    then
"
"      g_fonts( g_current_font ).fontsize := p_fontsize_pt;
"
"      if g_pages.count( ) > 0
"
"      then
"
"        txt2page( 'BT /F' || g_current_font || ' '
"
"                || to_char_round( g_fonts( g_current_font ).fontsize ) || ' Tf ET'
"
"                );
"
"      end if;
"
"      return;
"
"    end if;
"
"--
"
"    t_fontname := upper( p_fontname );
"
"    for i in g_fonts.first .. g_fonts.last
"
"    loop
"
"      if upper( g_fonts( i ).fontname ) = t_fontname
"
"      then
"
"        g_current_font := i;
"
"        g_fonts( i ).fontsize := coalesce( p_fontsize_pt
"
"                                         , g_fonts( i ).fontsize
"
"                                         , 12
"
"                                         );
"
"        g_used_fonts( i ) := 0;
"
"--
"
"        if g_pages.count( ) > 0
"
"        then
"
"          txt2page( 'BT /F' || i || ' '
"
"                  || to_char_round( g_fonts( i ).fontsize ) || ' Tf ET'
"
"                  );
"
"        end if;
"
"        exit;
"
"      end if;
"
"    end loop;
"
"  end;
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
"    )
"
"  is
"
"    t_family varchar2(100);
"
"    t_style varchar2(100);
"
"  begin
"
"    if ( p_family || p_style is null and p_fontsize_pt is null )
"
"    then
"
"      return;
"
"    end if;
"
"    t_family := nvl( lower( p_family )
"
"                   , case when g_current_font is not null then g_fonts( g_current_font ).family end
"
"                   );
"
"    t_style := nvl( replace(
"
"                    replace(
"
"                    replace(
"
"                    replace(
"
"                    replace( upper( p_style )
"
"                            , 'NORMAL', 'N' )
"
"                            , 'REGULAR', 'N' )
"
"                            , 'BOLD', 'B' )
"
"                            , 'ITALIC', 'I' )
"
"                            , 'OBLIQUE', 'I' )
"
"                  , case when g_current_font is not null then g_fonts( g_current_font ).style end
"
"                  );
"
"--
"
"    for i in g_fonts.first .. g_fonts.last
"
"    loop
"
"      if (     g_fonts( i ).family = t_family
"
"           and g_fonts( i ).style = t_style
"
"         )
"
"      then
"
"        g_current_font := i;
"
"        g_fonts( i ).fontsize := coalesce( p_fontsize_pt
"
"                                         , g_fonts( i ).fontsize
"
"                                         , 12
"
"                                         );
"
"        g_used_fonts( i ) := 0;
"
"--
"
"        if g_pages.count( ) > 0
"
"        then
"
"          txt2page( 'BT /F' || i || ' '
"
"                  || to_char_round( g_fonts( i ).fontsize ) || ' Tf ET'
"
"                  );
"
"        end if;
"
"        exit;
"
"      end if;
"
"    end loop;
"
"  end;
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
"  return varchar2
"
"  is
"
"    this_font tp_font;
"
"    type tp_font_table is record
"
"      ( offset pls_integer
"
"      , length pls_integer
"
"      );
"
"    type tp_tables is table of tp_font_table index by varchar2(4);
"
"    t_tables tp_tables;
"
"    t_tag varchar2(4);
"
"    t_blob blob;
"
"    t_offset pls_integer;
"
"    nr_hmetrics pls_integer;
"
"    subtype tp_glyphname is varchar2(250);
"
"    type tp_glyphnames is table of tp_glyphname index by pls_integer;
"
"    t_glyphnames tp_glyphnames;
"
"    t_glyph2name tp_pls_tab;
"
"  begin
"
"    if dbms_lob.substr( p_font, 4, p_offset ) != hextoraw( '00010000' ) --  OpenType Font
"
"    then
"
"      return null;
"
"    end if;
"
"    for i in 1 .. blob2num( p_font, 2, p_offset + 4 )
"
"    loop
"
"      t_tag :=
"
"        utl_raw.cast_to_varchar2( dbms_lob.substr( p_font, 4, p_offset - 4 + i * 16 ) );
"
"      t_tables( t_tag ).offset := blob2num( p_font, 4, p_offset + 4 + i * 16 ) + 1;
"
"      t_tables( t_tag ).length := blob2num( p_font, 4, p_offset + 8 + i * 16 );
"
"    end loop;
"
"--
"
"    if (  not t_tables.exists( 'cmap' )
"
"       or not t_tables.exists( 'glyf' )
"
"       or not t_tables.exists( 'head' )
"
"       or not t_tables.exists( 'hhea' )
"
"       or not t_tables.exists( 'hmtx' )
"
"       or not t_tables.exists( 'loca' )
"
"       or not t_tables.exists( 'maxp' )
"
"       or not t_tables.exists( 'name' )
"
"       or not t_tables.exists( 'post' )
"
"       )
"
"    then
"
"      return null;
"
"    end if;
"
"--
"
"    dbms_lob.createtemporary( t_blob, true );
"
"    dbms_lob.copy( t_blob, p_font, t_tables( 'maxp' ).length, 1, t_tables( 'maxp' ).offset );
"
"    this_font.numGlyphs := blob2num( t_blob, 2, 5 );
"
"--
"
"    dbms_lob.copy( t_blob, p_font, t_tables( 'cmap' ).length, 1, t_tables( 'cmap' ).offset );
"
"    for i in 0 .. blob2num( t_blob, 2, 3 ) - 1
"
"    loop
"
"      if (   dbms_lob.substr( t_blob, 2, 5 + i * 8 ) = hextoraw( '0003' ) -- Windows
"
"         and dbms_lob.substr( t_blob, 2, 5 + i * 8 + 2 )
"
"               in ( hextoraw( '0000' ) -- Symbol
"
"                  , hextoraw( '0001' ) -- Unicode BMP (UCS-2)
"
"                  )
"
"         )
"
"      then
"
"        if dbms_lob.substr( t_blob, 2, 5 + i * 8 + 2 ) = hextoraw( '0000' ) -- Symbol
"
"        then
"
"          this_font.flags := 4; -- symbolic
"
"        else
"
"          this_font.flags := 32; -- non-symbolic
"
"        end if;
"
"        t_offset := blob2num( t_blob, 4, 5 + i * 8 + 4 ) + 1;
"
"        if dbms_lob.substr( t_blob, 2, t_offset ) != hextoraw( '0004' )
"
"        then
"
"          return null;
"
"        end if;
"
"        declare
"
"          t_seg_cnt pls_integer;
"
"          t_end_offs pls_integer;
"
"          t_start_offs pls_integer;
"
"          t_idDelta_offs pls_integer;
"
"          t_idRangeOffset_offs pls_integer;
"
"          t_tmp pls_integer;
"
"          t_start pls_integer;
"
"        begin
"
"          t_seg_cnt := blob2num( t_blob, 2, t_offset + 6 ) / 2;
"
"          t_end_offs := t_offset + 14;
"
"          t_start_offs := t_end_offs + t_seg_cnt * 2 + 2;
"
"          t_idDelta_offs := t_start_offs + t_seg_cnt * 2;
"
"          t_idRangeOffset_offs := t_idDelta_offs + t_seg_cnt * 2;
"
"          for seg in 0 .. t_seg_cnt - 1
"
"          loop
"
"            t_tmp := blob2num( t_blob, 2, t_idRangeOffset_offs + seg * 2 );
"
"            if t_tmp = 0
"
"            then
"
"              t_tmp := blob2num( t_blob, 2, t_idDelta_offs + seg * 2 );
"
"              for c in blob2num( t_blob, 2, t_start_offs + seg * 2 )
"
"                    .. blob2num( t_blob, 2, t_end_offs + seg * 2 )
"
"              loop
"
"                this_font.code2glyph( c ) := mod( c + t_tmp, 65536 );
"
"              end loop;
"
"            else
"
"              t_start := blob2num( t_blob, 2, t_start_offs + seg * 2 );
"
"              for c in t_start .. blob2num( t_blob, 2, t_end_offs + seg * 2 )
"
"              loop
"
"                this_font.code2glyph( c ) := blob2num( t_blob, 2, t_idRangeOffset_offs + t_tmp + ( seg + c - t_start ) * 2 );
"
"              end loop;
"
"            end if;
"
"          end loop;
"
"        end;
"
"        exit;
"
"      end if;
"
"    end loop;
"
"--
"
"    t_glyphnames( 0 ) := '.notdef';
"
"    t_glyphnames( 1 ) := '.null';
"
"    t_glyphnames( 2 ) := 'nonmarkingreturn';
"
"    t_glyphnames( 3 ) := 'space';
"
"    t_glyphnames( 4 ) := 'exclam';
"
"    t_glyphnames( 5 ) := 'quotedbl';
"
"    t_glyphnames( 6 ) := 'numbersign';
"
"    t_glyphnames( 7 ) := 'dollar';
"
"    t_glyphnames( 8 ) := 'percent';
"
"    t_glyphnames( 9 ) := 'ampersand';
"
"    t_glyphnames( 10 ) := 'quotesingle';
"
"    t_glyphnames( 11 ) := 'parenleft';
"
"    t_glyphnames( 12 ) := 'parenright';
"
"    t_glyphnames( 13 ) := 'asterisk';
"
"    t_glyphnames( 14 ) := 'plus';
"
"    t_glyphnames( 15 ) := 'comma';
"
"    t_glyphnames( 16 ) := 'hyphen';
"
"    t_glyphnames( 17 ) := 'period';
"
"    t_glyphnames( 18 ) := 'slash';
"
"    t_glyphnames( 19 ) := 'zero';
"
"    t_glyphnames( 20 ) := 'one';
"
"    t_glyphnames( 21 ) := 'two';
"
"    t_glyphnames( 22 ) := 'three';
"
"    t_glyphnames( 23 ) := 'four';
"
"    t_glyphnames( 24 ) := 'five';
"
"    t_glyphnames( 25 ) := 'six';
"
"    t_glyphnames( 26 ) := 'seven';
"
"    t_glyphnames( 27 ) := 'eight';
"
"    t_glyphnames( 28 ) := 'nine';
"
"    t_glyphnames( 29 ) := 'colon';
"
"    t_glyphnames( 30 ) := 'semicolon';
"
"    t_glyphnames( 31 ) := 'less';
"
"    t_glyphnames( 32 ) := 'equal';
"
"    t_glyphnames( 33 ) := 'greater';
"
"    t_glyphnames( 34 ) := 'question';
"
"    t_glyphnames( 35 ) := 'at';
"
"    t_glyphnames( 36 ) := 'A';
"
"    t_glyphnames( 37 ) := 'B';
"
"    t_glyphnames( 38 ) := 'C';
"
"    t_glyphnames( 39 ) := 'D';
"
"    t_glyphnames( 40 ) := 'E';
"
"    t_glyphnames( 41 ) := 'F';
"
"    t_glyphnames( 42 ) := 'G';
"
"    t_glyphnames( 43 ) := 'H';
"
"    t_glyphnames( 44 ) := 'I';
"
"    t_glyphnames( 45 ) := 'J';
"
"    t_glyphnames( 46 ) := 'K';
"
"    t_glyphnames( 47 ) := 'L';
"
"    t_glyphnames( 48 ) := 'M';
"
"    t_glyphnames( 49 ) := 'N';
"
"    t_glyphnames( 50 ) := 'O';
"
"    t_glyphnames( 51 ) := 'P';
"
"    t_glyphnames( 52 ) := 'Q';
"
"    t_glyphnames( 53 ) := 'R';
"
"    t_glyphnames( 54 ) := 'S';
"
"    t_glyphnames( 55 ) := 'T';
"
"    t_glyphnames( 56 ) := 'U';
"
"    t_glyphnames( 57 ) := 'V';
"
"    t_glyphnames( 58 ) := 'W';
"
"    t_glyphnames( 59 ) := 'X';
"
"    t_glyphnames( 60 ) := 'Y';
"
"    t_glyphnames( 61 ) := 'Z';
"
"    t_glyphnames( 62 ) := 'bracketleft';
"
"    t_glyphnames( 63 ) := 'backslash';
"
"    t_glyphnames( 64 ) := 'bracketright';
"
"    t_glyphnames( 65 ) := 'asciicircum';
"
"    t_glyphnames( 66 ) := 'underscore';
"
"    t_glyphnames( 67 ) := 'grave';
"
"    t_glyphnames( 68 ) := 'a';
"
"    t_glyphnames( 69 ) := 'b';
"
"    t_glyphnames( 70 ) := 'c';
"
"    t_glyphnames( 71 ) := 'd';
"
"    t_glyphnames( 72 ) := 'e';
"
"    t_glyphnames( 73 ) := 'f';
"
"    t_glyphnames( 74 ) := 'g';
"
"    t_glyphnames( 75 ) := 'h';
"
"    t_glyphnames( 76 ) := 'i';
"
"    t_glyphnames( 77 ) := 'j';
"
"    t_glyphnames( 78 ) := 'k';
"
"    t_glyphnames( 79 ) := 'l';
"
"    t_glyphnames( 80 ) := 'm';
"
"    t_glyphnames( 81 ) := 'n';
"
"    t_glyphnames( 82 ) := 'o';
"
"    t_glyphnames( 83 ) := 'p';
"
"    t_glyphnames( 84 ) := 'q';
"
"    t_glyphnames( 85 ) := 'r';
"
"    t_glyphnames( 86 ) := 's';
"
"    t_glyphnames( 87 ) := 't';
"
"    t_glyphnames( 88 ) := 'u';
"
"    t_glyphnames( 89 ) := 'v';
"
"    t_glyphnames( 90 ) := 'w';
"
"    t_glyphnames( 91 ) := 'x';
"
"    t_glyphnames( 92 ) := 'y';
"
"    t_glyphnames( 93 ) := 'z';
"
"    t_glyphnames( 94 ) := 'braceleft';
"
"    t_glyphnames( 95 ) := 'bar';
"
"    t_glyphnames( 96 ) := 'braceright';
"
"    t_glyphnames( 97 ) := 'asciitilde';
"
"    t_glyphnames( 98 ) := 'Adieresis';
"
"    t_glyphnames( 99 ) := 'Aring';
"
"    t_glyphnames( 100 ) := 'Ccedilla';
"
"    t_glyphnames( 101 ) := 'Eacute';
"
"    t_glyphnames( 102 ) := 'Ntilde';
"
"    t_glyphnames( 103 ) := 'Odieresis';
"
"    t_glyphnames( 104 ) := 'Udieresis';
"
"    t_glyphnames( 105 ) := 'aacute';
"
"    t_glyphnames( 106 ) := 'agrave';
"
"    t_glyphnames( 107 ) := 'acircumflex';
"
"    t_glyphnames( 108 ) := 'adieresis';
"
"    t_glyphnames( 109 ) := 'atilde';
"
"    t_glyphnames( 110 ) := 'aring';
"
"    t_glyphnames( 111 ) := 'ccedilla';
"
"    t_glyphnames( 112 ) := 'eacute';
"
"    t_glyphnames( 113 ) := 'egrave';
"
"    t_glyphnames( 114 ) := 'ecircumflex';
"
"    t_glyphnames( 115 ) := 'edieresis';
"
"    t_glyphnames( 116 ) := 'iacute';
"
"    t_glyphnames( 117 ) := 'igrave';
"
"    t_glyphnames( 118 ) := 'icircumflex';
"
"    t_glyphnames( 119 ) := 'idieresis';
"
"    t_glyphnames( 120 ) := 'ntilde';
"
"    t_glyphnames( 121 ) := 'oacute';
"
"    t_glyphnames( 122 ) := 'ograve';
"
"    t_glyphnames( 123 ) := 'ocircumflex';
"
"    t_glyphnames( 124 ) := 'odieresis';
"
"    t_glyphnames( 125 ) := 'otilde';
"
"    t_glyphnames( 126 ) := 'uacute';
"
"    t_glyphnames( 127 ) := 'ugrave';
"
"    t_glyphnames( 128 ) := 'ucircumflex';
"
"    t_glyphnames( 129 ) := 'udieresis';
"
"    t_glyphnames( 130 ) := 'dagger';
"
"    t_glyphnames( 131 ) := 'degree';
"
"    t_glyphnames( 132 ) := 'cent';
"
"    t_glyphnames( 133 ) := 'sterling';
"
"    t_glyphnames( 134 ) := 'section';
"
"    t_glyphnames( 135 ) := 'bullet';
"
"    t_glyphnames( 136 ) := 'paragraph';
"
"    t_glyphnames( 137 ) := 'germandbls';
"
"    t_glyphnames( 138 ) := 'registered';
"
"    t_glyphnames( 139 ) := 'copyright';
"
"    t_glyphnames( 140 ) := 'trademark';
"
"    t_glyphnames( 141 ) := 'acute';
"
"    t_glyphnames( 142 ) := 'dieresis';
"
"    t_glyphnames( 143 ) := 'notequal';
"
"    t_glyphnames( 144 ) := 'AE';
"
"    t_glyphnames( 145 ) := 'Oslash';
"
"    t_glyphnames( 146 ) := 'infinity';
"
"    t_glyphnames( 147 ) := 'plusminus';
"
"    t_glyphnames( 148 ) := 'lessequal';
"
"    t_glyphnames( 149 ) := 'greaterequal';
"
"    t_glyphnames( 150 ) := 'yen';
"
"    t_glyphnames( 151 ) := 'mu';
"
"    t_glyphnames( 152 ) := 'partialdiff';
"
"    t_glyphnames( 153 ) := 'summation';
"
"    t_glyphnames( 154 ) := 'product';
"
"    t_glyphnames( 155 ) := 'pi';
"
"    t_glyphnames( 156 ) := 'integral';
"
"    t_glyphnames( 157 ) := 'ordfeminine';
"
"    t_glyphnames( 158 ) := 'ordmasculine';
"
"    t_glyphnames( 159 ) := 'Omega';
"
"    t_glyphnames( 160 ) := 'ae';
"
"    t_glyphnames( 161 ) := 'oslash';
"
"    t_glyphnames( 162 ) := 'questiondown';
"
"    t_glyphnames( 163 ) := 'exclamdown';
"
"    t_glyphnames( 164 ) := 'logicalnot';
"
"    t_glyphnames( 165 ) := 'radical';
"
"    t_glyphnames( 166 ) := 'florin';
"
"    t_glyphnames( 167 ) := 'approxequal';
"
"    t_glyphnames( 168 ) := 'Delta';
"
"    t_glyphnames( 169 ) := 'guillemotleft';
"
"    t_glyphnames( 170 ) := 'guillemotright';
"
"    t_glyphnames( 171 ) := 'ellipsis';
"
"    t_glyphnames( 172 ) := 'nonbreakingspace';
"
"    t_glyphnames( 173 ) := 'Agrave';
"
"    t_glyphnames( 174 ) := 'Atilde';
"
"    t_glyphnames( 175 ) := 'Otilde';
"
"    t_glyphnames( 176 ) := 'OE';
"
"    t_glyphnames( 177 ) := 'oe';
"
"    t_glyphnames( 178 ) := 'endash';
"
"    t_glyphnames( 179 ) := 'emdash';
"
"    t_glyphnames( 180 ) := 'quotedblleft';
"
"    t_glyphnames( 181 ) := 'quotedblright';
"
"    t_glyphnames( 182 ) := 'quoteleft';
"
"    t_glyphnames( 183 ) := 'quoteright';
"
"    t_glyphnames( 184 ) := 'divide';
"
"    t_glyphnames( 185 ) := 'lozenge';
"
"    t_glyphnames( 186 ) := 'ydieresis';
"
"    t_glyphnames( 187 ) := 'Ydieresis';
"
"    t_glyphnames( 188 ) := 'fraction';
"
"    t_glyphnames( 189 ) := 'currency';
"
"    t_glyphnames( 190 ) := 'guilsinglleft';
"
"    t_glyphnames( 191 ) := 'guilsinglright';
"
"    t_glyphnames( 192 ) := 'fi';
"
"    t_glyphnames( 193 ) := 'fl';
"
"    t_glyphnames( 194 ) := 'daggerdbl';
"
"    t_glyphnames( 195 ) := 'periodcentered';
"
"    t_glyphnames( 196 ) := 'quotesinglbase';
"
"    t_glyphnames( 197 ) := 'quotedblbase';
"
"    t_glyphnames( 198 ) := 'perthousand';
"
"    t_glyphnames( 199 ) := 'Acircumflex';
"
"    t_glyphnames( 200 ) := 'Ecircumflex';
"
"    t_glyphnames( 201 ) := 'Aacute';
"
"    t_glyphnames( 202 ) := 'Edieresis';
"
"    t_glyphnames( 203 ) := 'Egrave';
"
"    t_glyphnames( 204 ) := 'Iacute';
"
"    t_glyphnames( 205 ) := 'Icircumflex';
"
"    t_glyphnames( 206 ) := 'Idieresis';
"
"    t_glyphnames( 207 ) := 'Igrave';
"
"    t_glyphnames( 208 ) := 'Oacute';
"
"    t_glyphnames( 209 ) := 'Ocircumflex';
"
"    t_glyphnames( 210 ) := 'apple';
"
"    t_glyphnames( 211 ) := 'Ograve';
"
"    t_glyphnames( 212 ) := 'Uacute';
"
"    t_glyphnames( 213 ) := 'Ucircumflex';
"
"    t_glyphnames( 214 ) := 'Ugrave';
"
"    t_glyphnames( 215 ) := 'dotlessi';
"
"    t_glyphnames( 216 ) := 'circumflex';
"
"    t_glyphnames( 217 ) := 'tilde';
"
"    t_glyphnames( 218 ) := 'macron';
"
"    t_glyphnames( 219 ) := 'breve';
"
"    t_glyphnames( 220 ) := 'dotaccent';
"
"    t_glyphnames( 221 ) := 'ring';
"
"    t_glyphnames( 222 ) := 'cedilla';
"
"    t_glyphnames( 223 ) := 'hungarumlaut';
"
"    t_glyphnames( 224 ) := 'ogonek';
"
"    t_glyphnames( 225 ) := 'caron';
"
"    t_glyphnames( 226 ) := 'Lslash';
"
"    t_glyphnames( 227 ) := 'lslash';
"
"    t_glyphnames( 228 ) := 'Scaron';
"
"    t_glyphnames( 229 ) := 'scaron';
"
"    t_glyphnames( 230 ) := 'Zcaron';
"
"    t_glyphnames( 231 ) := 'zcaron';
"
"    t_glyphnames( 232 ) := 'brokenbar';
"
"    t_glyphnames( 233 ) := 'Eth';
"
"    t_glyphnames( 234 ) := 'eth';
"
"    t_glyphnames( 235 ) := 'Yacute';
"
"    t_glyphnames( 236 ) := 'yacute';
"
"    t_glyphnames( 237 ) := 'Thorn';
"
"    t_glyphnames( 238 ) := 'thorn';
"
"    t_glyphnames( 239 ) := 'minus';
"
"    t_glyphnames( 240 ) := 'multiply';
"
"    t_glyphnames( 241 ) := 'onesuperior';
"
"    t_glyphnames( 242 ) := 'twosuperior';
"
"    t_glyphnames( 243 ) := 'threesuperior';
"
"    t_glyphnames( 244 ) := 'onehalf';
"
"    t_glyphnames( 245 ) := 'onequarter';
"
"    t_glyphnames( 246 ) := 'threequarters';
"
"    t_glyphnames( 247 ) := 'franc';
"
"    t_glyphnames( 248 ) := 'Gbreve';
"
"    t_glyphnames( 249 ) := 'gbreve';
"
"    t_glyphnames( 250 ) := 'Idotaccent';
"
"    t_glyphnames( 251 ) := 'Scedilla';
"
"    t_glyphnames( 252 ) := 'scedilla';
"
"    t_glyphnames( 253 ) := 'Cacute';
"
"    t_glyphnames( 254 ) := 'cacute';
"
"    t_glyphnames( 255 ) := 'Ccaron';
"
"    t_glyphnames( 256 ) := 'ccaron';
"
"    t_glyphnames( 257 ) := 'dcroat';
"
"--
"
"    dbms_lob.copy( t_blob, p_font, t_tables( 'post' ).length, 1, t_tables( 'post' ).offset );
"
"    this_font.italic_angle := to_short( dbms_lob.substr( t_blob, 2, 5 ) )
"
"                            + to_short( dbms_lob.substr( t_blob, 2, 7 ) ) / 65536;
"
"    case rawtohex( dbms_lob.substr( t_blob, 4, 1 ) )
"
"      when '00010000'
"
"      then
"
"        for g in 0 .. 257
"
"        loop
"
"          t_glyph2name( g ) := g;
"
"        end loop;
"
"      when '00020000'
"
"      then
"
"        t_offset := blob2num( t_blob, 2, 33 ) * 2 + 35;
"
"        while nvl( blob2num( t_blob, 1, t_offset ), 0 ) > 0
"
"        loop
"
"          t_glyphnames( t_glyphnames.count ) := utl_raw.cast_to_varchar2( dbms_lob.substr( t_blob, blob2num( t_blob, 1, t_offset ), t_offset + 1 ) );
"
"          t_offset := t_offset + blob2num( t_blob, 1, t_offset ) + 1;
"
"        end loop;
"
"        for g in 0 .. blob2num( t_blob, 2, 33 ) - 1
"
"        loop
"
"          t_glyph2name( g ) := blob2num( t_blob, 2, 35 + 2 * g );
"
"        end loop;
"
"      when '00025000'
"
"      then
"
"        for g in 0 .. blob2num( t_blob, 2, 33 ) - 1
"
"        loop
"
"          t_offset := blob2num( t_blob, 1, 35 + g );
"
"          if t_offset > 127
"
"          then
"
"            t_glyph2name( g ) := g - t_offset;
"
"          else
"
"            t_glyph2name( g ) := g + t_offset;
"
"          end if;
"
"        end loop;
"
"      when '00030000'
"
"      then
"
"        t_glyphnames.delete;
"
"      else
"
"dbms_output.put_line( 'no post ' || dbms_lob.substr( t_blob, 4, 1 ) );
"
"    end case;
"
"--
"
"    dbms_lob.copy( t_blob, p_font, t_tables( 'head' ).length, 1, t_tables( 'head' ).offset );
"
"    if dbms_lob.substr( t_blob, 4, 13 ) = hextoraw( '5F0F3CF5' )  -- magic
"
"    then
"
"      declare
"
"        t_tmp pls_integer := blob2num( t_blob, 2, 45 );
"
"      begin
"
"        if bitand( t_tmp, 1 ) = 1
"
"        then
"
"          this_font.style := 'B';
"
"        end if;
"
"        if bitand( t_tmp, 2 ) = 2
"
"        then
"
"          this_font.style := this_font.style || 'I';
"
"          this_font.flags := this_font.flags + 64;
"
"        end if;
"
"        this_font.style := nvl( this_font.style, 'N' );
"
"        this_font.unit_norm := 1000 / blob2num( t_blob, 2, 19 );
"
"        this_font.bb_xmin := to_short( dbms_lob.substr( t_blob, 2, 37 ), this_font.unit_norm );
"
"        this_font.bb_ymin := to_short( dbms_lob.substr( t_blob, 2, 39 ), this_font.unit_norm );
"
"        this_font.bb_xmax := to_short( dbms_lob.substr( t_blob, 2, 41 ), this_font.unit_norm );
"
"        this_font.bb_ymax := to_short( dbms_lob.substr( t_blob, 2, 43 ), this_font.unit_norm );
"
"        this_font.indexToLocFormat := blob2num( t_blob, 2, 51 ); -- 0 for short offsets, 1 for long
"
"      end;
"
"    end if;
"
"--
"
"    dbms_lob.copy( t_blob, p_font, t_tables( 'hhea' ).length, 1, t_tables( 'hhea' ).offset );
"
"    if dbms_lob.substr( t_blob, 4, 1 ) = hextoraw( '00010000' ) -- version 1.0
"
"    then
"
"      this_font.ascent := to_short( dbms_lob.substr( t_blob, 2, 5 ), this_font.unit_norm );
"
"      this_font.descent := to_short( dbms_lob.substr( t_blob, 2, 7 ), this_font.unit_norm );
"
"      this_font.capheight := this_font.ascent;
"
"      nr_hmetrics := blob2num( t_blob, 2, 35 );
"
"    end if;
"
"--
"
"    dbms_lob.copy( t_blob, p_font, t_tables( 'hmtx' ).length, 1, t_tables( 'hmtx' ).offset );
"
"    for j in 0 .. nr_hmetrics - 1
"
"    loop
"
"      this_font.hmetrics( j ) := blob2num( t_blob, 2, 1 + 4 * j );
"
"    end loop;
"
"--
"
"    dbms_lob.copy( t_blob, p_font, t_tables( 'name' ).length, 1, t_tables( 'name' ).offset );
"
"    if dbms_lob.substr( t_blob, 2, 1 ) = hextoraw( '0000' ) -- format 0
"
"    then
"
"      t_offset := blob2num( t_blob, 2, 5 ) + 1;
"
"      for j in 0 .. blob2num( t_blob, 2, 3 ) - 1
"
"      loop
"
"        if (   dbms_lob.substr( t_blob, 2, 7  + j * 12 ) = hextoraw( '0003' ) -- Windows
"
"           and dbms_lob.substr( t_blob, 2, 11 + j * 12 ) = hextoraw( '0409' ) -- English United States
"
"           )
"
"        then
"
"          case rawtohex( dbms_lob.substr( t_blob, 2, 13 + j * 12 ) )
"
"            when '0001'
"
"            then
"
"              this_font.family := utl_i18n.raw_to_char( dbms_lob.substr( t_blob, blob2num( t_blob, 2, 15 + j * 12 ), t_offset + blob2num( t_blob, 2, 17 + j * 12 ) ), 'AL16UTF16' );
"
"            when '0006'
"
"            then
"
"              this_font.name := utl_i18n.raw_to_char( dbms_lob.substr( t_blob, blob2num( t_blob, 2, 15 + j * 12 ), t_offset + blob2num( t_blob, 2, 17 + j * 12 ) ), 'AL16UTF16' );
"
"            else
"
"              null;
"
"          end case;
"
"        end if;
"
"      end loop;
"
"    end if;
"
"--
"
"    if this_font.italic_angle != 0
"
"    then
"
"      this_font.flags := this_font.flags + 64;
"
"    end if;
"
"    this_font.subtype := 'TrueType';
"
"    this_font.stemv := 50;
"
"    this_font.family := lower( this_font.family );
"
"    this_font.encoding := utl_i18n.map_charset( p_encoding
"
"                                              , utl_i18n.generic_context
"
"                                              , utl_i18n.iana_to_oracle
"
"                                              );
"
"    this_font.encoding := nvl( this_font.encoding, upper( p_encoding ) );
"
"    this_font.charset := sys_context( 'userenv', 'LANGUAGE' );
"
"    this_font.charset := substr( this_font.charset
"
"                               , 1
"
"                               , instr( this_font.charset, '.' )
"
"                               ) || this_font.encoding;
"
"    this_font.cid := upper( p_encoding ) in ( 'CID', 'AL16UTF16', 'UTF', 'UNICODE' );
"
"    this_font.fontname := this_font.name;
"
"    this_font.compress_font := p_compress;
"
"--
"
"    if ( p_embed or this_font.cid ) and t_tables.exists( 'OS/2' )
"
"    then
"
"      dbms_lob.copy( t_blob, p_font, t_tables( 'OS/2' ).length, 1, t_tables( 'OS/2' ).offset );
"
"      if blob2num( t_blob, 2, 9 ) != 2
"
"      then
"
"        this_font.fontfile2 := p_font;
"
"        this_font.ttf_offset := p_offset;
"
"        this_font.name := dbms_random.string( 'u', 6 ) || '+' || this_font.name;
"
"--
"
"        t_blob := dbms_lob.substr( p_font, t_tables( 'loca' ).length, t_tables( 'loca' ).offset );
"
"        declare
"
"          t_size pls_integer := 2 + this_font.indexToLocFormat * 2; -- 0 for short offsets, 1 for long
"
"        begin
"
"          for i in 0 .. this_font.numGlyphs
"
"          loop
"
"            this_font.loca( i ) := blob2num( t_blob, t_size, 1 + i * t_size );
"
"          end loop;
"
"        end;
"
"      end if;
"
"    end if;
"
"--
"
"    if not this_font.cid
"
"    then
"
"      if this_font.flags = 4 -- a symbolic font
"
"      then
"
"        declare
"
"          t_real pls_integer;
"
"        begin
"
"          for t_code in 32 .. 255
"
"          loop
"
"            t_real := this_font.code2glyph.first + t_code - 32; -- assume code 32, space maps to the first code from the font
"
"            if this_font.code2glyph.exists( t_real )
"
"            then
"
"              this_font.first_char := least( nvl( this_font.first_char, 255 ), t_code );
"
"              this_font.last_char := t_code;
"
"              if this_font.hmetrics.exists( this_font.code2glyph( t_real ) )
"
"              then
"
"                this_font.char_width_tab( t_code ) := trunc( this_font.hmetrics( this_font.code2glyph( t_real ) ) * this_font.unit_norm );
"
"              else
"
"                this_font.char_width_tab( t_code ) := trunc( this_font.hmetrics( this_font.hmetrics.last() ) * this_font.unit_norm );
"
"              end if;
"
"            else
"
"              this_font.char_width_tab( t_code ) := trunc( this_font.hmetrics( 0 ) * this_font.unit_norm );
"
"            end if;
"
"          end loop;
"
"        end;
"
"      else
"
"        declare
"
"          t_unicode pls_integer;
"
"          t_prv_diff pls_integer;
"
"          t_utf16_charset varchar2(1000);
"
"          t_winansi_charset varchar2(1000);
"
"          t_glyphname tp_glyphname;
"
"        begin
"
"          t_prv_diff := -1;
"
"          t_utf16_charset := substr( this_font.charset, 1, instr( this_font.charset, '.' ) ) || 'AL16UTF16';
"
"          t_winansi_charset := substr( this_font.charset, 1, instr( this_font.charset, '.' ) ) || 'WE8MSWIN1252';
"
"          for t_code in 32 .. 255
"
"          loop
"
"            t_unicode := utl_raw.cast_to_binary_integer( utl_raw.convert( hextoraw( to_char( t_code, 'fm0x' ) )
"
"                                                                        , t_utf16_charset
"
"                                                                        , this_font.charset
"
"                                                                        )
"
"                                                       );
"
"            t_glyphname := '';
"
"            this_font.char_width_tab( t_code ) := trunc( this_font.hmetrics( this_font.hmetrics.last() ) * this_font.unit_norm );
"
"            if this_font.code2glyph.exists( t_unicode )
"
"            then
"
"              this_font.first_char := least( nvl( this_font.first_char, 255 ), t_code );
"
"              this_font.last_char := t_code;
"
"              if this_font.hmetrics.exists( this_font.code2glyph( t_unicode ) )
"
"              then
"
"                this_font.char_width_tab( t_code ) := trunc( this_font.hmetrics( this_font.code2glyph( t_unicode ) ) * this_font.unit_norm );
"
"              end if;
"
"              if t_glyph2name.exists( this_font.code2glyph( t_unicode ) )
"
"              then
"
"                if t_glyphnames.exists( t_glyph2name( this_font.code2glyph( t_unicode ) ) )
"
"                then
"
"                  t_glyphname := t_glyphnames( t_glyph2name( this_font.code2glyph( t_unicode ) ) );
"
"                end if;
"
"              end if;
"
"            end if;
"
"--
"
"            if (   t_glyphname is not null
"
"               and t_unicode != utl_raw.cast_to_binary_integer( utl_raw.convert( hextoraw( to_char( t_code, 'fm0x' ) )
"
"                                                                               , t_winansi_charset
"
"                                                                               , this_font.charset
"
"                                                                               )
"
"                                                              )
"
"               )
"
"            then
"
"              this_font.diff := this_font.diff || case when t_prv_diff != t_code - 1 then ' ' || t_code end || ' /' || t_glyphname;
"
"              t_prv_diff := t_code;
"
"            end if;
"
"          end loop;
"
"        end;
"
"        if this_font.diff is not null
"
"        then
"
"          this_font.diff := '/Differences [' || this_font.diff || ']';
"
"        end if;
"
"      end if;
"
"    end if;
"
"--
"
"    g_fonts( g_fonts.count( ) + 1 ) := this_font;
"
"--
"
"    return this_font.fontname;
"
"  end;
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
"    )
"
"  is
"
"    t_tmp varchar2(32767);
"
"  begin
"
"    t_tmp := load_ttf_font( p_font, p_encoding, p_embed, p_compress );
"
"  end;
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
"    )
"
"  is
"
"  begin
"
"    load_ttf_font( file2blob( p_dir, p_filename ), p_encoding, p_embed, p_compress );
"
"  end;
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
"    )
"
"  is
"
"    type tp_font_table is record
"
"      ( offset pls_integer
"
"      , length pls_integer
"
"      );
"
"    type tp_tables is table of tp_font_table index by varchar2(4);
"
"    t_tables tp_tables;
"
"    t_tag varchar2(4);
"
"    t_blob blob;
"
"    t_offset pls_integer;
"
"  begin
"
"    if utl_raw.cast_to_varchar2( dbms_lob.substr( p_ttc, 4, 1 ) ) != 'ttcf'
"
"    then
"
"      return;
"
"    end if;
"
"    for f in 0 .. blob2num( p_ttc, 4, 9 ) - 1
"
"    loop
"
"      load_ttf_font( p_ttc, p_encoding, p_embed, p_compress, blob2num( p_ttc, 4, 13 + f * 4 ) + 1 );
"
"    end loop;
"
"  end;
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
"    )
"
"  is
"
"  begin
"
"    load_ttc_fonts( file2blob( p_dir, p_filename ), p_encoding, p_embed, p_compress );
"
"  end;
"
"--
"
"  function rgb( p_hex_rgb in varchar2 )
"
"  return varchar2
"
"  is
"
"  begin
"
"    return to_char_round( nvl( to_number( substr( ltrim( p_hex_rgb, '#' )
"
"                                                , 1, 2 )
"
"                                        , 'xx' ) / 255
"
"                              , 0 )
"
"                         , 5 ) || ' '
"
"        || to_char_round( nvl(   to_number( substr( ltrim( p_hex_rgb, '#' )
"
"                                                , 3, 2 )
"
"                                        , 'xx' ) / 255
"
"                              , 0 )
"
"                         , 5 ) || ' '
"
"        || to_char_round( nvl(   to_number( substr( ltrim( p_hex_rgb, '#' )
"
"                                                , 5, 2 )
"
"                                        , 'xx' ) / 255
"
"                              , 0 )
"
"                         , 5 ) || ' ';
"
"  end;
"
"--
"
"  procedure set_color( p_rgb in varchar2 := '000000', p_backgr in boolean )
"
"  is
"
"  begin
"
"    txt2page( rgb( p_rgb ) || case when p_backgr then 'RG' else 'rg' end );
"
"  end;
"
"--
"
"  procedure set_color( p_rgb in varchar2 := '000000' )
"
"  is
"
"  begin
"
"    set_color( p_rgb, false );
"
"  end;
"
"--
"
"  procedure set_color
"
"    ( p_red in number := 0
"
"    , p_green in number := 0
"
"    , p_blue in number := 0
"
"    )
"
"  is
"
"  begin
"
"    if (     p_red between 0 and 255
"
"       and p_blue  between 0 and 255
"
"       and p_green between 0 and 255
"
"       )
"
"    then
"
"      set_color(  to_char( p_red, 'fm0x' )
"
"               || to_char( p_green, 'fm0x' )
"
"               || to_char( p_blue, 'fm0x' )
"
"               , false
"
"               );
"
"    end if;
"
"  end;
"
"--
"
"  procedure set_bk_color( p_rgb in varchar2 := 'ffffff' )
"
"  is
"
"  begin
"
"    set_color( p_rgb, true );
"
"  end;
"
"--
"
"  procedure set_bk_color
"
"    ( p_red in number := 0
"
"    , p_green in number := 0
"
"    , p_blue in number := 0
"
"    )
"
"  is
"
"  begin
"
"    if (     p_red between 0 and 255
"
"       and p_blue  between 0 and 255
"
"       and p_green between 0 and 255
"
"       )
"
"    then
"
"      set_color(  to_char( p_red, 'fm0x' )
"
"               || to_char( p_green, 'fm0x' )
"
"               || to_char( p_blue, 'fm0x' )
"
"               , true
"
"               );
"
"    end if;
"
"  end;
"
"--
"
"  procedure horizontal_line(
"
"    p_x in number
"
"  , p_y in number
"
"  , p_width in number
"
"  , p_line_width in number := 0.5
"
"  , p_line_color in varchar2 := '000000'
"
"  )
"
"  is
"
"    t_use_color boolean;
"
"  begin
"
"    txt2page( 'q ' || to_char_round( p_line_width, 5 ) || ' w' );
"
"    t_use_color := substr( p_line_color
"
"                         , -6
"
"                         ) != '000000';
"
"    if t_use_color
"
"    then
"
"      set_color( p_line_color );
"
"      set_bk_color( p_line_color );
"
"    else
"
"      txt2page( '0 g' );
"
"    end if;
"
"    txt2page(  to_char_round( p_x, 5 ) || ' '
"
"            || to_char_round( p_y, 5 ) || ' m '
"
"            || to_char_round( p_x + p_width, 5 ) || ' '
"
"            || to_char_round( p_y, 5 ) || ' l b'
"
"            );
"
"    txt2page( 'Q' );
"
"  end;
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
"    )
"
"  is
"
"  begin
"
"    horizontal_line( p_x, p_y, p_line_width, p_height, p_line_color );
"
"  end;
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
"    )
"
"  is
"
"  begin
"
"    txt2page( 'q' );
"
"    if substr( p_line_color, -6 ) != substr( p_fill_color, -6 )
"
"    then
"
"      txt2page( to_char_round( p_line_width, 5 ) || ' w' );
"
"    end if;
"
"    if substr( p_line_color, -6 ) != '000000'
"
"    then
"
"      set_bk_color( p_line_color );
"
"    else
"
"      txt2page( '0 g' );
"
"    end if;
"
"    if p_fill_color is not null
"
"    then
"
"      set_color( p_fill_color );
"
"    end if;
"
"    txt2page(  to_char_round( p_x, 5 ) || ' ' || to_char_round( p_y, 5 ) || ' '
"
"            || to_char_round( p_width, 5 ) || ' ' || to_char_round( p_height, 5 ) || ' re '
"
"            || case
"
"                 when p_fill_color is null
"
"                 then 'S'
"
"                 else 'b'
"
"               end
"
"            );
"
"    txt2page( 'Q' );
"
"  end;
"
"--
"
"  function get( p_what in pls_integer )
"
"  return number
"
"  is
"
"  begin
"
"    return case p_what
"
"             when 0 then g_settings.page_width
"
"             when 1 then g_settings.page_height
"
"             when 2 then g_settings.margin_top
"
"             when 3 then g_settings.margin_right
"
"             when 4 then g_settings.margin_bottom
"
"             when 5 then g_settings.margin_left
"
"             when 6 then g_x
"
"             when 7 then g_y
"
"             when 8 then g_fonts( g_current_font ).fontsize
"
"           end;
"
"  end;
"
"--
"
"end;"
/
