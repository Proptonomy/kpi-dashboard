-- ============================================================
-- Proptonomy KPI-tavle · databaseoppsett for Supabase
-- Kjør alt dette i Supabase → SQL Editor → New query → Run
-- ============================================================

create table if not exists public.activities (
  id         bigint generated always as identity primary key,
  person     text        not null,
  activity   text        not null,
  points     integer     not null default 0,
  note       text,
  created_at timestamptz not null default now()
);

-- Skru på radsikkerhet
alter table public.activities enable row level security;

-- Internt team-verktøy: alle kan lese tavla og legge til aktiviteter.
-- (Bevisst INGEN update/delete-policy, så rader ikke kan endres/slettes fra appen.)
create policy "les alle"  on public.activities for select using (true);
create policy "legg til"  on public.activities for insert with check (true);

-- Angre feilklikk: tillat sletting KUN av helt ferske rader (siste 15 min).
-- Beskytter historikk, men lar «Angre»-knappen fjerne nylige registreringer.
create policy "angre nylig" on public.activities for delete using (created_at > now() - interval '15 minutes');

-- Sanntid: gjør at leaderboardet oppdateres straks noen logger noe.
alter publication supabase_realtime add table public.activities;
