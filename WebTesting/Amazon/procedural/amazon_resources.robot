*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.amazon.com.br/
${MENU_ELETRONICOS}    //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}    //h1[contains(.,'Eletrônicos e Tecnologia')]
${INPUT_PESQUISA}    twotabsearchtextbox
${BTN_PESQUISA}    nav-search-submit-button

*** Keywords ***
Abrir o navegador
    Open Browser  
    Maximize Browser Window  

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    ${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible    ${HEADER_ELETRONICOS}
    
Verificar se o título da página fica "${TITLE}"
    Title Should Be    ${TITLE}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    //img[contains(@alt,'${NOME_CATEGORIA}')]

Digitar o nome de produto "${TEXTO_PESQUISA}" no campo de pesquisa
    Wait Until Element Is Visible    ${INPUT_PESQUISA}
    Input Text    ${INPUT_PESQUISA}    ${TEXTO_PESQUISA}

Clicar no botão de pesquisa
    Wait Until Element Is Visible    ${BTN_PESQUISA}
    Click Element    ${BTN_PESQUISA}

Verificar o resultado da pesquisa se esta listando o produto "${PRODUTO_PESQUISADO}"
    Wait Until Element Is Visible    locator=(//span[contains(.,'${PRODUTO_PESQUISADO}')])[2]
    Element Should Be Visible    locator=(//span[contains(.,'${PRODUTO_PESQUISADO}')])[2]

Adicionar o produto "${PRODUTO}" no carrinho
    Wait Until Element Is Visible    (//img[contains(@alt,'${PRODUTO}')])[1]
    Click Element    (//img[contains(@alt,'${PRODUTO}')])[1]
    Wait Until Element Is Visible    //input[@title='Adicionar ao carrinho']
    Click Element    //input[@title='Adicionar ao carrinho']

Verificar se o produto "${PRODUTO}" foi adicionado com sucesso
    Wait Until Element Is Visible    //span[contains(.,'Adicionado ao carrinho')]
    Element Should Be Visible    //span[contains(.,'Adicionado ao carrinho')]
    Ir para o carrinho
    Wait Until Element Is Visible    //h1[contains(.,'Carrinho de compras')]
    Element Should Be Visible    //h1[contains(.,'Carrinho de compras')]
    Element Should Be Visible    //span[@class='a-truncate-cut'][contains(.,'${PRODUTO}')]


Remover o produto "${PRODUTO}" do carrinho
    Wait Until Element Is Visible    //input[@aria-label='Excluir ${PRODUTO}']
    Click Element    //input[@aria-label='Excluir ${PRODUTO}']

Verificar se o carrinho fica vazio
    Wait Until Element Is Visible    //h1[@class='a-spacing-mini a-spacing-top-base'][contains(.,'Seu carrinho de compras da Amazon está vazio.')]
    Element Should Be Visible    //h1[@class='a-spacing-mini a-spacing-top-base'][contains(.,'Seu carrinho de compras da Amazon está vazio.')]

Ir para o carrinho
    Wait Until Element Is Visible        //a[@href='/cart?ref_=sw_gtc'][contains(.,'Ir para o carrinho')]
    Click Element    //a[@href='/cart?ref_=sw_gtc'][contains(.,'Ir para o carrinho')]


    
    