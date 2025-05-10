*** Settings ***
Resource    ../../resources/main.robot
Suite Setup    Efetuar Login em uma página web usando credenciais básicas válidas
Test Setup    O usuário está logado
Suite Teardown    Efetuar Logout E fechar navegador

*** Test Cases ***

Test case 1: Adicionar 1 Produto ao carrinho de compras e efetuar checkout
    Dado que o produto "Sauce Labs Backpack" foi localizado
    Quando o usuário clicar no botão "Add to cart"
    E o produto for apresentado no carrinho de compras
    E clicar no botão checkout
    E preencher o formulario com as informações de endereço do usuário
    E clicar no botão "Continue"
    E a tela de Checkout: Overview é apresentada
    Então o usuário clica no botão "Finish"
    E a tela de "Finish" é apresentada


    