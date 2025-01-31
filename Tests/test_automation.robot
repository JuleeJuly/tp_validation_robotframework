*** Settings ***
Documentation    This test suite contains test cases for the google site
Resource    ../Ressources/keywords/automation_keywords.robot


*** Variables ***
&{USERS}
...    username=Titi
...    lastname=Titi
...    firstname=Titi
...    email=titi${{random.randint(1000, 9999)}}@tutu.fr
...    password=password
...    birthday=10
...    birthmonth=3
...    birthyear=2012
...    adress=666 rue des enfers
...    country=Canada
...    state=state
...    city=city
...    zip=12345
...    mobile=0102030405
...    cardnumber=1111 1111 1111
...    cardcvc=555
...    cardmonth=12
...    cardyear=2027


*** Test Cases ***
Scenario: Search For A Specific Product And Verify The Results
    [Documentation]    This test case searches for a specific product and verifies the results.
    Given The User Is On The Website    https://automationexercise.com
    Then The Homepage Is Visible
    When The User Clicks On The "Products" Button
    Then The User Is Successfully Redirected To The Page    ALL PRODUCTS
    When The User Enters In The Search Bar And Clicks On The "Search" Button    Dress
    Then Is Visible    SEARCHED PRODUCTS
    And The Displayed Results Contain    Dress

Scenario: Delete Customer Account During Checkout
    [Documentation]    Delete Customer Account During Checkout
    Given The User Is On The Website    https://automationexercise.com
    When The User Creates An Account    &{USERS}
    And The User Adds Products To The Cart
    And The User Proceeds To Checkout    &{USERS}
    And The User Deletes Their Account
    Then The User Account Is Deleted

Scenario: User Creates an Account While Placing an Order and Then Deletes It
    [Documentation]    User Creates an Account While Placing an Order and Then Deletes It
    Given The User Is On The Website    https://automationexercise.com
    When The User Adds Products To The Cart
    And The User Verify The Cart
    And The User Creates An Account    &{USERS}
    And The User Places The Order    &{USERS}
    And The User Downloads The Invoice
    And The User Deletes Their Account
    Then The User Account Is Deleted
