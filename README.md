# RMQC27 AI Repository

Version control repository for Oracle APEX applications, database components, and PL/SQL packages for **Roadmap ERP**.

## Repository Structure

```
.
├── src/
│   └── apex/
│       ├── app_9100/                 # Full split export of Application 9100
│       │   └── f9100/
│       │       ├── application/
│       │       │   ├── pages/        # All 399 individual page SQL files (e.g., page_950100006022.sql)
│       │       │   ├── shared_components/ # LOVs, lists, security schemes, templates
│       │       │   ├── user_interfaces/
│       │       │   └── deployment/
│       │       └── install.sql       # Master application installation script
│       └── templates/                # Custom APEX templates
│           └── bi_card_templates.sql # BI_CARD and BI_CARD_SINGLE_VALUE definitions
├── db/
│   ├── packages/                     # PL/SQL package specifications (*.pks)
│   ├── package_bodies/               # PL/SQL package bodies (*.pkb)
│   └── migrations/                   # Database patch and migration scripts
│       └── 001_page_950100006022_fixes.sql
└── docs/                             # Documentation and guides
```

## Highlights & Features

### 1. Granular Diff Tracking
- Every APEX page is isolated in its own file (`src/apex/app_9100/f9100/application/pages/page_XXXXX.sql`).
- Every PL/SQL package and package body is stored in its own dedicated file (`db/packages/*.pks` and `db/package_bodies/*.pkb`).
- When a developer or AI makes changes to a specific page or PL/SQL package, `git diff` clearly displays the exact lines modified.

### 2. Recent Page 950100006022 (Human Resource Dashboard) Changes
- **Chart Type**: Row 1, Column 2 chart converted to a solid Pie chart (`Monthly CTC` &rarr; `Monthly`).
- **KPI Card Template Fix**: Installed `BI_CARD_SINGLE_VALUE` and `BI_CARD` templates to eliminate broken `#ALERT_TITLE#` placeholders and text clipping.
- **Metric Formatting**: Numeric values formatted with standard comma delimiters (`TO_CHAR(..., 'FM999,999,999,990')`).
- **Multi-Flow Sync**: Synchronized across flows `9100`, `141`, `150`, `800`, `9008`, `9121`, `9122`, `9130`, `9159`, and `9182`.

## Version Control Workflow

### Staging and Committing
```bash
# Check status of modified files
git status

# Stage changes
git add .

# Commit with a descriptive conventional commit message
git commit -m "feat(page-950100006022): description of change"

# Push to GitHub
git push origin main
```