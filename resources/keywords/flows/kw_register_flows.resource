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

# Registro Válido
Quando preencher o formulário de registro com dados válidos
    [Documentation]    Testa o registro do usuário preenchendo os dados no formulário
    Preencher o formulário de registro com dados válidos

# Registro Inválido
Quando o usuário clicar no botão "Registrar" sem preencher os campos obrigatórios
    [Documentation]    Clicar no botão "Registrar" sem preencher os campos obrigatórios
    E clicar no botão "Registrar"

Quando preencher o formulário de registro com dados já cadastrados (usuário default)
    [Documentation]    Preencher o formulário de registro com dados já cadastrados (usuário default)
    Preencher o formulário de registro com dados já cadastrados (user_name do usuário default)    $first_name_default    $last_name_default

# Submit
E clicar no botão "Registrar"
    [Documentation]    Clicar no botão "Registrar"
    Wait Until Element Is Visible    ${register.button_submit_register}
    Click Element    ${register.button_submit_register}
    Capture Page Screenshot


# ============================================================================================================== #
#                                     Fluxos de Edição de registro de Usuário                                    #
# ============================================================================================================== #

Quando preencher o formulário de edição de registro com dados atualizados do usuário
    [Documentation]    Preencher o formulário de edição de registro com dados atualizados do usuário
    Preencher o formulário de edição de registro com dados atualizados do usuário

E clicar no botão "Update Profile"
    [Documentation]    Clicar no botão "Update Profile"
    Wait Until Element Is Visible    ${register.button_update_profile}
    Click Element    ${register.button_update_profile}
    Capture Page Screenshot