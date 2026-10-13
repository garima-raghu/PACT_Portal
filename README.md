# PACT Portal — Agreement & Commercial Tracker

A full-stack enterprise portal for managing Change Requests, commercial costing, approval workflows, and recurring service tracking between a client and a managed services provider.

> Built as an internal delivery tool. All data in this repository is anonymized demo data.

---

## 🖥️ Live Demo

> Open `dashboard/PACT_Dashboard.html` in any browser — no server required.

---

## 🏗️ Tech Stack

| Layer | Technology |
|---|---|
| Frontend | Next.js 16, TypeScript, Tailwind CSS |
| Backend API | ASP.NET Core 8, Entity Framework Core 8 |
| Database | SQL Server Express |
| Process Manager | pm2 |
| Auth (planned) | Microsoft Entra ID (MSAL) |
| AI Import (planned) | Mistral 7B via Ollama |
| Dashboard | Power BI + standalone HTML |

---

## 📁 Project Structure

```
PACT_Portal/
├── web/                        # Next.js frontend
│   ├── app/
│   │   ├── dashboard/          # Executive dashboard
│   │   ├── cr/                 # CR list + detail pages
│   │   ├── commercial/         # Commercial costing (5 tabs)
│   │   ├── approval/           # Approval workflow
│   │   ├── documents/          # SharePoint document viewer
│   │   ├── import/             # AI PDF import (Mistral 7B)
│   │   ├── reports/            # Charts and financial summary
│   │   ├── audit/              # Immutable audit log
│   │   └── admin/              # User, rate card, customer mgmt
│   └── lib/
│       ├── msal.ts             # Entra ID auth
│       └── api.ts              # API client
├── api/                        # ASP.NET Core 8 REST API
│   └── src/
│       ├── Models/             # Domain models
│       ├── Services/           # Business logic
│       └── Controllers/        # API endpoints
├── database/
│   └── seeds/                  # Demo seed data (anonymized)
└── dashboard/
    └── PACT_Dashboard.html     # Standalone Power BI-style dashboard
```

---

## ✨ Features

### Change Request Management
- Full CR lifecycle: Draft → Submitted → Under Review → Approved → Implementing → Closed
- Part A (request details), Part B (proposal & scope), Part C (signatures)
- Rate card with estimate lines per CR
- Key deliverables and risk tracking

### Commercial & Costing
- Gross estimate, bill to client, cost share %
- Estimate lines with role, location, day rate, person days
- Actuals recording and variance tracking
- Forecast by period

### Recurring Services
- Multi-year recurring charge schedule (Yr1–Yr4)
- Service type tracking (Managed Service, Software/AI, Cloud)
- Annual recurring value calculation

### Approval Workflow
- Multi-step approval chain (Accenture internal + Customer)
- DocuSign envelope tracking
- Full audit trail — append-only, immutable

### AI PDF Import (Mistral 7B)
- Upload existing CR PDFs
- Mistral 7B extracts all fields automatically
- Review and confirm before saving to database
- Runs locally — no data leaves the network

### Power BI Dashboard (6 pages)
- Executive Overview — KPIs, CR register, status charts
- CR Register — filterable, all CRs
- Commercial & Costing — cost breakdown, rate cards
- Recurring Services — multi-year value forecast
- Approvals & Governance — signatory tracker
- Delivery Timeline — Gantt view

---

## 🚀 Getting Started

### Prerequisites
- Node.js v20+
- .NET SDK 8.0
- SQL Server Express
- pm2 (`npm install -g pm2`)

### 1. Clone the repo
```bash
git clone https://github.com/garima-raghu/PACT_Portal.git
cd PACT_Portal
```

### 2. Database setup
```bash
# Create CRTracker database in SQL Server
# Run migrations
cd api
dotnet ef database update
```

### 3. Load demo data
```bash
sqlcmd -S .\SQLEXPRESS -d CRTracker -I -i database/seeds/demo_seed.sql
```

### 4. Start the API
```bash
cd api
dotnet run
# API available at http://localhost:5000
# Swagger at http://localhost:5000/swagger
```

### 5. Start the frontend
```bash
cd web
npm install
npm run dev
# Portal at http://localhost:3000
```

### 6. Or run both with pm2
```bash
pm2 start ecosystem.config.js
```

---

## 📊 Standalone Dashboard

No setup needed — just open in browser:

```
dashboard/PACT_Dashboard.html
```

6 interactive pages with demo data. Works offline.

---

## 🗄️ Database Schema

Key tables in `CRTracker`:

| Table | Description |
|---|---|
| `change_requests` | Core CR data — status, dates, scope |
| `cr_commercials` | Estimated cost, bill to client, cost share |
| `cr_estimate_lines` | Role, location, rate, days, amount |
| `cr_recurring_charges` | Multi-year recurring service charges |
| `cr_actuals` | Actual effort and cost recorded |
| `cr_approvals` | Approval steps and decisions |
| `cr_status_histories` | Immutable status change log |
| `cr_documents` | DocuSign envelope tracking |
| `audit_logs` | Append-only audit trail |
| `users` | Accenture + customer users |
| `rate_cards` | Agreed day rates by role and location |

---

## 🔐 Authentication

Microsoft Entra ID (MSAL) integration is built but currently disabled for demo purposes. To enable:

```typescript
// web/app/layout.tsx — wrap with MsalProvider
// web/lib/msal.ts — configure clientId and tenantId
```

---

## 📝 API Endpoints

```
GET    /api/v1/Cr              — List all CRs
POST   /api/v1/Cr              — Create new CR
GET    /api/v1/Cr/{id}         — CR detail
PATCH  /api/v1/Cr/{id}/status  — Status transition
POST   /api/v1/Cr/{id}/approve — Record approval
GET    /api/v1/Cr/dashboard    — Dashboard aggregates
```

Swagger UI: `http://localhost:5000/swagger`

---

## 🎨 Design System

| Token | Value | Usage |
|---|---|---|
| Navy | `#0D1F3C` | Primary background |
| Teal | `#00C4B4` | Primary accent |
| Amber | `#F5A623` | Warning / billing |
| Green | `#2ECC8A` | Success / approved |
| Red | `#E63946` | Error / rejected |

---

## 📌 Roadmap

- [x] Next.js multi-page portal
- [x] ASP.NET Core 8 REST API
- [x] SQL Server database with EF Core migrations
- [x] CR lifecycle management
- [x] Commercial costing module
- [x] Approval workflow
- [x] Audit log
- [x] Power BI dashboard (standalone HTML)
- [ ] Mistral 7B PDF import (Ollama)
- [ ] Microsoft Entra ID authentication
- [ ] SharePoint document integration
- [ ] DocuSign API integration
- [ ] Live API data connection (frontend)

---

## ⚠️ Data Notice

All data in this repository is anonymized demo data. No real client names, costs, or document references are included.

---

## 👩‍💻 Author

**Garima Raghuwanshi**
Full-stack Developer · Enterprise Portal Development

---

*Built with Next.js · ASP.NET Core · SQL Server · Tailwind CSS · Chart.js*
