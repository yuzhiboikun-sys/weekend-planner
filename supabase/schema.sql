create table if not exists public.planner_state (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null,
  updated_at timestamptz not null default now()
 );

alter table public.planner_state enable row level security;

create policy "Users can read their own planner state"
  on public.planner_state for select
  using (auth.uid() = user_id);

create policy "Users can insert their own planner state"
  on public.planner_state for insert
  with check (auth.uid() = user_id);

create policy "Users can update their own planner state"
  on public.planner_state for update
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);
