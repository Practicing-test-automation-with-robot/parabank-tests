*** Settings ***
Resource    ../../../resources/main.robot
Suite Teardown    Fechar navegador

*** Test Cases ***

Test case: Login e Logout com dados inválidos
    [Tags]    login    invalid
    Efetuar Login em uma página web usando credenciais básicas inválidas