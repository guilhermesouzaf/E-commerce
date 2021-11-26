*** Settings ***

Resource         ../resource/Web/Common.robot
Resource         ../resource/Web/Login.robot
Resource         ../resource/Web/VariablesTest.robot
Resource         ../resource/Web/WebApp.robot
Test Setup       Begin Web Test


*** Test Cases ***

Finish Order Success

    Login.Login Success    &{USER VALID}
    WebApp.Order Success
