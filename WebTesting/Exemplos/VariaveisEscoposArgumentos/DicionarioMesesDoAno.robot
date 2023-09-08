*** Variables ***
&{MESES_DO_ANO}    Janeiro=31
...                Fevereiro=28
...                Março=31
...                Abril=30
...                Maio=31
...                Junho=30
...                Julho=31
...                Agosto=31
...                Setembro=30
...                Outubro=31
...                Novembro=30
...                Dezembro=31


*** Keywords ***
Listar os meses do ano
    Log To Console    \nO mês de Janeiro possui ${MESES_DO_ANO.Janeiro} dias.
    Log To Console    O mês de Fevereiro possui ${MESES_DO_ANO.Fevereiro} dias.
    Log To Console    O mês de Março possui ${MESES_DO_ANO.Março} dias.
    Log To Console    O mês de Abril possui ${MESES_DO_ANO.Abril} dias.
    Log To Console    O mês de Maio possui ${MESES_DO_ANO.Maio} dias.
    Log To Console    O mês de Junho possui ${MESES_DO_ANO.Junho} dias.
    Log To Console    O mês de Julho possui ${MESES_DO_ANO.Julho} dias.
    Log To Console    O mês de Agosto possui ${MESES_DO_ANO.Agosto} dias.
    Log To Console    O mês de Setembro possui ${MESES_DO_ANO.Setembro} dias.
    Log To Console    O mês de Outubro possui ${MESES_DO_ANO.Outubro} dias.
    Log To Console    O mês de Novembro possui ${MESES_DO_ANO.Novembro} dias.
    Log To Console    O mês de Dezembro possui ${MESES_DO_ANO.Dezembro} dias.


*** Test Cases ***
Caso de teste 01: Imprimir no console os meses do ano
    Listar os meses do ano
