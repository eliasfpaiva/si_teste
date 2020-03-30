# PuQuizz

Aplicativo de quiz, para apoio acadêmico, criado para a disciplina de Desenvolvimento de Aplicações Distribuídas do 7º período do curso de Sistemas de Informação da PUC Minas de Contagem

## Comunicação com servidor de dados

As comunicações podem ser realizadas através de JSON

### 1. Após autenticação na API do SGA, tendo a matrícula do aluno, enviamos a matrícula ao back-end para que nos retorne
* Nome
* Avatar
* Lista de Disciplinas em que o aluno já esteve ou esteja matriculado, contendo:
    * Lista de Unidades de ensino das Disciplinas
    * Lista de Assuntos das Unidades de Ensino
    * Percentuais de acertos do aluno para cada assunto
* Lista de materiáis de apoio sugeridos, de acordo com o desempenho do usuário, levando em conta a qualificação dos materiáis

### 2. Após o aluno selecionar um assunto, mandamos a matrícula do usuário e o ID do assunto para que o back-end retorne
* Lista de questões do assunto
* Lista de respostas já dadas para este assunto pelo usuário corrente

### 3. Ao entrar na tela de Ranking e escolher uma forma de ranqueamento enviamos a forma e a matrícula para que o back-end retorne
* Lista ordenada pelo desempenho dos alunos que participaram do quiz, contendo nome e porcetagem de acertos, relativos ao timpo de ranking solicitado

### 4. Ao encerrar o app, enviamos a lista das novas respostas dadas para atualização da base de dados. E o back-end retorna
* Lista de materiáis de apoio sugeridos, de acordo com o desempenho do usuário, levando em conta a qualificação dos materiáis

### 5. Ao encerrar o app enviamos a lista qualificações atribuidas aos materiáis sugeridos.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
