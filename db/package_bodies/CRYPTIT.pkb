CREATE OR REPLACE
"PACKAGE BODY cryptit AS
"
"     crypt_raw     RAW(4000);
"
"     crypt_str     VARCHAR(4000);
"
"     -- Encrypt the string --
"
"     FUNCTION encrypt(
"
"          str     VARCHAR2
"
"     )
"
"          RETURN RAW AS
"
"          l            INTEGER   := LENGTH(str);
"
"          i            INTEGER;
"
"          padblock     RAW(4000);
"
"          cle          RAW(8)    := UTL_RAW.cast_to_raw('iroadmap');
"
"     BEGIN
"
"          i := 8 - MOD(l, 8);
"
"          padblock := UTL_RAW.cast_to_raw(str || RPAD(CHR(i), i, CHR(i)));
"
"          DBMS_OBFUSCATION_TOOLKIT.desencrypt(
"
"               input                 => padblock,
"
"               KEY                   => cle,
"
"               encrypted_data        => crypt_raw
"
"          );
"
"          RETURN crypt_raw;
"
"     END;
"
"     -- Decrypt the string --
"
"     FUNCTION decrypt(
"
"          xcrypt     VARCHAR2
"
"     )
"
"          RETURN VARCHAR2 AS
"
"          l             NUMBER;
"
"          cle           RAW(8)    := UTL_RAW.cast_to_raw('iroadmap');
"
"          crypt_raw     RAW(4000)
"
"                     := UTL_RAW.cast_to_raw(UTL_RAW.cast_to_varchar2(xcrypt));
"
"     BEGIN
"
"          DBMS_OBFUSCATION_TOOLKIT.desdecrypt(
"
"               input                 => xcrypt,
"
"               KEY                   => cle,
"
"               decrypted_data        => crypt_raw
"
"          );
"
"          crypt_str := UTL_RAW.cast_to_varchar2(crypt_raw);
"
"          l := LENGTH(crypt_str);
"
"          crypt_str := RPAD(crypt_str, l - ASCII(SUBSTR(crypt_str, l)));
"
"          RETURN crypt_str;
"
"     END;
"
"END cryptit;"
/
