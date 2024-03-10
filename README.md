# Robot Framework

Neste repositório, compartilho os aprendizados e exemplos adquiridos durante dois cursos abrangentes sobre Robot Framework, abordando desde os conceitos básicos até técnicas avançadas.

## Instalando Robot Framework 🤖
Para rodar as suites de testes é necessário ter o Robot Framework instalado.
O método recomendado de instalação é utilizando o [pip](http://pip-installer.org/).
```
pip install --upgrade robotframework-seleniumlibrary
```
Rodando esse comando irá instalar também a última versão do Robot Framework e da [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html), que também será utilizada neste projeto.


Outra biblioteca utilizada é a [FakerLibrary](https://github.com/MarketSquare/robotframework-faker), utilizada para a geração de dados aleatórios na execução dos testes.
```
pip install robotframework-faker
```

## WebDrivers
WebDrivers permitem a interação entre o script de teste e o browser que está sendo utilizado.

As suites de testes estão rodando por padrão através do Firefox, para isso é necessário o `geckodriver` ou o WebDriver correspondente ao navegador que deseja usar.

[Geckodriver (Firefox)](https://github.com/mozilla/geckodriver/releases/latest)

[ChromeDriver (Google Chrome)](https://chromedriver.chromium.org/downloads)
> [!NOTE]
> Atenção: baixe a versão de acordo com o seu Chrome. Para saber a sua versão basta ir em Ajuda>Sobre o Google Chrome.

Agora é necessário adicionar o webdriver dentro da pasta de `scripts` do Python.
Geralmente ela fica em `C:\Users\User\AppData\Local\Programs\Python\Python39\Scripts` ou você pode conferir através das suas variaveis de ambiente.

Caso não tenha entendido ou conseguido acompanhar alguma etapa, recomendo a [playlist Kickoff da Bianca Campos no Youtube](https://www.youtube.com/watch?v=BhtyZISTFRs)

## Executando os testes
Os testes podem ser executados pelo comando:
```
robot nomeDoArquivo.robot
```
Exemplo, da pasta `WebTesting`:
```
robot youtube.robot
```

### Executando em um navegador diferente
O navegador utilizado é controlado pela variável `${BROWSER}`.
```
robot BROWSER:chrome youtube.robot
```
Onde, -v é o parâmetro que indica que será atribuído o valor `chrome` à variável `${BROWSER}` do meu teste. No meu exemplo, a variável está definida como default o valor firefox, mas rodando por este comando, o navegador utilizado será o chrome.

###  Especificar o diretório dos results da execução
```
robot -d ./Results WebTesting
```
Onde, -d é o parâmetro que indica que os resultados da execução (log/output/report) das suítes contidas no diretório (WebTesting) devem ser armazenados em um diretório específico, que no exemplo é uma pasta de nível acima (./), chamada Results.

### Executar apenas um teste específico da suíte:
```
robot -d ./Results -t “Cenário 01: Executar um vídeo no Youtube” WebTesting
```
Onde, -t é o parâmetro que indica que deve ser executado o(s) teste(s) específico(s) chamado(s) (“Cenário 01: Executar um vídeo no Youtube”) das suítes contidas no diretório (WebTesting). OBS.: Se existirem testes em diferentes suítes, mas com esse mesmo nome, todos serão executados.

