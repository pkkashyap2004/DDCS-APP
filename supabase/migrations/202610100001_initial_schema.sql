create extension if not exists pgcrypto;
create table if not exists public.products (id uuid primary key default gen_random_uuid(), name text not null check (char_length(name) between 2 and 120), description text not null default '', price numeric(12,2) not null default 0 check (price >= 0), image_url text, is_published boolean not null default false, created_at timestamptz not null default now(), updated_at timestamptz not null default now());
create table if not exists public.reviews (id uuid primary key default gen_random_uuid(), user_id uuid references auth.users(id) on delete set null, display_name text not null default 'Customer', message text not null check (char_length(message) between 3 and 1200), rating int not null check (rating between 1 and 5), is_published boolean not null default false, created_at timestamptz not null default now());
create table if not exists public.contact_inquiries (id uuid primary key default gen_random_uuid(), user_id uuid references auth.users(id) on delete set null, name text not null check (char_length(name) between 2 and 120), email text not null check (char_length(email) <= 254), phone text check (phone is null or char_length(phone) <= 30), message text not null check (char_length(message) between 10 and 4000), status text not null default 'new' check (status in ('new','in_progress','resolved','spam')), created_at timestamptz not null default now());
create index if not exists products_published_created_idx on public.products (is_published, created_at desc);
create index if not exists reviews_published_created_idx on public.reviews (is_published, created_at desc);
create index if not exists inquiries_status_created_idx on public.contact_inquiries (status, created_at desc);
alter table public.products enable row level security;
alter table public.reviews enable row level security;
alter table public.contact_inquiries enable row level security;
create policy "Published products are readable" on public.products for select to anon, authenticated using (is_published = true);
create policy "Published reviews are readable" on public.reviews for select to anon, authenticated using (is_published = true);
create policy "Anyone can submit contact inquiry" on public.contact_inquiries for insert to anon, authenticated with check (char_length(name) >= 2 and char_length(message) >= 10);
-- No public read policy on inquiries and no client write policies for products/reviews.
