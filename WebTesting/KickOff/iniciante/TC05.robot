*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary    locale=pt_BR


*** Variables ***
${baseUrl}    https://www.mercadolivre.com.br/
${browser}    ff


${anchor_ofertas}    //a[contains(text(), "Ofertas do dia")]
${h1_ofertas}    //h1[contains(text(), "Ofertas do dia")]

*** Keywords ***
Wait Until Visible and Click
    [Arguments]    ${element}    ${time}=10s
    Wait Until Element Is Visible    ${element}    ${time}
    Click Element    ${element}


Dado que estou na pagina inicial do Mercado Livre
    Open Browser    ${baseUrl}    ${browser}
    Maximize Browser Window

Quando clico em ofertas do dia
    Wait Until Visible and Click    ${anchor_ofertas}

Então visualizo as ofertas do dia
    Wait Until Element Is Visible    ${h1_ofertas}    10s
    Element Should Be Visible    ${h1_ofertas}
    Sleep    2s
    Close Browser
    



*** Test Cases ***
Cenário 01: Verificando a pagina Ofertas do Dia
    Dado que estou na pagina inicial do Mercado Livre
    Quando clico em ofertas do dia
    Então visualizo as ofertas do dia

