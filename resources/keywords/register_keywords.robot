*** Settings ***
Resource    ../main.robot

*** Keywords ***
# ============================================================================================================== #
#                                       Campos obrigatórios Preenchidos                                          #
# ============================================================================================================== # 

Dado que o usuário clicou no link de registro
    [Documentation]    Clicar no link de registro
    Wait Until Element Is Visible    ${register.link_register}
    Click Element    ${register.link_register}
    O formulário de registro é apresentado

O formulário de registro é apresentado
    [Documentation]    Verifica se o formulário de registro está visível
    Wait Until Element Is Visible    ${register_form}
    Capture Page Screenshot

Quando preencher o formulário de registro com dados válidos
    [Documentation]    Testa o registro do usuário preenchendo os dados no formulário
    Preencher o formulário de registro com dados válidos

E clicar no botão "Registrar"
    [Documentation]    Clicar no botão "Registrar"
    Wait Until Element Is Visible    ${register.button_submit_register}
    Click Element    ${register.button_submit_register}
    Capture Page Screenshot

Então o sistema efetua login apresentando uma mensagem de boas-vindas personalizada com o nome do usuário
    [Documentation]    Verifica se a mensagem de boas-vindas é exibida
    [Arguments]    ${username_user}
    Wait Until Element Is Visible    //h1[contains(text(),'Welcome')]    timeout=10s
    ${welcome_message}=    Get Text    //h1[@class='title' and contains(text(),'Welcome')]
    Should Contain    ${welcome_message}    Welcome ${username_user}
    Capture Page Screenshot

# ============================================================================================================== #
#                                                Registro Inválido                                               #
# ============================================================================================================== #

Quando o usuário clicar no botão "Registrar" sem preencher os campos obrigatórios
    [Documentation]    Clicar no botão "Registrar" sem preencher os campos obrigatórios
    E clicar no botão "Registrar"

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


Quando preencher o formulário de registro com dados já cadastrados (usuário default)
    [Documentation]    Preencher o formulário de registro com dados já cadastrados (usuário default)
    Preencher o formulário de registro com dados já cadastrados (user_name do usuário default)

Então sistema apresenta mensagem de erro de registro: "This username already exists."
    [Documentation]    Verifica se a mensagem de erro é exibida
    Wait Until Element Is Visible    //span[@id='customer.username.errors' and contains(text(),'This username already exists.')]    timeout=10s
    ${error_message}=    Get Text    //span[@id='customer.username.errors' and contains(text(),'This username already exists.')]
    Should Contain    ${error_message}    This username already exists.                     
    Capture Page Screenshot


# ============================================================================================================== #
#                                                Preenchimento do Forms                                          #
# ============================================================================================================== #

Preencher o formulário de registro
    [Documentation]    Preencher o formulário de registro com os dados fornecidos
    [Arguments]    ${first_name_user}    ${last_name_user}    ${address_user}    ${city_user}    ${state_user}    
    ...    ${zip_user}    ${phone_user}    ${ssn_user}    ${username_user}    ${password_user}    ${confirm_password}=None
    Input Text    ${input_first_name}    ${first_name_user}
    Input Text    ${input_last_name}    ${last_name_user}
    Input Text    ${input_address}    ${address_user}
    Input Text    ${input_city}    ${city_user}
    Input Text    ${input_state}    ${state_user}
    Input Text    ${input_zip}    ${zip_user}
    Input Text    ${input_phone}    ${phone_user}
    Input Text    ${input_ssn}    ${ssn_user}
    Input Text    ${input_username}    ${username_user}
    Input Text    ${input_password_register}    ${password_user}
    ${confirm_password}=    Run Keyword If    '${confirm_password}' == 'None'    Set Variable    ${password_user}    ELSE    ${confirm_password}
    Input Text    ${input_confirm_password}    ${confirm_password}
    Capture Page Screenshot

Preencher o formulário de registro com dados válidos
    [Documentation]    Preencher o formulário de registro com dados válidos
    ${first_name_user}    ${last_name_user}    ${address_user}    ${city_user}    ${state_user}    ${zip_user}    ${phone_user}    ${ssn_user}    ${username_user}    ${password_user}=    Dados fake de Registro de usuário
    Preencher o formulário de registro    ${first_name_user}    ${last_name_user}    ${address_user}    ${city_user}    ${state_user}    
    ...    ${zip_user}    ${phone_user}    ${ssn_user}    ${username_user}    ${password_user}

Preencher o formulário de registro com dados já cadastrados (user_name do usuário default)
    [Documentation]    Preencher o formulário de registro com dados já cadastrados (usuário default)
    ${address_user}    ${city_user}    ${state_user}    ${zip_user}    ${phone_user}    ${ssn_user}=    Dados fake de Registro de usuário
    Preencher o formulário de registro    ${first_name_default}    ${last_name_default}    ${address_user}    ${city_user}    ${state_user}    
    ...    ${zip_user}    ${phone_user}    ${ssn_user}    ${user_name_default}    ${password_default}    ${password_default}
