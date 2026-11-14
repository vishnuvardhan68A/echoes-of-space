-- Run this once in Supabase: SQL Editor > New query > Run
create table if not exists scores (
  class_code text not null check (char_length(class_code) between 2 and 20),
  nick text not null check (char_length(nick) between 1 and 20),
  xp int not null check (xp between 0 and 100000),
  badges int not null default 0,
  updated_at timestamptz not null default now(),
  primary key (class_code, nick)
);
alter table scores enable row level security;
-- Trust-based classroom board: anyone with the project URL and anon key can read and write.
-- Only a nickname, class code and XP are stored. Do not ask students for real names.
create policy "read scores" on scores for select using (true);
create policy "add scores" on scores for insert with check (true);
create policy "update scores" on scores for update using (true) with check (true);
