CREATE OR REPLACE
"PACKAGE BODY emp_sal AS
"
"   PROCEDURE find_sal(c_id emp_active_infos.empai_emp_id%TYPE) IS
"
"   c_sal emp_active_infos.empai_basic_sal%TYPE;
"
"   BEGIN
"
"      SELECT empai_basic_sal INTO c_sal
"
"      FROM emp_active_infos
"
"      WHERE empai_emp_id = c_id;
"
"      dbms_output.put_line('empai_basic_sal: '|| c_sal);
"
"   END find_sal;
"
"END emp_sal;"
/
