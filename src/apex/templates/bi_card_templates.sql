-- =============================================================================
-- Templates: BI_CARD and BI_CARD_SINGLE_VALUE
-- Application: 9100 (and companion flows 141, 150, 800, 9008, 9121, 9122, 9130, 9159, 9182)
-- Description: Modern responsive KPI card templates designed for BI dashboards.
-- =============================================================================

-- 1. BI_CARD_SINGLE_VALUE (Single KPI metric card)
-- Static ID: bi-card-single-value
-- Header: #NAME#
-- Value:  #VALUE#
/*
ROW_TEMPLATE_BEFORE_ROWS:
<div class="bi-card-wrapper" style="width: 100%; padding: 0; margin: 0; box-sizing: border-box;">

ROW_TEMPLATE1:
<div class="bi-card-box" style="width: 100%; background: #ffffff; border: 1px solid #d0d7de; border-radius: 6px; box-shadow: 0 1px 3px rgba(0,0,0,0.06); overflow: hidden; margin: 0; box-sizing: border-box;">
  <div class="bi-card-title" style="background: #f8fafc; border-bottom: 2px solid #0D6ABF; padding: 7px 12px; font-size: 13px; font-weight: 700; color: #0D6ABF; text-align: center; text-transform: uppercase; letter-spacing: 0.5px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; box-sizing: border-box;">
    #NAME#
  </div>
  <div class="bi-card-metric" style="padding: 10px 12px; display: flex; align-items: center; justify-content: center; min-height: 42px; text-align: center; box-sizing: border-box;">
    <span style="font-size: 22px; font-weight: 700; color: #0F2D4A; line-height: 1.2; letter-spacing: 0.3px;">#VALUE#</span>
  </div>
</div>

ROW_TEMPLATE_AFTER_ROWS:
</div>
*/

-- 2. BI_CARD (Dual KPI metric card with pill badges)
-- Static ID: bi-card
-- Header: #NAME#
-- Pill 1: #LABEL1#: #TOTAL# (Green badge)
-- Pill 2: #LABEL2#: #AVERAGE# (Red badge)
/*
ROW_TEMPLATE_BEFORE_ROWS:
<div class="bi-card-wrapper" style="width: 100%; padding: 0; margin: 0; box-sizing: border-box;">

ROW_TEMPLATE1:
<div class="bi-card-box" style="width: 100%; background: #ffffff; border: 1px solid #d0d7de; border-radius: 6px; box-shadow: 0 1px 3px rgba(0,0,0,0.06); overflow: hidden; margin: 0; box-sizing: border-box;">
  <div class="bi-card-title" style="background: #f8fafc; border-bottom: 2px solid #0D6ABF; padding: 7px 12px; font-size: 13px; font-weight: 700; color: #0D6ABF; text-align: center; text-transform: uppercase; letter-spacing: 0.5px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; box-sizing: border-box;">
    #NAME#
  </div>
  <div class="bi-card-metric" style="padding: 10px 12px; display: flex; align-items: center; justify-content: center; gap: 14px; min-height: 42px; text-align: center; box-sizing: border-box; flex-wrap: wrap;">
    <div style="background: #e8f5e9; border: 1px solid #a5d6a7; border-radius: 4px; padding: 4px 12px; display: inline-flex; align-items: center; gap: 6px; box-sizing: border-box;">
      <span style="font-size: 12px; font-weight: 700; color: #2e7d32;">#LABEL1#:</span>
      <span style="font-size: 16px; font-weight: 700; color: #1b5e20;">#TOTAL#</span>
    </div>
    <div style="background: #ffebee; border: 1px solid #ef9a9a; border-radius: 4px; padding: 4px 12px; display: inline-flex; align-items: center; gap: 6px; box-sizing: border-box;">
      <span style="font-size: 12px; font-weight: 700; color: #c62828;">#LABEL2#:</span>
      <span style="font-size: 16px; font-weight: 700; color: #b71c1c;">#AVERAGE#</span>
    </div>
  </div>
</div>

ROW_TEMPLATE_AFTER_ROWS:
</div>
*/
