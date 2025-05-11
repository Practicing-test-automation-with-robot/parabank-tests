*** Settings ***
Resource    ../main.robot
Library    ../utils/YamlReader.py

*** Keywords ***

# ====================================================================#
#   Keywords escritas em gherkin, para testes que dada a necessidade  #
#         viraram keyword para melhor aproveitamento de código        #
# ====================================================================#

Efetuar Login em uma página web usando credenciais básicas válidas
    Dado que o usuário abriu o site na tela de login
    Quando inserir as credenciais básicas de login (email e senha) válidas
    Então clicar no botão "Entrar"
    Validar tela inicial de login

Efetuar Login em uma página web usando credenciais básicas inválidas
    Dado que o usuário abriu o site na tela de login
    Quando inserir as credenciais básicas de login (email e senha) inválidas
    Então clicar no botão "Entrar"
    E Validar mensagem de erro de login

# ====================================================================#
#                     Abrir e fechar o navegador                      #
# ====================================================================#

Abrir Navegador Com Chrome Customizado
    # Abrir o navegador
    Open Browser    https://www.google.com/    Chrome
    Maximize Browser Window

    # Carregar o arquivo de configuração
    # Extrair a URL base
    # Navegar até a URL base
    ${config}=         Read YAML File    ${CONFIG_PATH}
    ${test_config}=    Get From Dictionary    ${config}    test_config
    ${env}=            Get From Dictionary    ${test_config}    environment
    ${base_url}=       Get From Dictionary    ${env}    base_url
    Go To    ${base_url}
    Capture Page Screenshot

Fechar navegador
    Close Browser


# ====================================================================#
#                            Login e Logout                           #
# ====================================================================#

# Login
Dado que o usuário abriu o site na tela de login
    Abrir Navegador Com Chrome Customizado
    Capture Page Screenshot

Quando inserir as credenciais básicas de login (email e senha) válidas
    Set Focus To Element    ${input_email}
    Input Text    ${input_email}    ${user_name_default} 
    Set Focus To Element    ${input_password}    
    Input Password    ${input_password}    ${password_default}
    
Então clicar no botão "Entrar"
    Click Element    ${login.button_submit_login}
    Sleep	2
    Capture Page Screenshot

Validar tela inicial de login
    Wait Until Element Is Visible    ${initial_screen}
    Wait Until Element Contains    ${initial_screen}    Welcome ${full_name_default}
    Log To Console    Usuario esta logado no sistema!
    Capture Element Screenshot    ${initial_screen}

Efetuar Logout
    Set Focus To Element    ${leftPanel}
    Click Button    ${leftPanel}
    Wait Until Element Is Visible    ${login_form}


# ====================================================================#
#                            Login Inválido                           #
# ====================================================================#
Quando inserir as credenciais básicas de login (email e senha) inválidas
    Set Focus To Element    ${input_email}
    Input Text    ${input_email}    ${user_name_invalid_default} 
    Set Focus To Element    ${input_password}    
    Input Password    ${input_password}    ${password_invalid_default}

E Validar mensagem de erro de login
    Wait Until Element Is Visible    ${login_error_message}
    Capture Page Screenshot



