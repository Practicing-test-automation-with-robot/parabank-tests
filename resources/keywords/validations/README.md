# Validations

Esta pasta agrupa **palavras-chave de validação** específicas que verificam o comportamento esperado da aplicação após uma ação ou fluxo.

## Objetivo

Isolar as **validações reutilizáveis** do projeto, como:
- Mensagens de erro
- Confirmações visuais
- Verificações de URL ou estado da tela
- Presença de elementos e conteúdos

## Benefícios

- Aumenta a legibilidade e clareza dos testes
- Facilita a reutilização e manutenção das regras de validação
- Ajuda a identificar rapidamente o que está sendo verificado no sistema

## Exemplo

O arquivo `registro.robot` pode conter:

```robot
Validar mensagem de erro de registro duplicado
    Wait Until Element Is Visible    //span[contains(text(),"This username already exists.")]
    Element Should Contain    //span[@id="customer.username.errors"]    This username already exists.
