*** Settings ***

# ====================================================================#
#                             Bibliotecas                             #
# ====================================================================#

Library    SeleniumLibrary
Library    String
Library    Collections
Library    OperatingSystem
Library    RequestsLibrary
Library    BuiltIn 
Library    DateTime
Library    FakerLibrary    locale=pt_BR

# utils
Library    ../utils/YamlReader.py
Library    ../utils/generate_uuid.py

# ====================================================================#
#                            resources/                               #
# ====================================================================#

# keywords
Resource    keywords/register_keywords.robot
Resource    keywords/login_keywords.robot

# variebles
Resource    variables/register.robot
Resource    variables/login.robot

# auth
Resource    auth/env.resource
