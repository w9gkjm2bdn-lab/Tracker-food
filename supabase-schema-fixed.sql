-- MYFITPAL FIXED SCHEMA - entry_date
create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  display_name text, email text, age int, weight numeric, height numeric,
  goal text check (goal in ('lose','maintain','gain')), activity_level text,
  calorie_goal int, protein_goal int, carbs_goal int, fat_goal int,
  created_at timestamptz default now(), updated_at timestamptz default now()
);
create table if not exists public.diary (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references auth.users(id) on delete cascade not null,
  entry_date date not null,
  meals jsonb default '{"breakfast":[],"lunch":[],"dinner":[],"snacks":[],"exercise":[]}'::jsonb,
  water_glasses int default 0, created_at timestamptz default now(), updated_at timestamptz default now(),
  unique(user_id, entry_date)
);
create table if not exists public.custom_foods (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references auth.users(id) on delete cascade not null,
  name text not null, brand text, calories int, protein numeric, carbs numeric, fat numeric, per_100g jsonb, created_at timestamptz default now()
);
create table if not exists public.weights (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references auth.users(id) on delete cascade not null,
  weight numeric not null, created_at timestamptz default now()
);
alter table public.profiles enable row level security;
alter table public.diary enable row level security;
alter table public.custom_foods enable row level security;
alter table public.weights enable row level security;
drop policy if exists "profiles all own" on public.profiles;
create policy "profiles all own" on public.profiles for all using (auth.uid() = id) with check (auth.uid() = id);
drop policy if exists "diary all own" on public.diary;
create policy "diary all own" on public.diary for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
drop policy if exists "foods all own" on public.custom_foods;
create policy "foods all own" on public.custom_foods for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
drop policy if exists "weights all own" on public.weights;
create policy "weights all own" on public.weights for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
