# Zombie Kill Machine V

## INTRODUÇÃO

**Descrição:** Este é um jogo de sobrevivência contra zombies onde o objetivo é ficar vivo o máximo de tempo possível. Você enfrenta ondas de inimigos cada vez mais difíceis,
precisa gerenciar recursos e tomar decisões rápidas pra não virar comida de zombie. A ideia é simples, mas viciante: quanto mais tempo você sobrevive, mais intenso
o jogo fica, tipo um desafio constante. Ideal pra quem curte ação, estratégia rápida e melhorar o próprio recorde a cada tentativa.

**Engine/Plataforma:** GameMaker

**Equipe:**
> *Lead programer: Michel Nathan Schauren*
> 
> *Secondary programmer: Arthur Nienov*
> 
> *Art designer: Kauã Bergmann*
> 
> *Sound developer: Vitor Dias Correia*
> 
> *Moral Suporter: Ayrton Oliveira Manhães*

**Regras importantes**
Depois de receber autorização para mexer no repositório. Lembre-se de seguir essas regras para manter a ordem do projeto.
1. Nunca comitar direto no `main`
2. Ter o seu próprio branch (ex:`Fulano-branch`)
3. Sempre que quiser adicionar as alterações do seu branch faça uma solicitação de Pull (Pull request)
4. Se tiver alguma ideia nova ou ache algum erro no jogo. Crie uma Issue.
5. Qualquer dúvida fale com o proprietário ou crie uma issue. 

---
## CONTROLE DE VERSIONAMENTO:
```

Formato: v0.0.0.0
v0.0.0.1 : Correções de bugs ou pequenos ajustes;
v0.0.1.0 : Adição de algo novo;
v0.1.0.0 : Grandes mudanças. Basicamente um bloco de adições compostas das adições do segundo ponto;
É importante dar um nome a esse tipo de atualização. Exemplo: (v1.21 - Modo Multiplayer);
v1.0.0.0 : Quase nunca acontece. Só se o jogo for refeitos ou se houver mudanças no formato de atualizações;

```

## 🎮 Tutorial GitHub – Como abriar o jogo e realizar atualizações

Este repositório é usado para desenvolver o jogo em equipe usando **GitHub + GameMaker**.  
Este guia é para quem **nunca usou GitHub**, tipo zero mesmo.

#### Objetivos:
1. [Criar conta no GitHub](https://github.com/MichelSchauren/Zombie-Kill-Machine-V-GameMaker/new/main?filename=README.md#1-criar-conta-no-github)
2. [Instalar o git](https://github.com/MichelSchauren/Zombie-Kill-Machine-V-GameMaker/new/main?filename=README.md#2-instalar-o-git)
3. [Instalar GitHub Desktop](https://github.com/MichelSchauren/Zombie-Kill-Machine-V-GameMaker/new/main?filename=README.md#3-instalar-o-github-desktop)
4. [Instalar Game Maker](https://github.com/MichelSchauren/Zombie-Kill-Machine-V-GameMaker/new/main?filename=README.md#4-instalar-o-gamemaker)
5. [Clonar o repositório](https://github.com/MichelSchauren/Zombie-Kill-Machine-V-GameMaker/new/main?filename=README.md#5-clonar-o-reposit%C3%B3rio)
6. [Criar o seu proprio Branch](https://github.com/MichelSchauren/Zombie-Kill-Machine-V-GameMaker/new/main?filename=README.md#6-criar-sua-pr%C3%B3pria-branch)
7. [Abrir repositorio no Game Maker](https://github.com/MichelSchauren/Zombie-Kill-Machine-V-GameMaker/new/main?filename=README.md#7-abrir-o-projeto-no-gamemaker)
8. [Atualizar jogo e fazer commits das atualizações](https://github.com/MichelSchauren/Zombie-Kill-Machine-V-GameMaker/new/main?filename=README.md#8-atualizar-e-fazer-commits)
9. [Fazer solicitações de Pull request](https://github.com/MichelSchauren/Zombie-Kill-Machine-V-GameMaker/new/main?filename=README.md#9-fazer-pull-request-pr)

#### Oque é ... ?
### 1. Git
> **O "Ctrl+Z" com superpoderes.**
> Imagine uma máquina do tempo para o seu código. O Git é um sistema que vigia seus arquivos e salva o histórico de tudo o que muda. Se você fizer uma besteira e quebrar o projeto, pode voltar no tempo para quando tudo funcionava.

### 2. Repositório
> Um repositório é o elemento mais básico do GitHub. É um lugar onde você pode armazenar seu código, seus arquivos e o histórico de revisão de cada arquivo. Os repositórios podem ter vários colaboradores e podem ser públicos ou particulares.

### 3. Clonagem de repositório (Clone)
> **O "Copiar e Colar" da nuvem para o seu PC.**
> É quando você baixa uma cópia exata de um projeto que está na internet (como no GitHub) para o seu computador. Diferente de um download comum, ele mantém uma "corda amarrada" com a versão online, permitindo que você envie e receba atualizações.

### 4. Commit
> **O "Checkpoint" do jogo.**
> Sabe quando você passa de fase e o jogo salva? Isso é um commit. É um pacote com as mudanças que você fez. Todo commit precisa de uma mensagem (tipo um post-it) explicando o que você mudou (ex: "Arrumei o botão de login").

### 5. Branch
> **O "Multiverso" ou Linha do Tempo Paralela.**
> Para não mexer no código principal (que está funcionando) e arriscar quebrar tudo, você cria uma *branch*. É uma cópia paralela onde você pode fazer bagunça, testar loucuras e errar à vontade. O código original fica lá, intacto e seguro.

<img width="899" height="310" alt="GitHub-Flow" src="https://github.com/user-attachments/assets/dff631b4-485b-441d-a575-51f8fde1f93e" />

### 6. Pull Request (PR)
> **O pedido de "Autorização para Mesclar".**
> Depois que você terminou de mexer na sua *branch* e viu que ficou bom, você abre um Pull Request. É basicamente você dizendo para o dono do projeto (ou sua equipe): *"Ei, terminei minha tarefa nessa linha do tempo paralela, vocês podem revisar e juntar (dar merge) no código principal?"*

### 7. Issues
> **A lista de tarefas e reclamações.**
> É o lugar onde a gente anota o que precisa ser feito. Pode ser um bug que encontraram ("O botão X não funciona"), uma ideia nova ("Deveríamos ter um modo escuro") ou apenas uma pergunta. É o quadro de "To-Do" do projeto.

Caso não tenha intendido algo, oque é bem possível, é recomendado pesquisar mais a fundo sobre esses conceitos.

---

### 🛠️ Parte 1: Instalação e Configuração

#### 1. Criar conta no GitHub
Se você ainda não tem, precisa de uma identidade na plataforma.
1. Acesse [github.com](https://github.com/).
2. Clique em **Sign up**.
3. Siga os passos para criar sua conta (é gratuito).

#### 2. Instalar o Git
O motor que faz tudo funcionar por baixo dos panos.
1. Baixe o Git aqui: [git-scm.com](https://git-scm.com/downloads).
2. Instale clicando em "Next" até o fim (as configurações padrão funcionam bem).

#### 3. Instalar o GitHub Desktop
A ferramenta visual que evita o uso de comandos complicados.
1. Baixe em [desktop.github.com](https://desktop.github.com/).
2. Instale e abra o programa.
3. Faça **Login** com a conta que você criou no passo 1.

#### 4. Instalar o GameMaker
A engine onde vamos criar o jogo.
1. Baixe e instale o GameMaker pelo site oficial ou Steam.
2. Certifique-se de que ele está abrindo corretamente.

---

### 🚀 Parte 2: Começando a Trabalhar

#### 5. Clonar o Repositório
Vamos trazer o projeto da nuvem para o seu computador.
1. No repositório do GitHub vai no botão verde `<> Code` e copia a URL (https://github.com/MichelSchauren/Zombie-Kill-Machine-V-GameMaker.git).
2. No **GitHub Desktop**, vá em `File` > `Clone repository...`.
3. Escolha a aba "URL".
4. Cole a URL que você copiou.
5. Em **Local Path**, procure a pasta dos projetos do Game Maker (O caminho é: `"C:\Users\SEU_USUARIO\GameMakerProjects\TemplateProjects"`).
6. Clique em **Clone**.
<img width="600" height="460" alt="GitHub Desktop 20_12_2025 13_29_08" src="https://github.com/user-attachments/assets/98026dcf-2db4-4849-b9a8-d1edef1afd3d" />

#### 6. Criar sua própria Branch
**Importante:** Nunca trabalhe diretamente na branch `main` ou `master`!
1. No GitHub Desktop, na barra superior, clique onde diz **Current Branch**.
2. Clique no botão **New Branch**.
<img width="960" height="660" alt="GitHub Desktop 20_12_2025 13_31_32" src="https://github.com/user-attachments/assets/38465f58-9fe2-4636-941b-3757d7ad5f36" />

3. Dê um nome para seu branch (de preferência: `Fulano-branch`).
4. Clique em **Create Branch**.
5. Agora você está na sua linha do tempo segura!
<img width="477" height="349" alt="GitHub Desktop 20_12_2025 13_33_25" src="https://github.com/user-attachments/assets/a06a999e-0c28-4d88-a0c6-0fb63d040b70" />

#### 7. Abrir o projeto no GameMaker
1. Abra o GameMaker.
2. Clique em **Open** e navegue até a pasta TemplateProjects (Passo 5).
3. Selecione o arquivo do projeto (`.yyp`).
<img width="776" height="518" alt="Start Page - GameMaker 20_12_2025 13_30_15" src="https://github.com/user-attachments/assets/4a1cd01d-c881-4363-b405-2ffa4a5871a8" />

---

### 💾 Parte 3: Salvando e Enviando

#### 8. Atualizar e fazer Commits
Depois de mexer no código ou criar assets no GameMaker. Há duas formas de fazer um commit (, ):
##### Direto no Game Maker
1. Antes de qualquer coisa é preciso habilitar o source control nas configuraçõs (depois de habilitado não é mais preciso fazer isso nas procimas vezes).
2. Depois de fazer suas alterações vá em `Source control` > `Commit Changes`.
3. Prepare todas as mudanças clicando em `Stage All`.
4. Faça um comentário sobre suas alterações. Coloque também a versão do jogo. Confira o [CONTROLE DE VERSIONAMENTO](https://github.com/MichelSchauren/Zombie-Kill-Machine-V-GameMaker/new/main?filename=README.md#controle-de-versionamento)
Obs: No exemplo esqueci de colocar a versão. Um exemplo melhor seria `v1.0.1.0 - Adicionei uma nova música` (Repare que como há a adição de algo novo a atulização é no segundo ponto).
5. Clique em `Commit` e seja feliz.
<img width="949" height="685" alt="Primeiro Jogo - GameMaker 20_12_2025 13_39_09" src="https://github.com/user-attachments/assets/9a04b5f5-fc81-4663-b580-5650c14dce31" />
Obs: No Game Maker tudo que for novo e não estiver commitado aparece com uma marcação vermelha. Aquilo que não sofreu nenhuma alteração aparecerá verde. 

6. Para enviar para a nuvem vá em `Source control` > `Push changes`.

##### Pelo GitHub Desktop mesmo
1. Salve tudo no GameMaker e volte para o **GitHub Desktop**.
2. Você verá uma lista dos arquivos que mudaram na lateral esquerda.
3. No campo **Summary** (canto inferior esquerdo), escreva um resumo do que fez (ex: "Adicionei sprite do inimigo").
4. Clique no botão azul **Commit to [nome-da-sua-branch]**.
5. **Muito Importante:** Para enviar para a nuvem, clique no botão **Push origin** (ou "Publish branch") que aparecerá no topo.


#### 9. Fazer Pull Request (PR)
Terminou sua tarefa e enviou (Push)? Hora de juntar com o projeto principal.
1. No GitHub Desktop, clique no botão **Create Pull Request** (geralmente um botão azul que aparece após o Push).
2. Isso abrirá o navegador no site do GitHub.
3. Verifique se as informações estão certas e clique no botão verde **Create pull request**.
4. Avise a equipe que o PR está aberto!

Se não tiver entendido algo pesquise mais a fundo sobre.
---
