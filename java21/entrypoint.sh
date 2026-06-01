#!/bin/bash
set -e

if [ ! -f /workspace/pom.xml ]; then
  echo "Gerando scaffold Spring Boot (Java 21) via Spring Initializr..."

  curl -fsSL \
    "https://start.spring.io/starter.tgz" \
    -d type=maven-project \
    -d language=java \
    -d bootVersion=3.4.5 \
    -d javaVersion=21 \
    -d groupId=com.example \
    -d artifactId=app \
    -d name=app \
    -d packageName=com.example.app \
    -d packaging=jar \
    -d dependencies=web,data-jpa,lombok,devtools \
    | tar -xz -C /workspace --strip-components=1

  echo "Scaffold criado em /workspace."
  echo ""
  echo "Estrutura gerada:"
  find /workspace/src -type f | sort
else
  echo "Projeto já existe em /workspace (pom.xml encontrado), pulando scaffold."
fi

exec sleep infinity
