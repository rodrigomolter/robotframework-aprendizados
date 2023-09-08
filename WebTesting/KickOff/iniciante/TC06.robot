*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary    locale=pt_BR


*** Variables ***
${baseUrl}    https://www.netflix.com/br/
${browser}    ff


${email}    abacaxi
${senha}    123456

${anchor_entrar}    //a[@id="signIn" and contains(text(), "Entrar")]
${input_email}    //input[@name="userLoginId"]
${input_senha}    //input[@name="password"]
${btn_entrar}    //button[contains(text(), "Entrar")]

${btn_cookie}    //button[@id="cookie-disclosure-close"]
${div_error}    //div[contains(text(), "Informe um email ou número de telefone válido.")]
${div_errorMessage}    //div[@data-uia="error-message-container"]

*** Keywords ***
Wait Until Visible and Click
    [Arguments]    ${element}    ${time}=10s
    Wait Until Element Is Visible    ${element}    ${time}
    Click Element    ${element}

Dado que estou na pagina inicial da Netflix
    Open Browser    ${baseUrl}    ${browser}
    Maximize Browser Window

Fechar Cookies Div
    Wait Until Visible and Click    ${btn_cookie}

Quando vou para a pagina de login
    Fechar Cookies Div
    Wait Until Visible and Click    ${anchor_entrar}

E preencho somente o campo de senha
    Wait Until Element Is Visible    ${input_senha}
    Input Password    ${input_senha}    ${senha}
    Click Element    ${btn_entrar}

E preencho um email inexistente
    Wait Until Element Is Visible    ${input_email}
    Input Text    ${input_email}    ${email}
    E preencho somente o campo de senha

Entao recebo uma mensagem para informar email valido
    Wait Until Element Is Visible    ${div_error}    10s
    Element Should Be Visible    ${div_error}
    Sleep    2s
    Close Browser
    
Entao recebo uma mensagem que nao foi encontrado esse email
    Wait Until Element Is Visible    ${div_errorMessage}    10s
    Element Should Be Visible    ${div_errorMessage}
    Sleep    2s
    Close Browser

*** Test Cases ***
Cenário 01: Login Netflix sem preencher email
    Dado que estou na pagina inicial da Netflix
    Quando vou para a pagina de login
    E preencho somente o campo de senha
    Entao recebo uma mensagem para informar email valido

Cenário 02: Login Netflix com email inexistente
    Dado que estou na pagina inicial da Netflix
    Quando vou para a pagina de login
    E preencho um email inexistente
    Entao recebo uma mensagem que nao foi encontrado esse email

