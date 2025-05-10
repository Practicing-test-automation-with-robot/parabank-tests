*** Settings ***
Resource    ../../../resources/main.robot

*** Test Cases ***

Test case 1: Login e Logout com dados válidos
    [Tags]    login    valid
    Efetuar Login em uma página web usando credenciais básicas válidas
    # Efetuar Logout E fechar navegador

Test case 2: Login com dados inválidos
    [Tags]    login    invalid
    Efetuar Login em uma página web usando credenciais básicas inválidas
    Fechar navegador
    
