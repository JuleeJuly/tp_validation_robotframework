*** Settings ***
Resource    ../../Ressources/library.resource
Resource    ../../Ressources/variables/automation_variables.robot


*** Keywords ***
The Browser Is Launched
    [Documentation]    Open Browser
    Open Browser    ${URL}    ${BROWSER}
    Accept Cookie
    Maximize Browser Window

The User Navigates
    [Documentation]    Navigates
    [Arguments]    ${URL_AUTOMATION}
    Go To    ${URL_AUTOMATION}
    Location Should Contain    ${URL_AUTOMATION}

The Homepage Is Visible
    [Documentation]    the homepage is visible
    Wait Until Element Is Visible    ${HOMEPAGE_LOGO}

The User Clicks On The "Products" Button
    [Documentation]    click on the products button
    Wait Until Element Is Enabled    ${PRODUCTS_BUTTON}
    Click Element    ${PRODUCTS_BUTTON}

The User Is Successfully Redirected To The Page
    [Documentation]    redirect to all products page
    [Arguments]    ${TITLE}
    Wait Until Element Is Visible    ${H2_TITLE}
    Wait Until Element Contains    ${H2_TITLE}    ${TITLE}

The User Enters In The Search Bar And Clicks On The "Search" Button
    [Documentation]    Search product "Dress"
    [Arguments]    ${PRODUCT}
    Wait Until Element Is Enabled    ${SEARCH}
    Input Text    ${SEARCH}    ${PRODUCT}
    Click Button    ${SUBMIT_SEARCH}

Is Visible
    [Documentation]    SEARCH PRODUCTS is visible
    [Arguments]    ${TITLE}
    Scroll Element Into View    ${H2_TITLE}
    Wait Until Element Is Visible    ${H2_TITLE}
    Wait Until Element Contains    ${H2_TITLE}    ${TITLE}

The Displayed Results Contain
    [Documentation]    the displayed result contain dress
    [Arguments]    ${PRODUCT}
    Wait Until Page Contains    ${PRODUCT}
    Close Browser

Accept Cookie
    [Documentation]    accept cookie
    Click Button    ${COOKIE}
