# Planning Poker

![Planning Poker](https://github.com/phferreira/assets/blob/master/images/planning_poker_table.png)

Planning Poker é uma ferramenta colaborativa para estimativas em desenvolvimento ágil, desenvolvida em Flutter. O objetivo é facilitar o processo de tomada de decisão durante as reuniões de planejamento ágil, ajudando equipes a estimarem as histórias de usuário e tarefas de forma precisa e colaborativa.

## Sobre o Projeto

Este aplicativo simula a técnica de Planning Poker, onde membros da equipe atribuem valores numéricos às tarefas ou histórias com base em sua complexidade, tempo ou esforço. 

### Funcionalidades Principais

- **Salas de Estimativa:** Crie salas de estimativa onde os membros da equipe podem se juntar para estimar histórias de usuário.
- **Cartas de Estimativa Personalizáveis:** Os participantes podem escolher entre diferentes cartas de estimativa, incluindo séries de Fibonacci.
- **Estatísticas e Relatórios:** Veja as estimativas da equipe em tempo real e gere relatórios com base nas escolhas feitas por todos os participantes.
- **Plataforma:** A aplicação foi desenvolvida em Flutter e pode ser executada em navegadores web.

## Tecnologias Utilizadas

- **Flutter:** Framework utilizado para o desenvolvimento do front-end e back-end da aplicação.
- **Dart:** Linguagem de programação utilizada em conjunto com o Flutter.
- **Firebase:** Utilizado para autenticação e armazenamento de dados em tempo real (Firestore).
- **WebSocket:** Implementado para atualizações em tempo real durante o processo de estimativa.

## Acesse o Projeto

Você pode acessar a versão web deste projeto nos seguintes links:

[Planning Poker - Github Pages](https://flutter-web-playground.github.io/planning_poker/)
[Planning Poker - Firebase Hosting](https://planning-poker-6aaa3.web.app/)

## Como Executar o Projeto Localmente

### Requisitos

- **Flutter SDK**: Certifique-se de ter o Flutter instalado em seu sistema. Você pode seguir as instruções de instalação no [site oficial do Flutter](https://flutter.dev/docs/get-started/install).
- **Node.js**: Opcionalmente, para alguns pacotes e ferramentas de desenvolvimento web, o Node.js pode ser necessário.
- **Firebase**: Deve-se configurar as variaveis de ambiente para acesso à real-time-datebase do firebase.

### Passos para Execução

1. Clone este repositório:
   ```bash
   git clone https://github.com/flutter-web-playground/planning_poker.git
2. Navegue até o diretório do projeto:
   ```bash
   cd planning_poker
4. Configurar variáveis de ambiente
6. Instale as dependências do Flutter
   ```bash
   flutter pub get
7. Para executar a aplicação em ambiente web:
   ```bash
   flutter run -d chrome --dart-define-from-file=keys_path.json  
8. Abra o navegador no endereço http://localhost:8080 (ou a porta correspondente exibida no terminal) para visualizar a aplicação em execução.

### Contribuição
Contribuições são bem-vindas! Siga os seguintes passos para contribuir com o projeto:

1. Faça um fork do projeto.
2. Crie uma nova branch com sua feature ou correção de bug:
   ```bash
   git checkout -b minha-feature
3. Envie suas modificações
   ```bash
   git commit -m "Adiciona nova feature"
   git push origin minha-feature
5. Abra um Pull Request descrevendo suas alterações.

### Licença
Este projeto está licenciado sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.

### Contato
Para mais informações, você pode entrar em contato:

- Email: p.h.ferreirah@gmail.com
- LinkedIn: https://www.linkedin.com/in/paulo-henrique-ferreira/
