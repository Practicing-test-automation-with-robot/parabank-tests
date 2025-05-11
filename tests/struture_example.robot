*** Settings ***
# Aqui configuramos as bibliotecas e recursos que serão usados nos testes.
# Exemplo: SeleniumLibrary é usada para automação de navegadores.
Library    SeleniumLibrary

# Podemos adicionar outras configurações, como arquivos de recursos ou variáveis globais.
# Resource    common_keywords.robot
# Variables    global_variables.robot



# ==================================================================================================================== #
*** Variables ***
# Aqui declaramos as variáveis que serão usadas nos testes.
# Variáveis ajudam a evitar repetição e tornam o código mais fácil de manter.

${URL}         https://exemplo.com
${BROWSER}     chrome
${USERNAME}    usuario_teste
${PASSWORD}    senha_teste

# Variáveis para o registro de usuário também podem ser definidas com base nas propriedades
# do elemento HTML, como id, name ou class.
${input_email}    id:email
${input_password}    id:password
${input_confirm_password}    id:confirm_password
${input_register}    name:register
${input_register_button}    class:register-button



# ====================================================================================================================
*** Keywords ***
# Keywords são como "funções" que agrupam ações reutilizáveis.
# Elas ajudam a organizar o código e evitar repetição.

Abrir site
    [Documentation]    Abre o site especificado no navegador.
    Open Browser    ${URL}    ${BROWSER}

Fazer login
    [Documentation]    Realiza login no site com as credenciais fornecidas.
    Input Text    id:username    ${USERNAME}
    Input Text    id:password    ${PASSWORD}
    Click Button    id:login-button

Verificar página inicial
    [Documentation]    Verifica se a página inicial foi carregada corretamente.
    Title Should Be    Página Inicial
    Capture Page Screenshot

Fechar navegador
    [Documentation]    Fecha o navegador.
    Close Browser



# ====================================================================================================================
*** Test Cases ***
# Test Cases são os cenários de teste que queremos validar.
# Cada Test Case é composto por Keywords.

Cenário 1: Login com sucesso
    [Documentation]    Este teste verifica se o login funciona corretamente.
    [Tags]    login    sucesso
    Abrir site
    Fazer login
    Verificar página inicial
    Fechar navegador

Cenário 2: Acessar site sem login
    [Documentation]    Este teste verifica se o site é acessível sem login.
    [Tags]    navegação    sem_login
    Abrir site
    Verificar página inicial
    Fechar navegador


# ==================================================================================================================== #

*** Comments ***
Explicação de cada seção:

Settings:
    É onde configuramos bibliotecas e recursos adicionais.
    Exemplo: Library SeleniumLibrary permite usar comandos para automação de navegadores.


Variables:
    Usamos variáveis para armazenar valores reutilizáveis, como URLs, títulos ou configurações.
    Exemplo: ${URL} armazena o endereço do site que será testado.

Keywords:
    São blocos de ações reutilizáveis, como abrir um site, verificar algo ou fechar o navegador.
    Cada Keyword pode ter uma descrição ([Documentation]) para explicar o que ela faz.

Test Cases:
    Representam os cenários de teste.
    Cada Test Case é composto por Keywords, que definem as ações a serem realizadas.


Dicas para iniciantes:
    Sempre use variáveis para valores que podem mudar (como URLs ou configurações).
    Divida ações repetitivas em Keywords para evitar duplicação.
    Use [Documentation] para descrever o que cada Keyword ou Test Case faz, facilitando o entendimento.
    Essa estrutura básica é um bom ponto de partida para criar testes automatizados com Robot Framework.

# ==================================================================================================================== #
Explicação sobre as tags:

O que são tags?
    Tags são rótulos que você pode adicionar aos seus casos de teste para categorizá-los.
    Elas ajudam a filtrar e executar apenas testes específicos, dependendo da necessidade.

Como usar tags?
    Adicione [Tags] logo abaixo de [Documentation] no caso de teste.
    Separe múltiplas tags com espaços.
        Exemplo: [Tags]    login    sucesso

Por que usar tags?
    Para organizar os testes por categorias, como login, navegação, regressão, etc.
    Para executar apenas um subconjunto de testes com base nas tags.

Como executar testes com tags específicas?
    No terminal use o comando: robot --include <tag> path/to/tests
    Isso executará apenas os testes com a tag especificada.

    Explicação:
        --exclude <tag>: Essa opção indica que todos os testes marcados com a tag especificada (<tag>)
        ...    serão ignorados durante a execução.
        path/to/tests: Especifica o caminho para os arquivos de teste ou diretórios que você deseja executar.


Tags são usadas somente na sessão de test cases?
    No Robot Framework, as tags são usadas principalmente na seção de Test Cases, mas elas também podem
    ...    ser aplicadas em Tasks (caso você esteja usando o Robot Framework para automação de tarefas
    ...    em vez de testes). No entanto, tags não são usadas diretamente em outras seções, como
    ...    *** Keywords *** ou *** Variables ***.

    A principal função das tags é categorizar e organizar os casos de teste ou tarefas, permitindo que você
    ...    execute ou exclua subconjuntos específicos de testes com base nas tags. Elas não têm utilidade
    ...    prática fora da seção de Test Cases ou Tasks, pois essas são as unidades executáveis no Robot Framework.


Benefícios:
Facilita a execução seletiva de testes.
Melhora a organização e manutenção do conjunto de testes.
Permite agrupar testes relacionados para diferentes cenários ou funcionalidades.

# Fim da sessão de comentários.
