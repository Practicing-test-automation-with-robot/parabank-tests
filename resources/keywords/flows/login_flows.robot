*** Settings ***
Resource    ../../main.robot

*** Comments ***
# ============================================================================================================== #
#                 Fluxos completos que combinam múltiplas páginas (ex: realizar_login.robot)
                                    Simulação de cenários completos
# ============================================================================================================== #

*** Keywords ***
# ============================================================================================================== #
#                                             Fluxos de Registro de Usuário                                      #
# ============================================================================================================== # 
Efetuar Login em uma página web usando credenciais básicas válidas
    Dado que o usuário abriu o site na tela de login
    Quando inserir as credenciais básicas de login (email e senha) válidas
    Então clicar no botão "Entrar"
    Validar tela inicial de login    $username_user    $first_name_user    $last_name_user

Efetuar Login em uma página web usando credenciais básicas inválidas
    Dado que o usuário abriu o site na tela de login
    Quando inserir as credenciais básicas de login (email e senha) inválidas
    Então clicar no botão "Entrar"
    E Validar mensagem de erro de login