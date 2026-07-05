# Gerador de Relatório de Vendas
Este projeto evoluiu de uma ferramenta de automação via linha de comando para uma aplicação web interativa. O sistema gerencia dados de vendas armazenados em um arquivo CSV, permitindo o registro e a visualização de relatórios de forma prática.

## 🚀 Funcionalidades Atuais
Web App (Interface Gráfica)
Gestão via Navegador: Adicione novas vendas através de um formulário interativo.

Visualização Dinâmica: Tabela organizada com Data, Produto, Vendedor e Valor, lida diretamente do seu arquivo CSV.

Versão CLI (Linha de Comando)
Relatórios Automáticos: Exibe total de vendas, valor total e ticket médio.

Filtros Inteligentes: Busca por vendedor específico.

Exportação: Gera um arquivo relatorio.txt com o resumo das análises.

## 🛠️ Tecnologias Utilizadas
Linguagem: Ruby

Web Framework: Sinatra (para a interface web)

Gerenciamento de Dados: CSV

CLI: tty-prompt e terminal-table

## 💻 Como Rodar
### 1. Pré-requisitos
Certifique-se de ter o Ruby instalado em sua máquina.

### 2. Instale as dependências
No seu terminal, instale o Sinatra e os pacotes da CLI:
gem install sinatra tty-prompt terminal-table

### 3. Modos de Execução
Para usar a versão Web:
- ruby web.rb
- Acesse http://localhost:4567 no seu navegador.

Para usar a versão CLI original:
ruby app.rb

## 📈 Próximos Passos
[ ] Implementar banco de dados real (SQLite) para substituir o CSV.

[ ] Melhorar o visual da interface web com CSS (Bootstrap/Tailwind).

[ ] Adicionar gráficos dinâmicos de vendas.
