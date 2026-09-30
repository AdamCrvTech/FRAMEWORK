
-------------------Qual a função do modificador de acesso privado (o uso do underscore "_" antes do nome da variável) no Dart?
## 1. O Modificador de Acesso Privado (`_`)
No Dart, a privacidade não é baseada na **classe** (como no Java ou C#), mas sim na **biblioteca** (que, na prática, costuma ser o próprio arquivo `.dart`).
* **Função:** Ao adicionar um `_` antes do nome de uma variável ou método, você está dizendo ao compilador que aquele membro é "privado ao arquivo". 
* **Efeito:** Ele só pode ser lido ou modificado por códigos que estejam dentro do mesmo arquivo onde a classe foi definida.


 -----------------Explique com suas palavras a diferença prática entre acessar uma variável diretamente e acessá-la através de um Getter.
## 2. Acesso Direto vs. Getter
Imagine que você tem uma variável `double saldo`.
* **Acesso Direto:** É como deixar a caixa registradora aberta. Qualquer um pode ler o valor e, pior, alterá-lo sem que você saiba.
* **Getter:** Funciona como um "balcão de informações". Você pede o valor e o Getter te entrega. 
* **Diferença Prática:** O Getter permite que você processe o dado antes de entregá-lo (ex: formatar uma moeda ou aplicar um desconto) sem alterar a variável original. Além disso, você pode criar uma variável que é "somente leitura" para o mundo externo, expondo apenas o Getter e escondendo o Setter.


------------------Qual é a principal responsabilidade de um Setter dentro do conceito de Encapsulamento?
## 3. A Responsabilidade do Setter no Encapsulamento
A principal missão do Setter é a **Validação e Proteção**. 
Dentro do encapsulamento, o Setter garante que a consistência dos dados seja mantida. Em vez de permitir que alguém atribua `-500` a uma variável `idade`, o Setter intercepta essa tentativa, valida se o número é positivo e só então altera o valor interno. Ele é o "segurança" da sua variável.


------------------O que acontece no código se tentarmos acessar um atributo privado de uma classe estando em um arquivo diferente de onde ela foi declarada?
## 4. Acesso Privado em Arquivos Diferentes
Se você tentar acessar `objeto._atributoPrivado` a partir de um arquivo diferente de onde a classe foi criada, o Dart apresentará um **erro de compilação**. Para o compilador, aquele atributo simplesmente "não existe" fora do seu arquivo de origem.


------------------Explique o motivo pelo qual o Dart não permite instanciar diretamente uma classe abstrata (ex: var c = Conteudo();).
## 5. Por que não instanciar Classes Abstratas?
Uma classe abstrata é como um **projeto incompleto** ou um conceito geral. 
* **Exemplo:** Você não consegue "criar um Animal". Você cria um Cachorro ou um Gato. 
* **Motivo:** Classes abstratas geralmente possuem métodos sem implementação (métodos abstratos). Se o Dart permitisse `var c = Conteudo();` e você tentasse chamar um método que não tem código escrito, o programa travaria. Elas servem apenas como "molde" para outras classes.




--------------------O que faz a anotação @override e em quais situações seu uso é obrigatório?
## 6. A Anotação `@override`
A anotação `@override` informa ao compilador (e a outros programadores) que você está redefinindo um método que já existe na classe pai (superclasse).
* **Quando é obrigatória?** Tecnicamente, no Dart, ela **não é obrigatória** para o código funcionar, mas é uma "boa prática" altamente recomendada. 
* **Utilidade:** Ela evita erros de digitação. Se você tentar sobrescrever `fazerSom()` mas digitar `fazerSomm()`, o `@override` vai gerar um erro avisando que o método pai não existe, impedindo bugs silenciosos.


----------------Qual a utilidade da função jsonDecode da biblioteca dart:convert quando estamos lidando com leitura de arquivos36?
## 7. Utilidade do `jsonDecode`
Quando você lê um arquivo (como um arquivo `.json`), o conteúdo chega para o Dart como uma grande `String` de texto bruto.
* **Utilidade:** O `jsonDecode` transforma essa `String` em uma estrutura de dados que o Dart entende, geralmente um `Map<String, dynamic>` ou uma `List`. 
* Isso permite que você acesse os dados de forma fácil, como `meuMapa['nome']`, em vez de ter que manipular o texto manualmente.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

1. JSON: Objeto Único vs. Lista
Visualmente, a mudança principal está nos caracteres delimitadores que envolvem os dados:

Objeto Único: Começa e termina com chaves { }. Ele representa um único conjunto de "chave: valor".

Lista de Itens: O arquivo passa a ser envolvido por colchetes [ ]. Dentro desses colchetes, os objetos (separados por vírgulas) mantêm sua estrutura de chaves.

Exemplo Visual:

JSON
// Objeto Único
{ "titulo": "Inception" }

// Lista de Objetos
[
  { "titulo": "Inception" },
  { "titulo": "Interstellar" }
]
2. Entendendo List<Map<String, dynamic>>
Quando o Dart lê um JSON e tipamos dessa forma, ele está criando uma "caixa dentro de outra caixa":

List (A Lista): É a estrutura externa. O Dart entende que você tem uma coleção ordenada de elementos que podem ser percorridos um a um.

Map<String, dynamic> (O Mapa): É cada item individual dentro dessa lista.

String: Significa que as chaves (os nomes dos campos, como "nome", "ano") são sempre textos.

dynamic: Significa que o valor associado a essa chave pode ser qualquer coisa (um número, outro texto, um booleano ou até outra lista).

Em resumo: É uma lista de dicionários.

3. For Tradicional vs. For-in
For Tradicional (for (i=0; i < n; i++)):

Foco: No índice (a posição).

Funcionamento: Você controla manualmente de onde começa, onde termina e o passo da iteração. É mais "robusto" se você precisar manipular a posição (ex: pular de 2 em 2 ou acessar o elemento anterior).

Legibilidade: Mais poluído visualmente.

For-in (for (var item in dados)):

Foco: No objeto (o conteúdo).

Funcionamento: O Dart cuida de percorrer a lista do início ao fim automaticamente.

Legibilidade: Muito mais limpo e fácil de ler. Você não corre o risco de errar o tamanho da lista ou acessar um índice inexistente (out of bounds).

4. Polimorfismo e List<Conteudo>
A lista aceita ambos porque tanto Filme quanto Serie herdam de Conteudo (ou implementam essa interface).

Baseado no Polimorfismo, um objeto de uma subclasse pode ser tratado como um objeto de sua classe pai. Como Filme é um Conteudo e Serie é um Conteudo, o Dart permite que eles convivam na mesma lista tipada com a classe base. Isso facilita a criação de funções genéricas que funcionam para qualquer tipo de produção audiovisual sem precisar de listas separadas.

5. O Método .map() e o .toList()
Para que serve o .map(): Ele serve para transformar os dados. Ele percorre cada item da lista original e "mapeia" (converte) para um novo formato ou objeto. Por exemplo, transformar uma lista de Map (JSON) em uma lista de objetos Filme.

Por que usar .toList(): O método .map() no Dart não devolve uma lista de imediato, mas sim um Iterable (um objeto preguiçoso que só processa os dados quando necessário). O .toList() força o Dart a converter esse resultado de volta para uma List real, permitindo que você use métodos específicos de listas (como acessar por índice) e armazene o resultado permanentemente na memória.