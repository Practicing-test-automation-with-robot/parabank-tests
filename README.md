
# 🧪 Small Daily Challenges - Test Automation with Robot Framework

Bem-vindo(a) ao repositório de desafios diários de automação com **Robot Framework**! Este projeto foi criado para praticar, aprender e dominar a criação de testes automatizados com foco em qualidade e boas práticas. 💪

---

## 📁 Estrutura de Pastas

```
small-daily-challenges/
├── .git/                     # Dados de versionamento
├── README.md                 # Este arquivo incrível que você está lendo
├── .gitignore                # Ignora arquivos temporários, swp, etc.
├── struture.robot            # Script com estrutura de exemplo dos testes
```

---

## 🚀 Requisitos

Antes de tudo, tenha o seguinte instalado na sua máquina:

- [Python 3.8+](https://www.python.org/)
- [pip](https://pip.pypa.io/en/stable/)
- [Robot Framework](https://robotframework.org/)

Instale o Robot Framework com pip:

```bash
pip install robotframework
```

Para rodar testes com navegador, adicione:

```bash
pip install robotframework-seleniumlibrary
```

---

## ▶️ Como Rodar os Testes

1. Acesse a pasta do projeto:

```bash
cd small-daily-challenges
```

2. Execute o comando:

```bash
robot struture.robot
```

3. Confira os relatórios gerados na pasta padrão `output`:
   - `report.html`: relatório completo
   - `log.html`: log detalhado
   - `output.xml`: útil para CI/CD

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
