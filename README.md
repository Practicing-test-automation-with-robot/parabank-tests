### 🧪 Small Daily Challenges – Test Automation with Robot Framework

Bem-vindo(a) ao repositório de desafios diários de automação com Robot Framework!
Este projeto foi criado para praticar, aprender e dominar a criação de testes automatizados com foco em qualidade e boas práticas. 💪

Este projeto utiliza o sistema bancário demo [ParaBank](https://parabank.parasoft.com/parabank/index.html), criado para fins educacionais e testes automatizados. O sistema oferece funcionalidades como login, transferências, extrato, etc.

--- 

##### 📁 Estrutura de Pastas
```bash
small-daily-challenges/
├── .venv/                       # Ambiente virtual Python para isolar dependências
├── config/                      # Arquivos de configuração do projeto
├── libraries/                   # Bibliotecas customizadas para os testes
├── resources/
│   ├── auth/                    # Dados de login e credenciais
│   ├── keywords/                # Keywords reutilizáveis organizadas por funcionalidade
│      ├── pages/                # Elementos e interações específicas de páginas (ex: login_page.robot)
│      ├── flows/                # Fluxos completos que combinam múltiplas páginas (ex: realizar_login.robot)
│      └── validations/          # Keywords específicas de validação (ex: validar_mensagem_erro.robot)
│   ├── locators/                # Variáveis globais e de ambiente
│   └── main.robot               # Arquivo principal com importações e setups
├── results/                     # Relatórios e logs de execução
├── tests/
│   ├── api/                     # Testes automatizados para APIs
│   ├── mobile/                  # Testes para aplicações mobile
│   ├── web/                     # Testes para aplicações web
│   └── structure_example.md     # Exemplo de estrutura para iniciantes
├── .gitignore                   # Exclusão de arquivos do versionamento
├── conftest.py                  # Configurações do Pytest
├── Dockerfile                   # Imagem Docker do projeto
├── Jenkinsfile                  # Pipeline de CI/CD para Jenkins
├── pytest.ini                   # Configurações do Pytest
└── README.md                    # Documentação principal
```
---
##### 📚 Bibliotecas Utilizadas (resources/main.robot)
- [BuiltIn](https://robotframework.org/robotframework/latest/libraries/BuiltIn.html)
- [Collections](https://robotframework.org/robotframework/latest/libraries/Collections.html)
- [DateTime](https://robotframework.org/robotframework/latest/libraries/DateTime.html)
- [OperatingSystem](https://robotframework.org/robotframework/latest/libraries/OperatingSystem.html)
- [String](https://robotframework.org/robotframework/latest/libraries/String.html)
- [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html)
- [FakerLibrary](https://github.com/guykisel/robotframework-faker)
- [Faker Python](https://faker.readthedocs.io/en/master/)
- [Providers - Faker](https://faker.readthedocs.io/en/master/providers.html)

---
##### ✅ Boas Práticas
✍️ Escrita de Testes

   1. Utilize nomes descritivos como Login com usuário válido
   2. Separe testes por funcionalidades e organize em pastas temáticas
   3. Reutilize Keywords sempre que possível
   4. Adicione tags como smoke, regression, login para filtros em execuções

--- 
##### 📐 Organização e Estrutura

   1. Nomeie arquivos/pastas com minúsculas e underscores: login_test.robot
   2. Padrão para arquivos de keywords: login_keywords.robot
--- 
##### Estrutura recomendada:

```bash
tests/ → cenários de testes
resources/keywords/ → palavras-chave reutilizáveis
resources/variables/ → variáveis globais
results/ → relatórios e logs
```
---
##### 🧪 Estrutura dos Testes

   1. Use Suite Setup, Test Setup, Teardown sempre que necessário
   2. Comente os testes claramente e use espaçamento para legibilidade:

```robot
*** Keywords ***
Realizar Login Com Sucesso
    # Abre navegador e acessa página
    Open Browser    ${URL}    chrome

    # Preenche credenciais
    Input Text    id=username    ${USERNAME}
    Input Text    id=password    ${PASSWORD}

    # Realiza login
    Click Button    id=login
```
---
##### 🔄 Controle de Versão e CI/CD

   * Evite versionar arquivos .log, .html, .xml ou diretórios de saída (results/)
   * Utilize .gitignore para manter o repositório limpo
   * Scripts e pipelines devem ser versionados: run_tests.sh, Jenkinsfile
---
##### 🤝 Contribuindo

   1. Faça um fork 🍴
   2. Crie uma branch: git checkout -b nome-do-desafio
   3. Envie suas alterações: git push origin nome-do-desafio
   4. Crie um Pull Request 🚀

###### ▶️ Como Executar

###### 1. Clone este repositório/fork:
```bash
git clone https://github.com/Practicing-test-automation-with-robot/parabank-tests.git
```

###### 2. Acesse o diretório do projeto:
```bash
cd parabank-tests
```

###### 3. Instale as dependências:
```bash
pip install -r requirements.txt
```

###### 4. Execute os testes:
```bash
robot tests/
```

--- 
##### ✨ Inspiração e Propósito

Este projeto nasceu da vontade de praticar com consistência e evoluir como QA Automation Engineer, unindo organização, boas práticas e aprendizado contínuo.

📌 Observação: Os aprendizados estão sendo registrados na [Wiki](https://github.com/Practicing-test-automation-with-robot/parabank-tests/wiki) do repositório.