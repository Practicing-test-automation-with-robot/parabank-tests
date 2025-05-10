*** Settings ***
Resource    ../../../resources/main.robot
Suite Setup    Abrir Navegador Com Chrome Customizado
Suite Teardown    Fechar navegador

*** Test Cases ***

# Test case: Registrar usuário com dados inválidos
#     [Tags]    register    invalid
#     Dado que o usuário clicou no link de registro
#     Quando o usuário clicar no botão "Registrar" sem preencher os campos obrigatórios
#     Então serão apresentadas mensagens de erros para os campos obrigatórios

    
