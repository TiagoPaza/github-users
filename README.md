### Arquitetura do projeto (Clean Architecture)
##### 1. Por que:
    * Queremos determinar quais tipos de banco de dados usamos para armazenamento (podemos querer alterá-lo mais tarde)
    * Queremos aderir aos princípios SOLID, pois estamos usando OOP para este projeto.
    * Queremos garantir que as camadas de interface do usuário não se importem com o que está acontecendo na camada de dados.
    * Podemos querer separar cada camada em pacotes diferentes.
### Camadas.
##### 1. Presentation (Camada visual)  
    * Widgets
    * Cubit (gerencia apenas o estado da interface do usuário com base na lógica de negócios)

##### 2. Domain (Camada de lógica de negócios)
    * Entidades (ou models que a interface do usuário precisa)
    * Casos de uso (histórias de usuários)
    * Interface de repositórios
    * Geralmente uma função, mas pode haver mais se as funções estiverem relacionadas.

##### 3. Data layer (Camada de acesso a dados)
    * source
        * remotes (API)
        * locals (Database)
    * Repositories (Implementation from Domain layer)

##### 4. Outras informações sobre as camadas
![image](https://miro.medium.com/max/772/0*sfCDEb571WD-7EfP.jpg)

### Padrão DI
`Dependency Injection` é um ótimo padrão de projeto que nos permite eliminar dependências rígidas entre elementos e torna a aplicação mais flexível, fácil de expandir escalas e manter.
No projeto utilizamos o plugin `get_it` para implementar e também definimos classes para que você possa implementar facilmente.

### resources
      * Todos os recursos (imagens, fonts, videos, ...)
      * Antes de usá-los, declare o caminho na classe utilitária e o sufixo da classe

### Json parsing / serialization
Este projeto está implementando `json_serializable`. Ele usa `build_runner` para gerar arquivos. Se você fizer uma alteração nesses arquivos, precisará executar novamente o gerador usando `build_runner`:
```
flutter pub run build_runner build --delete-conflicting-outputs
```


### Build App
Você pode gerar o aplicativo usando os comandos:

#### Android

```
flutter build apk -t lib/main.dart
```

##### iOS

```
flutter build ios -t lib/main.dart
```
