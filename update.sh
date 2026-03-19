#!/bin/bash

# ================================
# 🚀 AI Copilot DevSecOps - Robust Update Script
# ================================

set -euo pipefail

echo "🚀 Iniciando atualização robusta..."

# ================================
# 📍 Detectar diretório do projeto
# ================================
if [ -d ".git" ]; then
    PROJECT_DIR=$(pwd)
    echo "📁 Rodando dentro do projeto: $PROJECT_DIR"
else
    if [ -d "ai-copilot-devsecops" ]; then
        cd ai-copilot-devsecops
        PROJECT_DIR=$(pwd)
        echo "📁 Encontrado: $PROJECT_DIR"
    else
        echo "❌ Execute dentro do projeto ou na pasta pai"
        exit 1
    fi
fi

# ================================
# 📁 Estrutura
# ================================
echo "📁 Garantindo estrutura..."

mkdir -p flows docs .github/workflows flows/topics flows/copilot

# ================================
# 📄 Função segura
# ================================
create_file() {
    FILE_PATH=$1
    CONTENT=$2

    if [ -f "$FILE_PATH" ]; then
        echo "⚠️ Atualizando $FILE_PATH"
    else
        echo "🆕 Criando $FILE_PATH"
    fi

    echo "$CONTENT" > "$FILE_PATH"
}

# ================================
# 📄 README
# ================================
create_file "README.md" "# 🤖 AI Copilot DevSecOps

Projeto focado em automação de atendimento com Microsoft Copilot Studio, aplicando conceitos de IA e DevSecOps.

## 🚀 Features
- Copilot personalizado
- Fluxos conversacionais
- GenAI tuning
- CI/CD

## 🧠 Stack
- Copilot Studio
- Azure
- Power Platform

## 🔐 DevSecOps
- Segurança
- Monitoramento
- Automação

## 📌 Autor
Taisso Coutinho
"

# ================================
# 📄 DevSecOps
# ================================
create_file "docs/devsecops.md" "# DevSecOps

## Segurança
- Validação de inputs

## CI/CD
- GitHub Actions

## Monitoramento
- Logs
"

# ================================
# 📄 Topics
# ================================
create_file "docs/topics.md" "# Tópicos no Copilot

## Conceitos
- Intenções
- Fluxos

## Boas práticas
- Clareza
- Organização
"

create_file "flows/topics/conceitos.md" "# Conceitos

Tópicos representam intenções do usuário."

create_file "flows/topics/boas-praticas.md" "# Boas práticas

- Fluxos claros
- Respostas objetivas"

# ================================
# 📄 COPILOT PERSONALIZADO
# ================================
create_file "docs/copilot-custom.md" "# Copilot Personalizado

Criação de um Copilot do zero com foco em:

- Fluxo conversacional
- Tratamento de erros
- Uso de GenAI
"

create_file "flows/copilot/start.md" "# Start

Olá! Como posso ajudar?"

create_file "flows/copilot/topic-custom.md" "# Customização

Fluxos baseados em intenção do usuário."

create_file "flows/copilot/error-handling.md" "# Erros

Desculpe, não entendi. Pode reformular?"

create_file "flows/copilot/genai-tuning.md" "# GenAI

Controle de qualidade das respostas.
"

# ================================
# 📄 CI/CD
# ================================
create_file ".github/workflows/ci.yml" "name: CI

on:
  push:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - run: echo 'CI rodando'
"

# ================================
# 🔧 Git
# ================================
echo "🔧 Verificando mudanças..."

if git diff --quiet && git diff --staged --quiet; then
    echo "✅ Nada para commitar"
else
    git add .
    git commit -m "feat: add copilot custom module + topics + CI/CD"
    echo "✅ Commit realizado!"
fi

echo ""
echo "🚀 Atualização finalizada!"
echo "👉 Agora rode: git push"
