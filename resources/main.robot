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
Library    ../libraries/utils/YamlReader.py
Library    ../libraries/utils/generate_uuid.py

# ====================================================================#
#                            resources/                               #
# ====================================================================#

# auth
Resource    auth/env.resource

# keywords
# ====================================================================#
# validations
Resource    keywords/validations/kw_login_validations.resource
Resource    keywords/validations/kw_register_validations.resource
# flows
Resource    keywords/flows/kw_register_flows.resource
Resource    keywords/flows/kw_login_flows.resource
# 
Resource    keywords/pages/kw_login_page.resource
Resource    keywords/pages/kw_register_page.resource

# locators
Resource    locators/locators_register.resource
Resource    locators/locators_login.resource

# data
Resource    data/register_fake_data.robot
