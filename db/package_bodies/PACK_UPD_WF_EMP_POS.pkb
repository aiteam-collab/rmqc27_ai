CREATE OR REPLACE
"PACKAGE BODY pack_upd_wf_emp_pos
"
"AS
"
"
"
"   PROCEDURE proc_upd_wf_pos(p_bu                VARCHAR2,
"
"                    p_emp_id                VARCHAR2,
"
"                    p_old_pos_id            VARCHAR2,
"
"                    p_new_pos_id            VARCHAR2,
"
"                    p_user                VARCHAR2)
"
"   IS
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM appl_users
"
"    WHERE appluser_bu     = p_bu
"
"      AND appluser_emp_id = p_emp_id
"
"      AND appluser_status = 'A';
"
"
"
"      cr1                c1%ROWTYPE;
"
"
"
"   CURSOR c2
"
"       IS
"
"   SELECT *
"
"     FROM work_flow,
"
"          wf_direct_authorization
"
"    WHERE wf_bu      = wfda_bu
"
"      AND wf_bus_proc_id = wfda_type
"
"      AND wfda_bu        = p_bu
"
"      AND wfda_position  = p_new_pos_id
"
"      AND wf_auth_type   = 'P';
"
"
"
"      cr2                c2%ROWTYPE;
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
"            OPEN c2;
"
"            FETCH c2 INTO cr2;
"
"
"
"               IF c2%FOUND THEN
"
"                  RAISE_APPLICATION_ERROR(-20043, 'HRM'||'~'||p_bu||'~'||p_new_pos_id);
"
"               ELSE
"
"
"
"          UPDATE wf_direct_authorization
"
"             SET wfda_position = p_new_pos_id
"
"           WHERE wfda_bu       = p_bu
"
"             AND wfda_position = p_old_pos_id
"
"             AND EXISTS (SELECT wf_auth_type
"
"                   FROM work_flow
"
"                  WHERE wf_bu            = wfda_bu
"
"                    AND wf_bus_proc_id = wfda_type
"
"                    AND wf_auth_type   = 'P');
"
"
"
"          UPDATE work_flow_doc_control
"
"             SET wfdc_ctrl_person = p_new_pos_id
"
"           WHERE wfdc_bu       = p_bu
"
"             AND wfdc_ctrl_person = p_old_pos_id
"
"             AND EXISTS (SELECT wf_auth_type
"
"                       FROM work_flow
"
"                  WHERE wf_bu            = wfdc_bu
"
"                    AND wf_bus_proc_id = wfdc_type
"
"                    AND wf_auth_type   = 'P');
"
"
"
"          UPDATE wf_doc_control_log
"
"             SET wfdcl_prev_ctrl_person = p_new_pos_id
"
"           WHERE wfdcl_bu         = p_bu
"
"             AND wfdcl_prev_ctrl_person = p_old_pos_id
"
"             AND EXISTS (SELECT wf_auth_type
"
"                       FROM work_flow
"
"                  WHERE wf_bu            = wfdcl_bu
"
"                    AND wf_bus_proc_id = wfdcl_type
"
"                    AND wf_auth_type   = 'P');
"
"         /*
"
"          UPDATE so_non_person_appr_auth
"
"             SET snpaa_pos_id = p_new_pos_id
"
"           WHERE snpaa_bu     = p_bu
"
"             AND snpaa_pos_id = p_old_pos_id;
"
"         */ ---Commented by oormi
"
"          UPDATE sob_ovrd_auth
"
"             SET soa_pos_id = p_new_pos_id
"
"           WHERE soa_bu     = p_bu
"
"             AND soa_pos_id = p_old_pos_id;
"
"        /*
"
"          UPDATE process_incharge
"
"             SET pi_user_id = p_new_pos_id
"
"           WHERE pi_bu      = p_bu
"
"             AND pi_user_id = p_old_pos_id;
"
"            */
"
"          UPDATE line_incharge
"
"             SET li_user_id = p_new_pos_id
"
"           WHERE li_bu      = p_bu
"
"             AND li_user_id = p_old_pos_id;
"
"
"
"          UPDATE maint_request
"
"             SET mntrqst_rqst_pos_id = p_new_pos_id
"
"           WHERE mntrqst_bu          = p_bu
"
"             AND mntrqst_rqst_pos_id = p_old_pos_id;
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
"   END proc_upd_wf_pos;
"
"
"
"   PROCEDURE proc_upd_wf_emp(p_bu                VARCHAR2,
"
"                    p_user_id                VARCHAR2,
"
"                    p_old_emp_id            VARCHAR2,
"
"                    p_new_emp_id            VARCHAR2,
"
"                    p_upd_opt                VARCHAR2    DEFAULT 'U',     --'U' User and Workflow only, 'A' - User and Workflow and other module access table.
"
"                    p_user                VARCHAR2)
"
"   IS
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM appl_users
"
"    WHERE appluser_bu     = p_bu
"
"      AND appluser_id     = p_user_id
"
"      AND appluser_status = 'A';
"
"
"
"      cr1                c1%ROWTYPE;
"
"
"
"   CURSOR c2
"
"       IS
"
"   SELECT *
"
"     FROM appl_users
"
"    WHERE appluser_bu     = p_bu
"
"      AND appluser_emp_id = p_new_emp_id
"
"      AND appluser_id     <> p_user_id
"
"      AND appluser_status = 'A';
"
"
"
"      cr2                c2%ROWTYPE;
"
"
"
"   CURSOR c3
"
"       IS
"
"   SELECT *
"
"     FROM employees,
"
"          emp_active_infos
"
"    WHERE emp_bu     = empai_bu
"
"      AND emp_emp_id = empai_emp_id
"
"      AND emp_bu     = p_bu
"
"      AND emp_emp_id = p_new_emp_id
"
"      AND emp_status = 'A';
"
"
"
"      cr3                c3%ROWTYPE;
"
"
"
"   BEGIN
"
"
"
"      IF p_old_emp_id = p_new_emp_id THEN
"
"         RAISE_APPLICATION_ERROR(-20044, 'HRM'||'~'||p_bu||'~'||p_old_emp_id||'~'||p_new_emp_id);
"
"      END IF;
"
"
"
"      OPEN c1;
"
"      FETCH c1 INTO cr1;
"
"
"
"         IF c1%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20038, 'HRM'||'~'||p_bu||'~'||p_user_id);
"
"         ELSE
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
"                  RAISE_APPLICATION_ERROR(-20615, 'HRM'||'~'||p_bu||'~'||cr1.appluser_id||'~'||p_new_emp_id);
"
"               END IF;
"
"
"
"            CLOSE c2;
"
"
"
"            OPEN c3;
"
"            FETCH c3 INTO cr3;
"
"
"
"               IF c3%NOTFOUND THEN
"
"                  RAISE_APPLICATION_ERROR(-20615, 'HRM'||'~'||p_bu||'~'||p_new_emp_id);
"
"               END IF;
"
"
"
"            CLOSE c3;
"
"
"
"        UPDATE wf_emp_hierarchy
"
"           SET weh_emp_id = p_new_emp_id
"
"         WHERE weh_bu     = p_bu
"
"           AND weh_emp_id = p_old_emp_id;
"
"
"
"        UPDATE wf_emp_hierarchy
"
"           SET weh_par_emp_id = p_new_emp_id
"
"         WHERE weh_bu         = p_bu
"
"           AND weh_par_emp_id = p_old_emp_id;
"
"
"
"        UPDATE wf_direct_authorization
"
"           SET wfda_position = p_new_emp_id
"
"         WHERE wfda_bu       = p_bu
"
"           AND wfda_position = p_old_emp_id
"
"           AND EXISTS (SELECT wf_auth_type
"
"                 FROM work_flow
"
"                WHERE wf_bu      = wfda_bu
"
"                  AND wf_bus_proc_id = wfda_type
"
"                  AND wf_auth_type   = 'E');
"
"
"
"        UPDATE work_flow_doc_control
"
"           SET wfdc_ctrl_person = p_new_emp_id
"
"         WHERE wfdc_bu         = p_bu
"
"           AND wfdc_ctrl_person = p_old_emp_id
"
"           AND EXISTS (SELECT wf_auth_type
"
"                 FROM work_flow
"
"                WHERE wf_bu      = wfdc_bu
"
"                  AND wf_bus_proc_id = wfdc_type
"
"                  AND wf_auth_type   = 'E');
"
"
"
"        UPDATE wf_doc_control_log
"
"           SET wfdcl_prev_ctrl_person = p_new_emp_id
"
"         WHERE wfdcl_bu           = p_bu
"
"           AND wfdcl_prev_ctrl_person = p_old_emp_id
"
"           AND EXISTS (SELECT wf_auth_type
"
"                 FROM work_flow
"
"                WHERE wf_bu      = wfdcl_bu
"
"                  AND wf_bus_proc_id = wfdcl_type
"
"                  AND wf_auth_type   = 'E');
"
"
"
"            IF p_upd_opt = 'A' THEN
"
"
"
"           UPDATE buyers
"
"              SET buyer_emp_id = p_new_emp_id
"
"            WHERE buyer_bu     = p_bu
"
"              AND buyer_emp_id = p_old_emp_id;
"
"
"
"           UPDATE sales_areas
"
"              SET sa_resp_emp_id = p_new_emp_id
"
"            WHERE sa_bu          = p_bu
"
"              AND sa_resp_emp_id = p_old_emp_id;
"
"
"
"           UPDATE sales_area_terr
"
"              SET sat_resp_emp_id = p_new_emp_id
"
"            WHERE sat_bu           = p_bu
"
"              AND sat_resp_emp_id = p_old_emp_id;
"
"
"
"           UPDATE sales_persons
"
"              SET sp_emp_id = p_new_emp_id
"
"            WHERE sp_bu     = p_bu
"
"              AND sp_emp_id = p_old_emp_id;
"
"
"
"           UPDATE quality_person
"
"              SET qp_emp_id = p_new_emp_id
"
"            WHERE qp_bu     = p_bu
"
"              AND qp_emp_id = p_old_emp_id;
"
"
"
"          /* UPDATE s5_auditors
"
"              SET s5a_emp_id = p_new_emp_id
"
"            WHERE s5a_bu     = p_bu
"
"              AND s5a_emp_id = p_old_emp_id;*/
"
"
"
"           /*UPDATE annl_auditors
"
"              SET aa_emp_id = p_new_emp_id
"
"            WHERE aa_bu     = p_bu
"
"              AND aa_emp_id = p_old_emp_id;*/
"
"
"
"           UPDATE dc_mat_iss_auth
"
"              SET dmia_emp_id = p_new_emp_id
"
"            WHERE dmia_bu     = p_bu
"
"              AND dmia_emp_id = p_old_emp_id;
"
"
"
"           UPDATE pur_admin
"
"              SET pura_emp_id = p_new_emp_id
"
"            WHERE pura_bu     = p_bu
"
"              AND pura_emp_id = p_old_emp_id;
"
"
"
"           UPDATE pur_req_hd
"
"              SET prh_reqstr_id = p_new_emp_id
"
"            WHERE prh_bu        = p_bu
"
"              AND prh_reqstr_id = p_old_emp_id
"
"              AND prh_status    IN ('E');
"
"
"
"           UPDATE gate_entry_hd
"
"              SET gehd_gk_id  = p_new_emp_id
"
"            WHERE gehd_bu     = p_bu
"
"              AND gehd_gk_id  = p_old_emp_id
"
"              AND gehd_status IN ('N', 'C');
"
"
"
"           UPDATE mfg_resources
"
"              SET mfgr_emp_id = p_new_emp_id
"
"            WHERE mfgr_bu     = p_bu
"
"              AND mfgr_emp_id = p_old_emp_id;
"
"           /*
"
"           UPDATE process_incharge
"
"              SET pi_emp_id = p_new_emp_id
"
"            WHERE pi_bu     = p_bu
"
"              AND pi_emp_id = p_old_emp_id;
"
"
"
"           UPDATE planners
"
"              SET planner_emp_id = p_new_emp_id
"
"            WHERE planner_bu     = p_bu
"
"              AND planner_emp_id = p_old_emp_id;
"
"            */
"
"           UPDATE proj_employees
"
"              SET prje_emp_id = p_new_emp_id
"
"            WHERE prje_bu     = p_bu
"
"              AND prje_emp_id = p_old_emp_id;
"
"
"
"           UPDATE proj_exec_team
"
"              SET pet_team_mgr = p_new_emp_id
"
"            WHERE pet_bu       = p_bu
"
"              AND pet_team_mgr = p_old_emp_id;
"
"
"
"           UPDATE proj_exec_members
"
"              SET pem_emp_id = p_new_emp_id
"
"            WHERE pem_bu     = p_bu
"
"              AND pem_emp_id = p_old_emp_id;
"
"
"
"           UPDATE maint_planner
"
"              SET mnt_plnr_emp_id = p_new_emp_id
"
"            WHERE mnt_plnr_bu     = p_bu
"
"              AND mnt_plnr_emp_id = p_old_emp_id;
"
"            /*
"
"           UPDATE maint_resources
"
"              SET mntres_emp_id = p_new_emp_id
"
"            WHERE mntres_bu     = p_bu
"
"              AND mntres_emp_id = p_old_emp_id;
"
"            */
"
"           UPDATE maint_request
"
"              SET mntrqst_rqst_by     = p_new_emp_id,
"
"                  mntrqst_rqst_pos_id = cr3.empai_pos_id
"
"            WHERE mntrqst_bu      = p_bu
"
"              AND mntrqst_rqst_by = p_old_emp_id;
"
"           /*
"
"           UPDATE maint_rqst_investigation
"
"              SET mri_elec_attd_emp_id = p_new_emp_id
"
"            WHERE mri_bu               = p_bu
"
"              AND mri_elec_attd_emp_id = p_old_emp_id;
"
"
"
"           UPDATE maint_wrk_prmt_hd
"
"              SET mwph_wrkr_name = p_new_emp_id
"
"            WHERE mwph_bu        = p_bu
"
"              AND mwph_wrkr_name = p_old_emp_id;
"
"
"
"           UPDATE proj_appr_auth
"
"          SET prjaa_emp_id = p_new_emp_id
"
"        WHERE prjaa_bu     = p_bu
"
"          AND prjaa_emp_id = p_old_emp_id;
"
"
"
"           UPDATE proj_emp_credits
"
"          SET prjec_ec_id = p_new_emp_id
"
"        WHERE prjec_bu    = p_bu
"
"          AND prjec_ec_id = p_old_emp_id;
"
" */  ---Commented by oormi
"
"           UPDATE projects
"
"          SET prj_cont_mgr = p_new_emp_id
"
"        WHERE prj_bu       = p_bu
"
"          AND prj_cont_mgr = p_old_emp_id;
"
"         /*
"
"           UPDATE proj_emp_cur_asgmnt
"
"          SET peca_emp_id = p_new_emp_id
"
"        WHERE peca_bu     = p_bu
"
"          AND peca_emp_id = p_old_emp_id;
"
"
"
"           UPDATE proj_emp_profile
"
"          SET pep_emp_id = p_new_emp_id
"
"        WHERE pep_bu     = p_bu
"
"          AND pep_emp_id = p_old_emp_id;
"
"          */                               --Commented by oormi
"
"           UPDATE proj_emp_time_card_ln
"
"          SET petcl_emp_id = p_new_emp_id
"
"        WHERE petcl_bu     = p_bu
"
"          AND petcl_emp_id = p_old_emp_id;
"
"
"
"            END IF;        --p_upd_opt = 'A' THEN
"
"
"
"        UPDATE appl_users
"
"               SET appluser_emp_id   = p_new_emp_id,
"
"                   appluser_party_id = p_new_emp_id,
"
"                   appluser_upd_by   = p_user,
"
"                   appluser_upd_date = SYSDATE
"
"             WHERE appluser_bu = p_bu
"
"               AND appluser_id = p_user_id;
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
"   END proc_upd_wf_emp;
"
"
"
"   PROCEDURE proc_upd_wf_user(p_bu                VARCHAR2,
"
"                     p_frm_user_id            VARCHAR2,
"
"                     p_to_user_id            VARCHAR2,
"
"                     p_user                VARCHAR2)
"
"   IS
"
"   CURSOR c1(c_user_id            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM appl_users
"
"    WHERE appluser_bu     = p_bu
"
"      AND appluser_id     = c_user_id
"
"      AND appluser_status = 'A';
"
"
"
"      cr1                c1%ROWTYPE;
"
"
"
"   CURSOR c2(c_emp_id            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM employees,
"
"          emp_active_infos
"
"    WHERE emp_bu     = empai_bu
"
"      AND emp_emp_id = empai_emp_id
"
"      AND emp_bu     = p_bu
"
"      AND emp_emp_id = c_emp_id
"
"      AND emp_status = 'A';
"
"
"
"      cr2                c2%ROWTYPE;
"
"
"
"   CURSOR c3(c_pos_id            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM work_flow,
"
"          wf_direct_authorization
"
"    WHERE wf_bu      = wfda_bu
"
"      AND wf_bus_proc_id = wfda_type
"
"      AND wfda_bu        = p_bu
"
"      AND wfda_position  = c_pos_id
"
"      AND wf_auth_type   = 'P';
"
"
"
"      cr3                c3%ROWTYPE;
"
"
"
"      v_old_emp_id            VARCHAR2(10);
"
"      v_old_pos_id            VARCHAR2(10);
"
"      v_new_emp_id            VARCHAR2(10);
"
"      v_new_pos_id            VARCHAR2(10);
"
"
"
"   BEGIN
"
"
"
"      /* To get From user Employee and Position details */
"
"
"
"      OPEN c1(p_frm_user_id);
"
"      FETCH c1 INTO cr1;
"
"
"
"         IF c1%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20038, 'HRM'||'~'||p_frm_user_id);
"
"         ELSE
"
"            v_old_emp_id := cr1.appluser_emp_id;
"
"
"
"            OPEN c2(cr1.appluser_emp_id);
"
"            FETCH c2 INTO cr2;
"
"
"
"               IF c2%NOTFOUND THEN
"
"                  RAISE_APPLICATION_ERROR(-20821, 'HRM'||cr1.appluser_emp_id);
"
"               ELSE
"
"                  v_old_pos_id := cr2.empai_pos_id;
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
"      /* To get To user Employee and Position details */
"
"
"
"      OPEN c1(p_to_user_id);
"
"      FETCH c1 INTO cr1;
"
"
"
"         IF c1%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20038, 'HRM'||'~'||p_to_user_id);
"
"         ELSE
"
"
"
"            v_new_emp_id := cr1.appluser_emp_id;
"
"
"
"            OPEN c2(cr1.appluser_emp_id);
"
"            FETCH c2 INTO cr2;
"
"
"
"               IF c2%NOTFOUND THEN
"
"                  RAISE_APPLICATION_ERROR(-20821, 'HRM'||cr1.appluser_emp_id);
"
"               ELSE
"
"                  v_new_pos_id := cr2.empai_pos_id;
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
"      /* Update Position details from old to new user position */
"
"
"
"      UPDATE wf_direct_authorization
"
"         SET wfda_position = v_new_pos_id
"
"       WHERE wfda_bu       = p_bu
"
"         AND wfda_position = v_old_pos_id
"
"         AND EXISTS (SELECT wf_auth_type
"
"               FROM work_flow
"
"              WHERE wf_bu        = wfda_bu
"
"                AND wf_bus_proc_id = wfda_type
"
"                AND wf_auth_type   = 'P');
"
"
"
"      UPDATE work_flow_doc_control
"
"         SET wfdc_ctrl_person = v_new_pos_id
"
"       WHERE wfdc_bu           = p_bu
"
"         AND wfdc_ctrl_person = v_old_pos_id
"
"         AND EXISTS (SELECT wf_auth_type
"
"               FROM work_flow
"
"              WHERE wf_bu        = wfdc_bu
"
"                AND wf_bus_proc_id = wfdc_type
"
"                AND wf_auth_type   = 'P');
"
"
"
"      UPDATE wf_doc_control_log
"
"         SET wfdcl_prev_ctrl_person = v_new_pos_id
"
"       WHERE wfdcl_bu             = p_bu
"
"         AND wfdcl_prev_ctrl_person = v_old_pos_id
"
"         AND EXISTS (SELECT wf_auth_type
"
"               FROM work_flow
"
"              WHERE wf_bu        = wfdcl_bu
"
"                AND wf_bus_proc_id = wfdcl_type
"
"                AND wf_auth_type   = 'P');
"
"     /*
"
"     UPDATE so_non_person_appr_auth
"
"        SET snpaa_pos_id = v_new_pos_id
"
"      WHERE snpaa_bu     = p_bu
"
"        AND snpaa_pos_id = v_old_pos_id;
"
"    */                                  --Commented by oormi
"
"     UPDATE sob_ovrd_auth
"
"        SET soa_pos_id = v_new_pos_id
"
"      WHERE soa_bu     = p_bu
"
"        AND soa_pos_id = v_old_pos_id;
"
"    /*
"
"     UPDATE process_incharge
"
"        SET pi_user_id = v_new_pos_id
"
"      WHERE pi_bu      = p_bu
"
"        AND pi_user_id = v_old_pos_id;
"
"     */
"
"     UPDATE line_incharge
"
"        SET li_user_id = v_new_pos_id
"
"      WHERE li_bu      = p_bu
"
"        AND li_user_id = v_old_pos_id;
"
"
"
"     UPDATE maint_request
"
"        SET mntrqst_rqst_pos_id = v_new_pos_id
"
"      WHERE mntrqst_bu          = p_bu
"
"        AND mntrqst_rqst_pos_id = v_old_pos_id;
"
"
"
"     /* Update Employee ID details from old to new user Employee */
"
"
"
"     UPDATE wf_emp_hierarchy
"
"    SET weh_emp_id = v_new_emp_id
"
"      WHERE weh_bu     = p_bu
"
"        AND weh_emp_id = v_old_emp_id;
"
"
"
"     UPDATE wf_emp_hierarchy
"
"        SET weh_par_emp_id = v_new_emp_id
"
"      WHERE weh_bu         = p_bu
"
"        AND weh_par_emp_id = v_old_emp_id;
"
"
"
"     UPDATE wf_direct_authorization
"
"        SET wfda_position = v_new_emp_id
"
"      WHERE wfda_bu       = p_bu
"
"        AND wfda_position = v_old_emp_id
"
"        AND EXISTS (SELECT wf_auth_type
"
"               FROM work_flow
"
"             WHERE wf_bu      = wfda_bu
"
"               AND wf_bus_proc_id = wfda_type
"
"               AND wf_auth_type   = 'E');
"
"
"
"     UPDATE work_flow_doc_control
"
"    SET wfdc_ctrl_person = v_new_emp_id
"
"      WHERE wfdc_bu          = p_bu
"
"    AND wfdc_ctrl_person = v_old_emp_id
"
"    AND EXISTS (SELECT wf_auth_type
"
"              FROM work_flow
"
"             WHERE wf_bu      = wfdc_bu
"
"               AND wf_bus_proc_id = wfdc_type
"
"               AND wf_auth_type   = 'E');
"
"
"
"     UPDATE wf_doc_control_log
"
"        SET wfdcl_prev_ctrl_person = v_new_emp_id
"
"      WHERE wfdcl_bu            = p_bu
"
"        AND wfdcl_prev_ctrl_person = v_old_emp_id
"
"        AND EXISTS (SELECT wf_auth_type
"
"              FROM work_flow
"
"             WHERE wf_bu      = wfdcl_bu
"
"               AND wf_bus_proc_id = wfdcl_type
"
"               AND wf_auth_type   = 'E');
"
"
"
"     UPDATE buyers
"
"        SET buyer_emp_id = v_new_emp_id
"
"      WHERE buyer_bu     = p_bu
"
"        AND buyer_emp_id = v_old_emp_id;
"
"
"
"     UPDATE sales_areas
"
"        SET sa_resp_emp_id = v_new_emp_id
"
"      WHERE sa_bu          = p_bu
"
"    AND sa_resp_emp_id = v_old_emp_id;
"
"
"
"     UPDATE sales_area_terr
"
"        SET sat_resp_emp_id = v_new_emp_id
"
"      WHERE sat_bu         = p_bu
"
"    AND sat_resp_emp_id = v_old_emp_id;
"
"
"
"     UPDATE sales_persons
"
"        SET sp_emp_id = v_new_emp_id
"
"      WHERE sp_bu     = p_bu
"
"    AND sp_emp_id = v_old_emp_id;
"
"
"
"     UPDATE quality_person
"
"        SET qp_emp_id = v_new_emp_id
"
"      WHERE qp_bu     = p_bu
"
"    AND qp_emp_id = v_old_emp_id;
"
"
"
"    /* UPDATE s5_auditors
"
"        SET s5a_emp_id = v_new_emp_id
"
"      WHERE s5a_bu     = p_bu
"
"        AND s5a_emp_id = v_old_emp_id;
"
"
"
"     UPDATE annl_auditors
"
"        SET aa_emp_id = v_new_emp_id
"
"      WHERE aa_bu     = p_bu
"
"    AND aa_emp_id = v_old_emp_id;*/
"
"
"
"     UPDATE dc_mat_iss_auth
"
"    SET dmia_emp_id = v_new_emp_id
"
"      WHERE dmia_bu     = p_bu
"
"    AND dmia_emp_id = v_old_emp_id;
"
"
"
"     UPDATE pur_admin
"
"    SET pura_emp_id = v_new_emp_id
"
"      WHERE pura_bu     = p_bu
"
"    AND pura_emp_id = v_old_emp_id;
"
"
"
"     UPDATE pur_req_hd
"
"    SET prh_reqstr_id = v_new_emp_id
"
"      WHERE prh_bu        = p_bu
"
"    AND prh_reqstr_id = v_old_emp_id
"
"    AND prh_status    IN ('E');
"
"
"
"     UPDATE gate_entry_hd
"
"        SET gehd_gk_id  = v_new_emp_id
"
"      WHERE gehd_bu     = p_bu
"
"    AND gehd_gk_id  = v_old_emp_id
"
"    AND gehd_status IN ('N', 'C');
"
"
"
"     UPDATE mfg_resources
"
"        SET mfgr_emp_id = v_new_emp_id
"
"      WHERE mfgr_bu     = p_bu
"
"    AND mfgr_emp_id = v_old_emp_id;
"
"   /*
"
"     UPDATE process_incharge
"
"    SET pi_emp_id = v_new_emp_id
"
"      WHERE pi_bu     = p_bu
"
"    AND pi_emp_id = v_old_emp_id;
"
"
"
"     UPDATE planners
"
"     SET planner_emp_id = v_new_emp_id
"
"      WHERE planner_bu     = p_bu
"
"    AND planner_emp_id = v_old_emp_id;
"
" */
"
"     UPDATE proj_employees
"
"        SET prje_emp_id = v_new_emp_id
"
"      WHERE prje_bu     = p_bu
"
"    AND prje_emp_id = v_old_emp_id;
"
"
"
"     UPDATE proj_exec_team
"
"    SET pet_team_mgr = v_new_emp_id
"
"      WHERE pet_bu       = p_bu
"
"    AND pet_team_mgr = v_old_emp_id;
"
"
"
"     UPDATE proj_exec_members
"
"    SET pem_emp_id = v_new_emp_id
"
"      WHERE pem_bu     = p_bu
"
"    AND pem_emp_id = v_old_emp_id;
"
"
"
"     UPDATE maint_planner
"
"    SET mnt_plnr_emp_id = v_new_emp_id
"
"      WHERE mnt_plnr_bu     = p_bu
"
"    AND mnt_plnr_emp_id = v_old_emp_id;
"
"   /*
"
"     UPDATE maint_resources
"
"    SET mntres_emp_id = v_new_emp_id
"
"      WHERE mntres_bu     = p_bu
"
"        AND mntres_emp_id = v_old_emp_id;
"
"    */
"
"     UPDATE maint_request
"
"        SET mntrqst_rqst_by     = v_new_emp_id,
"
"          mntrqst_rqst_pos_id = v_new_pos_id
"
"      WHERE mntrqst_bu      = p_bu
"
"    AND mntrqst_rqst_by = v_old_emp_id;
"
"  /*
"
"     UPDATE maint_rqst_investigation
"
"    SET mri_elec_attd_emp_id = v_new_emp_id
"
"      WHERE mri_bu               = p_bu
"
"    AND mri_elec_attd_emp_id = v_old_emp_id;
"
"
"
"     UPDATE maint_wrk_prmt_hd
"
"    SET mwph_wrkr_name = v_new_emp_id
"
"      WHERE mwph_bu        = p_bu
"
"    AND mwph_wrkr_name = v_old_emp_id;
"
"
"
"     UPDATE proj_appr_auth
"
"    SET prjaa_emp_id = v_new_emp_id
"
"      WHERE prjaa_bu     = p_bu
"
"    AND prjaa_emp_id = v_old_emp_id;
"
"
"
"     UPDATE proj_emp_credits
"
"    SET prjec_ec_id = v_new_emp_id
"
"      WHERE prjec_bu    = p_bu
"
"    AND prjec_ec_id = v_old_emp_id;
"
"    */                                       --Commented by oormi
"
"     UPDATE projects
"
"    SET prj_cont_mgr = v_new_emp_id
"
"      WHERE prj_bu       = p_bu
"
"    AND prj_cont_mgr = v_old_emp_id;
"
"   /*
"
"     UPDATE proj_emp_cur_asgmnt
"
"    SET peca_emp_id = v_new_emp_id
"
"      WHERE peca_bu     = p_bu
"
"    AND peca_emp_id = v_old_emp_id;
"
"
"
"     UPDATE proj_emp_profile
"
"    SET pep_emp_id = v_new_emp_id
"
"      WHERE pep_bu     = p_bu
"
"    AND pep_emp_id = v_old_emp_id;
"
"   */                                       --Commented by oormi
"
"     UPDATE proj_emp_time_card_ln
"
"    SET petcl_emp_id = v_new_emp_id
"
"      WHERE petcl_bu     = p_bu
"
"    AND petcl_emp_id = v_old_emp_id;
"
"
"
"      /* Update Employee ID details from old to new user Employee */
"
"
"
"     UPDATE user_prefix_access a
"
"        SET a.upa_user_id = p_to_user_id
"
"      WHERE a.upa_bu      = p_bu
"
"        AND a.upa_user_id = p_frm_user_id
"
"        AND NOT EXISTS (SELECT 1
"
"                          FROM user_prefix_access b
"
"                         WHERE b.upa_bu      = p_bu
"
"                           AND b.upa_user_id = p_to_user_id
"
"                           AND b.upa_pfx     = upa_pfx);
"
"      /*
"
"      UPDATE appl_user_role_access
"
"         SET aura_user_id = p_to_user_id
"
"       WHERE aura_bu      = p_bu
"
"         AND aura_user_id = p_frm_user_id;
"
"     */                                       --Commented by oormi
"
"    /*  UPDATE user_bus_fun_access
"
"         SET ubfa_user_id = p_to_user_id
"
"       WHERE ubfa_bu      = p_bu
"
"         AND ubfa_user_id = p_frm_user_id;
"
"    */
"
"      UPDATE user_notfn_asgmnt
"
"         SET una_user_id = p_to_user_id
"
"       WHERE una_bu      = p_bu
"
"         AND una_user_id = p_frm_user_id;
"
"
"
"      UPDATE curr_user_notfn
"
"         SET cun_user_id = p_to_user_id
"
"       WHERE cun_user_id = p_frm_user_id;
"
"
"
"      UPDATE notification_alert
"
"         SET cun_user_id = p_to_user_id
"
"       WHERE cun_user_id = p_frm_user_id;
"
"
"
"      UPDATE pom_control
"
"         SET pomctrl_entity_user = p_to_user_id
"
"       WHERE pomctrl_bu             = p_bu
"
"         AND pomctrl_entity_user = p_frm_user_id;
"
"    /*
"
"      UPDATE prod_admin
"
"         SET proa_user_id = p_to_user_id
"
"       WHERE proa_bu      = p_bu
"
"         AND proa_user_id = p_frm_user_id;*/
"
"     /*
"
"      UPDATE user_store_oper_access
"
"         SET usoa_user_id = p_to_user_id
"
"       WHERE usoa_bu      = p_bu
"
"         AND usoa_user_id = p_frm_user_id;
"
"
"
"      UPDATE user_mr_store_access
"
"         SET umsa_user = p_to_user_id
"
"       WHERE umsa_bu   = p_bu
"
"         AND umsa_user = p_frm_user_id;
"
"      */                                       --Commented by oormi
"
"      UPDATE feas_study_dept_users_access
"
"         SET fsdua_user_id = p_to_user_id
"
"       WHERE fsdua_bu      = p_bu
"
"         AND fsdua_user_id = p_frm_user_id;
"
"
"
"      UPDATE item_code_cre_access
"
"         SET icca_user = p_to_user_id
"
"       WHERE icca_bu   = p_bu
"
"         AND icca_user = p_frm_user_id;
"
"
"
"      UPDATE tqm_admin
"
"         SET tqmad_user = p_to_user_id
"
"       WHERE tqmad_bu   = p_bu
"
"         AND tqmad_user = p_frm_user_id;
"
"
"
"      UPDATE ctn_tab_access
"
"         SET ctn_user_id = p_to_user_id
"
"       WHERE ctn_bu      = p_bu
"
"         AND ctn_user_id = p_frm_user_id;
"
"
"
"      UPDATE ncr_group_user_access
"
"         SET ngua_user_id = p_to_user_id
"
"       WHERE ngua_bu      = p_bu
"
"         AND ngua_user_id = p_frm_user_id;
"
"
"
"      UPDATE suplr_products
"
"         SET suprprod_cre_by = CASE WHEN suprprod_cre_by = p_frm_user_id THEN p_to_user_id ELSE suprprod_cre_by END,
"
"             suprprod_upd_by = CASE WHEN suprprod_upd_by = p_frm_user_id THEN p_to_user_id ELSE suprprod_upd_by END
"
"       WHERE suprprod_bu     = p_bu
"
"         AND suprprod_status = 'N';
"
"
"
"      UPDATE prod_deflt_suplr_hd
"
"         SET pdshd_cre_by = CASE WHEN pdshd_cre_by = p_frm_user_id THEN p_to_user_id ELSE pdshd_cre_by END,
"
"             pdshd_upd_by = CASE WHEN pdshd_upd_by = p_frm_user_id THEN p_to_user_id ELSE pdshd_upd_by END
"
"       WHERE pdshd_bu     = p_bu
"
"         AND pdshd_status = 'N';
"
"
"
"      UPDATE pur_rate_contr_hd
"
"         SET prchd_cre_by = CASE WHEN prchd_cre_by = p_frm_user_id THEN p_to_user_id ELSE prchd_cre_by END,
"
"             prchd_upd_by = CASE WHEN prchd_upd_by = p_frm_user_id THEN p_to_user_id ELSE prchd_upd_by END
"
"       WHERE prchd_bu     = p_bu
"
"         AND prchd_status IN ('E','L');
"
"
"
"      UPDATE pur_rate_contr_ament_hd
"
"         SET prcahd_cre_by = CASE WHEN prcahd_cre_by = p_frm_user_id THEN p_to_user_id ELSE prcahd_cre_by END,
"
"             prcahd_upd_by = CASE WHEN prcahd_upd_by = p_frm_user_id THEN p_to_user_id ELSE prcahd_upd_by END
"
"       WHERE prcahd_bu     = p_bu
"
"         AND prcahd_status IN ('E','L');
"
"
"
"  /*    UPDATE pur_req_hd
"
"         SET prh_control_person = CASE WHEN prh_control_person = p_frm_user_id THEN p_to_user_id ELSE prh_control_person END,
"
"             prh_reqstr_id      = CASE WHEN prh_reqstr_id = v_old_emp_id THEN v_new_emp_id ELSE prh_reqstr_id END,
"
"             prh_cre_by         = CASE WHEN prh_cre_by = p_frm_user_id THEN p_to_user_id ELSE prh_cre_by END,
"
"             prh_upd_by     = CASE WHEN prh_upd_by = p_frm_user_id THEN p_to_user_id ELSE prh_upd_by END
"
"       WHERE prh_bu     = p_bu
"
"         AND prh_status = 'E';*/
"
"
"
"      UPDATE suplr_sch_rqst_hd
"
"         SET ssrh_cre_by = CASE WHEN ssrh_cre_by = p_frm_user_id THEN p_to_user_id ELSE ssrh_cre_by END,
"
"             ssrh_upd_by = CASE WHEn ssrh_upd_by = p_frm_user_id THEN p_to_user_id ELSE ssrh_upd_by END
"
"       WHERE ssrh_bu     = p_bu
"
"         AND ssrh_status = 'E';
"
"
"
"      UPDATE suplr_schld_hd
"
"         SET sshd_cre_by = CASE WHEN sshd_cre_by = p_frm_user_id THEN p_to_user_id ELSE sshd_cre_by END,
"
"             sshd_upd_by = CASE WHEn sshd_upd_by = p_frm_user_id THEN p_to_user_id ELSE sshd_upd_by END
"
"       WHERE sshd_bu     = p_bu
"
"         AND sshd_status IN ('N','T');
"
"
"
"      UPDATE rfq_hd
"
"         SET rfqhd_cre_by = CASE WHEN rfqhd_cre_by = p_frm_user_id THEN p_to_user_id ELSE rfqhd_cre_by END,
"
"             rfqhd_upd_by = CASE WHEn rfqhd_upd_by = p_frm_user_id THEN p_to_user_id ELSE rfqhd_upd_by END
"
"       WHERE rfqhd_bu     = p_bu
"
"         AND rfqhd_status = 'E';
"
"
"
"      UPDATE pur_order_hd
"
"         SET poh_cre_by = CASE WHEN poh_cre_by = p_frm_user_id THEN p_to_user_id ELSE poh_cre_by END,
"
"             poh_upd_by = CASE WHEN poh_upd_by = p_frm_user_id THEN p_to_user_id ELSE poh_upd_by END
"
"       WHERE poh_bu     = p_bu
"
"         AND poh_status IN ('E','M');
"
"
"
"      UPDATE inv_material_request_hd
"
"         SET imrhd_cre_by = CASE WHEN imrhd_cre_by = p_frm_user_id THEN p_to_user_id ELSE imrhd_cre_by END,
"
"             imrhd_upd_by = CASE WHEn imrhd_upd_by = p_frm_user_id THEN p_to_user_id ELSE imrhd_upd_by END
"
"       WHERE imrhd_bu     = p_bu
"
"         AND imrhd_status = 'E';
"
"
"
"      UPDATE inv_material_request_ln
"
"         SET imrln_sel_user = p_to_user_id
"
"       WHERE imrln_bu       = p_bu
"
"         AND imrln_sel_user = p_frm_user_id
"
"         AND imrln_status   = 'E';
"
"
"
"      UPDATE stock_adj_trans_hd
"
"         SET sathd_cre_by = CASE WHEN sathd_cre_by = p_frm_user_id THEN p_to_user_id ELSE sathd_cre_by END,
"
"             sathd_upd_by = CASE WHEN sathd_upd_by = p_frm_user_id THEN p_to_user_id ELSE sathd_upd_by END
"
"       WHERE sathd_bu     = p_bu
"
"         AND sathd_status = 'E';
"
"
"
"      UPDATE sales_rate_contr_hd
"
"         SET srchd_cre_by = CASE WHEN srchd_cre_by = p_frm_user_id THEN p_to_user_id ELSE srchd_cre_by END,
"
"             srchd_upd_by = CASE WHEN srchd_upd_by = p_frm_user_id THEN p_to_user_id ELSE srchd_upd_by END
"
"       WHERE srchd_bu     = p_bu
"
"         AND srchd_status = 'E';
"
"
"
"      UPDATE sales_rate_contr_ament_hd
"
"         SET srcahd_cre_by = CASE WHEN srcahd_cre_by = p_frm_user_id THEN p_to_user_id ELSE srcahd_cre_by END,
"
"             srcahd_upd_by = CASE WHEN srcahd_upd_by = p_frm_user_id  THEN p_to_user_id ELSE srcahd_upd_by END
"
"       WHERE srcahd_bu     = p_bu
"
"         AND srcahd_status = 'E';
"
"
"
"      UPDATE cust_order_hd
"
"         SET cohd_cre_by = CASE WHEN cohd_cre_by = p_frm_user_id THEN p_to_user_id ELSE cohd_cre_by END,
"
"             cohd_upd_by = CASE WHEN cohd_upd_by = p_frm_user_id THEN p_to_user_id ELSE cohd_upd_by END
"
"       WHERE cohd_bu     = p_bu
"
"         AND cohd_status = 'E';
"
"
"
"     /* UPDATE cust_sales_order_hd
"
"         SET csohd_cre_by = CASE WHEN csohd_cre_by = p_frm_user_id THEN p_to_user_id ELSE csohd_cre_by END,
"
"             csohd_upd_by = CASE WHEN csohd_upd_by = p_frm_user_id THEN p_to_user_id ELSE csohd_upd_by END
"
"       WHERE csohd_bu     = p_bu
"
"         AND csohd_status = 'N';*/
"
"
"
"      UPDATE sales_order_hd
"
"         SET soh_cre_by = CASE WHEN soh_cre_by = p_frm_user_id THEN p_to_user_id ELSE soh_cre_by END,
"
"             soh_upd_by = CASE WHEN soh_upd_by = p_frm_user_id THEN p_to_user_id ELSE soh_upd_by END
"
"       WHERE soh_bu     = p_bu
"
"         AND soh_status IN ('N','T');
"
"
"
"      UPDATE sales_invoices_hd
"
"         SET sihd_cre_by = CASE WHEN sihd_cre_by = p_frm_user_id THEN p_to_user_id ELSE sihd_cre_by END,
"
"             sihd_upd_by = CASE WHEN sihd_upd_by = p_frm_user_id THEN p_to_user_id ELSE sihd_upd_by END
"
"       WHERE sihd_bu     = p_bu
"
"         AND sihd_status IN ('N','P');
"
"      /*
"
"      UPDATE sales_return_ln
"
"         SET srtln_frt_sel_user = p_to_user_id
"
"       WHERE srtln_bu           = p_bu
"
"         AND srtln_frt_sel_user = p_frm_user_id
"
"         AND srtln_status       IN ('N','Q');
"
"      */
"
"      UPDATE po_rcpt_first_stage_insp_hd
"
"         SET prfsih_cre_by = CASE WHEN prfsih_cre_by = p_frm_user_id THEN p_to_user_id ELSE prfsih_cre_by END,
"
"             prfsih_upd_by = CASE WHEN prfsih_upd_by = p_frm_user_id THEN p_to_user_id ELSE prfsih_upd_by END
"
"       WHERE prfsih_bu     = p_bu
"
"         AND prfsih_status = 'N';
"
"
"
"      UPDATE tqm_qc_hd
"
"         SET tqhd_cre_by = CASE WHEN tqhd_cre_by = p_frm_user_id THEN p_to_user_id ELSE tqhd_cre_by END,
"
"             tqhd_upd_by = CASE WHEN tqhd_upd_by = p_frm_user_id THEN p_to_user_id ELSE tqhd_upd_by END
"
"       WHERE tqhd_bu     = p_bu
"
"         AND tqhd_status = 'E';
"
"
"
"      UPDATE tqm_ncr
"
"         SET tqncr_cre_by = CASE WHEN tqncr_cre_by = p_frm_user_id THEN p_to_user_id ELSE tqncr_cre_by END,
"
"             tqncr_upd_by = CASE WHEN tqncr_upd_by = p_frm_user_id THEN p_to_user_id ELSE tqncr_upd_by END
"
"       WHERE tqncr_bu     = p_bu
"
"         AND tqncr_status = 'O';
"
"
"
"      UPDATE suplr_doc_hd
"
"         SET suphd_cre_by = p_to_user_id
"
"       WHERE suphd_bu     = p_bu
"
"         AND suphd_cre_by = p_frm_user_id
"
"         AND suphd_status IN ('N', 'O');
"
"     /*
"
"      UPDATE cust_doc
"
"         SET cdoc_cre_by = p_to_user_id
"
"       WHERE cdoc_bu     = p_bu
"
"         AND cdoc_cre_by = p_frm_user_id
"
"         AND cdoc_status IN ('N', 'O');
"
"     */
"
"      UPDATE bank_trans
"
"         SET btrans_cre_by = p_to_user_id
"
"       WHERE btrans_bu     = p_bu
"
"         AND btrans_cre_by = p_frm_user_id
"
"         AND btrans_status IN ('N', 'O', 'S');
"
"
"
"      UPDATE gl_jrnl_hd
"
"         SET gjh_cre_by = p_to_user_id
"
"       WHERE gjh_bu     = p_bu
"
"         AND gjh_cre_by = p_frm_user_id
"
"         AND gjh_status IN ('N', 'R');
"
"
"
"      UPDATE gl_jrnl_ln
"
"         SET gjl_cre_by = p_to_user_id
"
"       WHERE gjl_bu     = p_bu
"
"         AND gjl_cre_by = p_frm_user_id
"
"         AND gjl_status IN ('N', 'R');
"
"
"
"      UPDATE appl_journals
"
"         SET aj_cre_by = p_to_user_id
"
"       WHERE aj_bu     = p_bu
"
"         AND aj_cre_by = p_frm_user_id;
"
"
"
"      UPDATE bom_hd
"
"         SET bomhd_cre_by = CASE WHEN bomhd_cre_by = p_frm_user_id THEN p_to_user_id ELSE bomhd_cre_by END,
"
"             bomhd_upd_by = CASE WHEN bomhd_upd_by = p_frm_user_id THEN p_to_user_id ELSE bomhd_upd_by END
"
"       WHERE bomhd_bu     = p_bu
"
"         AND bomhd_status = 'N';
"
"
"
"      UPDATE mfg_sales_forecast_hd
"
"         SET msfhd_cre_by = CASE WHEN msfhd_cre_by = p_frm_user_id THEN p_to_user_id ELSE msfhd_cre_by END,
"
"             msfhd_upd_by = CASE WHEN msfhd_upd_by = p_frm_user_id THEN p_to_user_id ELSE msfhd_upd_by END
"
"       WHERE msfhd_bu     = p_bu
"
"         AND msfhd_status IN ('V','N');
"
"
"
"      UPDATE mrp_hd
"
"         SET mrphd_cre_by = CASE WHEN mrphd_cre_by = p_frm_user_id THEN p_to_user_id ELSE mrphd_cre_by END,
"
"             mrphd_upd_by = CASE WHEN mrphd_upd_by = p_frm_user_id THEN p_to_user_id ELSE mrphd_upd_by END
"
"       WHERE mrphd_bu     = p_bu
"
"         AND mrphd_status = 'N';
"
"
"
"      UPDATE prod_order_hd
"
"         SET prohd_cre_by = CASE WHEN prohd_cre_by = p_frm_user_id THEN p_to_user_id ELSE prohd_cre_by END,
"
"             prohd_upd_by = CASE WHEN prohd_upd_by = p_frm_user_id THEN p_to_user_id ELSE prohd_upd_by END
"
"       WHERE prohd_bu     = p_bu
"
"         AND prohd_status = 'N';
"
"
"
"      UPDATE prod_plan_mon_hd
"
"         SET ppmh_cre_by = CASE WHEN ppmh_cre_by = p_frm_user_id THEN p_to_user_id ELSE ppmh_cre_by END
"
"       WHERE ppmh_bu     = p_bu
"
"         AND ppmh_status = 'N';
"
"
"
"      UPDATE projects
"
"         SET prj_cre_by = CASE WHEN prj_cre_by = p_frm_user_id THEN p_to_user_id ELSE prj_cre_by END,
"
"             prj_upd_by = CASE WHEN prj_upd_by = p_frm_user_id THEN p_to_user_id ELSE prj_upd_by END
"
"       WHERE prj_bu     = p_bu
"
"         AND prj_status = 'N';
"
"
"
"      UPDATE rework_order_hd
"
"         SET rwohd_cre_by = CASE WHEN rwohd_cre_by = p_frm_user_id THEN p_to_user_id ELSE rwohd_cre_by END,
"
"             rwohd_upd_by = CASE WHEN rwohd_upd_by = p_frm_user_id THEN p_to_user_id ELSE rwohd_upd_by END
"
"       WHERE rwohd_bu     = p_bu
"
"         AND rwohd_status = 'N';
"
"
"
"      UPDATE mchn_tool_setup_hd
"
"         SET mtsh_cre_by = CASE WHEN mtsh_cre_by = p_frm_user_id THEN p_to_user_id ELSE mtsh_cre_by END,
"
"             mtsh_upd_by = CASE WHEN mtsh_upd_by = p_frm_user_id THEN p_to_user_id ELSE mtsh_upd_by END
"
"       WHERE mtsh_bu     = p_bu
"
"         AND mtsh_status = 'N';
"
"
"
"      UPDATE maint_request
"
"     SET mntrqst_cre_by = CASE WHEN mntrqst_cre_by = p_frm_user_id THEN p_to_user_id ELSE mntrqst_cre_by END,
"
"             mntrqst_upd_by = CASE WHEN mntrqst_upd_by = p_frm_user_id THEN p_to_user_id ELSE mntrqst_upd_by END
"
"       WHERE mntrqst_bu     = p_bu
"
"         AND mntrqst_status = 'N';
"
"
"
"      UPDATE maint_emp_time_cards_hd
"
"         SET metchd_cre_by = CASE WHEN metchd_cre_by = p_frm_user_id THEN p_to_user_id ELSE metchd_cre_by END,
"
"             metchd_upd_by = CASE WHEN metchd_upd_by = p_frm_user_id THEN p_to_user_id ELSE metchd_upd_by END
"
"       WHERE metchd_bu     = p_bu
"
"         AND metchd_status = 'N';
"
"
"
"      UPDATE maint_wo
"
"         SET mntwo_cre_by = CASE WHEN mntwo_cre_by = p_frm_user_id THEN p_to_user_id ELSE mntwo_cre_by END,
"
"             mntwo_upd_by = CASE WHEN mntwo_upd_by = p_frm_user_id THEN p_to_user_id ELSE mntwo_upd_by END
"
"       WHERE mntwo_bu     = p_bu
"
"         AND mntwo_status = 'N';
"
"
"
"      UPDATE projects
"
"         SET prj_cre_by = CASE WHEN prj_cre_by = p_frm_user_id THEN p_to_user_id ELSE prj_cre_by END,
"
"             prj_upd_by = CASE WHEN prj_upd_by = p_frm_user_id THEN p_to_user_id ELSE prj_upd_by END
"
"       WHERE prj_bu     = p_bu
"
"         AND prj_status = 'N';
"
"
"
"      UPDATE prod_comp_hd
"
"         SET pchd_cre_by = CASE WHEN pchd_cre_by = p_frm_user_id THEN p_to_user_id ELSE pchd_cre_by END,
"
"             pchd_upd_by = CASE WHEN pchd_upd_by = p_frm_user_id THEN p_to_user_id ELSE pchd_upd_by END
"
"       WHERE pchd_bu     = p_bu
"
"         AND pchd_status = 'N';
"
"
"
"      UPDATE mchn_tool_setup_hd
"
"         SET mtsh_cre_by = CASE WHEN mtsh_cre_by = p_frm_user_id THEN p_to_user_id ELSE mtsh_cre_by END,
"
"             mtsh_upd_by = CASE WHEN mtsh_upd_by = p_frm_user_id THEN p_to_user_id ELSE mtsh_upd_by END
"
"       WHERE mtsh_bu     = p_bu
"
"         AND mtsh_status = 'N';
"
"
"
"   END proc_upd_wf_user;
"
"
"
"   PROCEDURE proc_cre_wf_user(p_bu                VARCHAR2,
"
"                     p_frm_user_id            VARCHAR2,
"
"                     p_to_user_id            VARCHAR2,
"
"                     p_user                VARCHAR2)
"
"   IS
"
"   CURSOR c1(c_user_id            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM appl_users
"
"    WHERE appluser_bu     = p_bu
"
"      AND appluser_id     = c_user_id
"
"      AND appluser_status = 'A';
"
"
"
"      cr1                c1%ROWTYPE;
"
"
"
"   CURSOR c2(c_emp_id            VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM employees,
"
"          emp_active_infos
"
"    WHERE emp_bu     = empai_bu
"
"      AND emp_emp_id = empai_emp_id
"
"      AND emp_bu     = p_bu
"
"      AND emp_emp_id = c_emp_id
"
"      AND emp_status = 'A';
"
"
"
"      cr2                c2%ROWTYPE;
"
"
"
"      v_old_emp_id            VARCHAR2(10);
"
"      v_old_pos_id            VARCHAR2(10);
"
"      v_new_emp_id            VARCHAR2(10);
"
"      v_new_pos_id            VARCHAR2(10);
"
"      v_new_emp_doj            DATE;
"
"      v_new_emp_dept            VARCHAR2(10);
"
"      v_new_emp_job            VARCHAR2(10);
"
"      v_eff_from            DATE;
"
"      v_eff_to                DATE;
"
"      v_seq_no                NUMBER(5);
"
"
"
"   BEGIN
"
"
"
"      /* To get From user Employee and Position details */
"
"
"
"      OPEN c1(p_frm_user_id);
"
"      FETCH c1 INTO cr1;
"
"
"
"         IF c1%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20038, 'HRM'||'~'||p_frm_user_id);
"
"         ELSE
"
"            v_old_emp_id := cr1.appluser_emp_id;
"
"
"
"            OPEN c2(cr1.appluser_emp_id);
"
"            FETCH c2 INTO cr2;
"
"
"
"               IF c2%NOTFOUND THEN
"
"                  RAISE_APPLICATION_ERROR(-20821, 'HRM'||cr1.appluser_emp_id);
"
"               ELSE
"
"                  v_old_pos_id := cr2.empai_pos_id;
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
"      /* To get To user Employee and Position details */
"
"
"
"      OPEN c1(p_to_user_id);
"
"      FETCH c1 INTO cr1;
"
"
"
"         IF c1%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20038, 'HRM'||'~'||p_to_user_id);
"
"         ELSE
"
"
"
"            v_new_emp_id := cr1.appluser_emp_id;
"
"
"
"            OPEN c2(cr1.appluser_emp_id);
"
"            FETCH c2 INTO cr2;
"
"
"
"               IF c2%NOTFOUND THEN
"
"                  RAISE_APPLICATION_ERROR(-20821, 'HRM'||cr1.appluser_emp_id);
"
"               ELSE
"
"                  v_new_pos_id   := cr2.empai_pos_id;
"
"                  v_new_emp_doj  := TRUNC(cr2.emp_start_date);
"
"                  v_new_emp_dept := cr2.empai_dept_id;
"
"                  v_new_emp_job     := cr2.empai_job_id;
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
"      v_eff_from := v_new_emp_doj;
"
"      v_eff_to   := '31-DEC-2099';
"
"
"
"      /* Insert Work Flow Authorization based on Type Position */
"
"
"
"      FOR cr3 IN (SELECT *
"
"                  FROM wf_direct_authorization
"
"                 WHERE wfda_bu       = p_bu
"
"                  AND wfda_position = v_old_pos_id
"
"                  AND EXISTS (SELECT wf_auth_type
"
"                       FROM work_flow
"
"                      WHERE wf_bu            = wfda_bu
"
"                    AND wf_bus_proc_id = wfda_type
"
"                    AND wf_auth_type   = 'P'))
"
"      LOOP
"
"
"
"         UPDATE wf_direct_authorization
"
"            SET wfda_position = v_new_pos_id
"
"          WHERE wfda_bu       = p_bu
"
"            AND wfda_type     = cr3.wfda_type
"
"            AND wfda_seq_no   = cr3.wfda_seq_no
"
"            AND wfda_position = v_new_pos_id
"
"            AND EXISTS (SELECT wf_auth_type
"
"                  FROM work_flow
"
"                 WHERE wf_bu           = wfda_bu
"
"                   AND wf_bus_proc_id = wfda_type
"
"                   AND wf_auth_type   = 'P');
"
"
"
"         IF SQL%NOTFOUND THEN
"
"
"
"            SELECT NVL(MAX(wfda_sub_seq_no),0) + 1
"
"          INTO v_seq_no
"
"          FROM wf_direct_authorization
"
"         WHERE wfda_bu     = p_bu
"
"           AND wfda_type   = cr3.wfda_type
"
"              AND wfda_seq_no = cr3.wfda_seq_no;
"
"
"
"            INSERT INTO wf_direct_authorization(wfda_bu         ,
"
"                        wfda_type     ,
"
"                        wfda_seq_no     ,
"
"                        wfda_sub_seq_no     ,
"
"                        wfda_plnt     ,
"
"                        wfda_position     ,
"
"                        wfda_date_from     ,
"
"                        wfda_date_to     ,
"
"                        wfda_value     ,
"
"                        wfda_aod_flag     ,
"
"                        wfda_mobile_no     ,
"
"                        wfda_appr_bu     ,
"
"                        wfda_disc_pct     ,
"
"                        wfda_cre_by     ,
"
"                        wfda_cre_date     )
"
"                     VALUES(cr3.wfda_bu     ,        --wfda_bu
"
"                        cr3.wfda_type     ,        --wfda_type
"
"                        cr3.wfda_seq_no     ,        --wfda_seq_no
"
"                        v_seq_no     ,        --wfda_sub_seq_no
"
"                        cr3.wfda_plnt     ,        --wfda_plnt
"
"                        v_new_pos_id     ,        --wfda_position
"
"                        v_eff_from     ,        --wfda_date_from
"
"                        v_eff_to     ,        --wfda_date_to
"
"                        cr3.wfda_value     ,        --wfda_value
"
"                        cr3.wfda_aod_flag,        --wfda_aod_flag
"
"                        NULL         ,        --wfda_mobile_no
"
"                        cr3.wfda_appr_bu ,        --wfda_appr_bu
"
"                        cr3.wfda_disc_pct,        --wfda_disc_pct
"
"                        p_user         ,        --wfda_cre_by
"
"                        SYSDATE         );        --wfda_cre_date
"
"
"
"         END IF;
"
"
"
"      END LOOP c3;
"
"
"
"      /* Insert Work Flow Authorization based on Type Employee */
"
"
"
"      FOR cr4 IN (SELECT *
"
"                  FROM wf_direct_authorization
"
"                 WHERE wfda_bu       = p_bu
"
"                  AND wfda_position = v_old_emp_id
"
"                  AND EXISTS (SELECT wf_auth_type
"
"                       FROM work_flow
"
"                      WHERE wf_bu            = wfda_bu
"
"                    AND wf_bus_proc_id = wfda_type
"
"                    AND wf_auth_type   = 'E'))
"
"      LOOP
"
"
"
"         UPDATE wf_direct_authorization
"
"            SET wfda_position = v_new_emp_id
"
"          WHERE wfda_bu       = p_bu
"
"            AND wfda_type     = cr4.wfda_type
"
"            AND wfda_seq_no   = cr4.wfda_seq_no
"
"            AND wfda_position = v_new_emp_id
"
"            AND EXISTS (SELECT wf_auth_type
"
"                  FROM work_flow
"
"                 WHERE wf_bu           = wfda_bu
"
"                   AND wf_bus_proc_id = wfda_type
"
"                   AND wf_auth_type   = 'E');
"
"
"
"         IF SQL%NOTFOUND THEN
"
"
"
"            SELECT NVL(MAX(wfda_sub_seq_no),0) + 1
"
"          INTO v_seq_no
"
"          FROM wf_direct_authorization
"
"         WHERE wfda_bu     = p_bu
"
"           AND wfda_type   = cr4.wfda_type
"
"              AND wfda_seq_no = cr4.wfda_seq_no;
"
"
"
"            INSERT INTO wf_direct_authorization(wfda_bu         ,
"
"                        wfda_type     ,
"
"                        wfda_seq_no     ,
"
"                        wfda_sub_seq_no     ,
"
"                        wfda_plnt     ,
"
"                        wfda_position     ,
"
"                        wfda_date_from     ,
"
"                        wfda_date_to     ,
"
"                        wfda_value     ,
"
"                        wfda_aod_flag     ,
"
"                        wfda_mobile_no     ,
"
"                        wfda_appr_bu     ,
"
"                        wfda_disc_pct     ,
"
"                        wfda_cre_by     ,
"
"                        wfda_cre_date     )
"
"                     VALUES(cr4.wfda_bu     ,        --wfda_bu
"
"                        cr4.wfda_type     ,        --wfda_type
"
"                        cr4.wfda_seq_no     ,        --wfda_seq_no
"
"                        v_seq_no     ,        --wfda_sub_seq_no
"
"                        cr4.wfda_plnt     ,        --wfda_plnt
"
"                        v_new_emp_id     ,        --wfda_position
"
"                        v_eff_from     ,        --wfda_date_from
"
"                        v_eff_to     ,        --wfda_date_to
"
"                        cr4.wfda_value     ,        --wfda_value
"
"                        cr4.wfda_aod_flag,        --wfda_aod_flag
"
"                        NULL         ,        --wfda_mobile_no
"
"                        cr4.wfda_appr_bu ,        --wfda_appr_bu
"
"                        cr4.wfda_disc_pct,        --wfda_disc_pct
"
"                        p_user         ,        --wfda_cre_by
"
"                        SYSDATE         );        --wfda_cre_date
"
"
"
"         END IF;
"
"
"
"      END LOOP c4;
"
"      /*
"
"      FOR cr5 IN (SELECT *
"
"                  FROM so_non_person_appr_auth
"
"                 WHERE snpaa_bu     = p_bu
"
"                 AND snpaa_pos_id = v_old_pos_id)
"
"      LOOP
"
"
"
"         UPDATE so_non_person_appr_auth
"
"            SET snpaa_pos_id = v_new_pos_id
"
"          WHERE snpaa_bu     = p_bu
"
"            AND snpaa_pos_id = v_new_pos_id;
"
"
"
"         IF SQL%NOTFOUND THEN
"
"
"
"            INSERT INTO so_non_person_appr_auth(snpaa_bu      ,
"
"                        snpaa_pos_id      ,
"
"                        snpaa_cumm_pct      ,
"
"                        snpaa_date_from      ,
"
"                        snpaa_date_to      ,
"
"                        snpaa_cre_by      ,
"
"                        snpaa_cre_date      )
"
"                     VALUES(cr5.snpaa_bu      ,        --snpaa_bu
"
"                        v_new_pos_id      ,        --snpaa_pos_id
"
"                        cr5.snpaa_cumm_pct,        --snpaa_cumm_pct
"
"                        v_eff_from      ,        --snpaa_date_from
"
"                        v_eff_to      ,        --snpaa_date_to
"
"                        p_user          ,        --snpaa_cre_by
"
"                        SYSDATE          );        --snpaa_cre_date
"
"
"
"         END IF;
"
"
"
"      END LOOP c5;
"
"      */                                       --Commented by oormi
"
"      FOR cr6 IN (SELECT *
"
"                  FROM sob_ovrd_auth
"
"                 WHERE soa_bu     = p_bu
"
"                 AND soa_pos_id = v_old_pos_id)
"
"      LOOP
"
"
"
"         UPDATE sob_ovrd_auth
"
"            SET soa_pos_id = v_new_pos_id
"
"          WHERE soa_bu     = p_bu
"
"            AND soa_plnt   = cr6.soa_plnt
"
"            AND soa_pos_id = v_new_pos_id;
"
"
"
"         IF SQL%NOTFOUND THEN
"
"
"
"            INSERT INTO sob_ovrd_auth(soa_bu        ,
"
"                      soa_plnt        ,
"
"                      soa_pos_id    ,
"
"                      soa_date_from    ,
"
"                      soa_date_to    ,
"
"                      soa_cre_by    ,
"
"                      soa_cre_date    )
"
"                   VALUES(cr6.soa_bu    ,        --soa_bu
"
"                      cr6.soa_plnt    ,        --soa_plnt
"
"                      v_new_pos_id    ,        --soa_pos_id
"
"                      v_eff_from    ,        --soa_date_from
"
"                      v_eff_to        ,        --soa_date_to
"
"                      p_user        ,        --soa_cre_by
"
"                      SYSDATE        );        --soa_cre_date
"
"
"
"         END IF;
"
"
"
"      END LOOP c6;
"
"
"
"     /* FOR cr7 IN (SELECT *
"
"                  FROM process_incharge
"
"                 WHERE pi_bu      = p_bu
"
"                    AND pi_user_id = v_old_pos_id)
"
"      LOOP
"
"
"
"         UPDATE process_incharge
"
"            SET pi_user_id = v_new_pos_id
"
"          WHERE pi_bu      = p_bu
"
"            AND pi_plnt    = cr7.pi_plnt
"
"            AND pi_proc_id = cr7.pi_proc_id
"
"            AND pi_user_id = v_new_pos_id;
"
"
"
"         IF SQL%NOTFOUND THEN
"
"
"
"            INSERT INTO process_incharge(pi_bu        ,
"
"                     pi_plnt    ,
"
"                     pi_proc_id    ,
"
"                     pi_user_id    ,
"
"                     pi_emp_id    ,
"
"                     pi_eff_from    ,
"
"                     pi_eff_to    ,
"
"                     pi_cre_by    ,
"
"                     pi_cre_date    )
"
"                  VALUES(cr7.pi_bu    ,        --pi_bu
"
"                     cr7.pi_plnt    ,        --pi_plnt
"
"                     cr7.pi_proc_id    ,        --pi_proc_id
"
"                     v_new_pos_id    ,        --pi_user_id
"
"                     v_new_emp_id    ,        --pi_emp_id
"
"                     v_eff_from    ,        --pi_eff_from
"
"                     v_eff_to    ,        --pi_eff_to
"
"                     p_user        ,        --pi_cre_by
"
"                     SYSDATE    );        --pi_cre_date
"
"
"
"
"
"         END IF;
"
"
"
"      END LOOP c7;*/
"
"
"
"      FOR cr8 IN (SELECT *
"
"                  FROM line_incharge
"
"                 WHERE li_bu      = p_bu
"
"                 AND li_user_id = v_old_pos_id)
"
"      LOOP
"
"
"
"         UPDATE line_incharge
"
"            SET li_user_id = v_new_pos_id
"
"          WHERE li_bu      = p_bu
"
"            AND li_plnt    = cr8.li_plnt
"
"            AND li_line_id = cr8.li_line_id
"
"            AND li_user_id = v_new_pos_id;
"
"
"
"         IF SQL%NOTFOUND THEN
"
"
"
"            INSERT INTO line_incharge(li_bu        ,
"
"                      li_plnt        ,
"
"                      li_line_id    ,
"
"                      li_user_id    ,
"
"                      li_eff_from    ,
"
"                      li_eff_to          ,
"
"                      li_cre_by        ,
"
"                      li_cre_date    )
"
"                   VALUES(cr8.li_bu        ,        --li_bu
"
"                      cr8.li_plnt    ,        --li_plnt
"
"                      cr8.li_line_id    ,        --li_line_id
"
"                      v_new_pos_id    ,        --li_user_id
"
"                      v_eff_from    ,        --li_eff_from
"
"                      v_eff_to          ,        --li_eff_to
"
"                      p_user        ,        --li_cre_by
"
"                      SYSDATE        );        --li_cre_date
"
"
"
"         END IF;
"
"
"
"      END LOOP c8;
"
"
"
"      FOR cr9 IN (SELECT *
"
"                FROM wf_emp_hierarchy
"
"               WHERE weh_bu     = p_bu
"
"                 AND weh_emp_id = v_old_emp_id)
"
"      LOOP
"
"
"
"         UPDATE wf_emp_hierarchy
"
"        SET weh_emp_id = v_new_emp_id
"
"          WHERE weh_bu         = p_bu
"
"            AND weh_emp_id     = v_new_emp_id
"
"            AND weh_appr_bu    = cr9.weh_appr_bu
"
"        AND weh_appr_plnt  = cr9.weh_appr_plnt
"
"            AND weh_par_emp_id = cr9.weh_par_emp_id;
"
"
"
"         IF SQL%NOTFOUND THEN
"
"
"
"            INSERT INTO wf_emp_hierarchy(weh_bu            ,
"
"                     weh_emp_id        ,
"
"                     weh_appr_bu        ,
"
"                     weh_appr_plnt        ,
"
"                     weh_par_emp_id        ,
"
"                     weh_deflt_flag        ,
"
"                     weh_cre_by        ,
"
"                     weh_cre_date        )
"
"                   VALUES(cr9.weh_bu        ,        --weh_bu
"
"                     v_new_emp_id        ,        --weh_emp_id
"
"                     cr9.weh_appr_bu    ,        --weh_appr_bu
"
"                     cr9.weh_appr_plnt    ,        --weh_appr_plnt
"
"                     cr9.weh_par_emp_id    ,        --weh_par_emp_id
"
"                     cr9.weh_deflt_flag    ,        --weh_deflt_flag
"
"                     p_user            ,        --weh_cre_by
"
"                     SYSDATE        );        --weh_cre_date
"
"
"
"         END IF;
"
"
"
"      END LOOP c9;
"
"
"
"      FOR cr10 IN (SELECT *
"
"                 FROM wf_emp_hierarchy
"
"                WHERE weh_bu         = p_bu
"
"                  AND weh_par_emp_id = v_old_emp_id)
"
"      LOOP
"
"
"
"         UPDATE wf_emp_hierarchy
"
"        SET weh_par_emp_id = v_new_emp_id
"
"          WHERE weh_bu         = p_bu
"
"            AND weh_emp_id     = cr10.weh_emp_id
"
"            AND weh_appr_bu    = cr10.weh_appr_bu
"
"        AND weh_appr_plnt  = cr10.weh_appr_plnt
"
"            AND weh_par_emp_id = v_new_emp_id;
"
"
"
"         IF SQL%NOTFOUND THEN
"
"
"
"            INSERT INTO wf_emp_hierarchy(weh_bu            ,
"
"                     weh_emp_id        ,
"
"                     weh_appr_bu        ,
"
"                     weh_appr_plnt        ,
"
"                     weh_par_emp_id        ,
"
"                     weh_deflt_flag        ,
"
"                     weh_cre_by        ,
"
"                     weh_cre_date        )
"
"                   VALUES(cr10.weh_bu        ,        --weh_bu
"
"                     cr10.weh_emp_id    ,        --weh_emp_id
"
"                     cr10.weh_appr_bu    ,        --weh_appr_bu
"
"                     cr10.weh_appr_plnt    ,        --weh_appr_plnt
"
"                     v_new_emp_id        ,        --weh_par_emp_id
"
"                     cr10.weh_deflt_flag    ,        --weh_deflt_flag
"
"                     p_user            ,        --weh_cre_by
"
"                     SYSDATE        );        --weh_cre_date
"
"
"
"         END IF;
"
"
"
"      END LOOP c10;
"
"
"
"      FOR cr11 IN (SELECT *
"
"                   FROM dc_mat_iss_auth
"
"                  WHERE dmia_bu     = p_bu
"
"              AND dmia_emp_id = v_old_emp_id)
"
"      LOOP
"
"
"
"         UPDATE dc_mat_iss_auth
"
"        SET dmia_emp_id = v_new_emp_id
"
"          WHERE dmia_bu     = p_bu
"
"        AND dmia_emp_id = v_new_emp_id;
"
"
"
"     IF SQL%NOTFOUND THEN
"
"
"
"        INSERT INTO dc_mat_iss_auth(dmia_bu        ,
"
"                    dmia_emp_id    ,
"
"                    dmia_date_from    ,
"
"                    dmia_date_to    ,
"
"                    dmia_cre_by    ,
"
"                    dmia_cre_date    )
"
"                 VALUES(cr11.dmia_bu    ,        --dmia_bu
"
"                    v_new_emp_id    ,        --dmia_emp_id
"
"                    v_eff_from    ,        --dmia_date_from
"
"                    v_eff_to    ,        --dmia_date_to
"
"                    p_user        ,        --dmia_cre_by
"
"                    SYSDATE        );        --dmia_cre_date
"
"
"
"     END IF;
"
"
"
"      END LOOP c11;
"
"
"
"      FOR cr12 IN (SELECT *
"
"                   FROM pur_admin
"
"                  WHERE pura_bu     = p_bu
"
"              AND pura_emp_id = v_old_emp_id)
"
"      LOOP
"
"
"
"         UPDATE pur_admin
"
"        SET pura_emp_id = v_new_emp_id
"
"          WHERE pura_bu     = p_bu
"
"        AND pura_emp_id = v_new_emp_id;
"
"
"
"     IF SQL%NOTFOUND THEN
"
"
"
"        INSERT INTO pur_admin(pura_bu    ,
"
"                  pura_emp_id    ,
"
"                  pura_date_from,
"
"                  pura_date_to    ,
"
"                  pura_cre_by    ,
"
"                  pura_cre_date    )
"
"               VALUES(cr12.pura_bu    ,        --pura_bu
"
"                  v_new_emp_id    ,        --pura_emp_id
"
"                  v_eff_from    ,        --pura_date_from
"
"                  v_eff_to    ,        --pura_date_to
"
"                  p_user    ,        --pura_cre_by
"
"                  SYSDATE    );        --pura_cre_date
"
"
"
"     END IF;
"
"
"
"      END LOOP c12;
"
"
"
"      FOR cr13 IN (SELECT *
"
"                 FROM proj_employees
"
"                WHERE prje_bu     = p_bu
"
"              AND prje_emp_id = v_old_emp_id)
"
"      LOOP
"
"
"
"         UPDATE proj_employees
"
"            SET prje_emp_id = v_new_emp_id
"
"          WHERE prje_bu     = p_bu
"
"            AND prje_plant  = cr13.prje_plant
"
"        AND prje_emp_id = v_new_emp_id;
"
"
"
"     IF SQL%NOTFOUND THEN
"
"
"
"        INSERT INTO proj_employees(prje_bu          ,
"
"                       prje_plant      ,
"
"                       prje_emp_id      ,
"
"                       prje_dept_id      ,
"
"                       prje_job_id      ,
"
"                       prje_hrly_cost      ,
"
"                       prje_cre_by      ,
"
"                       prje_cre_date      )
"
"                VALUES(cr13.prje_bu      ,        --prje_bu
"
"                       cr13.prje_plant      ,        --prje_plant
"
"                       v_new_emp_id      ,        --prje_emp_id
"
"                       v_new_emp_dept      ,        --prje_dept_id
"
"                       v_new_emp_job      ,        --prje_job_id
"
"                       cr13.prje_hrly_cost,        --prje_hrly_cost
"
"                       p_user          ,        --prje_cre_by
"
"                       SYSDATE          );        --prje_cre_date
"
"
"
"     END IF;
"
"
"
"      END LOOP c13;
"
"
"
"      FOR cr14 IN (SELECT *
"
"                   FROM user_prefix_access
"
"                  WHERE upa_bu      = p_bu
"
"                     AND upa_user_id = p_frm_user_id)
"
"      LOOP
"
"
"
"         UPDATE user_prefix_access
"
"            SET upa_user_id = p_to_user_id
"
"          WHERE upa_bu      = p_bu
"
"            AND upa_pfx     = cr14.upa_pfx
"
"            AND upa_user_id = p_to_user_id;
"
"
"
"         IF SQL%NOTFOUND THEN
"
"
"
"            INSERT INTO user_prefix_access(upa_bu         ,
"
"                       upa_user_id         ,
"
"                       upa_pfx         ,
"
"                       upa_dflt_flag     ,
"
"                       upa_cre_by         ,
"
"                       upa_cre_date      )
"
"                    VALUES(cr14.upa_bu         ,        --upa_bu
"
"                       p_to_user_id         ,        --upa_user_id
"
"                       cr14.upa_pfx         ,        --upa_pfx
"
"                       cr14.upa_dflt_flag,        --upa_dflt_flag
"
"                       p_user         ,        --upa_cre_by
"
"                       SYSDATE         );        --upa_cre_date
"
"
"
"         END IF;
"
"
"
"      END LOOP c14;
"
"      /*
"
"      FOR cr15 IN (SELECT *
"
"                   FROM appl_user_role_access
"
"                  WHERE aura_bu      = p_bu
"
"                   AND aura_user_id = p_frm_user_id)
"
"      LOOP
"
"
"
"         UPDATE appl_user_role_access
"
"            SET aura_user_id = p_to_user_id
"
"          WHERE aura_bu      = p_bu
"
"            AND aura_role_id = cr15.aura_role_id
"
"            AND aura_user_id = p_to_user_id;
"
"
"
"         IF SQL%NOTFOUND THEN
"
"
"
"            INSERT INTO appl_user_role_access(aura_bu        ,
"
"                          aura_user_id    ,
"
"                          aura_role_id    ,
"
"                          aura_date_from    ,
"
"                          aura_date_to    ,
"
"                          aura_cre_by    ,
"
"                          aura_cre_date    )
"
"                       VALUES(cr15.aura_bu    ,        --aura_bu
"
"                          p_to_user_id    ,        --aura_user_id
"
"                          cr15.aura_role_id    ,        --aura_role_id
"
"                          v_eff_from    ,        --aura_date_from
"
"                          v_eff_to        ,        --aura_date_to
"
"                          p_user        ,        --aura_cre_by
"
"                          SYSDATE        );        --aura_cre_date
"
"
"
"         END IF;
"
"
"
"      END LOOP c15;
"
"      */                                       --Commented by oormi
"
"      /*FOR cr16 IN (SELECT *
"
"                   FROM user_bus_fun_access
"
"                  WHERE ubfa_bu      = p_bu
"
"                   AND ubfa_user_id = p_frm_user_id)
"
"      LOOP
"
"
"
"         UPDATE user_bus_fun_access
"
"            SET ubfa_user_id    = p_to_user_id
"
"          WHERE ubfa_bu         = p_bu
"
"            AND ubfa_bus_fun_id = cr16.ubfa_bus_fun_id
"
"            AND ubfa_user_id    = p_to_user_id;
"
"
"
"         IF SQL%NOTFOUND THEN
"
"
"
"            INSERT INTO user_bus_fun_access(ubfa_bu        ,
"
"                        ubfa_user_id    ,
"
"                        ubfa_bus_fun_id    ,
"
"                        ubfa_date_from    ,
"
"                        ubfa_date_to    ,
"
"                        ubfa_cre_by        ,
"
"                        ubfa_cre_date    )
"
"                     VALUES(cr16.ubfa_bu    ,
"
"                        p_to_user_id    ,
"
"                        cr16.ubfa_bus_fun_id,
"
"                        v_eff_from        ,
"
"                        v_eff_to        ,
"
"                        p_user        ,
"
"                        SYSDATE        );
"
"
"
"         END IF;
"
"
"
"      END LOOP c16;*/
"
"
"
"      FOR cr17 IN (SELECT *
"
"                   FROM user_notfn_asgmnt
"
"                  WHERE una_bu      = p_bu
"
"                   AND una_user_id = p_frm_user_id)
"
"      LOOP
"
"
"
"         UPDATE user_notfn_asgmnt
"
"            SET una_user_id  = p_to_user_id
"
"          WHERE una_bu       = p_bu
"
"            AND una_notfn_id = cr17.una_notfn_id
"
"            AND una_user_id  = p_to_user_id;
"
"
"
"         IF SQL%NOTFOUND THEN
"
"
"
"            INSERT INTO user_notfn_asgmnt(una_bu        ,
"
"                      una_user_id        ,
"
"                      una_notfn_id        ,
"
"                      una_role_type        ,
"
"                      una_eff_from        ,
"
"                      una_cre_by        ,
"
"                      una_cre_date        )
"
"                   VALUES(cr17.una_bu        ,        --una_bu
"
"                      p_to_user_id        ,        --una_user_id
"
"                      cr17.una_notfn_id    ,        --una_notfn_id
"
"                      cr17.una_role_type    ,        --una_role_type
"
"                      v_eff_from        ,        --una_eff_from
"
"                      p_user        ,        --una_cre_by
"
"                      SYSDATE        );        --una_cre_date
"
"
"
"         END IF;
"
"
"
"      END LOOP c17;
"
"
"
"      FOR cr18 IN (SELECT *
"
"                   FROM curr_user_notfn
"
"                  WHERE cun_user_id = p_frm_user_id)
"
"      LOOP
"
"
"
"         UPDATE curr_user_notfn
"
"            SET cun_user_id  = p_to_user_id
"
"          WHERE cun_user_id  = p_to_user_id
"
"            AND cun_notfn_id = cr18.cun_notfn_id;
"
"
"
"         IF SQL%NOTFOUND THEN
"
"
"
"            INSERT INTO curr_user_notfn(cun_notfn_id      ,
"
"                    cun_user_id      ,
"
"                    cun_user_role      ,
"
"                    cun_notfn_mod      ,
"
"                    cun_rec_cnt      ,
"
"                    cun_cre_by      ,
"
"                    cun_cre_date      )
"
"                 VALUES(cr18.cun_notfn_id ,        --cun_notfn_id
"
"                    p_to_user_id      ,        --cun_user_id
"
"                    cr18.cun_user_role,        --cun_user_role
"
"                    cr18.cun_notfn_mod,        --cun_notfn_mod
"
"                    0          ,        --cun_rec_cnt
"
"                    p_user          ,        --cun_cre_by
"
"                    SYSDATE          );        --cun_cre_date
"
"
"
"         END IF;
"
"
"
"      END LOOP c18;
"
"
"
"      /*
"
"      FOR cr20 IN (SELECT *
"
"                   FROM user_store_oper_access
"
"                  WHERE usoa_bu      = p_bu
"
"                  AND usoa_user_id = p_frm_user_id)
"
"      LOOP
"
"
"
"         UPDATE user_store_oper_access
"
"            SET usoa_user_id = p_to_user_id
"
"          WHERE usoa_bu       = p_bu
"
"            AND usoa_store_id = cr20.usoa_store_id
"
"            AND usoa_oper     = cr20.usoa_oper
"
"            AND usoa_user_id  = p_to_user_id;
"
"
"
"         IF SQL%NOTFOUND THEN
"
"
"
"            INSERT INTO user_store_oper_access (usoa_bu          ,
"
"                        usoa_store_id      ,
"
"                        usoa_user_id      ,
"
"                        usoa_date_from      ,
"
"                        usoa_date_to      ,
"
"                        usoa_oper      ,
"
"                        usoa_cre_by      ,
"
"                        usoa_cre_date      )
"
"                     VALUES(cr20.usoa_bu      ,        --usoa_bu
"
"                        cr20.usoa_store_id,        --usoa_store_id
"
"                        p_to_user_id      ,        --usoa_user_id
"
"                        v_eff_from      ,        --usoa_date_from
"
"                        v_eff_to      ,        --usoa_date_to
"
"                        cr20.usoa_oper      ,        --usoa_oper
"
"                        p_user          ,        --usoa_cre_by
"
"                        SYSDATE          );        --usoa_cre_date
"
"
"
"         END IF;
"
"
"
"      END LOOP c20;
"
"
"
"      FOR cr21 IN (SELECT *
"
"                   FROM user_mr_store_access
"
"                  WHERE umsa_bu   = p_bu
"
"                   AND umsa_user = p_frm_user_id)
"
"      LOOP
"
"
"
"         UPDATE user_mr_store_access
"
"            SET umsa_user = p_to_user_id
"
"          WHERE umsa_bu         = p_bu
"
"            AND umsa_from_store = cr21.umsa_from_store
"
"            AND umsa_to_store   = cr21.umsa_to_store
"
"            AND umsa_item_type  = cr21.umsa_item_type
"
"            AND umsa_user       = p_to_user_id;
"
"
"
"         IF SQL%NOTFOUND THEN
"
"
"
"            INSERT INTO user_mr_store_access(umsa_bu         ,
"
"                         umsa_from_store     ,
"
"                         umsa_to_store     ,
"
"                         umsa_user         ,
"
"                         umsa_date_from     ,
"
"                         umsa_date_to     ,
"
"                         umsa_item_type     ,
"
"                         umsa_cre_by     ,
"
"                         umsa_cre_date     )
"
"                      VALUES(cr21.umsa_bu     ,        --umsa_bu
"
"                         cr21.umsa_from_store,        --umsa_from_store
"
"                         cr21.umsa_to_store     ,        --umsa_to_store
"
"                         p_to_user_id     ,        --umsa_user
"
"                         v_eff_from         ,        --umsa_date_from
"
"                         v_eff_to         ,        --umsa_date_to
"
"                         cr21.umsa_item_type ,        --umsa_item_type
"
"                         p_user         ,        --umsa_cre_by
"
"                         SYSDATE         );        --umsa_cre_date
"
"
"
"         END IF;
"
"
"
"      END LOOP c21;
"
"      */                                       --Commented by oormi
"
"      FOR cr22 IN (SELECT *
"
"                   FROM feas_study_dept_users_access
"
"                  WHERE fsdua_bu      = p_bu
"
"                   AND fsdua_user_id = p_frm_user_id)
"
"      LOOP
"
"
"
"         UPDATE feas_study_dept_users_access
"
"            SET fsdua_user_id = p_to_user_id
"
"          WHERE fsdua_bu      = p_bu
"
"            AND fsdua_dept_id = cr22.fsdua_dept_id
"
"            AND fsdua_user_id = p_to_user_id;
"
"
"
"         IF SQL%NOTFOUND THEN
"
"
"
"            INSERT INTO feas_study_dept_users_access(fsdua_bu        ,
"
"                             fsdua_dept_id    ,
"
"                             fsdua_user_id    ,
"
"                             fsdua_cre_by    ,
"
"                             fsdua_cre_date    )
"
"                          VALUES(cr22.fsdua_bu    ,        --fsdua_bu
"
"                             cr22.fsdua_dept_id    ,        --fsdua_dept_id
"
"                             p_to_user_id    ,        --fsdua_user_id
"
"                             p_user        ,        --fsdua_cre_by
"
"                             SYSDATE        );        --fsdua_cre_date
"
"
"
"         END IF;
"
"
"
"      END LOOP c22;
"
"
"
"      FOR cr23 IN (SELECT *
"
"                   FROM item_code_cre_access
"
"                  WHERE icca_bu   = p_bu
"
"                   AND icca_user = p_frm_user_id)
"
"      LOOP
"
"
"
"         UPDATE item_code_cre_access
"
"            SET icca_user      = p_to_user_id
"
"          WHERE icca_bu        = p_bu
"
"            AND icca_sub_class = cr23.icca_sub_class
"
"            AND icca_user      = p_to_user_id;
"
"
"
"         IF SQL%NOTFOUND THEN
"
"
"
"            INSERT INTO item_code_cre_access(icca_bu            ,
"
"                         icca_user            ,
"
"                         icca_sub_class        ,
"
"                         icca_from_date        ,
"
"                         icca_to_date        ,
"
"                         icca_upd_access_flag    ,
"
"                         icca_ins_access_flag    ,
"
"                         icca_admin_access_flag    ,
"
"                         icca_cre_by        ,
"
"                         icca_cre_date        )
"
"                      VALUES(cr23.icca_bu        ,        --icca_bu
"
"                         p_to_user_id        ,        --icca_user
"
"                         cr23.icca_sub_class    ,        --icca_sub_class
"
"                         v_eff_from            ,        --icca_from_date
"
"                         v_eff_to            ,        --icca_to_date
"
"                         cr23.icca_upd_access_flag    ,        --icca_upd_access_flag
"
"                         cr23.icca_ins_access_flag    ,        --icca_ins_access_flag
"
"                         cr23.icca_admin_access_flag,        --icca_admin_access_flag
"
"                         p_user            ,        --icca_cre_by
"
"                         SYSDATE            );        --icca_cre_date
"
"
"
"         END IF;
"
"
"
"      END LOOP c23;
"
"
"
"      FOR cr24 IN (SELECT *
"
"                   FROM tqm_admin
"
"                  WHERE tqmad_bu   = p_bu
"
"                   AND tqmad_user = p_frm_user_id)
"
"      LOOP
"
"
"
"         UPDATE tqm_admin
"
"            SET tqmad_user = p_to_user_id
"
"          WHERE tqmad_bu     = p_bu
"
"            AND tqmad_type   = cr24.tqmad_type
"
"            AND tqmad_qc_pfx = cr24.tqmad_qc_pfx
"
"            AND tqmad_user   = p_to_user_id;
"
"
"
"         IF SQL%NOTFOUND THEN
"
"
"
"            INSERT INTO tqm_admin(tqmad_bu        ,
"
"                  tqmad_user        ,
"
"                  tqmad_type        ,
"
"                  tqmad_qc_pfx        ,
"
"                  tqmad_date_from    ,
"
"                  tqmad_date_to        ,
"
"                  tqmad_cre_by        ,
"
"                  tqmad_cre_date    )
"
"               VALUES(cr24.tqmad_bu        ,        --tqmad_bu
"
"                  p_to_user_id        ,        --tqmad_user
"
"                  cr24.tqmad_type    ,        --tqmad_type
"
"                  cr24.tqmad_qc_pfx    ,        --tqmad_qc_pfx
"
"                  v_eff_from        ,        --tqmad_date_from
"
"                  v_eff_to        ,        --tqmad_date_to
"
"                  p_user        ,        --tqmad_cre_by
"
"                  SYSDATE        );        --tqmad_cre_date
"
"
"
"         END IF;
"
"
"
"      END LOOP c24;
"
"
"
"      FOR cr25 IN (SELECT *
"
"                   FROM ctn_tab_access
"
"                  WHERE ctn_bu      = p_bu
"
"                   AND ctn_user_id = p_frm_user_id)
"
"      LOOP
"
"
"
"         UPDATE ctn_tab_access
"
"            SET ctn_user_id = p_to_user_id
"
"          WHERE ctn_bu      = p_bu
"
"            AND ctn_tab_id  = cr25.ctn_tab_id
"
"            AND ctn_user_id = p_to_user_id;
"
"
"
"         IF SQL%NOTFOUND THEN
"
"
"
"            INSERT INTO ctn_tab_access(ctn_bu        ,
"
"                       ctn_tab_id    ,
"
"                       ctn_user_id    ,
"
"                       ctn_cre_by    ,
"
"                       ctn_cre_date    )
"
"                VALUES(cr25.ctn_bu    ,        --ctn_bu
"
"                       cr25.ctn_tab_id    ,        --ctn_tab_id
"
"                       p_to_user_id    ,        --ctn_user_id
"
"                       p_user        ,        --ctn_cre_by
"
"                       SYSDATE        );        --ctn_cre_date
"
"
"
"         END IF;
"
"
"
"      END LOOP c25;
"
"
"
"      FOR cr26 IN (SELECT *
"
"                   FROM ncr_group_user_access
"
"                  WHERE ngua_bu      = p_bu
"
"                   AND ngua_user_id = p_frm_user_id)
"
"      LOOP
"
"
"
"         UPDATE ncr_group_user_access
"
"            SET ngua_user_id = p_to_user_id
"
"          WHERE ngua_bu      = p_bu
"
"            AND ngua_grp_id  = cr26.ngua_grp_id
"
"            AND ngua_user_id = p_to_user_id;
"
"
"
"         IF SQL%NOTFOUND THEN
"
"
"
"            INSERT INTO ncr_group_user_access(ngua_bu            ,
"
"                          ngua_grp_id       ,
"
"                          ngua_user_id      ,
"
"                          ngua_cre_by       ,
"
"                          ngua_cre_date     )
"
"                       VALUES(cr26.ngua_bu    ,        --ngua_bu
"
"                          cr26.ngua_grp_id  ,        --ngua_grp_id
"
"                          p_to_user_id      ,        --ngua_user_id
"
"                          p_user           ,        --ngua_cre_by
"
"                          SYSDATE        );        --ngua_cre_date
"
"
"
"         END IF;
"
"
"
"      END LOOP c26;
"
"
"
"      FOR cr27 IN (SELECT *
"
"                   FROM appl_user_plant_access
"
"                  WHERE auba_bu = p_bu
"
"                    AND auba_user_id = p_frm_user_id)
"
"      LOOP
"
"
"
"         UPDATE appl_user_plant_access
"
"            SET auba_user_id = p_to_user_id
"
"          WHERE auba_bu      = p_bu
"
"            AND auba_plant   = cr27.auba_plant
"
"            AND auba_user_id = p_to_user_id;
"
"
"
"         IF SQL%NOTFOUND THEN
"
"
"
"            INSERT INTO appl_user_plant_access( auba_bu            ,
"
"                        auba_user_id        ,
"
"                        auba_plant        ,
"
"                        auba_from        ,
"
"                        auba_to            ,
"
"                        auba_deflt_flag        ,
"
"                        auba_cre_by        ,
"
"                        auba_cre_date        )
"
"                     VALUES(cr27.auba_bu        ,            --auba_bu
"
"                         p_to_user_id        ,            --auba_user_id
"
"                         cr27.auba_plant        ,            --auba_plant
"
"                         v_eff_from        ,            --auba_from
"
"                         v_eff_to        ,            --auba_to
"
"                         cr27.auba_deflt_flag,            --auba_deflt_flag
"
"                         p_user            ,            --auba_cre_by
"
"                         SYSDATE            );            --auba_cre_date
"
"
"
"
"
"         END IF;
"
"
"
"      END LOOP c27;
"
"
"
"   END proc_cre_wf_user;
"
"
"
"END pack_upd_wf_emp_pos;"
/
