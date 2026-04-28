# Resume PDF — Design Spec
**Date:** 2026-04-28  
**Output:** `resume.html` (print-to-PDF via Chrome) → `Fernando_Abreu_Resume.pdf`  
**Format:** 2 pages, US Letter, 2-column layout

---

## 1. Delivery Mechanism

Single self-contained `resume.html` file in the repo root. No build step, no dependencies.  
User opens in Chrome → File → Print → Save as PDF (or Cmd+P → Save as PDF).  
`@page` and `@media print` CSS control exact margins and page breaks.

---

## 2. Visual Identity

| Token | Value |
|---|---|
| Header bg | `#0e6e7a` (deep teal) |
| Sidebar bg | `#f0f7f8` (light teal-gray) |
| Accent / links | `#1a9aaa` |
| Body text | `#2d3748` |
| Section label | Uppercase, `0.65rem`, teal, tracked |
| Name | `2rem`, bold, white |
| Job title | `1rem`, white, 300 weight |
| Body font | DM Sans (Google Fonts) or system sans fallback |
| Photo | 80×80px circular, top-right of header |
| Page margins | 0.55in all sides via `@page` |
| Column split | Left 65% / Right 35% |

---

## 3. Page 1 Layout

### Header (full-width, teal bg)
- Left: Name `Fernando Abreu` · Title `Principal Project Manager | Cloud & AI · Microsoft`
- Contact row: 📞 804.773.5483 · ✉ fefoabreu@gmail.com · LinkedIn linkedin.com/in/fefoabreu · 📍 Richmond, VA
- Cert tags inline: `PMP · CSPO · CSM · ITIL · MBA · CMMI`
- Right: 80px circular headshot (`assets/profile.jpg`)

### Left Column
**Summary**  
3 sentences: PM identity + 10-year Microsoft context + differentiator (multilingual, agentic AI builder, F500 delivery).

**Experience — Microsoft Professional Services** `July 2016 – Present · Richmond, VA`  
Principal Project Manager  
- Led end-to-end delivery of Cloud & AI consulting engagements across Fortune 500 accounts
- Developed and deployed Agentic AI companion agents (Delivery, Pursuit, Sales) enabling data-driven portfolio monitoring and root-cause analysis
- Accelerated sales velocity through SOW design, pricing models, and complex deal governance for multi-million-dollar contracts
- Built practice IP including delivery frameworks, methodology, and reusable accelerators

Client portfolio (inline tag row): AT&T · Chevron · Coca-Cola · Disney · ExxonMobil · FedEx · Ford · NBA · NFL · Nike · T-Mobile · WarnerBros. Discovery · + more

**Experience — Dexian-DISYS** `2010 – 2016 · Houston, TX → Washington D.C. Metro`  
Practice Leader, Application Development  
- Founded and scaled a Scrum-Agile Application Development Practice from zero, with full P&L and operational ownership
- Delivered consulting for U.S. Postal Service, ExxonMobil, Schlumberger, and Frontier
- Managed full lead-to-order and order-to-cash lifecycle; people management, technical presales, and complex deal governance

### Right Sidebar
**Key Achievements** (star bullets)
- Built 3 production Agentic AI agents (Delivery, Pursuit, Sales) deployed across Microsoft's PS portfolio
- Delivered Cloud & AI engagements for 17+ Fortune 500 clients over 10 years at Microsoft
- Founded and scaled Agile App Dev Practice from zero (Dexian-DISYS); full P&L ownership
- CMMI SCAMPI A & B appraiser; led organizational process appraisals at Meta Brasil

**Skills**
- *Practices:* Agile/Scrum · Design Thinking · PMO Methodology · SDLC · CMMI · Kanban · DevOps
- *Cloud & AI:* Azure Cloud Adoption · Agentic AI Solutions · AI Agent Development · AI/Automation Optimization
- *Leadership:* Cross-Functional Orchestration · Stakeholder Management · Change Management · Risk Management
- *Business:* Technical Presales · Portfolio Management · Complex Deal Governance · Consumption ROI · SOW Design

**Certifications**
- PMP — Project Management Institute
- CSPO · CSM — Scrum Alliance
- ITIL — Exin
- CMMI SCAMPI A & B — SEI Carnegie Mellon

---

## 4. Page 2 Layout

Page break forced before Page 2 content via `page-break-before: always`.

### Left Column

**Experience — Meta Brasil** `2002 – 2010 · Porto Alegre, Brazil`  
SW Engineer → Dev Lead → IT Consultant → Technical Program Manager  
- Progressed through every discipline over 8 years: production code → team lead → IT consulting → TPM
- Implemented CMMI SEPG processes and led Scampi appraisals; managed outsourcing operations
- Designed and engineered IT consulting products end-to-end; expertise in solution design and client-facing consulting

**Experience — Dinamize Web Systems** `2000 – 2004 · Porto Alegre, Brazil`  
Full Stack Software Engineer  
- Built client-server and web-based applications using Delphi, VB, ASP.NET, and SQL Server
- Developed foundational skills in database administration, UX/UI wireframing, and product engineering

**Education**
- **MBA in Business Strategy — Magna Cum Laude** · PUC Rio Grande do Sul (2009–2011)
- **B.S. Computer Science — Summa Cum Laude** · PUC Rio Grande do Sul (2003–2007)
- **Associate's in Software Engineering** · Escola Técnica Santo Inácio

**Community**
- PMP Exam Instructor — PMIRS Chapter (since 2006); Risk Management track
- PMO Workshop Facilitator — SEBRAE-RS (since 2011)

### Right Sidebar

**Languages**
- English — Native (100%)
- Portuguese — Native (100%)
- French — Proficient (78%)
- Spanish — Conversational (55%)
(Each with a teal progress bar)

**Testimonials** (3 curated, compact card style)

> "Fernando is one of the most knowledgeable and effective resources I have come across in my +20yrs at MSFT... VERY few can accomplish this."  
> — **Adam Ryncarz**, Ford/GM/Cruise Account Delivery Executive · Microsoft

> "I have unwavering confidence in everything you do... I genuinely see you as a leader in your field."  
> — **Dawna Covey**, Enterprise ADL · Microsoft

> "Fernando has a can do attitude... Fernando is a joy to work with."  
> — **Melissa Hooper**, Sales Director · Microsoft

---

## 5. ATS Compatibility Notes

- All content in semantic HTML (`<h1>`–`<h3>`, `<p>`, `<ul>`, `<li>`) — parseable by ATS
- No text embedded in images (except the headshot)
- Section headers use standard labels (Experience, Education, Skills, Certifications)
- Sidebar uses readable text, not purely graphical elements
- Color and layout are decorative overlays; underlying text is clean

---

## 6. File Deliverables

| File | Purpose |
|---|---|
| `resume.html` | Source + print target |
| `assets/profile.jpg` | Headshot (already exists in repo) |

No additional dependencies. Google Fonts loaded from CDN (DM Sans). If printing offline, system sans-serif is the fallback.

---

## 7. Out of Scope

- Interactive features (the website's animations, hover effects)
- Dark mode / alternate color themes
- Automated PDF generation script (can be added later with Puppeteer if needed)
