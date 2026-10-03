CREATE OR REPLACE
"PACKAGE BODY Pkg_Read_Image
"
"IS
"
"
"
"  GL$Blob   	BLOB ;         -- global CLOB variable
"
"  GL$LONGRAW   	LONG RAW ;     -- global CLOB variable
"
"  GN$Pos    PLS_INTEGER := 1 ; -- global current pos in the BLOB
"
"  GN$Length PLS_INTEGER := 0 ; -- global current length of th blob
"
"  GN$Chunk  PLS_INTEGER := 16384 ;
"
"
"
"  FUNCTION Get_Length RETURN PLS_INTEGER
"
"  IS
"
"  BEGIN
"
"    RETURN GN$Length;
"
"  END ;
"
"
"
"  ----------------------------------------
"
"  -- Get the content of the BLOB column --
"
"  ----------------------------------------
"
"  FUNCTION select_image ( PC$Clause IN VARCHAR2,L$type	NUMBER) RETURN BOOLEAN
"
"  IS
"
"  BEGIN
"
"    IF L$type = 113 THEN
"
"    	EXECUTE IMMEDIATE PC$Clause INTO GL$Blob ;
"
"    ELSIF L$type = 24 THEN
"
"    	EXECUTE IMMEDIATE PC$Clause INTO GL$LONGRAW;
"
"    END IF;
"
"    GN$Pos := 1 ;
"
"    RETURN TRUE ;
"
"  EXCEPTION
"
"    WHEN OTHERS THEN
"
"	  RETURN FALSE ;
"
"  END select_image ;
"
"
"
"
"
"  -------------------------------------------------------------
"
"  -- Return a Base 64 16384 bytes chunk of the selected BLOB --
"
"  -------------------------------------------------------------
"
"  FUNCTION Get_B64_Chunk(L$type	NUMBER) RETURN VARCHAR2
"
"  IS
"
"    LN$amt  NUMBER := GN$Chunk ;
"
"    LR$raw  RAW(16384);
"
"  BEGIN
"
"    LN$amt := GN$Chunk ;
"
"    -- Read the BLOB
"
"
"
"    IF L$type = 113 THEN
"
"    	DBMS_LOB.READ(GL$Blob, LN$amt, GN$Pos, LR$raw);
"
"    ELSIF L$type = 24 THEN
"
"	DBMS_LOB.READ(GL$LONGRAW, LN$amt, GN$Pos, LR$raw);
"
"    END IF;
"
"    GN$Pos := GN$Pos + LN$amt;
"
"    LN$amt := GN$Chunk;
"
"    --RETURN utl_raw.cast_to_varchar2(LR$raw) ;
"
"	RETURN UTL_RAW.CAST_TO_VARCHAR2(UTL_ENCODE.BASE64_ENCODE(LR$Raw));
"
"  EXCEPTION
"
"    WHEN OTHERS THEN
"
"        RETURN NULL ;
"
"  END Get_B64_Chunk ;
"
"
"
"END Pkg_Read_Image;"
/
