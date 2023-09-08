*** Settings ***
Library   SeleniumLibrary


*** Variables ***
${minhaVariavel}    teste

*** Keywords ***
Abrir Site Dev Finance
    Open Browser    https://dev-finance.netlify.app    chrome


*** Test Cases ***
Cenário 01: Abrindo o site
    Abrir Site Dev Finance

