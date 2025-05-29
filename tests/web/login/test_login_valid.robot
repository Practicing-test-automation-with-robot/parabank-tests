*** Settings ***
Resource    ../../../resources/main.robot
Suite Teardown    Fechar navegador

*** Test Cases ***

Test case: Login e Logout com dados válidos
    [Tags]    login    valid
    Efetuar Login em uma página web usando credenciais básicas válidas default
    Efetuar Logout

    
