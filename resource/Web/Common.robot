*** Settings ***
Library    Browser    60s 


*** Keywords ***
Begin Web Test

    New Browser                ${BROWSER_CHROMIUM}    headless=false
    New Context                viewport={'width': 1366, 'height': 768}
    New Page                   ${LOGIN URL}                               
    Wait For Elements State    css=div[class='bot_column']             visible        10