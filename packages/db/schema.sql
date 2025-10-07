-- enable UUID generator (usually on by default)
create extension if not exists "pgcrypto";

-- Tenants
create table if not exists tenants (
  id uuid default gen_random_uuid() primary key,
  slug text unique not null,
  name text not null,
  public boolean default true
);

-- Pages
create table if not exists pages (
  id uuid default gen_random_uuid() primary key,
  tenant_slug text references tenants(slug) on delete cascade,
  slug text not null,
  title text not null,
  summary text,
  url text not null,
  keywords text[],
  published_at timestamptz default now(),
  unique(tenant_slug, slug)
);

-- Optional manual edges (boosting)
create table if not exists page_edges (
  src uuid references pages(id) on delete cascade,
  dst uuid references pages(id) on delete cascade,
  weight real default 0.5,
  primary key (src, dst)
);

-- Public read
alter table tenants enable row level security;
alter table pages   enable row level security;

create policy "public read tenants" on tenants for select using (public is true);
create policy "public read pages"   on pages   for select using (true);
