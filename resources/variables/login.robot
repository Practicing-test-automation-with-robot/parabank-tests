*** Settings ***
Library    SeleniumLibrary


*** Variables ***

# Google
${CHROME_OPTIONS}    --disable-features=PasswordCheck

# login form elements
${input_email}        name:username 
${input_password}     name:password 
${initial_screen}    class:main-body
${logout}    id:logout_sidebar_link
${login_form}    id:loginPanel

# biblioteca de elementos
&{login}
...    link_register=//a[text()='Register']
...    link_fogot_password=//a[text()='Forgot login info?']
...    error_mensage=//*[@id="login_button_container"]/div/form/h3

# bottons forms
...    button_submit_login=//*[@id="login-button"]
...    button_submit_register=//input[@value='Register' and @class='button']

