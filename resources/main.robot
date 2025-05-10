*** Settings ***
Library    SeleniumLibrary

# Resources
# keywords
Resource    keywords/cart_keywords.robot
Resource    keywords/login_keywords.robot

# variebles
Resource    variables/cart.robot
Resource    variables/login.robot

# auth
Resource    auth/env.resource