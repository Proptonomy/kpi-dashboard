# Proptonomy KPI-tavle

Intern KPI- og aktivitetstavle for salgsteamet. Hver på teamet logger aktiviteter
(salg, demoer, outreach, m.m.) fra sin egen PC, og tavla viser leaderboards live.

- **Frontend:** én statisk fil (`index.html`) — vanilla JS
- **Backend:** Supabase (Postgres + REST + realtime)
- **Hosting:** GitHub Pages på https://intern-dashboard.proptonomy.ai

## Endre teamet / aktiviteter / poeng
Alt konfigureres i `CONFIG`-objektet øverst i `index.html` (team, aktiviteter,
poeng, mål). Rediger, commit og push — GitHub Pages oppdaterer seg selv.
