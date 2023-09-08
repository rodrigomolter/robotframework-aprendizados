*** Settings ***
Library   SeleniumLibrary


*** Variables ***
#Variaveis de Configuração
${url}    https://www.youtube.com/
${browser}    ff

#Dados do teste
${nomeDaMusica}    partners in crime set it off

#Elementos
${input_pesquisar}    //input[@id="search"]
${btn_pesquisar}        //button[@id="search-icon-legacy"]
${anchor_primeiroVideo}    (//a[@id="video-title"])[1]
${assert}    (//yt-button-shape/button[@aria-label="Compartilhar"])[1]


*** Keywords ***
Dado que eu estou no site do youtube
    Open Browser    ${url}    ${browser}  

Quando pesquiso por um vídeo
    Wait Until Element Is Visible    ${btn_pesquisar}    10s
    Input Text    ${input_pesquisar}    ${nomeDaMusica}
    Click Element    ${btn_pesquisar}
    Press Keys    None    RETURN

E seleciono a primeira opção da lista
    Wait Until Element Is Visible    ${anchor_primeiroVideo}    10s
    Click Element    ${anchor_primeiroVideo}

Então o vídeo é reproduzido
    Wait Until Element Is Visible    ${assert}    10s
    Element Should Be Visible    ${assert}    
    Sleep     2s
    Close Browser


*** Test Cases ***
Cenário 01: Executar um vídeo no Youtube
    Dado que eu estou no site do youtube
    Quando pesquiso por um vídeo
    E seleciono a primeira opção da lista
    Então o vídeo é reproduzido

