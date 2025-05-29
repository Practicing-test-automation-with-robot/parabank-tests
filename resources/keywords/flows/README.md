# Flows

Esta pasta contém **fluxos reutilizáveis de testes**, que combinam várias palavras-chave em uma sequência lógica de ações.

Eles representam **fluxos completos de uso do sistema**, como:
- Login com usuário válido
- Cadastro de novo cliente
- Logout
- Navegação até determinada funcionalidade

## Objetivo

Centralizar **fluxos comuns que são reutilizados em diversos testes**, facilitando a manutenção e melhorando a legibilidade dos arquivos de teste.

## Exemplo

O fluxo `Efetuar Login com sucesso` pode conter:
- Abrir navegador e acessar o site
- Preencher usuário e senha válidos
- Clicar em "Entrar"
- Validar mensagem de boas-vindas

Dessa forma, os testes .robot ficam mais limpos:

```robot
*** Test Cases ***
Login com Sucesso
    Efetuar Login com sucesso
