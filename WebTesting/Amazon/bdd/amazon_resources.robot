*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.amazon.com.br/
${BROWSER}    ff
${MENU_ELETRONICOS}    //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}    //h1[contains(.,'Eletrônicos e Tecnologia')]
${INPUT_PESQUISA}    twotabsearchtextbox
${BTN_PESQUISA}    nav-search-submit-button

*** Keywords ***
Abrir o navegador
    Open Browser  browser=${BROWSER}
    Maximize Browser Window  

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Dado que estou na home page da Amazon.com.br
    Go To    ${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Quando acessar o menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}

E o texto "${FRASE}" deve ser exibido na página
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible    ${HEADER_ELETRONICOS}
    
Então o título da página deve ficar "${TITLE}"
    Title Should Be    ${TITLE}

E a categoria "${NOME_CATEGORIA}" deve ser exibida na página
    Element Should Be Visible    //img[contains(@alt,'${NOME_CATEGORIA}')]

Quando pesquisar pelo produto "${TEXTO_PESQUISA}"
    Wait Until Element Is Visible    ${INPUT_PESQUISA}
    Input Text    ${INPUT_PESQUISA}    ${TEXTO_PESQUISA}
    Clicar no botão de pesquisa

Clicar no botão de pesquisa
    Wait Until Element Is Visible    ${BTN_PESQUISA}
    Click Element    ${BTN_PESQUISA}

E um produto da linha "${PRODUTO_PESQUISADO}" deve ser mostrado na página
    Wait Until Element Is Visible    locator=(//span[contains(.,'${PRODUTO_PESQUISADO}')])[2]
    Element Should Be Visible    locator=(//span[contains(.,'${PRODUTO_PESQUISADO}')])[2]


Quando adicionar o produto "${PRODUTO}" no carrinho
    Quando pesquisar pelo produto "${PRODUTO}"
    Wait Until Element Is Visible    (//img[contains(@alt,'${PRODUTO}')])[1]
    Click Element    (//img[contains(@alt,'${PRODUTO}')])[1]
    Wait Until Element Is Visible    //input[@title='Adicionar ao carrinho']
    Click Element    //input[@title='Adicionar ao carrinho']
    Set Test Variable    ${PRODUTO_ADICIONADO}    ${PRODUTO}  

Então o produto adicionado deve ser mostrado no carrinho
    Wait Until Element Is Visible    //span[contains(.,'Adicionado ao carrinho')]
    Element Should Be Visible    //span[contains(.,'Adicionado ao carrinho')]
    Ir para o carrinho
    Wait Until Element Is Visible    //h1[contains(.,'Carrinho de compras')]
    Element Should Be Visible    //h1[contains(.,'Carrinho de compras')]
    Element Should Be Visible    //span[@class='a-truncate-cut'][contains(.,'${PRODUTO_ADICIONADO}')]

Ir para o carrinho
    Wait Until Element Is Visible        //a[@href='/cart?ref_=sw_gtc'][contains(.,'Ir para o carrinho')]
    Click Element    //a[@href='/cart?ref_=sw_gtc'][contains(.,'Ir para o carrinho')]

E existe o produto "${PRODUTO}" no carrinho
    Quando adicionar o produto "${PRODUTO}" no carrinho
    Então o produto "${PRODUTO}" deve ser mostrado no carrinho

Quando remover o produto "${PRODUTO}" do carrinho
    Wait Until Element Is Visible    //input[@aria-label='Excluir ${PRODUTO}']
    Click Element    //input[@aria-label='Excluir ${PRODUTO}']
    Element Should Be Visible    //span[@class='a-size-base'][contains(.,'${PRODUTO}${SPACE} Abre em uma nova aba ${SPACE} foi removido de Carrinho de compras.')]

Então o carrinho deve ficar vazio
    Wait Until Element Is Visible    //h1[@class='a-spacing-mini a-spacing-top-base'][contains(.,'Seu carrinho de compras da Amazon está vazio.')]
    Element Should Be Visible    //h1[@class='a-spacing-mini a-spacing-top-base'][contains(.,'Seu carrinho de compras da Amazon está vazio.')]




    