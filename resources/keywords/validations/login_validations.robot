*** Settings ***
Resource    ../../main.robot

*** Comments ***
# ============================================================================================================== #
#                     Keywords específicas de validação (ex: validar_mensagem_erro.robot)                        #
#                                Verificação de mensagens, estados e outputs                                     #
# ============================================================================================================== #

*** Keywords ***
Validar tela inicial de login
    [Documentation]    Valida a tela inicial de login
    [Arguments]    ${username_user}    ${first_name_user}    ${last_name_user}
    Wait Until Element Is Visible    ${initial_screen}
    Run Keyword If     ${initial_screen}== Welcome ${full_name_default}    log    Mensagem de boas-vindas: ${initial_screen}
    Run Keyword If     ${initial_screen}== Welcome ${first_name_user} ${last_name_user}    log    Mensagem de boas-vindas: ${initial_screen}
    Log To Console    Usuario esta logado no sistema!
    Capture Element Screenshot    ${initial_screen}

E Validar mensagem de erro de login
    [Documentation]    Valida a mensagem de erro de login
    Wait Until Element Is Visible    ${login_error_message}
    Capture Page Screenshot