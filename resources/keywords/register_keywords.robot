*** Settings ***
Resource    ../main.robot
Library    ../../.venv/Lib/site-packages/robot/libraries/Screenshot.py

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
    ${first_name_user}    ${last_name_user}    ${address_user}    ${city_user}    ${state_user}    ${zip_user}    ${phone_user}    ${ssn_user}    ${username_user}    ${password_user}=    Gerando os dados fake diretamente do Robot Framework
    Preencher o formulário de registro com dados válidos    ${first_name_user}    ${last_name_user}    ${address_user}    ${city_user}    ${state_user}    ${zip_user}    ${phone_user}    ${ssn_user}    ${username_user}    ${password_user}

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
    [Documentation]    Verifica se as mensagens de erro são exibidas nos campos obrigatórios
    @{linhas}=    Get WebElements    xpath=//table[@class='form2']//tr[td[2]/input]
    FOR    ${linha}    IN    @{linhas}
        ${tds}=    Get WebElements    xpath=.//td
        ${rotulo}=    Get Text    ${tds[0]}
        ${erro}=    Get Text    xpath=.//span[contains(@class, 'error')]
        Should Be True    "${erro}" in ${register_form_errors}
        Log    Erro encontrado na linha do campo: ${rotulo}
    END
    Capture Page Screenshot

# ============================================================================================================== #
#                                                Dados Fake de registro                                          #
# ============================================================================================================== #

Gerando os dados fake diretamente do Robot Framework
    ${first_name_user}    FakerLibrary.first_name
    ${last_name_user}     FakerLibrary.last_name
    ${address_user}       FakerLibrary.address
    ${city_user}          FakerLibrary.city
    ${state_user}         FakerLibrary.state
    ${zip_user}           FakerLibrary.postcode  
    ${phone_user}         FakerLibrary.phone_number
    ${ssn_user}           FakerLibrary.ssn
    ${username_user}      FakerLibrary.user_name
    ${password_user}      FakerLibrary.password
    RETURN     ${first_name_user}    ${last_name_user}    ${address_user}    ${city_user}    ${state_user}    
    ...    ${zip_user}    ${phone_user}    ${ssn_user}    ${username_user}    ${password_user}


Preencher o formulário de registro com dados válidos
    [Documentation]    Preencher o formulário de registro com dados válidos
    [Arguments]    ${first_name_user}    ${last_name_user}    ${address_user}    ${city_user}    ${state_user}    
    ...    ${zip_user}    ${phone_user}    ${ssn_user}    ${username_user}    ${password_user}
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
    Input Text    ${input_confirm_password}    ${password_user}
    Capture Page Screenshot