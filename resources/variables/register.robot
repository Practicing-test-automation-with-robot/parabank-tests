*** Settings ***
Library    SeleniumLibrary


*** Variables ***

# register form elements
${register_form}    id:customerForm
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

# biblioteca de elementos
&{resgister}
...    link_register=//a[text()='Register']
...    button_submit_register=//input[@value='Register' and @class='button']