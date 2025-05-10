*** Settings ***
Resource    ../../../resources/main.robot
Suite Setup    Abrir Navegador Com Chrome Customizado
Suite Teardown    Fechar navegador

*** Test Cases ***

# Test case: Registrar usuário com dados válidos
#     [Tags]    register    valid
#     Dado que o usuário clicou no link de registro
#     Quando preencher o formulário de registro com dados válidos
#     E clicar no botão "Registrar"
#     Então será apresentada uma mensagem de sucesso de registro do usuário

    
