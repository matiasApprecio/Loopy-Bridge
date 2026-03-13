#!/bin/bash
# Loopy Bridge Agent Launcher
# Este script lanza el sub-agente Loopy Bridge con las variables de entorno configuradas

set -e

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Directorio del agente
AGENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AGENT_ID="loopy-bridge"

echo -e "${GREEN}🌉 Iniciando Loopy Bridge Agent...${NC}"
echo ""

# Verificar variables de entorno
if [ -z "$LOOPY_AGENT_REGISTRY_TOKEN" ]; then
    echo -e "${RED}❌ Error: LOOPY_AGENT_REGISTRY_TOKEN no está configurado${NC}"
    echo "   Configúralo con: export LOOPY_AGENT_REGISTRY_TOKEN=\u003ctu_token\u003e"
    exit 1
fi

if [ -z "$LOOPY_SESSION_KEY" ]; then
    echo -e "${RED}❌ Error: LOOPY_SESSION_KEY no está configurado${NC}"
    echo "   Configúralo con: export LOOPY_SESSION_KEY=\u003ctu_session_key\u003e"
    exit 1
fi

echo -e "${GREEN}✅ Variables de entorno verificadas${NC}"
echo ""

# Verificar que el skill está instalado
if [ ! -d "/root/.openclaw/workspace/skills/loopy-bridge" ]; then
    echo -e "${YELLOW}⚠️  Advertencia: Skill loopy-bridge no encontrado en workspace/skills/${NC}"
    echo "   El agente puede no funcionar correctamente sin el skill."
    echo ""
fi

# Información de inicio
echo "📋 Configuración:"
echo "   Agente: Loopy Bridge"
echo "   Session Key: ${LOOPY_SESSION_KEY:0:8}..."
echo "   Token: ${LOOPY_AGENT_REGISTRY_TOKEN:0:8}..."
echo ""
echo "🔗 Endpoint A2A:"
echo "   https://efsyebiumgieglwvxiss.supabase.co/functions/v1/mc-bridge/a2a/inbound"
echo ""

# Iniciar el agente (esto depende de cómo OpenClaw maneja los sub-agentes)
# Por ahora, solo mostramos que está listo
echo -e "${GREEN}✅ Loopy Bridge está listo para comunicarse con el Team Loopy${NC}"
echo ""
echo "📖 Para usar este agente desde el agente principal:"
echo "   sessions_spawn(task=\"...\", agentId=\"loopy-bridge\")"
echo ""
