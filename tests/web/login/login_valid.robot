*** Settings ***
Resource    ../../../resources/main.robot

*** Test Cases ***

Test case: Login e Logout com dados válidos
    [Tags]    login    valid
    Efetuar Login em uma página web usando credenciais básicas válidas
    # Efetuar Logout
    # Fechar navegador
    # Efetuar Logout E fechar navegador
    
