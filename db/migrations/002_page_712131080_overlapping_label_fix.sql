-- =============================================================================
-- Migration: 002_page_712131080_overlapping_label_fix.sql
-- Page: 712131080 (Payroll Journals)
-- Applications: 9101, 9107
-- Description:
--   Fix overlapping text on "Created By" (P712131080_CRE_BY) and "Approved By" (P712131080_APPR_BY).
--   Root cause: When using the "Optional - Floating" label template with a Popup LOV,
--   disabling manual entry ("manual_entry": "N") combined with a non-null LOV_NULL_TEXT
--   causes APEX to render the null text ("Select the Created by") in the input box,
--   colliding with the unfocused floating label ("Created By").
--   Resolution:
--     1. Enabled manual entry ("manual_entry": "Y") matching other Popup LOVs.
--     2. Cleared LOV_NULL_TEXT and set LOV_DISPLAY_NULL = 'NO'.
--     3. Added standard dialog sizing and clean LOV D/R column aliases.
-- =============================================================================

BEGIN
  UPDATE APEX_260100.WWV_FLOW_STEP_ITEMS
     SET lov_null_text = NULL,
         lov_display_null = 'NO',
         attributes = '{"case_sensitive":"N","display_as":"DIALOG","fetch_on_search":"Y","height":"500","initial_fetch":"FIRST_ROWSET","manual_entry":"Y","match_type":"CONTAINS","min_chars":"0","title":"Select the Created by","width":"800"}',
         lov = 'select DISTINCT ppbh_cre_by D, ppbh_cre_by R from pyrl_proc_batch_hd where ppbh_bu = :global_bu and ppbh_cre_by is not null order by ppbh_cre_by'
   WHERE flow_step_id = 712131080
     AND name = 'P712131080_CRE_BY';

  UPDATE APEX_260100.WWV_FLOW_STEP_ITEMS
     SET lov_null_text = NULL,
         lov_display_null = 'NO',
         attributes = '{"case_sensitive":"N","display_as":"DIALOG","fetch_on_search":"Y","height":"500","initial_fetch":"FIRST_ROWSET","manual_entry":"Y","match_type":"CONTAINS","min_chars":"0","title":"Select the Approved By","width":"800"}',
         lov = 'select DISTINCT PPBH_VOU_APPR_BY D, PPBH_VOU_APPR_BY R from pyrl_proc_batch_hd where ppbh_bu = :global_bu and PPBH_VOU_APPR_BY is not null order by PPBH_VOU_APPR_BY'
   WHERE flow_step_id = 712131080
     AND name = 'P712131080_APPR_BY';

  COMMIT;
END;
/
