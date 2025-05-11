*** Settings ***
Resource    ../../main.robot

*** Comments ***
# ============================================================================================================== #
#                     Keywords específicas de validação (ex: validar_mensagem_erro.robot)                        #
#                                Verificação de mensagens, estados e outputs                                     #
# ============================================================================================================== #

*** Keywords ***
# ============================================================================================================== #
#                                   Validações de Registro de Usuário (Register)                                 #
# ============================================================================================================== #
Então o sistema efetua login apresentando uma mensagem de boas-vindas personalizada com o nome do usuário
    [Documentation]    Verifica se a mensagem de boas-vindas é exibida
    [Arguments]    ${username_user}
    Wait Until Element Is Visible    //h1[contains(text(),'Welcome')]    timeout=10s
    ${welcome_message}=    Get Text    //h1[@class='title' and contains(text(),'Welcome')]
    Should Contain    ${welcome_message}    Welcome ${username_user}
    Capture Page Screenshot

Então serão apresentadas mensagens de erros para os campos obrigatórios
    [Documentation]    Verifica se as mensagens de erro são exibidas nos campos obrigatórios do forms
    ...    que está organizado em uma tabela
    @{linhas}=    Get WebElements    xpath=//table[@class='form2']//tr[td[2]/input]
    FOR    ${linha}    IN    @{linhas}
        ${tds}=    Get WebElements    xpath=.//td
        ${rotulo}=    Get Text    ${tds[0]}
        ${erro}=    Get Text    xpath=.//span[contains(@class, 'error')]
        Should Be True    "${erro}" in ${register_form_errors}
        Log    Erro encontrado na linha do campo: ${rotulo}
    END
    Capture Page Screenshot

Então sistema apresenta mensagem de erro de registro: "This username already exists."
    [Documentation]    Verifica se a mensagem de erro é exibida
    Wait Until Element Is Visible    //span[@id='customer.username.errors' and contains(text(),'This username already exists.')]    timeout=10s
    ${error_message}=    Get Text    //span[@id='customer.username.errors' and contains(text(),'This username already exists.')]
    Should Contain    ${error_message}    This username already exists.                     
    Capture Page Screenshot

# ============================================================================================================== #
#                                   Validações de Edição de Registro de Usuário                                  #
# ============================================================================================================== #

Então o usuário deve visualizar a mensagem de sucesso "Profile updated"
    [Documentation]    Verifica se a mensagem de sucesso é exibida se não apresentar mensagem de erro
    Run Keyword If    '${updateProfileResult}' != 'Profile Updated'    Log    Test completed successfully: ${updateProfileResult}       
    Run Keyword If    '${updateProfileError}' == 'Error!'    Fail    Test failed due to error: ${updateProfileError}

