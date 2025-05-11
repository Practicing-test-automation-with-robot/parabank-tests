*** Settings ***
Resource    ../../main.robot

*** Comments ***
# ============================================================================================================== #
        Nesta pasta "Pages" estão os elementos e interações específicas de páginas (ex: login_page.robot)
        Interações com elementos visuais (cliques, inputs, waits, etc.)
# ============================================================================================================== #

*** Keywords ***
# ============================================================================================================== #
#                          Interação com elementos visuais de Registro de Usuário                                #
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


# ============================================================================================================== #
#                    Interação com elementos visuais de Edição de registro de Usuário                            #
# ============================================================================================================== # 

Dado que o usuário clicou no link de "Update Contact Info" do painel lateral à esquerda
    [Documentation]    Clicar no link de "Update Contact Info"
    Wait Until Element Is Visible    ${register.update_contact_form}
    Click Element    ${register.update_contact_form}
    O formulário de edição de registro é apresentado

O formulário de edição de registro é apresentado
    [Documentation]    Verifica se o formulário de edição de registro está visível
    Wait Until Element Is Visible    ${Update_user_data}
    Capture Page Screenshot

Preencher o formulário de edição de registro com dados atualizados do usuário
    [Documentation]    Preencher o formulário de edição de registro com dados atualizados do usuário
    ${first_name_user}    ${last_name_user}    ${address_user}    ${city_user}    ${state_user}    ${zip_user}    ${phone_user}    ${ssn_user}    ${username_user}    ${password_user}=   Dados fake de Registro de usuário
    Input Text    ${input_address}    ${address_user}
    Input Text    ${input_city}    ${city_user}
    Input Text    ${input_state}    ${state_user}
    Input Text    ${input_zip}    ${zip_user}
    Input Text    ${input_phone}    ${phone_user}
    Capture Page Screenshot