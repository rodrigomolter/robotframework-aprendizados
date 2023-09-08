*** Variables ***
@{NUMEROS}    7    3    8    5     9    4    1    9      14    
...           6    2    10   11    5    3    7    10     12

*** Test Cases ***
Test Case 01
    Log To Console    ${\n}
    FOR    ${N}    IN    @{NUMEROS}
        IF    ${N} == 5
            Log To Console    Eu sou o número 5!
        ELSE IF    ${N} == 10
            Log To Console    Eu sou o número 10!
        ELSE
            Log To Console    Eu não sou o número 5 e nem o 10!
        END
        
    END