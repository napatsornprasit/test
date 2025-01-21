*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}             https://abhigyank.github.io/To-Do-List/
${BROWSER}         Chrome

*** Test Cases ***
Open Application
    [Documentation]    Open the To-Do List application in the browser.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Title Should Be    To-Do List

Add a New Task
    [Documentation]    Verify that a new task can be added to the list.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Title Should Be    To-Do List
    Input Text         id:new-task      Buy Groceries
    Click button    //*[@id="add-item"]/button
    Click Element    xpath=/html/body/div/div/div[1]/a[2]/span
    Element Should Be Visible   xpath=/html/body/div/div/div[1]/a[2]/span

Mark Task as Complete
    [Documentation]    Verify that a task can be marked as completed.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Title Should Be    To-Do List
    Input Text         id:new-task      Buy Groceries
    Click button    //*[@id="add-item"]/button
    Click Element    xpath=/html/body/div/div/div[1]/a[2]/span
    Element Should Be Visible   xpath=/html/body/div/div/div[1]/a[2]/span
    Click Element    xpath=/html/body/div/div/div[1]/a[2]/span
    Click Element    xpath=/html/body/div/div/div[1]/a[3]/span
    Element Should Be Visible    xpath=//*[@id="completed-tasks"]

Delete a Task From Complete Task Menu
    [Documentation]    Verify that a task can be deleted.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Title Should Be    To-Do List
    Input Text         id:new-task      Buy Groceries
    Click button    //*[@id="add-item"]/button
    Click Element    xpath=/html/body/div/div/div[1]/a[2]/span
    Element Should Be Visible   xpath=/html/body/div/div/div[1]/a[2]/span
    Click Element    xpath=//span[text()='Buy Groceries']/following-sibling::span[contains(@class, 'mdl-checkbox__ripple-container')]
    Click Element    xpath=/html/body/div/div/div[1]/a[3]/span
    Element Should Be Visible    xpath=//*[@id="completed-tasks"]
    Wait Until Element Is Visible    xpath=//button[@class='mdl-button mdl-js-button mdl-js-ripple-effect delete']
    Click Element    xpath=//button[@class='mdl-button mdl-js-button mdl-js-ripple-effect delete']
    Element Should Not Be Visible   xpath=//button[@class='mdl-button mdl-js-button mdl-js-ripple-effect delete']

