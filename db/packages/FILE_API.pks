CREATE OR REPLACE
"PACKAGE file_api AS
"
"
"
"FUNCTION canRead (p_path  IN  VARCHAR2) RETURN NUMBER
"
"AS LANGUAGE JAVA
"
"NAME 'FileHandler.canRead (java.lang.String) return java.lang.int';
"
"
"
"FUNCTION canWrite (p_path  IN  VARCHAR2) RETURN NUMBER
"
"AS LANGUAGE JAVA
"
"NAME 'FileHandler.canWrite (java.lang.String) return java.lang.int';
"
"
"
"FUNCTION createNewFile (p_path  IN  VARCHAR2) RETURN NUMBER
"
"AS LANGUAGE JAVA
"
"NAME 'FileHandler.createNewFile (java.lang.String) return java.lang.int';
"
"
"
"FUNCTION delete (p_path  IN  VARCHAR2) RETURN NUMBER
"
"AS LANGUAGE JAVA
"
"NAME 'FileHandler.delete (java.lang.String) return java.lang.int';
"
"
"
"FUNCTION exists (p_path  IN  VARCHAR2) RETURN NUMBER
"
"AS LANGUAGE JAVA
"
"NAME 'FileHandler.exists (java.lang.String) return java.lang.int';
"
"
"
"FUNCTION isDirectory (p_path  IN  VARCHAR2) RETURN NUMBER
"
"AS LANGUAGE JAVA
"
"NAME 'FileHandler.isDirectory (java.lang.String) return java.lang.int';
"
"
"
"FUNCTION isFile (p_path  IN  VARCHAR2) RETURN NUMBER
"
"AS LANGUAGE JAVA
"
"NAME 'FileHandler.isFile (java.lang.String) return java.lang.int';
"
"
"
"FUNCTION isHidden (p_path  IN  VARCHAR2) RETURN NUMBER
"
"AS LANGUAGE JAVA
"
"NAME 'FileHandler.isHidden (java.lang.String) return java.lang.int';
"
"
"
"FUNCTION lastModified (p_path  IN  VARCHAR2) RETURN DATE
"
"AS LANGUAGE JAVA
"
"NAME 'FileHandler.lastModified (java.lang.String) return java.sql.Timestamp';
"
"
"
"FUNCTION length (p_path  IN  VARCHAR2) RETURN NUMBER
"
"AS LANGUAGE JAVA
"
"NAME 'FileHandler.length (java.lang.String) return java.lang.long';
"
"
"
"FUNCTION list (p_path  IN  VARCHAR2) RETURN VARCHAR2
"
"AS LANGUAGE JAVA
"
"NAME 'FileHandler.list (java.lang.String) return java.lang.String';
"
"
"
"FUNCTION mkdir (p_path  IN  VARCHAR2) RETURN NUMBER
"
"AS LANGUAGE JAVA
"
"NAME 'FileHandler.mkdir (java.lang.String) return java.lang.int';
"
"
"
"FUNCTION mkdirs (p_path  IN  VARCHAR2) RETURN NUMBER
"
"AS LANGUAGE JAVA
"
"NAME 'FileHandler.mkdirs (java.lang.String) return java.lang.int';
"
"
"
"FUNCTION renameTo (p_from_path  IN  VARCHAR2,
"
"                   p_to_path    IN  VARCHAR2) RETURN NUMBER
"
"AS LANGUAGE JAVA
"
"NAME 'FileHandler.renameTo (java.lang.String, java.lang.String) return java.lang.int';
"
"
"
"FUNCTION setReadOnly (p_path  IN  VARCHAR2) RETURN NUMBER
"
"AS LANGUAGE JAVA
"
"NAME 'FileHandler.setReadOnly (java.lang.String) return java.lang.int';
"
"
"
"FUNCTION copy (p_from_path  IN  VARCHAR2,
"
"               p_to_path    IN  VARCHAR2) RETURN NUMBER
"
"AS LANGUAGE JAVA
"
"NAME 'FileHandler.copy (java.lang.String, java.lang.String) return java.lang.int';
"
"
"
"END file_api;"
/
