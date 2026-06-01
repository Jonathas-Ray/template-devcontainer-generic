# DevContainer Template

Template de ambiente de desenvolvimento em containers Docker com múltiplas linguagens e bancos de dados.

## Como usar

1. Copie `.env.example` para `.env` e ajuste as senhas se quiser.
2. Abra o `docker-compose.yml` e **descomente** apenas o(s) serviço(s) que você vai usar — banco e linguagem.
3. Coloque seu código na pasta `workspace/` (ela é montada dentro do container em `/workspace`).
4. Copie o `.devcontainer.json` da pasta da linguagem escolhida para a raiz do repositório e renomeie para `.devcontainer/devcontainer.json` **ou** aponte-o diretamente.
5. No VS Code, execute **"Reopen in Container"**.

## Serviços disponíveis

### Bancos de dados
| Serviço    | Porta padrão | Imagem       |
|------------|-------------|--------------|
| `mysql`    | 3306        | mysql:8.4    |
| `postgres` | 5432        | postgres:16  |
| `mongodb`  | 27017       | mongo:7      |

### Linguagens / Frameworks
| Serviço       | Porta padrão | Detalhes                          |
|---------------|-------------|-----------------------------------|
| `dev-python`  | —           | Python 3 + pip                    |
| `dev-cpp`     | —           | GCC + CMake + PlatformIO CLI      |
| `dev-java17`  | 8080        | JDK 17 + Maven + Spring Boot CLI  |
| `dev-java21`  | 8080        | JDK 21 + Maven + Spring Boot CLI  |
| `dev-nest`    | 3000        | Node LTS + NestJS CLI + scaffold  |
| `dev-vue-ts`  | 5173        | Node LTS + Vue 3 + Vite + TS      |
| `dev-vue-js`  | 5173        | Node LTS + Vue 3 + Vite + JS      |

> ⚠️ Não suba dois serviços que usem a mesma porta ao mesmo tempo sem ajustar o mapeamento.

## Scripts utilitários

```bash
# Backup do banco ativo
./scripts/backup-db.sh

# Restaurar um backup
./scripts/restore-db.sh backups/backup_YYYYMMDD_HHMMSS.sql
```

## Volumes persistentes

Cada linguagem tem seu próprio volume para dependências (ex: `node_modules`, `.m2`, `.platformio`), evitando re-download a cada `docker compose up`.
