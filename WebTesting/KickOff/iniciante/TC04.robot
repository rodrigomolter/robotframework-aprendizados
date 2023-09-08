*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${btn_novaConta}    //a[contains(text(), "Criar nova conta")]
${input_firstName}    //input[@placeholder="Nome"]
${input_lastName}    //div[@class="placeholder" and contains(text(), "Sobrenome")]/following-sibling::input
${input_phone}    //div[@class="placeholder" and contains(text(), "Celular ou email")]/following-sibling::input
${input_password}    //div[@class="placeholder" and contains(text(), "Nova senha")]/following-sibling::input
${list_birthdayDay}    name:birthday_day
${list_birthdayMonth}    name:birthday_month
${list_birthdayYear}    name:birthday_year
${rb_gender}    //label[contains(text(), "Masculino")]/following-sibling::input
${btn_cadastrar}    //button[@name="websubmit" and contains(text(), "Cadastre-se")]

*** Keywords ***
Wait Until Visible and Click
    [Arguments]    ${element}    ${time}=10s
    Wait Until Element Is Visible    ${element}    ${time}
    Click Element    ${element}


Acesse a página de cadastro do Facebook
    Open Browser    https://www.facebook.com    ff
    Maximize Browser Window
    Wait Until Visible and Click    ${btn_novaConta}


Preencher Campos
    Wait Until Element Is Visible    ${input_firstName}
    Input Text    ${input_firstName}    Arya
    Input Text    ${input_lastName}    Stark
    Input Text    ${input_phone}    555-1234
    Input Text    ${input_password}    123456789
    Select From List By Value    ${list_birthdayDay}    13
    Select From List By Index    ${list_birthdayMonth}    0
    Select From List By Value    ${list_birthdayYear}    2013
    Click Element    ${rb_gender}


Clicar em Cadastrar
    Wait Until Visible and Click    ${btn_cadastrar}
    Sleep    4s
    Close Browser



*** Test Cases ***
Cenário 01: Criando uma conta no Facebook
    Acesse a página de cadastro do Facebook
    Preencher Campos
    Clicar em Cadastrar

