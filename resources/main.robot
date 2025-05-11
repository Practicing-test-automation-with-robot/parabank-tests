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
Resource    keywords/register_keywords.robot
Resource    keywords/login_keywords.robot

# locators
Resource    locators/register.robot
Resource    locators/login.robot

# data
Resource    data/register_fake_data.robot
