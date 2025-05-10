*** Settings ***
Resource    ../main.robot
Library    SeleniumLibrary

*** Keywords ***

# Keywords escritas em gherkin, para testes que dada a necessidade
#  viraram keyword para melhor aproveitamento de código
#__________________________________________________________________#

# quebrar em mais partes para ser algo reutilizável
Adicionar 1 Produto ao carrinho de compras e efetuar checkout
    Dado que o produto "Sauce Labs Backpack" foi localizado
    Quando o usuário clicar no botão "Add to cart"
    E o produto for apresentado no carrinho de compras
    E clicar no botão checkout
    E preencher o formulario com as informações de endereço do usuário
    E clicar no botão "Continue"
    E a tela de Checkout: Overview é apresentada
    Então o usuário clica no botão "Finish"
    E a tela de "Finish" é apresentada

#__________________________________________________________________#



# Keywords desenvolvidas
#__________________________________________________________________#

Dado que o produto "Sauce Labs Backpack" foi localizado
    Wait Until Element Is Visible    ${produt_sauce_labs_backpack}
    Capture Page Screenshot

Quando o usuário clicar no botão "Add to cart"
    Set Focus To Element    ${cart.add_to_cart}
    Click Button    ${cart.add_to_cart}
    Wait Until Element Is Visible    ${cart.add_to_cart}

E o produto for apresentado no carrinho de compras
    Set Focus To Element    ${cart_icon}
    Click Element    ${cart_icon}
    Capture Page Screenshot
    Sleep    5
    Wait Until Element Is Visible    ${cart_contents_container}    timeout=10s
    Capture Element Screenshot    ${cart_contents_container}

E clicar no botão checkout
    Wait Until Element Is Visible    ${cart.checkout}
    Click Element    ${cart.checkout}
    Wait Until Element Is Visible    ${checkout_screen}
    Capture Element Screenshot     ${checkout_screen}

E preencher o formulario com as informações de endereço do usuário
    Wait Until Element Is Visible    ${first_name}
    Set Focus To Element    ${first_name}
    Input Text    ${first_name}    ${user_first_name}
    Input Text    ${last_name}    ${user_last_name}
    Input Text    ${postal_code}    ${user_postal_code}

E clicar no botão "Continue"
    Scroll Element Into View    ${continue_button}
    Set Focus To Element    ${continue_button}
    Click Button    ${continue_button}


E a tela de Checkout: Overview é apresentada
    Wait Until Element Is Visible    ${checkout_overview}
    Capture Element Screenshot    ${checkout_overview}

    Set Focus To Element    ${checkout_summary_container}
    Capture Element Screenshot    ${checkout_summary_container}

Então o usuário clica no botão "Finish"
    Scroll Element Into View    ${finish_button}
    Click Button    ${finish_button}

E a tela de "Finish" é apresentada
    Wait Until Element Is Visible    ${finish_screen}
    Capture Element Screenshot    ${finish_screen}
