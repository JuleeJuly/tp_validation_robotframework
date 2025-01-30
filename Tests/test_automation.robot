*** Settings ***
Documentation    This test suite contains test cases for the google site
Resource    ../Ressources/keywords/automation_keywords.robot


*** Test Cases ***
Scenario: Search For A Specific Product And Verify The Results
    [Documentation]    This test case searches for a specific product and verifies the results.
    Given The Browser Is Launched
    And The User Navigates    https://automationexercise.com
    Then The Homepage Is Visible
    When The User Clicks On The "Products" Button
    Then The User Is Successfully Redirected To The Page    ALL PRODUCTS
    When The User Enters In The Search Bar And Clicks On The "Search" Button    Dress
    Then Is Visible    SEARCHED PRODUCTS
    And The Displayed Results Contain    Dress
