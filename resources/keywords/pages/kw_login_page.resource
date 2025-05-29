*** Settings ***
Resource    ../../main.robot

*** Comments ***
# ============================================================================================================== #
        Nesta pasta "Pages" estão os elementos e interações específicas de páginas (ex: login_page.robot)
        Interações com elementos visuais (cliques, inputs, waits, etc.)
# ============================================================================================================== #

*** Keywords ***
# ============================================================================================================== #
#                         Interações com elementos visuais de Login e Logout                                     #
# ============================================================================================================== #

# Login
Dado que o usuário abriu o site na tela de login
    Abrir Navegador Com Chrome Customizado
    Capture Page Screenshot

Quando inserir as credenciais básicas de login (email e senha) válidas
    Set Focus To Element    ${input_email}
    Input Text    ${input_email}    ${user_name_default} 
    Set Focus To Element    ${input_password}    
    Input Password    ${input_password}    ${password_default}

Quando inserir as credenciais básicas de login (email e senha) inválidas
    Set Focus To Element    ${input_email}
    Input Text    ${input_email}    ${user_name_invalid_default} 
    Set Focus To Element    ${input_password}    
    Input Password    ${input_password}    ${password_invalid_default}

Então clicar no botão "Entrar"
    Click Element    ${login.button_submit_login}
    Sleep	2
    Capture Page Screenshot

# Logout
Efetuar Logout
    Set Focus To Element    ${leftPanel}
    Click Button    ${leftPanel}
    Wait Until Element Is Visible    ${login_form}

#  Abrir e fechar o navegador
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