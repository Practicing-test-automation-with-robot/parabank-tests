*** Settings ***
Resource    ../main.robot

*** Variables ***
# =================================================================================== #
#                                 Configurações                                       #
# =================================================================================== #

${CONFIG_PATH}    C:/small-daily-challenges/parabank-tests/config/test_config.yaml

# register form elements
${register_form}    id:customerForm
${register_form_2}    class:form2
${input_first_name}    name:customer.firstName
${input_last_name}    name:customer.lastName
${input_address}    name:customer.address.street
${input_city}    id:customer.address.city
${input_state}    id:customer.address.state
${input_zip}    id:customer.address.zipCode
${input_phone}    id:customer.phoneNumber
${input_ssn}    id:customer.ssn
${input_username}    id:customer.username
${input_password_register}    id:customer.password
${input_confirm_password}    id:repeatedPassword

# register form error messages
@{register_form_errors}    First name is required.    Last name is required.    Address is required.    City is required.    State is required.    Zip Code is required.    Phone number is required.    SSN is required.    Username is required.    Password is required.

# =================================================================================== #
#                             Biblioteca de elementos                                 #  
# =================================================================================== #
&{register}
...    link_register=//a[text()='Register']
...    button_submit_register=//input[@value='Register' and @class='button']