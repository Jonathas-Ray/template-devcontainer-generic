#!/bin/bash
set -e

# Se não houver projeto NestJS no workspace, cria o scaffold
if [ ! -f /workspace/package.json ]; then
  echo "Criando scaffold NestJS em /workspace..."
  cd /tmp
  nest new app --package-manager npm --skip-git --strict
  cp -r /tmp/app/. /workspace/
  echo "Scaffold criado com sucesso."
else
  echo "Projeto já existe em /workspace, pulando scaffold."
fi

exec sleep infinity
