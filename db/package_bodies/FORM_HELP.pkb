CREATE OR REPLACE
"package body form_help is
"
"   --
"
"   --  Package level variable storing the initial
"
"   --  level at which the display routine was called.
"
"   --
"
"   v_initial_level varchar2(2);
"
"   --
"
"   --  HTML to output to set up page
"
"   --
"
"   procedure output_html_header
"
"   is
"
"   begin
"
"      htp.p('<HTML>');
"
"      htp.p('<BODY>');
"
"   end;
"
"   --
"
"   --  Close page
"
"   --
"
"   procedure output_html_footer
"
"   is
"
"   begin
"
"      htp.p('</BODY>');
"
"      htp.p('</HTML>');
"
"   end;
"
"   --
"
"   --  Returns next level at which to search for help if
"
"   --  none is found at the current level
"
"   --
"
"   function next_level( p_level in varchar2 ) return varchar2
"
"   is
"
"      l_level varchar2(2);
"
"   begin
"
"      if (p_level = 'F') then
"
"         l_level := 'C';
"
"      elsif (p_level = 'C') then
"
"         l_level := 'B';
"
"      elsif (p_level = 'B') then
"
"         l_level := 'T';
"
"      elsif (p_level = 'T') then
"
"         l_level := 'M';
"
"      else
"
"         l_level := 'F';
"
"      end if;
"
"      return l_level;
"
"   end;
"
"   --
"
"   --  Returns the level at which the 'Up one level' link should
"
"   --  attempt to display help.
"
"   --
"
"   function next_link_level( p_level in varchar2 ) return varchar2
"
"   is
"
"      l_level varchar2(2);
"
"   begin
"
"      if (p_level in ('F', 'C')) then
"
"         l_level := 'B';
"
"      elsif (p_level in ('B', 'T')) then
"
"         l_level := 'M';
"
"      else
"
"         l_level := 'F';
"
"      end if;
"
"      return l_level;
"
"   end;
"
"   --
"
"   --  Build query to retrieve help text.
"
"   --
"
"   function build_query( p_help_table in varchar2,
"
"                         p_app in varchar2,
"
"                         p_module in varchar2,
"
"                         p_block in varchar2,
"
"                         p_item in varchar2,
"
"                         p_col in varchar2,
"
"                         p_table in varchar2,
"
"                         p_level in varchar2) return varchar2
"
"   is
"
"      l_query varchar2(2000);
"
"      l_index varchar2(100);
"
"   begin
"
"      l_query := 'SELECT HLP_TEXT FROM '||p_help_table||' WHERE HLP_APPLN = '''||p_app||''' AND ';
"
"      --
"
"      --  Build index to query on based on level
"
"      --
"
"      if    p_level = 'T' then
"
"         l_index := p_table;
"
"      elsif p_level = 'C' then
"
"         l_index := p_col||'.'||p_table;
"
"      elsif p_level = 'M' then
"
"         l_index := p_module;
"
"      elsif p_level = 'B' then
"
"         l_index := p_module||'.'||p_block;
"
"      elsif p_level = 'F' then
"
"         l_index := p_item||'.'||p_module||'.'||p_block;
"
"      end if;
"
"
"
"      l_query := l_query || 'HLP_INDEX = '''||l_index||''' AND HLP_TYPE = '''||p_level||''' ORDER BY HLP_SEQ';
"
"      --
"
"      --
"
"      return l_query;
"
"   end;
"
"   --
"
"   --  Output the link to the parent help page. This is
"
"   --  a call to form_help.display passing a new p_level
"
"   --  argument.
"
"   --
"
"   procedure output_master_link( p_help_table in varchar2,
"
"                                 p_app in varchar2,
"
"                                 p_module in varchar2,
"
"                                 p_block in varchar2,
"
"                                 p_item in varchar2,
"
"                                 p_col in varchar2,
"
"                                 p_table in varchar2,
"
"                                 p_level in varchar2 )
"
"   is
"
"      l_next_level   varchar2(2);
"
"      l_link_url     varchar2(500);
"
"   begin
"
"      l_next_level := next_link_level(p_level);
"
"      l_link_url := 'form_help.display?';
"
"      l_link_url := l_link_url || 'p_help_table='|| htf.escape_url(p_help_table)||'&';
"
"      l_link_url := l_link_url || 'p_app='|| htf.escape_url(p_app)||'&';
"
"      l_link_url := l_link_url || 'p_module='|| htf.escape_url(p_module)||'&';
"
"      l_link_url := l_link_url || 'p_block='|| htf.escape_url(p_block)||'&';
"
"      l_link_url := l_link_url || 'p_item='|| htf.escape_url(p_item)||'&';
"
"      l_link_url := l_link_url || 'p_col='|| htf.escape_url(p_col)||'&';
"
"      l_link_url := l_link_url || 'p_table='|| htf.escape_url(p_table)||'&';
"
"      l_link_url := l_link_url || 'p_level='|| htf.escape_url(l_next_level);
"
"      htp.p('<A href=""'||l_link_url||'"">Up one level</A><HR>');
"
"   end;
"
"   --
"
"   --  Procedure to actually display the help text at the
"
"   --  requested level. If no help text is found at the requested
"
"   --  level, the display procedure calls itself passing the next
"
"   --  level up, unless a full cycle of all help levels has been
"
"   --  completed. Parameter p_call_internal indicates whether display
"
"   --  has been called recursively - if so, we do not output the HTML
"
"   --  header or footer in this call.
"
"   --
"
"   procedure display( p_help_table in varchar2,
"
"                      p_app in varchar2,
"
"                      p_module in varchar2,
"
"                      p_block in varchar2,
"
"                      p_item in varchar2,
"
"                      p_col in varchar2,
"
"                      p_table in varchar2,
"
"                      p_level in varchar2)
"
"   is
"
"      l_query           varchar2(2000);
"
"      l_help_row        varchar2(2000);
"
"      l_cursor          integer;
"
"      l_rows_fetched    integer;
"
"      l_void            integer;
"
"      l_total_rows      integer := 0;
"
"      l_level           varchar2(2);
"
"      l_html            boolean := false;
"
"   begin
"
"      --
"
"      --  Build help text query
"
"      --
"
"      l_query := build_query( p_help_table, p_app, p_module, p_block, p_item, p_col, p_table, p_level );
"
"      --
"
"      --  Output user help text
"
"      --
"
"      l_cursor := dbms_sql.open_cursor;
"
"      dbms_sql.parse(l_cursor, l_query, dbms_sql.v7);
"
"      dbms_sql.define_column(l_cursor, 1, l_help_row, 2000);
"
"      l_void := dbms_sql.execute(l_cursor);
"
"      l_rows_fetched := dbms_sql.fetch_rows(l_cursor);
"
"      while (l_rows_fetched > 0) loop
"
"         dbms_sql.column_value(l_cursor, 1, l_help_row);
"
"         --
"
"         --  If this is first row of help retrieved, try
"
"         --  to determine whether the document is a plain
"
"         --  ASCII document or whether it contains HTML. We
"
"         --  assume that if the first 6 characters are '<HTML>'
"
"         --  then this is an HTML document, otherwise it is
"
"         --  just ASCII.
"
"         --
"
"         if ( l_total_rows = 0 ) then
"
"            if (substr(ltrim(rtrim(l_help_row)),1,6) = '<HTML>') then
"
"               l_html := true;
"
"            else
"
"               output_html_header;
"
"            end if;
"
"         end if;
"
"         htp.p(l_help_row);
"
"         l_total_rows := l_total_rows + 1;
"
"         l_rows_fetched := dbms_sql.fetch_rows(l_cursor);
"
"      end loop;
"
"      dbms_sql.close_cursor(l_cursor);
"
"      --
"
"      --  If no help defined at this level, try the next level up
"
"      --
"
"      if l_total_rows = 0 then
"
"         --
"
"         --  If we have not cycled round completely...
"
"         --
"
"         if (p_level != v_initial_level) or (v_initial_level is null) then
"
"            if v_initial_level is null then
"
"               v_initial_level := p_level;
"
"            end if;
"
"            l_level := next_level( p_level );
"
"            display( p_help_table, p_app, p_module, p_block, p_item, p_col, p_table, l_level );
"
"         end if;
"
"      else
"
"         if not l_html then
"
"             output_html_footer;
"
"         end if;
"
"      end if;
"
"   end;
"
"   --
"
"   --
"
"end form_help;"
/
