*** Settings ***
Library         ./Libraries/HashLibrary/geradorHash.py
Library         ./Libraries/ParOuImparLibrary/checkParOuImpar.py
# Library         Libraries.SeleniumLibrary
Library         SeleniumLibrary
Test Teardown   Close Browser

*** Test Cases ***
Teste de conversão de string para HASH sha256
    Converter "Estou ficando ninja em Robot Framework!!" para sha256

Teste de conversão de arquivo para HASH sha256
    Converter o arquivo "arquivo_PDF.pdf" para sha256

Teste minha SeleniumLibrary
    Abrir meu browser

Teste numero par ou impar
    Verifica se o numero é par

*** Keywords ***
Converter "${CONTEUDO}" para sha256
    ${CONTEUDO_HASH}   Gerar Hash    ${CONTEUDO}
    Log   ${CONTEUDO_HASH}

Converter o arquivo "${FILE}" para sha256
    ${CONTEUDO_HASH}   Gerar Hash Arquivo   ./${FILE}
    Log   ${CONTEUDO_HASH}

Abrir meu browser
    # My Open Browser    http://www.robotframework.org    chrome
    Open Browser    http://www.robotframework.org    chrome

Verifica se o numero é par
    Numero Par Ou Impar    ${3}