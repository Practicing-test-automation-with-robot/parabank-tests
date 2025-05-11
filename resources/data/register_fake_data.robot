*** Settings ***
Resource    ../main.robot

*** Keywords ***

Dados fake de Registro de usuário
    [Documentation]    Gera dados fake para o registro de novos usuários utilizando a biblioteca FakerLibrary
    ${first_name_user}    FakerLibrary.first_name
    ${last_name_user}     FakerLibrary.last_name
    ${address_user}       FakerLibrary.address
    ${city_user}          FakerLibrary.city
    ${address_user}       FakerLibrary.street_address
    ${state_user}         FakerLibrary.state
    ${zip_user}           FakerLibrary.postcode  
    ${phone_user}         FakerLibrary.phone_number
    ${ssn_user}           FakerLibrary.ssn
    ${username_user}      FakerLibrary.user_name
    ${password_user}      FakerLibrary.password
    RETURN     ${first_name_user}    ${last_name_user}    ${address_user}    ${city_user}    ${state_user}    
    ...    ${zip_user}    ${phone_user}    ${ssn_user}    ${username_user}    ${password_user}