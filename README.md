## MovieListApp
Este é um aplicativo simples desenvolvido em Swift que consome uma API para exibir uma lista de filmes. O aplicativo permite visualizar os filmes, favoritar ou desfavoritar um filme conforme a preferência do usuário.

### Funcionalidades
- Listagem de Filmes: Exibe uma lista de filmes obtida a partir de uma API externa.

- Favoritar/Desfavoritar: O usuário pode favoritar um filme e visualizar sua lista de filmes favoritos.

- Interface Simples: Interface amigável e fácil de usar, criada com UIKit e implementada de maneira eficiente para boa experiência do usuário.

### Tecnologias Utilizadas
- Swift 5: Linguagem de programação principal para o desenvolvimento do app.

- UIKit: Framework para a criação da interface gráfica.

- Async Await: Para consumo da API e manipulação de dados.

- UserDefaults: Utilizado para armazenar filmes favoritados de forma persistente no dispositivo.

### Como Executar o Projeto
Clone o repositório:
- git clone https://github.com/jsleal13/movie-list-study
- Abra o projeto no Xcode: Navegue até a pasta do projeto e abra o arquivo .xcodeproj.

### Estrutura do Projeto (MVVM)
- Modelos: Representação dos filmes e objetos relacionados.
- Network: Camada responsável por fazer as requisições para a API.
- Views: Contém as interfaces que o usuário interage.
- Controllers: Lógica de controle entre a interface de usuário e a manipulação dos dados.
-UserDefaults: Armazena dados locais, como filmes favoritados.

### API
Este projeto consome uma API para listar os filmes. A API retorna uma lista de filmes em formato JSON, e os dados são processados para exibição no aplicativo.
