*** Settings ***
Resource    ../../../resources/main.robot
Suite Setup    Abrir Navegador Com Chrome Customizado
Suite Teardown    Fechar navegador

*** Test Cases ***

Test case: Registrar usuário sem preencher os campos obrigatórios
    [Tags]    register    invalid
    Dado que o usuário clicou no link de registro
    Quando o usuário clicar no botão "Registrar" sem preencher os campos obrigatórios
    Então serão apresentadas mensagens de erros para os campos obrigatórios

Test case: Registrar usuário com credenciais já cadastradas no sistema
    [Tags]    register    invalid
    Dado que o usuário clicou no link de registro
    Quando preencher o formulário de registro com dados já cadastrados (usuário default)
    E clicar no botão "Registrar"
    Então sistema apresenta mensagem de erro de registro: "This username already exists."
