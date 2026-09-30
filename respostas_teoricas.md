# Parte II – Questões Teóricas

**1. O que é MVVM e qual a responsabilidade de cada camada?**
MVVM (Model–View–ViewModel) é um padrão que separa o app em três partes para o código ficar organizado.
- **Model:** representa os dados e as regras deles (ex.: classes `Usuario` e `Pedido`).
- **View:** é a tela, os widgets. Só mostra as informações e captura os cliques do usuário.
- **ViewModel:** fica entre a View e os dados. Guarda o estado da tela, tem a lógica e avisa a View quando algo muda.

**2. Papel da camada Service.**
A Service é a camada que conversa diretamente com o banco SQLite. Ela tem os comandos de inserir, buscar, atualizar e excluir. Assim a ViewModel não precisa saber como o banco funciona.

**3. Por que não acessar o banco direto na View?**
Porque mistura a interface com o acesso a dados, o código fica bagunçado e difícil de manter, de testar e de reaproveitar. Se o banco mudar, seria preciso alterar todas as telas. Além disso, operações no banco são assíncronas e podem travar a tela se forem mal feitas.

**4. Função do Provider.**
O Provider disponibiliza a ViewModel para os widgets da árvore. Com ele a View consegue ler os dados da ViewModel (`watch`/`Consumer`) e chamar métodos dela (`read`), sem precisar criar a ViewModel em cada tela. Também reconstrói a tela quando a ViewModel avisa que mudou.

**5. Para que servem ChangeNotifier e notifyListeners()?**
`ChangeNotifier` é uma classe que permite que outros objetos "escutem" suas mudanças. O `notifyListeners()` avisa a todos que estão escutando (as Views) que os dados mudaram, para que reconstruam a tela.

**6. O que acontece se alterar os dados e não chamar notifyListeners()?**
Os dados mudam na ViewModel, mas a interface não é atualizada e continua mostrando o valor antigo, pois ninguém foi avisado da mudança.

**7. O que é SQLite e vantagens?**
SQLite é um banco de dados relacional leve que fica dentro do próprio aplicativo, em um arquivo local. Vantagens: não precisa de servidor, funciona offline, é rápido, gratuito, simples de usar e guarda os dados mesmo depois de fechar o app.

**8. Diferença entre RAM e SQLite.**
Dados em variáveis ficam na memória RAM e são perdidos quando o app é fechado ou reiniciado. Dados no SQLite ficam gravados em arquivo no armazenamento do aparelho e continuam lá depois de fechar o app.

**9. O que é CRUD?**
É a sigla de **Create, Read, Update, Delete**:
- **Create (Criar):** cadastrar um novo registro.
- **Read (Ler):** consultar/listar registros.
- **Update (Atualizar):** alterar um registro existente.
- **Delete (Excluir):** remover um registro.

**10. Finalidade dos comandos SQL.**
- **INSERT:** insere um novo registro na tabela.
- **SELECT:** consulta e retorna dados da tabela.
- **UPDATE:** altera dados de registros que já existem.
- **DELETE:** remove registros da tabela.

**11. Fluxo View → ViewModel → Service → SQLite ao cadastrar um registro.**
1. **View:** o usuário preenche o formulário e clica no botão; a View chama um método da ViewModel passando os dados digitados.
2. **ViewModel:** valida os dados, monta o objeto (Model) e chama a Service.
3. **Service:** transforma o objeto em Map e executa o `INSERT` no banco.
4. **SQLite:** grava o registro no arquivo do banco.
Depois, a ViewModel recarrega a lista e chama `notifyListeners()`, e a View mostra o novo registro.

**12. Dados sumiram ao reiniciar o app. Possível causa?**
Os dados estavam sendo guardados só em memória (em uma lista/variável) e não foram gravados no SQLite. Outra causa possível é o banco ser recriado a cada abertura do app.

**13. Registro alterado no SQLite, mas a tela mostra o valor antigo.**
Provavelmente a ViewModel atualizou o banco mas não recarregou a lista, ou esqueceu de chamar `notifyListeners()`. Também pode ser que a View não esteja escutando a ViewModel (usando `read` em vez de `watch`/`Consumer`), então ela não é reconstruída.

**14. Violação de MVVM no código.**
A View (botão) está chamando `BancoService().inserirPedido(...)` diretamente, ou seja, está acessando a camada Service/banco sem passar pela ViewModel. Isso quebra o fluxo View → ViewModel → Service.
Forma correta: a View chama a ViewModel, e a ViewModel chama a Service:

```dart
// View
onPressed: () async {
  await context.read<PedidoViewModel>().adicionar(nomeController.text, ...);
}

// ViewModel
Future<void> adicionar(...) async {
  await _service.inserirPedido(pedido);
  await carregar();   // atualiza a lista e chama notifyListeners()
}
```

**15. Benefícios da separação View, ViewModel, Model e Service.**
- **Manutenção:** cada parte tem uma função; é fácil achar e corrigir erros e mudar uma camada sem quebrar as outras.
- **Testabilidade:** dá para testar a ViewModel e a Service sem depender das telas.
- **Escalabilidade:** fica mais fácil adicionar novas telas e funcionalidades e trabalhar em equipe, pois o código é organizado e com pouco acoplamento.
