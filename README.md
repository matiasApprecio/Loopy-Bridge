# Loopy Bridge — Sub-Agente de Comunicación A2A

> Embajador diplomático entre OpenClaw y el Team Loopy de Loopy Thinking.

## 📋 Resumen

Este sub-agente gestiona la comunicación bidireccional con los 5 agentes del Team Loopy:
- **Nova** — Señales e integraciones
- **Atlas** — Análisis e interpretación
- **Vega** — Decisiones y ejecución
- **Echo** — Aprendizajes y políticas
- **Orion** — Gobernanza y meta-capa

## 🚀 Inicio Rápido

### 1. Configurar Variables de Entorno

```bash
export LOOPY_AGENT_REGISTRY_TOKEN="tu_token_de_loopy"
export LOOPY_SESSION_KEY="tu_mc_session_key"
```

### 2. Usar desde el Agente Principal

```python
# Enviar señal a un Loop
sessions_spawn(
    task="Enviar señal de NPS 72 al loop de Satisfacción del Cliente (loop_id: xxx)",
    agentId="loopy-bridge"
)

# Consultar a Atlas
sessions_spawn(
    task="Preguntar a Atlas cuál es el nivel de confianza del loop de ventas",
    agentId="loopy-bridge"
)
```

## 📁 Estructura del Agente

```
loopy-bridge/
├── agent.json          # Configuración del agente
├── IDENTITY.md         # Perfil y personalidad
├── AGENTS.md          # Triggers, prohibiciones, workflows
├── SKILL.md           # Especificación técnica A2A
├── USER.md            # Información del usuario propietario
├── launch.sh          # Script de inicio
└── README.md          # Este archivo
```

## 🔌 Intents Soportados

| Intent | Descripción | Agente |
|--------|-------------|--------|
| `send_signal` | Enviar datos a un Loop | Pipeline directo |
| `configure_signal` | Configurar integración | Nova |
| `test_signal` | Probar conexión | Nova |
| `correct_signal` | Corregir señal enviada | Nova |
| `query_cron` | Consultar jobs programados | Cualquiera |
| `general` | Consulta libre | Cualquiera |

## ⚠️ Reglas de Gobernanza

1. **NUNCA** enviar señales sin confirmar loop_id con el usuario
2. **NUNCA** ignorar una pausa de Orion
3. **NUNCA** exponer el token en logs o conversaciones
4. **SIEMPRE** pedir aprobación para correcciones de señales
5. **Máximo** 30 requests/hora (rate limit del sistema)

## 🔗 Endpoint A2A

```
POST https://efsyebiumgieglwvxiss.supabase.co/functions/v1/mc-bridge/a2a/inbound
Authorization: Bearer <LOOPY_AGENT_REGISTRY_TOKEN>
```

## 🛠️ Troubleshooting

| Error | Solución |
|-------|----------|
| 401 Unauthorized | Regenerar token en Loopy > Admin > Conexiones |
| 404 Not Found | Verificar session_key en Loopy > Perfil > Agente Personal |
| 429 Rate Limit | Esperar antes de reintentar (30 req/hora) |
| Orion emite pausa | Detener actividad y notificar al usuario inmediatamente |

## 📞 Soporte

Para problemas con credenciales:
- Token: Loopy > Admin > Conexiones > Tipo "agent_registry"
- Session Key: Loopy > Perfil > Agente Personal > Session Key
