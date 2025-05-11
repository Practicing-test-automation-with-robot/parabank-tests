*** Settings ***
Resource    ../../../resources/main.robot
Suite Setup    Efetuar Login em uma página web usando credenciais básicas válidas
Suite Teardown    Fechar navegador

*** Test Cases ***

Test case: Update contact info
    [Documentation]    Teste de atualização de dados de contato do usuário, apenas primeiro e ultimo nome não alterados
    [Tags]    update_contact
    Dado que o usuário clicou no link de "Update Contact Info" do painel lateral à esquerda
    Quando preencher o formulário de edição de registro com dados atualizados do usuário
    E clicar no botão "Update Profile"
    Então o usuário deve visualizar a mensagem de sucesso "Profile Updated"