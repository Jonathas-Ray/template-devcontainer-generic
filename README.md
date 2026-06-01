# devcontainer-boilerplate

Boilerplate Docker para ambientes de desenvolvimento isolados com Dev Containers no VS Code. Descomente o serviço que quiser no `docker-compose.yml`, abra o projeto no VS Code e comece a trabalhar.

**Tecnologias disponíveis:**
Vue 3 + Vite (TypeScript e JavaScript) · NestJS · Python 3 · Java 17 · Java 21 · C/C++ com PlatformIO · MySQL · PostgreSQL · MongoDB

---

## Pré-requisitos

- [Docker](https://www.docker.com/) instalado e rodando
- [VS Code](https://code.visualstudio.com/) com a extensão [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

---

## Como usar

1. Clone o repositório:
   ```bash
   git clone <url-do-repositorio>
   cd devcontainer-boilerplate
   ```

2. Copie o arquivo de variáveis de ambiente:
   ```bash
   cp .env.example .env
   ```

3. Abra o `docker-compose.yml` e **descomente** o banco de dados e a linguagem que você vai usar.

4. Copie o `.devcontainer.json` da pasta da linguagem escolhida para a raiz do projeto:
   ```bash
   # Exemplo para NestJS:
   cp nest/.devcontainer.json .devcontainer.json
   ```

5. No VS Code, abra a paleta de comandos (`Ctrl+Shift+P`) e execute **"Dev Containers: Reopen in Container"**.

> Na primeira execução, os containers de Vue, NestJS, NestJS, Python, C++ e Java criam automaticamente a estrutura do projeto em `workspace/` caso ela esteja vazia.

---

## O que cada serviço contém

### Bancos de dados

| Serviço    | Porta padrão | Imagem      |
|------------|--------------|-------------|
| `mysql`    | 3306         | mysql:8.4   |
| `postgres` | 5432         | postgres:16 |
| `mongodb`  | 27017        | mongo:7     |

### Linguagens e frameworks

| Serviço      | Porta  | O que vem pronto                                                      |
|--------------|--------|-----------------------------------------------------------------------|
| `dev-vue-ts` | 5173   | Node LTS · Vue 3 + Vite + TypeScript · Vue Router · Pinia · ESLint   |
| `dev-vue-js` | 5173   | Node LTS · Vue 3 + Vite + JavaScript · Vue Router · Pinia · ESLint   |
| `dev-nest`   | 3000   | Node LTS · NestJS CLI · scaffold básico gerado automaticamente        |
| `dev-python` | —      | Python 3 · pytest · conectores MySQL, PostgreSQL e MongoDB            |
| `dev-java17` | 8080   | JDK 17 · Maven · scaffold Spring Boot com Web, JPA, Lombok e DevTools |
| `dev-java21` | 8080   | JDK 21 · Maven · scaffold Spring Boot com Web, JPA, Lombok e DevTools |
| `dev-cpp`    | —      | GCC · CMake · PlatformIO CLI · scaffold Arduino/embedded             |

> ⚠️ Não suba dois serviços com a mesma porta ao mesmo tempo sem ajustar o mapeamento no `docker-compose.yml`.

---

## Estrutura do repositório

| Pasta        | Descrição                                              |
|--------------|--------------------------------------------------------|
| `vue-ts/`    | Dockerfile e `.devcontainer.json` para Vue 3 + TS      |
| `vue-js/`    | Dockerfile e `.devcontainer.json` para Vue 3 + JS      |
| `nest/`      | Dockerfile e `.devcontainer.json` para NestJS          |
| `python/`    | Dockerfile e `.devcontainer.json` para Python 3        |
| `java17/`    | Dockerfile e `.devcontainer.json` para Java 17         |
| `java21/`    | Dockerfile e `.devcontainer.json` para Java 21         |
| `cpp/`       | Dockerfile e `.devcontainer.json` para C/C++ + PlatformIO |
| `workspace/` | Pasta montada dentro de todos os containers em `/workspace` |
| `scripts/`   | Scripts de backup e restore para os bancos             |
| `backups/`   | Destino dos arquivos de backup gerados                 |

---

## Scripts utilitários

```bash
# Gera backup do banco (mysql | postgres | mongodb)
./scripts/backup-db.sh mysql

# Restaura a partir de um arquivo de backup
./scripts/restore-db.sh backups/mysql_backup_20250101_120000.sql mysql
```

---

## Observações

- Cada linguagem tem um volume dedicado para dependências (`node_modules`, `.m2`, `.platformio`, etc.), evitando re-downloads a cada `docker compose up`.
- Para adicionar extensões do VS Code ao container, edite o `.devcontainer.json` da pasta correspondente e inclua o ID da extensão na lista `extensions`.
- O scaffold do Java é gerado via [Spring Initializr](https://start.spring.io) na primeira inicialização — requer conexão com a internet no primeiro `docker compose up`.
