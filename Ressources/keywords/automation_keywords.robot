*** Settings ***
Resource    ../../Ressources/library.resource
Library    OperatingSystem
Resource    ../../Ressources/variables/automation_variables.robot


*** Keywords ***
The User Is On The Website
    [Documentation]    Open browser and navigates
    [Arguments]    ${URL_AUTOMATION}
    Open Browser    ${URL}    ${BROWSER}
    Accept Cookie
    Maximize Browser Window
    Go To    ${URL_AUTOMATION}
    Location Should Contain    ${URL_AUTOMATION}
    The Homepage Is Visible

The User Creates An Account
    [Documentation]    The User Creates An Account
    [Arguments]    &{USERS}
    Click Element    ${SIGNUP_LOGIN}
    Wait Until Element Is Enabled    ${INPUT_NAME}
    Input Text    ${INPUT_NAME}    ${USERS}[username]
    Input Text    ${INPUT_EMAIL}    ${USERS}[email]
    Click Button    ${BUTTON_SIGNUP}
    Wait Until Element Is Enabled    ${CREATE_ACCOUNT_GENDER}
    Click Button    ${CREATE_ACCOUNT_GENDER}
    ${VALUE_NAME}    Get Value    ${CREATE_ACCOUNT_NAME}
    Should Be Equal    ${VALUE_NAME}    ${USERS}[username]
    ${VALUE_EMAIL}    Get Value    ${CREATE_ACCOUNT_EMAIL}
    Should Be Equal    ${VALUE_EMAIL}    ${USERS}[email]
    Input Password    ${CREATE_ACCOUNT_PASSWORD}    ${USERS}[password]
    Select From List By Value    ${CREATE_ACCOUNT_DAY}    ${USERS}[birthday]
    Select From List By Value    ${CREATE_ACCOUNT_MONTH}    ${USERS}[birthmonth]
    Select From List By Value    ${CREATE_ACCOUNT_YEAR}    ${USERS}[birthyear]
    Input Text    ${CREATE_ACCOUNT_FIRSTNAME}    ${USERS}[username]
    Input Text    ${CREATE_ACCOUNT_LASTNAME}    ${USERS}[lastname]
    Input Text    ${CREATE_ACCOUNT_ADRESS}    ${USERS}[adress]
    Select From List By Value    ${CREATE_ACCOUNT_COUNTRY}    ${USERS}[country]
    Input Text    ${CREATE_ACCOUNT_STATE}    ${USERS}[state]
    Input Text    ${CREATE_ACCOUNT_CITY}    ${USERS}[city]
    Input Text    ${CREATE_ACCOUNT_ZIP}    ${USERS}[zip]
    Input Text    ${CREATE_ACCOUNT_PHONE}    ${USERS}[mobile]
    Click Button    ${CREATE_ACCOUNT_BUTTON}
    Wait Until Element Is Visible    ${TEXT_ACOUNT_CREATED}
    Wait Until Element Contains    ${TITLE_ACOUNT_CREATED}    ${ACCOUNT_CREATED}
    Click Element    ${CONTINUE_ACCOUNT}
    Wait Until Element Is Visible    ${H2}
    Wait Until Element Contains    ${LAST_LI_MENU}    ${USERS}[username]

The User Adds Products To The Cart
    [Documentation]    The User Adds Products To The Cart
    FOR    ${ITEM}    IN RANGE    2    5
        The User Clicks On The "Products" Button
        The User Is Successfully Redirected To The Page    ALL PRODUCTS
        Execute JavaScript    document.querySelectorAll('iframe').forEach(iframe => iframe.remove());
        Wait Until Element Is Visible    //a[@href='/product_details/${ITEM}']    10s
        Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
        Click Element    //a[@href='/product_details/${ITEM}']
        Wait Until Element Is Visible    ${ADD_TO_CART}    10s
        Click Button    ${ADD_TO_CART}
        Wait Until Element Is Visible    ${CONTINUE_SHOPPING}
        Click Element    ${CONTINUE_SHOPPING}
    END

The User Verify The Cart
    [Documentation]    The User Verify The Cart
    Verify Cart
    Click Element    ${BUTTON_CHECKOUT}
    Click Element    ${REGISTER_LOGIN}

The User Proceeds To Checkout
    [Documentation]    The User Proceeds To Checkout
    [Arguments]    &{USERS}
    Verify Cart
    Click Element    ${BUTTON_CHECKOUT}
    Wait Until Element Is Visible    ${ADRESS_DELIVERY}
    Verify Adress    ${TYPE_ADRESS}    &{USERS}
    Verify Adress    ${TYPE_ADRESS2}    &{USERS}

The User Places The Order
    [Documentation]    The User Places The Order
    [Arguments]    &{USERS}
    Verify Cart
    The User Proceeds To Checkout    &{USERS}
    Input Text    ${COM}    mon commentaire
    Click Element    ${PLACE_ORDER}
    Add Payment    &{USERS}
    Wait Until Element Is Visible    ${CONFIRM_ORDER}

The User Deletes Their Account
    [Documentation]    The User Deletes Their Account
    Wait Until Element Is Enabled    ${DELETE_ACCOUNT}
    Click Element    ${DELETE_ACCOUNT}

The User Account Is Deleted
    [Documentation]    The Customer Account Is Deleted
    Wait Until Element Is Visible    ${ACCOUNT_DELETED}
    Click Element    ${CONTINUE_ACCOUNT}
    Close Browser

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

Verify Adress
    [Documentation]    Verify Adress
    [Arguments]    ${TYPE_ADRESS}    &{USERS}
    ${NAME}    Get Text    //ul[@id='${TYPE_ADRESS}']/li[@class='address_firstname address_lastname']
    ${NAME2}    Set Variable    Mrs.
    ${NAME2}    Set Variable    ${NAME2} ${USERS}[username] ${USERS}[lastname]
    Should Be Equal    ${NAME}    ${NAME2}
    ${ADRESS}    Get Text    css=#${TYPE_ADRESS} > li:nth-of-type(4)
    Should Be Equal    ${ADRESS}    ${USERS}[adress]
    ${ADRESS2}    Get Text    //ul[@id='${TYPE_ADRESS}']/li[@class='address_city address_state_name address_postcode']
    ${ADRESS22}    Set Variable    ${USERS}[city] ${USERS}[state] ${USERS}[zip]
    Should Be Equal    ${ADRESS2}    ${ADRESS22}
    ${COUNTRY}    Get Text    //ul[@id='${TYPE_ADRESS}']/li[@class='address_country_name']
    Should Be Equal    ${COUNTRY}    ${USERS}[country]
    ${MOBILE}    Get Text    //ul[@id='${TYPE_ADRESS}']/li[@class='address_phone']
    Should Be Equal    ${MOBILE}    ${USERS}[mobile]

Verify Cart
    [Documentation]    Verify Cart
    Click Element    ${BUTTON_CART}
    Wait Until Element Is Visible    ${MENU_ACTIVE}
    Wait Until Element Contains    ${MENU_ACTIVE}    Shopping Cart

Add Payment
    [Documentation]    Add Payment
    [Arguments]    &{USERS}
    Input Text    ${CARD_NAME}    ${USERS}[lastname]
    Input Text    ${CARD_NUMBER}    ${USERS}[cardnumber]
    Input Text    ${CARD_CVC}    ${USERS}[cardcvc]
    Input Text    ${CARD_EXPIRY_MONTH}    ${USERS}[cardmonth]
    Input Text    ${CARD_EXPIRY_YEAR}    ${USERS}[cardyear]
    Click Button    ${CARD_SUBMIT}

The User Downloads The Invoice
    [Documentation]    Download Invoice
    Download Invoice
    Click Element    ${CONTINUE_ACCOUNT}

Download Invoice
    [Documentation]    Download Invoice
    Remove File    ${PATH_INVOICE}
    Click Element    ${DOWNLOAD_INVOICE}
    ${FICHIER}    Set Variable    ${PATH_INVOICE}
    Wait Until Created    ${FICHIER}    10s
    File Should Exist    ${FICHIER}
