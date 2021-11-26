*** Variables ***
${username_input}        data-test=username
${password_input}        data-test=password

${submit_button}         data-test=login-button

${company_logo}          xpath=//*[@class='login_logo']
${dashboard_logo}        xpath=//*[@class='app_logo']


*** Keywords ***
Login Success
    [Arguments]                    &{USER VALID}
   
    Enter username and Password    &{USER VALID}
    Wait For Elements State        ${dashboard_logo}       visible    10

Enter username and Password
    [Arguments]                    &{USER}
    
    Wait For Elements State        ${company_logo}      visible
    Fill Text                      ${username_input}    ${USER.username}
    Fill Text                      ${password_input}    ${USER.password}
    Click                          ${submit_button} 

