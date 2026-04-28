# Resume PDF Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Create `resume.html` — a self-contained, print-optimized 2-page resume that renders to a polished PDF when printed via Chrome's "Save as PDF."

**Architecture:** Single `resume.html` file with inline `<style>` and all content. Two `.page` divs (one per resume page) each containing a teal header and a 2-column body (65% left / 35% right sidebar). `@page` CSS rules control US Letter size and zero margins; `print-color-adjust: exact` ensures background colors print.

**Tech Stack:** HTML5, CSS3 (`@page`, `@media print`, CSS Grid), Google Fonts (DM Sans), Chrome print-to-PDF.

---

## File Map

| File | Action | Purpose |
|---|---|---|
| `resume.html` | Create | Complete resume — all CSS + HTML in one file |
| `assets/profile.jpg` | Read-only | Headshot (already exists) |

---

## Task 1: Document Skeleton + All CSS

**Files:**
- Create: `resume.html`

- [ ] **Step 1: Create `resume.html` with the full CSS and empty page shells**

Create `/Users/fefoabreu/fefoabreu.me/resume.html` with this exact content:

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Fernando Abreu — Resume</title>
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
  <style>
    /* ── TOKENS ───────────────────────────────────────── */
    :root {
      --teal-dark:  #0e6e7a;
      --teal-mid:   #1a9aaa;
      --teal-light: #f0f7f8;
      --text:       #2d3748;
      --text-muted: #718096;
      --white:      #ffffff;
      --border:     #d1e8ec;
      --gold:       #e8a614;
    }

    /* ── PAGE SETUP ───────────────────────────────────── */
    @page { size: letter; margin: 0; }

    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    body {
      font-family: 'DM Sans', system-ui, sans-serif;
      color: var(--text);
      font-size: 9pt;
      line-height: 1.5;
      background: #fff;
      -webkit-print-color-adjust: exact;
      print-color-adjust: exact;
    }

    /* ── PAGE CONTAINERS ──────────────────────────────── */
    .page {
      width: 8.5in;
      min-height: 11in;
      display: flex;
      flex-direction: column;
      background: #fff;
      overflow: hidden;
    }
    .page + .page { page-break-before: always; }

    /* ── HEADER ───────────────────────────────────────── */
    .header {
      background: var(--teal-dark);
      color: var(--white);
      padding: 0.32in 0.4in;
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 1rem;
      flex-shrink: 0;
    }
    .header-text { flex: 1; }
    .header-name {
      font-size: 22pt;
      font-weight: 700;
      letter-spacing: -0.02em;
      color: var(--white);
      line-height: 1.05;
    }
    .header-title {
      font-size: 9pt;
      font-weight: 300;
      color: rgba(255,255,255,.82);
      margin-top: .15rem;
      letter-spacing: .02em;
    }
    .header-contact {
      display: flex;
      flex-wrap: wrap;
      gap: .2rem .9rem;
      margin-top: .4rem;
      font-size: 7.5pt;
      color: rgba(255,255,255,.72);
    }
    .header-contact a { color: rgba(255,255,255,.72); text-decoration: none; }
    .cert-tags {
      display: flex;
      flex-wrap: wrap;
      gap: .25rem;
      margin-top: .45rem;
    }
    .cert-tag {
      font-size: 6.5pt;
      padding: .12rem .45rem;
      border: 1px solid rgba(255,255,255,.38);
      border-radius: 10px;
      color: rgba(255,255,255,.82);
      letter-spacing: .08em;
    }
    .header-photo {
      width: 72px;
      height: 72px;
      border-radius: 50%;
      object-fit: cover;
      border: 2px solid rgba(255,255,255,.38);
      flex-shrink: 0;
    }

    /* ── BODY GRID ────────────────────────────────────── */
    .body {
      display: grid;
      grid-template-columns: 1.85fr 1fr;
      flex: 1;
    }
    .col-left {
      padding: .28in .28in .28in .4in;
      border-right: 1px solid var(--border);
    }
    .col-right {
      background: var(--teal-light);
      padding: .28in .25in;
    }

    /* ── SECTION LABEL ────────────────────────────────── */
    .section-label {
      font-size: 6.5pt;
      font-weight: 700;
      letter-spacing: .18em;
      text-transform: uppercase;
      color: var(--teal-mid);
      border-bottom: 1.5px solid var(--teal-mid);
      padding-bottom: .18rem;
      margin-bottom: .35rem;
    }

    /* ── SUMMARY ──────────────────────────────────────── */
    .summary { margin-bottom: .2in; }
    .summary p { font-size: 8.5pt; line-height: 1.65; color: var(--text); }

    /* ── EXPERIENCE ───────────────────────────────────── */
    .experience { margin-bottom: .15in; }
    .job { margin-bottom: .17in; }
    .job:last-child { margin-bottom: 0; }
    .job-header {
      display: flex;
      justify-content: space-between;
      align-items: baseline;
    }
    .job-company {
      font-size: 10.5pt;
      font-weight: 700;
      color: var(--teal-dark);
    }
    .job-dates {
      font-size: 7pt;
      color: var(--text-muted);
      white-space: nowrap;
    }
    .job-meta {
      font-size: 7.5pt;
      color: var(--text-muted);
      margin-top: .05rem;
      margin-bottom: .1rem;
    }
    .job-meta strong {
      font-weight: 600;
      color: var(--text);
    }
    .job-bullets {
      margin: .15rem 0 .15rem .85rem;
      padding: 0;
    }
    .job-bullets li {
      font-size: 8pt;
      color: var(--text);
      line-height: 1.55;
      margin-bottom: .1rem;
    }
    .client-tags {
      display: flex;
      flex-wrap: wrap;
      gap: .18rem;
      margin-top: .18rem;
    }
    .client-tag {
      font-size: 6.5pt;
      padding: .08rem .38rem;
      border: 1px solid #b2d8e0;
      border-radius: 10px;
      color: var(--teal-mid);
      background: rgba(26,154,170,.06);
    }

    /* ── EDUCATION ────────────────────────────────────── */
    .education { margin-bottom: .15in; }
    .edu-item { margin-bottom: .09in; }
    .edu-degree { font-size: 8.5pt; font-weight: 600; color: var(--text); }
    .edu-school  { font-size: 7.5pt; color: var(--text-muted); }

    /* ── COMMUNITY ────────────────────────────────────── */
    .community-item {
      font-size: 8pt;
      color: var(--text);
      line-height: 1.55;
      padding-left: .5rem;
      border-left: 2px solid var(--teal-mid);
      margin-bottom: .1in;
    }

    /* ── SIDEBAR: ACHIEVEMENTS ────────────────────────── */
    .sidebar-section { margin-bottom: .18in; }
    .sidebar-section:last-child { margin-bottom: 0; }

    .achievement {
      display: flex;
      align-items: flex-start;
      gap: .35rem;
      margin-bottom: .12rem;
    }
    .achievement-star { color: var(--gold); font-size: 9pt; flex-shrink: 0; margin-top: 1px; }
    .achievement p { font-size: 7.5pt; color: var(--text); line-height: 1.5; }

    /* ── SIDEBAR: SKILLS ──────────────────────────────── */
    .tag-group { margin-bottom: .12rem; }
    .tag-group-label { font-size: 6.5pt; color: var(--teal-mid); font-weight: 700; margin-bottom: .12rem; }
    .tags { display: flex; flex-wrap: wrap; gap: .18rem; }
    .tag {
      font-size: 7pt;
      padding: .12rem .42rem;
      background: rgba(26,154,170,.1);
      border: 1px solid rgba(26,154,170,.25);
      border-radius: 10px;
      color: var(--teal-dark);
    }

    /* ── SIDEBAR: CERTS ───────────────────────────────── */
    .cert-item { margin-bottom: .09rem; }
    .cert-name   { font-size: 8pt; font-weight: 600; color: var(--text); }
    .cert-issuer { font-size: 7pt; color: var(--text-muted); }

    /* ── SIDEBAR: LANGUAGES ───────────────────────────── */
    .lang-item { margin-bottom: .12rem; }
    .lang-row {
      display: flex;
      justify-content: space-between;
      align-items: baseline;
    }
    .lang-name  { font-size: 8pt; font-weight: 500; color: var(--text); }
    .lang-level { font-size: 7pt; color: var(--teal-mid); }
    .lang-bar-wrap { height: 3px; background: rgba(26,154,170,.2); border-radius: 2px; margin-top: 2px; }
    .lang-bar { height: 100%; background: var(--teal-mid); border-radius: 2px; }

    /* ── SIDEBAR: TESTIMONIALS ────────────────────────── */
    .testimonial {
      background: rgba(255,255,255,.72);
      border-left: 2.5px solid var(--teal-mid);
      padding: .18rem .3rem;
      margin-bottom: .12rem;
      border-radius: 0 4px 4px 0;
    }
    .testimonial-text {
      font-size: 7.5pt;
      font-style: italic;
      color: var(--text);
      line-height: 1.55;
    }
    .testimonial-author { font-size: 7.5pt; font-weight: 700; color: var(--teal-dark); margin-top: .1rem; }
    .testimonial-role   { font-size: 6.5pt; color: var(--text-muted); }

    /* ── PRINT OVERRIDES ──────────────────────────────── */
    @media print {
      body { font-size: 9pt; }
      .page + .page { page-break-before: always; }
      a { color: inherit !important; text-decoration: none !important; }
    }
  </style>
</head>
<body>

  <!-- ═══════════════ PAGE 1 ═══════════════ -->
  <div class="page">
    <!-- HEADER PLACEHOLDER -->
    <header class="header">
      <div class="header-text">
        <div class="header-name">Fernando Abreu</div>
      </div>
    </header>
    <!-- BODY PLACEHOLDER -->
    <div class="body">
      <div class="col-left"></div>
      <div class="col-right"></div>
    </div>
  </div>

  <!-- ═══════════════ PAGE 2 ═══════════════ -->
  <div class="page">
    <div class="body">
      <div class="col-left"></div>
      <div class="col-right"></div>
    </div>
  </div>

</body>
</html>
```

- [ ] **Step 2: Open in Chrome and verify the skeleton**

Open `resume.html` in Chrome. You should see:
- Two blank page-shaped areas stacked vertically
- A teal header strip at the top of page 1 with "Fernando Abreu"
- Light teal right sidebar on both pages
- No overflow, no scroll bars within pages

- [ ] **Step 3: Commit the skeleton**

```bash
git add resume.html
git commit -m "feat: resume HTML skeleton with CSS tokens and page layout"
```

---

## Task 2: Complete the Page 1 Header

**Files:**
- Modify: `resume.html` — replace the `<header>` placeholder in Page 1

- [ ] **Step 1: Replace the Page 1 `<header>` block**

Find this exact block in `resume.html`:

```html
    <!-- HEADER PLACEHOLDER -->
    <header class="header">
      <div class="header-text">
        <div class="header-name">Fernando Abreu</div>
      </div>
    </header>
```

Replace it with:

```html
    <!-- HEADER -->
    <header class="header">
      <div class="header-text">
        <div class="header-name">Fernando Abreu</div>
        <div class="header-title">Principal Project Manager &nbsp;|&nbsp; Cloud &amp; Agentic AI &nbsp;·&nbsp; Microsoft Professional Services &nbsp;·&nbsp; Fortune 500</div>
        <div class="header-contact">
          <span>📞 804.773.5483</span>
          <a href="mailto:fefoabreu@gmail.com">fefoabreu@gmail.com</a>
          <a href="https://linkedin.com/in/fefoabreu">linkedin.com/in/fefoabreu</a>
          <span>📍 Richmond, VA</span>
        </div>
        <div class="cert-tags">
          <span class="cert-tag">PMP</span>
          <span class="cert-tag">CSPO</span>
          <span class="cert-tag">CSM</span>
          <span class="cert-tag">ITIL</span>
          <span class="cert-tag">MBA</span>
          <span class="cert-tag">CMMI</span>
        </div>
      </div>
      <img src="assets/profile.jpg" alt="Fernando Abreu" class="header-photo" />
    </header>
```

- [ ] **Step 2: Verify header in Chrome**

Refresh the page. Verify:
- Teal header spans full width
- Name is large and bold (white)
- Subtitle, contact row (phone · email · LinkedIn · location), and cert tags all appear below in lighter white text
- Circular headshot appears on the right side of the header

- [ ] **Step 3: Commit**

```bash
git add resume.html
git commit -m "feat: add resume header with contact info, cert tags, and headshot"
```

---

## Task 3: Page 1 — Left Column (Summary + Microsoft + Dexian-DISYS)

**Files:**
- Modify: `resume.html` — replace the Page 1 left column `<div class="col-left"></div>` placeholder

- [ ] **Step 1: Replace the Page 1 `col-left` placeholder**

Find:
```html
      <div class="col-left"></div>
```
(This is the first occurrence — inside the first `.page` div.)

Replace with:

```html
      <div class="col-left">

        <!-- SUMMARY -->
        <div class="summary">
          <div class="section-label">Summary</div>
          <p>Principal Project Manager with 25+ years in IT and a decade leading Microsoft's most complex Cloud and AI consulting engagements across the Fortune 500. Expert at orchestrating cross-functional teams — Architects, BAs, Feature Teams, Vendors, and Delivery Executives — to drive measurable consumption ROI and lasting business outcomes. Multilingual (English, Portuguese, French, Spanish) and a practicing builder of Agentic AI solutions.</p>
        </div>

        <!-- EXPERIENCE -->
        <div class="experience">
          <div class="section-label">Experience</div>

          <!-- Microsoft -->
          <div class="job">
            <div class="job-header">
              <div class="job-company">Microsoft</div>
              <div class="job-dates">July 2016 – Present</div>
            </div>
            <div class="job-meta"><strong>Principal Project Manager</strong> · Professional Services · Richmond, VA</div>
            <ul class="job-bullets">
              <li>Lead end-to-end delivery of complex Cloud &amp; AI consulting engagements for Fortune 500 clients, orchestrating cross-functional teams across architects, BAs, feature teams, vendors, and delivery executives to drive consumption ROI.</li>
              <li>Developed and deployed Agentic AI companion agents — Delivery, Pursuit, and Sales — enabling data-driven portfolio monitoring, root-cause analysis, and accelerated issue resolution across program portfolios.</li>
              <li>Accelerated sales velocity through SOW design, pricing models, and complex deal governance for multi-million-dollar contracts; managed OKRs, KPIs, financial health, and customer satisfaction metrics.</li>
              <li>Built and scaled practice intellectual property including delivery frameworks, methodology, offerings, and reusable accelerators that elevate the consulting value proposition.</li>
            </ul>
            <div class="client-tags">
              <span class="client-tag">AT&amp;T</span>
              <span class="client-tag">Chevron</span>
              <span class="client-tag">Coca-Cola</span>
              <span class="client-tag">Disney</span>
              <span class="client-tag">ExxonMobil</span>
              <span class="client-tag">FedEx</span>
              <span class="client-tag">Ford</span>
              <span class="client-tag">GM-Cruise</span>
              <span class="client-tag">NBA</span>
              <span class="client-tag">NFL</span>
              <span class="client-tag">Nike</span>
              <span class="client-tag">T-Mobile</span>
              <span class="client-tag">WarnerBros. Discovery</span>
              <span class="client-tag">+ more</span>
            </div>
          </div>

          <!-- Dexian-DISYS -->
          <div class="job">
            <div class="job-header">
              <div class="job-company">Dexian-DISYS</div>
              <div class="job-dates">2010 – 2016</div>
            </div>
            <div class="job-meta"><strong>Practice Leader, Application Development</strong> · Houston, TX → Washington D.C. Metro</div>
            <ul class="job-bullets">
              <li>Founded and scaled a Scrum-Agile Application Development Practice from zero, defining delivery models, sales strategy, and full operational oversight with P&amp;L responsibility.</li>
              <li>Delivered consulting for U.S. Postal Service, ExxonMobil, Schlumberger, and Frontier; managed full lead-to-order and order-to-cash lifecycle.</li>
              <li>Led people management, technical presales, financial forecasting, and complex deal governance; expanded scope from Houston to D.C. Metro region.</li>
            </ul>
          </div>

        </div><!-- /experience -->

      </div><!-- /col-left -->
```

- [ ] **Step 2: Verify in Chrome**

Refresh. The left column on page 1 should show:
- Summary paragraph
- Microsoft job block (company name in teal, dates right-aligned, title, 4 bullets, client tag row)
- Dexian-DISYS block below it with 3 bullets

- [ ] **Step 3: Commit**

```bash
git add resume.html
git commit -m "feat: add page 1 left column — summary, Microsoft, Dexian-DISYS experience"
```

---

## Task 4: Page 1 — Right Sidebar (Key Achievements + Skills + Certifications)

**Files:**
- Modify: `resume.html` — replace the first `<div class="col-right"></div>` placeholder

- [ ] **Step 1: Replace the Page 1 `col-right` placeholder**

Find the first occurrence of:
```html
      <div class="col-right"></div>
```

Replace with:

```html
      <div class="col-right">

        <!-- KEY ACHIEVEMENTS -->
        <div class="sidebar-section">
          <div class="section-label">Key Achievements</div>
          <div class="achievement">
            <span class="achievement-star">★</span>
            <p>Built 3 production Agentic AI agents (Delivery, Pursuit, Sales) deployed across Microsoft's Professional Services portfolio</p>
          </div>
          <div class="achievement">
            <span class="achievement-star">★</span>
            <p>Delivered Cloud &amp; AI engagements for 17+ Fortune 500 clients over 10 years at Microsoft</p>
          </div>
          <div class="achievement">
            <span class="achievement-star">★</span>
            <p>Founded and scaled Agile App Dev Practice from zero at Dexian-DISYS with full P&amp;L ownership</p>
          </div>
          <div class="achievement">
            <span class="achievement-star">★</span>
            <p>CMMI SCAMPI A &amp; B appraiser; led organizational process appraisals at Meta Brasil</p>
          </div>
        </div>

        <!-- SKILLS -->
        <div class="sidebar-section">
          <div class="section-label">Skills</div>
          <div class="tag-group">
            <div class="tag-group-label">Practices</div>
            <div class="tags">
              <span class="tag">Agile / Scrum</span>
              <span class="tag">Design Thinking</span>
              <span class="tag">PMO Methodology</span>
              <span class="tag">SDLC</span>
              <span class="tag">CMMI</span>
              <span class="tag">Kanban</span>
              <span class="tag">DevOps</span>
            </div>
          </div>
          <div class="tag-group">
            <div class="tag-group-label">Cloud &amp; AI</div>
            <div class="tags">
              <span class="tag">Azure Cloud Adoption</span>
              <span class="tag">Agentic AI Solutions</span>
              <span class="tag">AI Agent Development</span>
              <span class="tag">AI/Automation Optimization</span>
            </div>
          </div>
          <div class="tag-group">
            <div class="tag-group-label">Leadership</div>
            <div class="tags">
              <span class="tag">Cross-Functional Orchestration</span>
              <span class="tag">Stakeholder Management</span>
              <span class="tag">Change Management</span>
              <span class="tag">Risk Management</span>
            </div>
          </div>
          <div class="tag-group">
            <div class="tag-group-label">Business</div>
            <div class="tags">
              <span class="tag">Technical Presales</span>
              <span class="tag">Portfolio Management</span>
              <span class="tag">Complex Deal Governance</span>
              <span class="tag">SOW Design</span>
            </div>
          </div>
        </div>

        <!-- CERTIFICATIONS -->
        <div class="sidebar-section">
          <div class="section-label">Certifications</div>
          <div class="cert-item">
            <div class="cert-name">PMP</div>
            <div class="cert-issuer">Project Management Institute</div>
          </div>
          <div class="cert-item">
            <div class="cert-name">CSPO · CSM</div>
            <div class="cert-issuer">Scrum Alliance</div>
          </div>
          <div class="cert-item">
            <div class="cert-name">ITIL</div>
            <div class="cert-issuer">Exin</div>
          </div>
          <div class="cert-item">
            <div class="cert-name">CMMI SCAMPI A &amp; B</div>
            <div class="cert-issuer">SEI Carnegie Mellon</div>
          </div>
        </div>

      </div><!-- /col-right -->
```

- [ ] **Step 2: Verify in Chrome**

Refresh. The right sidebar on page 1 should show:
- "Key Achievements" section with gold stars and 4 bullets
- "Skills" section with 4 tag groups (Practices, Cloud & AI, Leadership, Business) — teal tags on light background
- "Certifications" section with 4 entries

- [ ] **Step 3: Commit**

```bash
git add resume.html
git commit -m "feat: add page 1 right sidebar — achievements, skills, certifications"
```

---

## Task 5: Page 2 — Left Column (Meta Brasil + Dinamize + Education + Community)

**Files:**
- Modify: `resume.html` — replace the second `<div class="col-left"></div>` placeholder (inside the second `.page` div)

- [ ] **Step 1: Replace the Page 2 `col-left` placeholder**

Find the second occurrence of:
```html
      <div class="col-left"></div>
```

Replace with:

```html
      <div class="col-left">

        <!-- EXPERIENCE CONTINUED -->
        <div class="experience">
          <div class="section-label">Experience (continued)</div>

          <!-- Meta Brasil -->
          <div class="job">
            <div class="job-header">
              <div class="job-company">Meta Brasil</div>
              <div class="job-dates">2002 – 2010</div>
            </div>
            <div class="job-meta"><strong>SW Engineer → Dev Lead → IT Consultant → Technical Program Manager</strong> · Porto Alegre, Brazil</div>
            <ul class="job-bullets">
              <li>Progressed through every discipline over 8 years — from writing production code to leading product teams, implementing SDLC and PMO methodologies, and managing outsourcing operations.</li>
              <li>Implemented CMMI SEPG processes and led SCAMPI appraisals; managed outsourcing operations and delivered optimized business-technology integration for enterprise clients.</li>
              <li>Designed and engineered IT consulting products end-to-end, building deep expertise in solution design, product engineering, and client-facing consulting.</li>
            </ul>
          </div>

          <!-- Dinamize -->
          <div class="job">
            <div class="job-header">
              <div class="job-company">Dinamize Web Systems</div>
              <div class="job-dates">2000 – 2004</div>
            </div>
            <div class="job-meta"><strong>Full Stack Software Engineer</strong> · Porto Alegre, Brazil</div>
            <ul class="job-bullets">
              <li>Built client-server and web-based applications using Delphi, Visual Basic, ASP.NET, and SQL Server.</li>
              <li>Developed foundational skills in database administration, UX/UI wireframing, and product engineering.</li>
            </ul>
          </div>

        </div><!-- /experience -->

        <!-- EDUCATION -->
        <div class="education">
          <div class="section-label">Education</div>
          <div class="edu-item">
            <div class="edu-degree">MBA in Business Strategy — Magna Cum Laude</div>
            <div class="edu-school">PUC Rio Grande do Sul &nbsp;·&nbsp; 2009–2011</div>
          </div>
          <div class="edu-item">
            <div class="edu-degree">B.S. Computer Science — Summa Cum Laude</div>
            <div class="edu-school">PUC Rio Grande do Sul &nbsp;·&nbsp; 2003–2007</div>
          </div>
          <div class="edu-item">
            <div class="edu-degree">Associate's in Software Engineering</div>
            <div class="edu-school">Escola Técnica Santo Inácio</div>
          </div>
        </div>

        <!-- COMMUNITY -->
        <div>
          <div class="section-label">Community &amp; Teaching</div>
          <div class="community-item">PMP Exam Instructor — PMIRS Chapter (since 2006) &nbsp;·&nbsp; Risk Management track</div>
          <div class="community-item">PMO Workshop Facilitator — SEBRAE-RS (since 2011)</div>
        </div>

      </div><!-- /col-left -->
```

- [ ] **Step 2: Verify in Chrome**

Refresh. Page 2 left column should show:
- "Experience (continued)" with Meta Brasil (3 bullets) and Dinamize (2 bullets)
- Education section with 3 entries (MBA, BS, Associate's)
- Community section with 2 left-bordered items

- [ ] **Step 3: Commit**

```bash
git add resume.html
git commit -m "feat: add page 2 left column — Meta Brasil, Dinamize, education, community"
```

---

## Task 6: Page 2 — Right Sidebar (Languages + Testimonials)

**Files:**
- Modify: `resume.html` — replace the second `<div class="col-right"></div>` placeholder

- [ ] **Step 1: Replace the Page 2 `col-right` placeholder**

Find the second occurrence of:
```html
      <div class="col-right"></div>
```

Replace with:

```html
      <div class="col-right">

        <!-- LANGUAGES -->
        <div class="sidebar-section">
          <div class="section-label">Languages</div>
          <div class="lang-item">
            <div class="lang-row">
              <span class="lang-name">English</span>
              <span class="lang-level">Native</span>
            </div>
            <div class="lang-bar-wrap"><div class="lang-bar" style="width:100%"></div></div>
          </div>
          <div class="lang-item">
            <div class="lang-row">
              <span class="lang-name">Portuguese</span>
              <span class="lang-level">Native</span>
            </div>
            <div class="lang-bar-wrap"><div class="lang-bar" style="width:100%"></div></div>
          </div>
          <div class="lang-item">
            <div class="lang-row">
              <span class="lang-name">French</span>
              <span class="lang-level">Proficient</span>
            </div>
            <div class="lang-bar-wrap"><div class="lang-bar" style="width:78%"></div></div>
          </div>
          <div class="lang-item">
            <div class="lang-row">
              <span class="lang-name">Spanish</span>
              <span class="lang-level">Conversational</span>
            </div>
            <div class="lang-bar-wrap"><div class="lang-bar" style="width:55%"></div></div>
          </div>
        </div>

        <!-- TESTIMONIALS -->
        <div class="sidebar-section">
          <div class="section-label">Voices</div>

          <div class="testimonial">
            <div class="testimonial-text">"Fernando is one of the most knowledgeable and effective resources I have come across in my +20yrs at MSFT... VERY few can accomplish this."</div>
            <div class="testimonial-author">Adam Ryncarz</div>
            <div class="testimonial-role">Ford/GM/Cruise Account Delivery Executive · Microsoft</div>
          </div>

          <div class="testimonial">
            <div class="testimonial-text">"I have unwavering confidence in everything you do... I genuinely see you as a leader in your field."</div>
            <div class="testimonial-author">Dawna Covey</div>
            <div class="testimonial-role">Enterprise ADL · Microsoft</div>
          </div>

          <div class="testimonial">
            <div class="testimonial-text">"Fernando has a can do attitude. Even on areas outside of his remit, he has leaned in to support the team... Fernando is a joy to work with."</div>
            <div class="testimonial-author">Melissa Hooper</div>
            <div class="testimonial-role">Sales Director · Microsoft</div>
          </div>

        </div>

      </div><!-- /col-right -->
```

- [ ] **Step 2: Verify in Chrome**

Refresh. Page 2 right sidebar should show:
- Languages section with 4 entries and teal progress bars
- "Voices" section with 3 testimonial cards (white background, teal left border, name bolded in teal)

- [ ] **Step 3: Commit**

```bash
git add resume.html
git commit -m "feat: add page 2 right sidebar — languages with bars, testimonials panel"
```

---

## Task 7: Print Verification and Final Polish

**Files:**
- Modify: `resume.html` (minor spacing tweaks if needed)

- [ ] **Step 1: Open Chrome print preview**

In Chrome, open `resume.html` and press `Cmd+P` (Mac). In the print dialog:
- Destination: "Save as PDF"
- Paper size: Letter
- Margins: None (or Default — the `@page` CSS controls this)
- Options: check "Background graphics" is ON (required for teal colors to print)

- [ ] **Step 2: Verify page 1 in print preview**

Check all of the following in the print preview:
- [ ] Header: teal background prints, photo is circular, name/title/contact visible
- [ ] Left column: Summary paragraph fits without overflow
- [ ] Microsoft block: all 4 bullets visible, client tags wrap cleanly
- [ ] Dexian-DISYS block: 3 bullets visible
- [ ] Right sidebar: achievements, skills tags, certifications all visible
- [ ] Page 1 does NOT bleed into page 2

- [ ] **Step 3: Verify page 2 in print preview**

- [ ] Meta Brasil and Dinamize blocks fit cleanly
- [ ] Education and Community sections appear
- [ ] Languages bars are visible (teal fill)
- [ ] Three testimonial cards appear with teal left border

- [ ] **Step 4: Fix any overflow or spacing issues**

If content overflows a page, reduce the following values in the CSS (adjust as needed):
- `.col-left` padding: reduce from `.28in` to `.22in`
- `.job` margin-bottom: reduce from `.17in` to `.13in`
- `.summary` margin-bottom: reduce from `.2in` to `.16in`
- `.job-bullets li` margin-bottom: reduce from `.1rem` to `.06rem`

If the sidebar is too cramped, reduce `.sidebar-section` margin-bottom from `.18in` to `.13in`.

- [ ] **Step 5: Save the final PDF**

In the Chrome print dialog, click Save. Name the file:
```
Fernando_Abreu_Resume.pdf
```
Save it to your desktop or wherever needed for submission.

- [ ] **Step 6: Final commit**

```bash
git add resume.html
git commit -m "feat: complete 2-page resume PDF — print-verified, teal template style"
```

---

## Self-Review Against Spec

| Spec Requirement | Covered by Task |
|---|---|
| Teal color scheme matching sample template | Task 1 (CSS tokens) |
| 2-column layout, 65% left / 35% right | Task 1 (body grid) |
| Circular headshot in header | Task 2 |
| Summary (3 sentences) | Task 3 |
| Microsoft experience with 4 bullets + client tags | Task 3 |
| Dexian-DISYS with 3 bullets | Task 3 |
| Key Achievements (4 gold-star bullets) | Task 4 |
| Skills grouped by category (4 groups) | Task 4 |
| Certifications (4 entries with issuer) | Task 4 |
| Meta Brasil with 3 bullets | Task 5 |
| Dinamize with 2 bullets | Task 5 |
| Education (MBA, BS, Associate's) | Task 5 |
| Community / Teaching section | Task 5 |
| Languages with progress bars | Task 6 |
| Testimonials panel (3 curated quotes) | Task 6 |
| ATS-friendly: semantic HTML, no text-in-image | All tasks |
| `@page`, `@media print`, `print-color-adjust` | Task 1 |
| `assets/profile.jpg` reference | Task 2 |
| US Letter, Chrome print-to-PDF delivery | Task 7 |

All spec requirements are covered. No placeholders remain.
