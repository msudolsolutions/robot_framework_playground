*** Settings ***
Library  SeleniumLibrary
Suite Teardown  Close Browser

*** Variables ***
${WEBSITE}  https://the-internet.herokuapp.com

*** Test Cases ***

Test Case 1
    [Documentation]  Open the-internet in Safari
    Open Browser  ${WEBSITE}  safari
    Maximize Browser Window
    Element Text Should Be    xpath=//*[@id="content"]/h1    Welcome to the-internet

Test Case 2
    [Documentation]  Click on the Add/Remove Elements link
    Click Element  link=Add/Remove Elements
    Wait Until Element Is Visible    xpath=//*[@id="content"]/h3    timeout=3s
    Element Text Should Be    xpath=//*[@id="content"]/h3    Add/Remove Elements

Test Case 3
    [Documentation]  Add a new element
    Click Element  xpath=//button[text()='Add Element']
    Wait Until Element Is Visible    xpath=//*[@id="elements"]/button    timeout=3s
