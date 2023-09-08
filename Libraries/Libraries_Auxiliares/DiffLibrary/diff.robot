*** Settings ***
Library         DiffLibrary
Library         OperatingSystem
Test Setup      Criar os arquivos de texto

*** Variables ***
${ARQUIVO01}    ${CURDIR}/my_files/arquivo01.txt
${ARQUIVO02}    ${CURDIR}/my_files/arquivo02.txt

*** Test Cases ***
Exemplo 01: Compara dois arquivos
    Compara arquivos iguais
    
Exemplo 02: Compara dois arquivos diferentes
    Altera o primeiro arquivo
    Compara arquivos diferentes

*** Keywords ***
Criar os arquivos de texto
    Create File         ./my_files/arquivo01.txt     Ecologia sem luta de classes é jardinagem!
    Create File         ./my_files/arquivo02.txt     Ecologia sem luta de classes é jardinagem!
Compara arquivos iguais
    Diff Files    ${ARQUIVO01}    ${ARQUIVO02}

Compara arquivos diferentes
    Run Keyword And Expect Error    differences found between ${ARQUIVO01} and ${ARQUIVO02}    Diff Files    ${ARQUIVO01}    ${ARQUIVO02}

Altera o primeiro arquivo
    Append To File    ${ARQUIVO01}    - Chico Mendes