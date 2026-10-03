CREATE OR REPLACE
"PACKAGE BODY pack_emp_res_hrly_rate
"
"AS
"
"   PROCEDURE proc_upd_emp_hrly_rate_lp(p_bu                        VARCHAR2,
"
"                                     p_plnt                      VARCHAR2,
"
"                                       p_emp_id                        VARCHAR2,
"
"                                       p_date_from                    DATE,
"
"                                       p_date_to                    DATE,
"
"                                       p_user                        VARCHAR2)
"
"   IS
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM planning_control
"
"    WHERE planctrl_bu              = p_bu
"
"      AND planctrl_plnt          = p_plnt
"
"      AND planctrl_upd_emp_hrly_rate = 'L';
"
"
"
"      cr1            c1%ROWTYPE;
"
"
"
"   CURSOR c2
"
"       IS
"
"   SELECT *
"
"     FROM mfg_resources
"
"    WHERE mfgr_bu     = p_bu
"
"      AND mfgr_emp_id     = p_emp_id
"
"      AND p_date_to BETWEEN TRUNC(mfgr_eff_from) AND TRUNC(mfgr_eff_to);
"
"
"
"      cr2            c2%ROWTYPE;
"
"
"
"   CURSOR c3
"
"       IS
"
"   SELECT NVL(SUM(DECODE(ppln_mode,'+',ppln_amount,ppln_amount * -1)),0) ppln_amount
"
"     FROM payroll_prep_hd,
"
"          payroll_prep_ln,
"
"          payroll_elements_hd
"
"    WHERE pphd_bu      = ppln_bu
"
"      AND pphd_year      = ppln_year
"
"      AND pphd_period     = ppln_period
"
"      AND pphd_emp_id      = ppln_emp_id
"
"      AND pphd_pyrl_type = ppln_pyrl_type
"
"      AND pphd_bu      = p_bu
"
"      AND pphd_emp_id      = p_emp_id
"
"      AND pehd_bu      = ppln_bu
"
"      AND pehd_elmnt_id  = ppln_elmnt_id
"
"      AND pehd_type NOT IN ('CA3','RC3','3RD');
"
"
"
"      cr3            c3%ROWTYPE;
"
"
"
"      v_mnth_days            NUMBER(5,2)     := 0;
"
"      v_wrk_hrs              NUMBER(5)     := 0;
"
"      v_gross_amt            NUMBER(15, 3)     := 0;
"
"      v_per_hrs_sal          NUMBER(15, 3)     := 0;
"
"
"
"      v_ip_addr            VARCHAR2(50)     := AUDIT_INFO.GET_IP_ADDRESS;      --added 23-jan-2020 : Ajis
"
"      v_os_user            VARCHAR2(50)     := AUDIT_INFO.GET_OS_USER;        --added 23-jan-2020 : Ajis
"
"
"
"
"
"   BEGIN
"
"
"
"      OPEN c1;
"
"      FETCH c1 INTO cr1;
"
"
"
"         IF c1%FOUND THEN
"
"
"
"            v_mnth_days := cr1.planctrl_labour_mon_days;
"
"            v_wrk_hrs   := cr1.planctrl_labour_per_day_hr;
"
"
"
"            OPEN c3;
"
"            FETCH c3 INTO cr3;
"
"
"
"               IF cr3.ppln_amount > 0 THEN
"
"                  v_gross_amt := cr3.ppln_amount;
"
"               END IF;
"
"
"
"            CLOSE c3;
"
"
"
"            IF v_mnth_days > 0 AND v_wrk_hrs > 0 THEN
"
"               v_per_hrs_sal := (v_gross_amt/v_mnth_days)/v_wrk_hrs;
"
"            ELSE
"
"               RAISE_APPLICATION_ERROR(-20115,'HRM');
"
"            END IF;
"
"
"
"            OPEN c2;
"
"            FETCH c2 INTO cr2;
"
"
"
"               IF c2%FOUND THEN
"
"
"
"          INSERT INTO mfg_res_per_unit_rates(mrpur_bu            ,
"
"                         mrpur_plnt            ,
"
"                         mrpur_res_id        ,
"
"                         mrpur_eff_date      ,
"
"                         mrpur_hourly_rate  ,
"
"                         mrpur_cre_by        ,
"
"                         mrpur_cre_ip_addr  ,    --added 23-jan-2020 : Ajis
"
"                         mrpur_cre_os_user  ,    --added 23-jan-2020 : Ajis
"
"                         mrpur_cre_date        )
"
"                                    VALUES(p_bu            ,       --mrpur_bu
"
"                                          p_plnt            ,       --mrpur_plnt
"
"                         cr2.mfgr_res_id    ,       --mrpur_res_id
"
"                         TRUNC(p_date_from) ,       --mrpur_eff_date
"
"                         v_per_hrs_sal        ,       --mrpur_hourly_rate
"
"                         p_user            ,       --mrpur_cre_by
"
"                         v_ip_addr        ,     --mrpur_cre_ip_addr        --added 23-jan-2020 : Ajis
"
"                         v_os_user        ,     --mrpur_cre_os_user        --added 23-jan-2020 : Ajis
"
"                         SYSDATE            );      --mrpur_cre_date
"
"
"
"               END IF;
"
"
"
"            CLOSE c2;
"
"
"
"         END IF;
"
"
"
"      CLOSE c1;
"
"
"
"   END;
"
"
"
"   PROCEDURE proc_upd_emp_hrly_rate_prf(p_bu                    VARCHAR2,
"
"                                   p_plnt                  VARCHAR2,
"
"                    p_emp_id                VARCHAR2,
"
"                    p_eff_from              DATE,
"
"                    p_new_basic_sal         NUMBER,
"
"                    p_user                  VARCHAR2)
"
"   IS
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM planning_control
"
"    WHERE planctrl_bu            = p_bu
"
"      AND planctrl_plnt          = p_plnt
"
"      AND planctrl_upd_emp_hrly_rate = 'P';
"
"
"
"      cr1            c1%ROWTYPE;
"
"
"
"   CURSOR c2
"
"       IS
"
"   SELECT *
"
"     FROM mfg_resources
"
"    WHERE mfgr_bu     = p_bu
"
"      AND mfgr_emp_id = p_emp_id
"
"      AND p_eff_from BETWEEN TRUNC(mfgr_eff_from) AND TRUNC(mfgr_eff_to);
"
"
"
"      cr2            c2%ROWTYPE;
"
"
"
"      v_mnth_days        NUMBER(5,2) := 0;
"
"      v_wrk_hrs          NUMBER(5) := 0;
"
"      v_basic_sal        NUMBER(15, 3) := 0;
"
"      v_per_hrs_sal      NUMBER(15, 3) := 0;
"
"
"
"      v_ip_addr         VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;     --added 23-jan-2020 : Ajis
"
"      v_os_user         VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;    --added 23-jan-2020 : Ajis
"
"
"
"
"
"   BEGIN
"
"
"
"       OPEN c1;
"
"       FETCH c1 INTO cr1;
"
"
"
"         IF c1%FOUND THEN
"
"
"
"            v_mnth_days := cr1.planctrl_labour_mon_days;
"
"            v_wrk_hrs   := cr1.planctrl_labour_per_day_hr;
"
"
"
"            v_basic_sal := NVL(p_new_basic_sal,0);
"
"
"
"            IF v_mnth_days > 0 AND v_wrk_hrs > 0 THEN
"
"               v_per_hrs_sal := (v_basic_sal/v_mnth_days)/v_wrk_hrs;
"
"            ELSE
"
"               RAISE_APPLICATION_ERROR(-20115,'HRM');
"
"            END IF;
"
"
"
"            OPEN c2;
"
"            FETCH c2 INTO cr2;
"
"
"
"               IF c2%FOUND THEN
"
"
"
"          INSERT INTO mfg_res_per_unit_rates(mrpur_bu            ,
"
"                         mrpur_plnt          ,
"
"                         mrpur_res_id        ,
"
"                         mrpur_eff_date        ,
"
"                         mrpur_hourly_rate  ,
"
"                         mrpur_cre_by        ,
"
"                         mrpur_cre_ip_addr  ,    --added 23-jan-2020 : Ajis
"
"                         mrpur_cre_os_user  ,    --added 23-jan-2020 : Ajis
"
"                         mrpur_cre_date        )
"
"                      VALUES(p_bu            ,        --mrpur_bu
"
"                         p_plnt            ,        --mrpur_plnt
"
"                         cr2.mfgr_res_id    ,        --mrpur_res_id
"
"                         TRUNC(p_eff_from)  ,        --mrpur_eff_date
"
"                         v_per_hrs_sal        ,        --mrpur_hourly_rate
"
"                         p_user            ,        --mrpur_cre_by
"
"                         v_ip_addr        ,      --mrpur_cre_ip_addr        --added 23-jan-2020 : Ajis
"
"                         v_os_user        ,      --mrpur_cre_os_user        --added 23-jan-2020 : Ajis
"
"                         SYSDATE            );       --mrpur_cre_date
"
"
"
"               END IF;
"
"
"
"            CLOSE c2;
"
"
"
"         END IF;
"
"
"
"      CLOSE c1;
"
"
"
"   END;
"
"
"
"END;"
/
