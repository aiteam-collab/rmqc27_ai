-- =============================================================================
-- Migration: 001_page_950100006022_fixes.sql
-- Description: 
--   1. Change Row 1 Col 2 chart from donut to pie (Region 'Monthly CTC' / 'Monthly').
--   2. Replace Alert row template with BI_CARD_SINGLE_VALUE and BI_CARD templates.
--   3. Apply numeric comma formatting to all KPI card queries.
-- =============================================================================

-- 1. Chart type change: 'donut' -> 'pie'
UPDATE APEX_260100.WWV_FLOW_JET_CHARTS c
   SET c.chart_type = 'pie'
 WHERE c.page_id = 950100006022
   AND c.region_id IN (
       SELECT p.id 
         FROM APEX_260100.WWV_FLOW_PAGE_PLUGS p 
        WHERE p.page_id = 950100006022 
          AND p.plug_name = 'Monthly'
   );

-- 2. Card Template sync and Query formatting (see bi_card_templates.sql)
-- (Applied across applications: 9100, 141, 150, 800, 9008, 9121, 9122, 9130, 9159, 9182)
COMMIT;
