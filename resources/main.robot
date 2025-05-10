*** Settings ***
Library    SeleniumLibrary

# ====================================================================#
#                            Resources                                #
# ====================================================================#

# keywords
Resource    keywords/register_keywords.robot
Resource    keywords/login_keywords.robot

# variebles
Resource    variables/register.robot
Resource    variables/login.robot

# auth
Resource    auth/env.resource