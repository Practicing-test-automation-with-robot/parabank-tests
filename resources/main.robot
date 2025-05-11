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
Resource    keywords/validations/register_validations.robot
Resource    keywords/validations/login_validations.robot
# flows
Resource    keywords/flows/register_flows.robot
Resource    keywords/flows/login_flows.robot
# 
Resource    keywords/pages/login_page.robot
Resource    keywords/pages/register_page.robot

# locators
Resource    locators/register.robot
Resource    locators/login.robot

# data
Resource    data/register_fake_data.robot
