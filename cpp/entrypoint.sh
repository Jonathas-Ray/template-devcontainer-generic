#!/bin/bash
set -e

if [ ! -f /workspace/platformio.ini ]; then
  echo "Criando scaffold PlatformIO em /workspace..."

  # Cria projeto PlatformIO genérico (sem board específica)
  # O usuário pode trocar a board em platformio.ini depois
  mkdir -p /workspace/src
  mkdir -p /workspace/include
  mkdir -p /workspace/test
  mkdir -p /workspace/lib

  cat > /workspace/platformio.ini << 'EOF'
; PlatformIO Project Configuration
; Documentação: https://docs.platformio.org/page/projectconf.html
;
; Troque 'board' pela placa que você vai usar, ex:
;   uno, mega2560, esp32dev, nodemcuv2, teensy40
; e 'platform' pelo ecossistema correspondente:
;   atmelavr, espressif32, espressif8266, teensy

[env:default]
platform = atmelavr
board = uno
framework = arduino
EOF

  cat > /workspace/src/main.cpp << 'EOF'
#include <Arduino.h>

void setup() {
    Serial.begin(9600);
    Serial.println("Hello, World!");
}

void loop() {
    // seu código aqui
}
EOF

  cat > /workspace/include/README << 'EOF'
Coloque aqui seus arquivos de cabeçalho (.h / .hpp).
EOF

  cat > /workspace/lib/README << 'EOF'
Coloque aqui bibliotecas privadas do projeto.
Cada biblioteca deve ter sua própria pasta com um arquivo de cabeçalho e fonte.
EOF

  cat > /workspace/test/README << 'EOF'
Coloque aqui seus arquivos de teste de unidade (Unity framework).
EOF

  echo "Scaffold criado."
  echo ""
  echo "Estrutura gerada:"
  find /workspace -type f | sort
else
  echo "Projeto já existe em /workspace (platformio.ini encontrado), pulando scaffold."
fi

exec sleep infinity
