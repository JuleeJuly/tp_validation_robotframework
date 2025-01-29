*** Settings ***
Resource    ../../Ressources/library.resource
Resource    ../../Ressources/variables/test_variables.robot


*** Keywords ***
I Am On The Website
    [Documentation]    Open the website
    Open The Site

I Search
    [Documentation]    Search
    
Open The Site
    [Documentation]    Open The website
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
