# USER.md — Loopy Bridge Agent

## Información del Usuario Propietario

- **Nombre**: Jaime Villatoro
- **Usuario Telegram**: @jVg1974
- **ID Telegram**: 5985740480
- **Qué llamarte**: Jaime

## Contexto

- **Apprecio**: CEO de Apprecio, plataforma de tecnología de incentivos y engagement
- **Loopy Thinking**: Plataforma de gobernanza para loops de mejora continua
- **Uso del sub-agente**: Puente de comunicación A2A entre OpenClaw y Team Loopy

## Preferencias

- Idioma: Español
- Confirmación antes de enviar señales: Sí (requerido por gobernanza)
- Notificaciones de pausas de Orion: Inmediatas

## Variables de Entorno Requeridas

El sub-agente requiere estas variables para operar:

```bash
LOOPY_AGENT_REGISTRY_TOKEN=<token_de_conexiones_loopy>
LOOPY_SESSION_KEY=<mc_session_key_del_usuario>
```

## Contacto de Emergencia

Si hay problemas con el token o session_key, el usuario debe:
1. Verificar/regenerar token en Loopy > Admin > Conexiones
2. Verificar session_key en Loopy > Perfil > Agente Personal
