# HOSTARAGUAIA - Desafio: Criação de um Aplicativo de Filmes

## Objetivo
Criar um aplicativo para buscar filmes e séries, com funcionalidades para visualizar detalhes dos filmes, marcar favoritos e consultar a lista de favoritos.

## Requisitos Funcionais

### Tela Inicial:
- Caixa de texto para buscar filmes
- Ver favoritos

### Tela de Filme:
- Título
- Imagem
- Sinopse
- Ano
- Score
- Onde assistir
- Botão de favorito

### Tela de Favoritos:
- Lista de filmes com link para o filme
- Os favoritos podem ser salvos localmente usando um método de persistência (Hive)

### API Sugerida
- [Watchmode API](https://api.watchmode.com/)

## Requisitos Técnicos

### Gerenciamento de Estado:
Utilizar Bloc para o gerenciamento de estado

### Persistência de Dados:
Utilizar Hive para a persistência local de dados

### UI/UX:
- Interface amigável e intuitiva
- Design responsivo para diferentes tamanhos de tela
- Utilizar widgets adequados para construir a interface

## Critérios de Avaliação

### Funcionalidade:
- O aplicativo atende a todos os requisitos funcionais
- A navegação entre as telas funciona corretamente
- Deve funcionar em Android, iOS e web

### Código:
- Código limpo, bem organizado e seguindo padrão de Clean Code
- Uso adequado do gerenciamento de estado
- Implementação eficiente e correta da persistência de dados

### UI/UX:
- Interface visualmente agradável e fácil de usar
- Boa experiência do usuário na interação com o aplicativo

## Entrega

### Repositório:
- O candidato deve subir o código em um repositório no GitHub ou outra plataforma similar
- O repositório deve conter um `README.md` com instruções claras sobre como rodar o aplicativo

### Prazo:
- O candidato terá um prazo de 3 a 5 dias para completar o desafio

## Instruções para Rodar o Aplicativo

### Pré-requisitos:
- Flutter instalado na máquina ([Instalação do Flutter](https://flutter.dev/docs/get-started/install))
- Conta e chave de API da Watchmode API

### Passos:

1. **Clone o repositório:**
    ```sh
    git clone https://github.com/usuario/repo.git
    cd repo
    ```

2. **Instale as dependências:**
    ```sh
    flutter pub get
    ```

3. **Configure a API Key:**
    - Crie um arquivo `.env` na raiz do projeto
    - Adicione sua chave de API no formato:
      ```
      WATCHMODE_API_KEY=your_api_key_here
      ```

4. **Execute o aplicativo:**
    ```sh
    flutter run
    ```

### Observações:
- Certifique-se de que o emulador/simulador ou dispositivo físico está configurado e conectado.

## Conclusão

Este desafio visa avaliar suas habilidades em desenvolvimento com Flutter, incluindo a capacidade de implementar funcionalidades, organizar e escrever código de forma limpa e criar uma interface amigável para o usuário.