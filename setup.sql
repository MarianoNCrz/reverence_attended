-- Tabla de invitados para Supabase. Pegalo en SQL Editor y tocá Run (una sola vez).

create table if not exists public.invitados (
  dni     text primary key,
  nombre  text not null,
  ingreso boolean not null default false,
  hora    text not null default ''
);

alter table public.invitados enable row level security;

-- La puerta (sin login) puede leer la lista.
create policy "puerta lee" on public.invitados
  for select to anon, authenticated using (true);

-- La puerta (sin login) solo puede marcar un ingreso: pasar de false a true.
create policy "puerta marca ingreso" on public.invitados
  for update to anon using (ingreso = false) with check (ingreso = true);

-- Quien inicia sesión (vos y Sofía) puede cargar, reiniciar y borrar.
create policy "admin todo" on public.invitados
  for all to authenticated using (true) with check (true);

-- Además, la puerta solo puede tocar las columnas ingreso y hora.
revoke update on public.invitados from anon;
grant update (ingreso, hora) on public.invitados to anon;

-- Tiempo real.
alter publication supabase_realtime add table public.invitados;
