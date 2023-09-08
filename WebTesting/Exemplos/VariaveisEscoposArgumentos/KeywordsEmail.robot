*** Settings ***
Library    FakerLibrary    locale=pt_BR
Library    String

*** Keywords ***
Email Generator
    [Arguments]    ${NOME}    ${SOBRENOME}
    ${LETRAS_ALEATORIA}    FakerLibrary.Random Letters    5
    #Transforma a lista de letras em uma string
    ${LETRAS_ALEATORIA}    Evaluate    "".join(${LETRAS_ALEATORIA})
    #Concatena o email
    ${NOVO_EMAIL}    Set Variable    ${NOME}${SOBRENOME}${LETRAS_ALEATORIA}@testerobot.com
    #Remove white spaces
    ${NOVO_EMAIL}    Evaluate    "${NOVO_EMAIL}".replace(' ', '')
    [Return]    ${NOVO_EMAIL}

*** Test Cases ***
Caso de Teste 01: Gerar email
    ${NOME}    FakerLibrary.First Name
    ${SOBRENOME}    FakerLibrary.Last Name
    ${NOVO_EMAIL}    Email Generator    ${NOME}    ${SOBRENOME}
    Log To Console    ${NOVO_EMAIL}
