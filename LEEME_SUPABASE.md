# Rama v1_supabase — puesta en marcha

Misma app (generador + control de acceso) pero con Supabase en lugar de Firebase.
Los correos siguen saliendo con el script de Google (`enviar-qr.gs`), sin cambios.

## Pasos (una sola vez)

1. **Proyecto:** supabase.com → New project. Elegí región *South America (São Paulo)* y plan Free. Guardá la contraseña de la base.
2. **Tabla:** SQL Editor → New query → pegá `setup.sql` → Run.
3. **Cerrar el registro público (importante):** Authentication → Sign In / Providers → Email → desactivá **Allow new users to sign up**. Dejá desactivado también *Allow anonymous sign-ins*. Si no, cualquiera podría crearse una cuenta y borrar tu lista.
4. **Usuarios:** Authentication → Users → Add user → *Create new user* con email y contraseña (tildá *Auto Confirm User*). Uno para vos y otro para Sofía.
5. **Claves:** botón *Connect* (o Settings → API Keys). Copiá la *Project URL* y la *Publishable key* (`sb_publishable_...`) y pegalas en `supabase-config.js`. No uses nunca la secret key.
6. **Subí** estos archivos a la rama `v1_supabase`.

## Cómo probarlo sin tocar lo de la fiesta

GitHub Pages publica una sola rama. No cambies la rama de Pages mientras `main` esté en uso.
Para probar: en la carpeta con los archivos abrí una terminal y corré `python3 -m http.server 8000`, y entrá a `http://localhost:8000/generador-qr-v4.html`.
En Configurar iniciá sesión, generá un QR y fijate que aparezca en Supabase → Table Editor → invitados.

## Diferencias con la versión Firebase

- Guardar, reiniciar y borrar invitados **pide iniciar sesión** (pestaña Configurar del generador).
- La puerta no tiene login: puede leer la lista y marcar ingresos, nada más.
- Si dos celulares escanean el mismo QR a la vez con señal, la base deja pasar solo uno.
- Sin señal, la app guarda en el celular y sube los ingresos al volver (esto lo programamos nosotros; Supabase no lo trae).
- **Plan gratis: el proyecto se pausa tras 7 días sin actividad.** Antes de la fiesta entrá al panel y verificá que esté activo.
