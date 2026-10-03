# RMQC27 AI Repository

Version control repository for Oracle APEX applications and database components for **Roadmap ERP**.

## Repository Structure

```
.
├── src/
│   └── apex/
│       ├── pages/                    # Exported APEX page SQL files
│       │   └── f9100_page_950100006022.sql
│       └── templates/                # Custom APEX templates
│           └── bi_card_templates.sql
├── db/
│   └── migrations/                   # Database patch and migration scripts
│       └── 001_page_950100006022_fixes.sql
└── docs/                             # Documentation and guides
```

## Recent Changes

### Page 950100006022 (Human Resource Dashboard)
- **Chart Type**: Converted Row 1, Column 2 chart (`Monthly CTC` -> `Monthly`) from Donut to solid Pie chart.
- **KPI Card Template Fix**: Replaced the default `Alerts` row template with custom, responsive `BI_CARD_SINGLE_VALUE` and `BI_CARD` templates to eliminate broken `#ALERT_TITLE#` placeholders and clipping.
- **Metric Formatting**: Added standard comma formatting (`TO_CHAR(..., 'FM999,999,999,990')`) to all numeric metrics for clear readability.
- **Cross-Application Sync**: Synced across Application `9100` and companion flows (`141`, `150`, `800`, `9008`, `9121`, `9122`, `9130`, `9159`, `9182`).

## Version Control Workflow

### Exporting an APEX Page
Using SQLcl:
```sql
apex export-components -api 9100 -expcomponents PAGE:950100006022
```

### Git Commands
```bash
# Check status
git status

# Stage changes
git add .

# Commit with a descriptive message
git commit -m "feat(page-950100006022): update card templates and format metrics"

# Push to remote
git push origin main
```