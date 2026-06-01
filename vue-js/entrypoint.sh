#!/bin/bash
set -e

if [ ! -f /workspace/package.json ]; then
  echo "Criando scaffold Vue 3 + Vite + JavaScript em /workspace..."
  cd /tmp
  npm create vue@latest app -- \
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
