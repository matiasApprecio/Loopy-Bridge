# SKILL.md — loopy-bridge

> Skill de comunicación A2A con el Team Loopy de Loopy Thinking.

## Descripción

Este skill permite al agente OpenClaw comunicarse bidireccionalmente con los 5 agentes del Team Loopy (Nova, Atlas, Vega, Echo, Orion) mediante el protocolo A2A inbound.

## Configuración requerida

| Variable | Descripción | Dónde obtenerla |
|----------|-------------|-----------------|
| `LOOPY_AGENT_REGISTRY_TOKEN` | Token de autenticación Bearer | Loopy > Admin > Conexiones > Tipo "agent_registry" |
| `LOOPY_SESSION_KEY` | mc_session_key del usuario | Loopy > Perfil > Agente Personal > Session Key |

## Endpoint

```
POST https://efsyebiumgieglwvxiss.supabase.co/functions/v1/mc-bridge/a2a/inbound
```

## Headers

```
Authorization: Bearer <LOOPY_AGENT_REGISTRY_TOKEN>
Content-Type: application/json
```

## Intents disponibles

| Intent | Agente destino | Descripción |
|--------|---------------|-------------|
| `send_signal` | (pipeline directo) | Enviar señal a un Loop |
| `configure_signal` | Nova | Configurar captura de señal |
| `test_signal` | Nova | Probar señal y validar recepción |
| `correct_signal` | Nova | Corregir señal (requiere aprobación) |
| `query_cron` | Cualquiera | Consultar jobs programados |
| `general` | Cualquiera | Consulta libre |

## Ejemplo de uso

```python
import requests, os

ENDPOINT = "https://efsyebiumgieglwvxiss.supabase.co/functions/v1/mc-bridge/a2a/inbound"
TOKEN = os.environ["LOOPY_AGENT_REGISTRY_TOKEN"]
SESSION = os.environ["LOOPY_SESSION_KEY"]

def loopy_send(intent, message, to="nova", signal_data=None, context=None):
    payload = {"session_key": SESSION, "intent": intent, "to": to, "message": message}
    if signal_data: payload["signal_data"] = signal_data
    if context: payload["context"] = context
    return requests.post(ENDPOINT, json=payload, headers={
        "Authorization": f"Bearer {TOKEN}",
        "Content-Type": "application/json"
    }).json()

# Enviar señal
loopy_send("send_signal", "", signal_data={
    "loop_id": "uuid-del-loop",
    "data": {"tipo": "Encuesta NPS", "resultado_general": "NPS 72", "severidad": "info", "detalle": []}
})

# Preguntar a Atlas
loopy_send("general", "¿Cuál es el nivel de confianza del loop de satisfacción?", to="atlas", context={"loop_id": "uuid"})
```

## Límites

- **Rate limit**: 30 requests/hora por session_key
- **Payload máximo**: 10KB
- **Modificaciones**: Retornan `requires_user_approval: true` — siempre confirmar con el usuario
