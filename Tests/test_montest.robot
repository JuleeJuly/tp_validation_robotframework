*** Settings ***
Documentation    This test suite contains test cases for the google site
Resource    ../Ressources/keywords/test_keywords.robot


*** Test Cases ***
Scenario: Open Google
    [Documentation]    Open the website
    Given I Am On The Website
    When I Search 
    Then I Have A Search Result