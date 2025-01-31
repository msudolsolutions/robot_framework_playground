*** Settings ***
Documentation    This is an example test in Robot Framework using Selenium
Library    SeleniumLibrary
Library    Dialogs

*** Variables ***
${SEARCH_QUERY}    Robot Framework

*** Test Cases ***
Open Google in Safari and Search
    Open Browser  https://www.google.com  safari
    Maximize Browser Window
    # Dealing with cookie policy when it pops up:
    ${status}    ${result} =    Run Keyword And Ignore Error    Click Element  xpath=//*[@id="L2AGLb"]
    Input Text    name=q    ${SEARCH_QUERY} 
    Press Keys    name=q    ENTER
    # ${input} =    Get Value From User    Please complete the CAPTCHA portion and type OK to continue.
    # Safari browser forces to terminate automatic execution before doing something manually, so error is expected
    ${error}=    Run Keyword And Expect Error    *not visible after*    Wait Until Element Is Visible  xpath=//div[@id='search']
    Capture Page Screenshot
    Close Browser
