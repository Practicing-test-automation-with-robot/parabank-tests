*** Settings ***
Resource    ../main.robot

*** Variables ***

# Google
${CHROME_OPTIONS}    --disable-features=PasswordCheck

# login form elements
${input_email}        name:username 
${input_password}     name:password 
${initial_screen}    class:smallText
${login_form}    id:loginPanel
${register_error_message}    class:error

# paineis
${leftPanel}    id:leftPanel
${rightPanel}    id:rightPanel

# erros
${login_error_message}    class:error

# biblioteca de elementos
&{login}
...    link_register=//a[text()='Register']
...    link_fogot_password=//a[text()='Forgot login info?']
...    error_mensage=//*[@id="login_button_container"]/div/form/h3
...    logout=//a[text()='Logout']

# bottons forms
...    button_submit_login=//input[@class='button' and @type='submit']
...    button_submit_register=//input[@value='Register' and @class='button']

