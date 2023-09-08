*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary    locale=pt_BR


*** Variables ***
${input_firstName}    id:firstName
${input_lastName}    id:lastName
${input_email}    id:userEmail
${rdbutton_gender}    //label[@for="gender-radio-1"]
${input_phone}    id:userNumber
${input_date}    id:dateOfBirthInput
${input_subjects}    id:subjectsInput
${checkbox_hobbies}    //label[@for="hobbies-checkbox-3"]
${textarea_adress}    id:currentAddress
${button_submit}    id:submit



*** Keywords ***
Abrir Site DemonQA
    Open Browser    https://demoqa.com/automation-practice-form    ff
    Maximize Browser Window

Preencher Campos
    Wait Until Element Is Visible    ${input_firstName}    10s
    ${firstName}    FakerLibrary.First Name
    Input Text    ${input_firstName}    ${firstName}
    ${lastName}    FakerLibrary.Last Name
    Input Text    ${input_lastName}    ${lastName}
    ${email}    FakerLibrary.Email
    Input Text    ${input_email}    ${email}
    Click Element    ${rdbutton_gender}
    ${phone}    FakerLibrary.Basic Phone Number
    Input Text    ${input_phone}    ${phone}
    #Input Text    ${input_date}    01 Aug 2023
    Input Text    ${input_subjects}    Math
    Press Keys    ${input_subjects}    TAB
    Click Element    ${checkbox_hobbies}
    ${adress}    FakerLibrary.Address
    Input Text    ${textarea_adress}    ${adress}

Clicar em Submit
    #Click Element    ${button_submit}
    Sleep    4s
    Close Browser



*** Test Cases ***
Cenário 01: Preenchendo Formulario
    Abrir Site DemonQA
    Preencher Campos
    Clicar em Submit

