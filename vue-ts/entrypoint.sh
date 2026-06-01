#!/bin/bash
set -e

# Cria scaffold Vue 3 + Vite + TypeScript se não existir
if [ ! -f /workspace/package.json ]; then
  echo "Criando scaffold Vue 3 + Vite + TypeScript em /workspace..."
  cd /tmp
  npm create vue@latest app -- \
    --ts \
    --router \
    --pinia \
    --eslint \
    --force
  cp -r /tmp/app/. /workspace/
  cd /workspace && npm install
  echo "Scaffold criado com sucesso."
else
  echo "Projeto já existe em /workspace, pulando scaffold."
fi

exec sleep infinity
