*** Settings ***
Resource    ../../Steps/Main_Steps.robot

*** Test Cases ***
TC01 - Solicitar visto Americano
    Dado que eu acesse o php travels
    E realize o cadastro 
    E faça o Login
    E acesso a página de visto
    E informo o pais de origem sendo o Brazil
    E fecho o navegador