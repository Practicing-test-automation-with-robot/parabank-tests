*** Settings ***
Resource    ../../../resources/main.robot
Suite Setup    Abrir Navegador Com Chrome Customizado
Test Teardown    Efetuar Logout
Suite Teardown    Fechar navegador

*** Test Cases ***

Test case: Registrar usuário com dados válidos
    [Tags]    register    valid
    Dado que o usuário clicou no link de registro
    Quando preencher o formulário de registro com dados válidos
    E clicar no botão "Registrar"
    Então o sistema efetua login apresentando uma mensagem de boas-vindas personalizada com o nome do usuário    $username_user

    
