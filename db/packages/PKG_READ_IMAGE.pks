CREATE OR REPLACE
"PACKAGE PKG_READ_IMAGE
"
"IS
"
"  -- populate the BLOB column --
"
"  FUNCTION select_image ( PC$Clause IN VARCHAR2,L$type	NUMBER) RETURN BOOLEAN ;
"
"  -- Get and return chunks of 4000 bytes --
"
"  FUNCTION Get_B64_Chunk(L$type	NUMBER) RETURN VARCHAR2 ;
"
"  -- Get the blob length --
"
"  FUNCTION Get_Length RETURN PLS_INTEGER ;
"
"END PKG_READ_IMAGE;"
/
