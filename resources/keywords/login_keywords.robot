*** Settings ***
Resource    ../main.robot
Library    SeleniumLibrary

*** Keywords ***

# Keywords escritas em gherkin, para testes que dada a necessidade
#  viraram keyword para melhor aproveitamento de código
#__________________________________________________________________#
Efetuar Login em uma página web usando credenciais básicas válidas
    Dado que o usuário abriu o site na tela de login
    Quando inserir as credenciais básicas de login (email e senha) válidas
    Então clicar no botão "Entrar"

Efetuar Logout E fechar navegador
    Dado que o usuário está na tela inicial de produtos
    Quando o usuário clica no menu
    E seleciona a opção "Logout"
    Então a tela inicial de Login do site é apresentada
    Fechar navegador

Efetuar Login em uma página web usando credenciais básicas inválidas
    Dado que o usuário abriu o site na tela de login
    Quando inserir as credenciais básicas de login (email e senha) inválidas
    Então clicar no botão "Entrar"
    E Validar mensagem de erro de login

Fechar navegador
    Close Browser

#__________________________________________________________________#



# Keywords desenvolvidas
#__________________________________________________________________#

Abrir Navegador Com Chrome Customizado
    ${options}=    Create Dictionary
    ...    args=--disable-features=PasswordCheck,--disable-popup-blocking
    &{prefs}=    Create Dictionary
    ...    credentials_enable_service=${False}
    ...    profile.password_manager_enabled=${False}
    ${driver}=    Create WebDriver    Chrome    options=${options}
    Go To    https://www.saucedemo.com/v1/
    Maximize Browser Window

Dado que o usuário abriu o site na tela de login
    Abrir Navegador Com Chrome Customizado
    Capture Page Screenshot


Quando inserir as credenciais básicas de login (email e senha) válidas
    Set Focus To Element    ${input_email}
    Input Text    ${input_email}    ${user_name} 
    Set Focus To Element    ${input_password}    
    Input Password    ${input_password}    ${password}

Então clicar no botão "Entrar"
    Click Element    ${login.button_submit_login}
    Sleep	2
    Capture Page Screenshot


O usuário está logado
    Wait Until Element Is Visible    ${initial_screen}
    Log To Console    Usuario esta logado no sistema!
    

Quando inserir as credenciais básicas de login (email e senha) inválidas
    Set Focus To Element    ${input_email}
    Input Text    ${input_email}    ${user_name_invalid} 
    Set Focus To Element    ${input_password}    
    Input Password    ${input_password}    ${password_invalid}


E Validar mensagem de erro de login
    Wait Until Element Is Visible    ${login.error_mensage}
    Capture Page Screenshot


Dado que o usuário está na tela inicial de produtos
    Set Focus To Element    ${cart.menu}
    Click Button    ${cart.menu}
    Wait Until Element Is Visible    ${all_itens}
    Click Element    ${all_itens}
    Dado que o produto "Sauce Labs Backpack" foi localizado

Quando o usuário clica no menu
    Set Focus To Element    ${cart.menu}
    Click Button    ${cart.menu}

E seleciona a opção "Logout"
    Wait Until Element Is Visible    ${logout}
    Click Element    ${logout}

Então a tela inicial de Login do site é apresentada
    Wait Until Element Is Visible    ${login_screen}
    Capture Element Screenshot    ${login_screen}
    Log To Console    Usuario efetuou logout com sucesso!
