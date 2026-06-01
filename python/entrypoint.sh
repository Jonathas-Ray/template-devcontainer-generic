#!/bin/bash
set -e

if [ ! -f /workspace/requirements.txt ]; then
  echo "Criando scaffold Python em /workspace..."

  mkdir -p /workspace/src/app
  mkdir -p /workspace/tests

  cat > /workspace/src/app/__init__.py << 'EOF'
EOF

  cat > /workspace/src/app/main.py << 'EOF'
def hello() -> str:
    return "Hello, World!"


if __name__ == "__main__":
    print(hello())
EOF

  cat > /workspace/tests/__init__.py << 'EOF'
EOF

  cat > /workspace/tests/test_main.py << 'EOF'
from src.app.main import hello


def test_hello():
    assert hello() == "Hello, World!"
EOF

  cat > /workspace/requirements.txt << 'EOF'
# Adicione suas dependências aqui
# Exemplo:
# requests==2.31.0
# python-dotenv==1.0.0
EOF

  cat > /workspace/requirements-dev.txt << 'EOF'
pytest
pytest-cov
EOF

  pip3 install -r /workspace/requirements-dev.txt --break-system-packages --quiet

  cat > /workspace/.env.example << 'EOF'
# DB_HOST=mysql
# DB_USER=app_user
# DB_PASSWORD=app_pass
# DB_NAME=app_db
EOF

  echo "Scaffold criado."
  echo ""
  echo "Estrutura gerada:"
  find /workspace -not -path '*/__pycache__/*' -type f | sort
else
  echo "Projeto já existe em /workspace (requirements.txt encontrado), pulando scaffold."
fi

exec sleep infinity
