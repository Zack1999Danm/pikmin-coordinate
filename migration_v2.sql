-- CoCo directory v2: optional metadata columns. Safe to run on the existing stores table.
alter table public.stores add column if not exists address text;
alter table public.stores add column if not exists county text;
create index if not exists stores_latitude_longitude_idx on public.stores(latitude, longitude);
create index if not exists stores_name_idx on public.stores(name);
