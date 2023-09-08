*** Settings ***
Resource    ../../Resource/Settings.resource
Resource    ../../Elements/Main_Elements.resource


*** Keywords ***
E acesso a página de visto
    Wait Until Element Is Visible  ${Home.A_Visto}  10
    Click Element  ${Home.A_Visto}

E informo o pais de origem sendo o ${Texto}
    Wait Until Element Is Visible  ${Visto.Span_PaisOrigem}  10
    Click Element                  ${Visto.Span_PaisOrigem}
    Wait Until Element Is Visible  ${Visto.Input_InformaPaisOrigem}  10
    Input Text                     ${Visto.Input_InformaPaisOrigem}  ${Texto}
    Press Keys                     ${Visto.Input_InformaPaisOrigem}  ENTER