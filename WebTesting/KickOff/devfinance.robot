*** Settings ***
Library   SeleniumLibrary


*** Variables ***
${anchor_newtransaction}    //a[contains(text(), "+ Nova Transação")]
${input_descricao}    id:description
${input_amount}    id:amount
${input_date}    id:date
${button_salvar}    //button[contains(text(), "Salvar")]
${img_removetransaction}    //img[@onclick="Transaction.remove(0)"]


*** Keywords ***
Abrir Site DevFinance
    Open Browser    https://dev-finance.netlify.app/    ff

Adicionar Transação Negativa
    Click Element    ${anchor_newtransaction}
    Input Text    ${input_descricao}    Cineminha
    Input Text    ${input_amount}    -50,00
    Input Text    ${input_date}    25/08/2023
    Click Element    ${button_salvar}

Adicionar Transação Positiva
    Click Element    ${anchor_newtransaction}
    Input Text    ${input_descricao}    Freela
    Input Text    ${input_amount}    500,00
    Input Text    ${input_date}    01/09/2023
    Click Element    ${button_salvar}

Remover Ultima Transação
    Click Element    ${img_removetransaction}

Fechar Browser
    Sleep    3s
    Close Browser


*** Test Cases ***
Cenário 01: Cadastrando duas transações
    [Tags]    Regressivo
    Abrir Site DevFinance
    Adicionar Transação Negativa
    Adicionar Transação Positiva
    Fechar Browser

Cenário 02: Cadastrando duas transações e removendo a última adicionada
    [Tags]    Regressivo
    Abrir Site DevFinance
    Adicionar Transação Positiva
    Adicionar Transação Negativa
    Remover Ultima Transação
    Fechar Browser

    

