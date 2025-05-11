
# 🧪 Small Daily Challenges - Test Automation with Robot Framework

Bem-vindo(a) ao repositório de desafios diários de automação com **Robot Framework**! Este projeto foi criado para praticar, aprender e dominar a criação de testes automatizados com foco em qualidade e boas práticas. 💪

### Site

Abaixo segue o link do site utilizado para elaboração dos testes, sistema bancário demo com login, transferências, extrato, etc.

- [Parabank demo](https://parabank.parasoft.com/parabank/index.htm)

---

## 📁 Estrutura de Pastas

```
small-daily-challenges/
├── .venv                     # Ambiente virtual Python para isolar dependências do projeto.
├── config                    # Arquivos de configuração do projeto.
├── libraries                 # Bibliotecas customizadas criadas para uso nos testes.
├── resources/     
   ├── auth/                  # Contém dados de login no arquivo env.resource.
   ├── keywords/              # Contém as Keywords reutilizáveis organizadas por funcionalidade.
   ├── variables/             # Contém as variáveis utilizadas nas Keywords e testes.
   ├── main.robot             # Arquivo principal que importa bibliotecas, pastas e arquivos necessários.
├── results                   # Diretório onde são armazenados os relatórios e logs das execuções.
├── tests/
   ├── api/                   # Suites de testes para APIs.
   ├── mobile/                # Suites de testes para aplicações mobile.
   ├── web/                   # Suites de testes para aplicações web.
   ├── structure_example.md   # Exemplo de estrutura de testes para iniciantes.
├── .gitignore                # Arquivo para ignorar arquivos e pastas desnecessários no controle de versão.
├── conftest.py               # Arquivo de configuração para o pytest.
├── Dockerfile                # Configuração para criar uma imagem Docker do projeto.
├── Jenkinsfile               # Pipeline de CI/CD para integração contínua no Jenkins.
├── pytest.ini                # Configurações específicas para o pytest.
├── README.md                 # Documentação principal do projeto.
```
---

### Links para Bibliotecas Utilizadas no `resources/main.robot`

- [BuiltIn](https://robotframework.org/robotframework/latest/libraries/BuiltIn.html)
- [Collections Library](https://robotframework.org/robotframework/latest/libraries/Collections.html)
- [DateTime Library](https://robotframework.org/robotframework/latest/libraries/DateTime.html)
- [OperatingSystem Library](https://robotframework.org/robotframework/latest/libraries/OperatingSystem.html)
- [String Library](https://robotframework.org/robotframework/latest/libraries/String.html)
- [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html)
- [FakerLibrary](https://github.com/guykisel/robotframework-faker)
- [Biblioteca Faker Python](https://faker.readthedocs.io/en/master/#basic-usage)
- [Providers/nomes para gerar dados fake]( https://faker.readthedocs.io/en/master/providers.html)

---

## ✅ Boas Práticas
Organização, clareza e padronização são a base de um bom projeto de automação. Aqui estão as boas práticas recomendadas para este repositório:

---
📄 Escrita de Testes
   - 🔤 Use nomes descritivos para seus testes, como Login com usuário válido ao invés de Teste1.
   - 📂 Separe os cenários por funcionalidades, organizando os testes em pastas como login/, checkout/, carrinho/, etc.
   - 🔁 Reutilize Keywords sempre que possível. Crie funções reutilizáveis em arquivos .robot dedicados à lógica de cada funcionalidade.
   - 🏷️ Adicione tags em seus testes ([Tags]) para permitir filtros em execuções específicas (ex: smoke, regression, login).
---

📐 Organização e Estrutura
   - 📁 Nomeie arquivos e pastas usando apenas letras minúsculas e com underscores (_) para separar palavras. Ex: login_test.robot, add_to_cart_test.robot.

   - 🗂️ Na pasta resources/keywords/, siga o padrão nome_da_funcionalidade_keywords.robot. Ex: login_keywords.robot, checkout_keywords.robot.

   - 🧩 Divida os arquivos por contexto:

```markdown
   tests/: arquivos de cenários (cenário de negócios)
   resources/keywords/: palavras-chave reutilizáveis
   resources/variables/: variáveis globais ou de ambiente
   output/: relatórios e logs
```

🛠️ Estrutura dos Testes

   -📋 Sempre utilize Suite Setup, Test Setup, Teardown, e Suite Teardown quando aplicável. Isso garante testes limpos, controlados e isolados.
   - ✍️ Use comentários claros dentro das Keywords, pulando linhas quando necessário para facilitar a leitura e manutenção:

```markdown
      *** Keywords ***
      Realizar Login Com Sucesso
         # Abre o navegador e acessa a página de login
         Open Browser    ${URL}    chrome
         
         # Preenche os dados do usuário
         Input Text    id=username    ${USERNAME}
         Input Text    id=password    ${PASSWORD}
         
         # Clica no botão de login
         Click Button    id=login
```

🧪 Evite depender de dados dinâmicos ou externos não controlados (como tempo de espera fixo, dados de terceiros etc.). Prefira Wait Until Element Is Visible ao invés de Sleep.

🔄 Controle de Versão e CI/CD
🚫 Não suba arquivos .log, .html, .xml, nem pastas output/. Garanta isso com um .gitignore bem configurado.
🧪 Para integração contínua, mantenha scripts como run_tests.sh e pipelines versionados no projeto.

---

## 🙌 Contribuindo

Quer contribuir? Show!

1. Faça um fork 🍴
2. Crie uma branch com seu desafio ou melhoria: `git checkout -b desafio-login`
3. Faça o push: `git push origin desafio-login`
4. Crie um Pull Request

---

## 🧙‍♂️ Inspiração e Objetivo

Este repositório nasceu da vontade de praticar com consistência e evoluir como QA Automation Engineer. Bora crescer juntos nessa jornada 🚀🔥

```Observação```: Há uma Wiki no repositório, onde anexarei meus aprendizados com a ferramenta.

