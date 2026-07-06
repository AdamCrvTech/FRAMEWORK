///////Explique tecnicamente o que é um objeto do tipo Future no Dart e por que ele é retornado por funções de requisição web.
Um **Future** é um objeto que representa um valor ou erro que estará disponível em algum momento no futuro. No Dart, requisições web retornam um `Future` porque a rede é **assíncrona**: o programa não pode "travar" esperando a resposta do servidor; ele continua executando outras tarefas até que os dados cheguem.

///////Qual é o impacto do comando await no fluxo de execução de uma função marcada como async?
O comando **await** pausa a execução da função atual até que o `Future` seja concluído.
* **No fluxo interno:** A linha seguinte ao `await` só executa após a resposta chegar.
* **No fluxo externo:** A thread principal (Event Loop) não trava; ela fica livre para processar outras interações (como animações na tela) enquanto aguarda.

///////Pesquise e explique brevemente o que significam os seguintes Status Codes do protocolo HTTP: 200, 401, 403 e 404.
| Código | Significado | Descrição |
| :--- | :--- | :--- |
| **200** | **OK** | A requisição foi bem-sucedida e o servidor retornou os dados. |
| **401** | **Unauthorized** | Falha na autenticação (você precisa de login/token). |
| **403** | **Forbidden** | Você está autenticado, mas não tem permissão para acessar o recurso. |
| **404** | **Not Found** | O recurso ou URL solicitada não foi encontrada no servidor. |

///////Por que a nossa função main principal precisa ter a assinatura alterada para Future<void> main() async quando chamamos operações dependentes de rede diretamente nela?
A função `main` é o ponto de entrada. Se você usa `await` dentro dela para operações de rede, ela precisa ser marcada como `async`. Alterar para `Future<void>` garante que o ambiente de execução do Dart saiba que deve esperar a conclusão das tarefas assíncronas antes de encerrar o processo do programa.

///////Qual é o papel da função jsonDecode quando recebemos a propriedade .body de uma resposta HTTP?
A propriedade `.body` de uma resposta HTTP chega quase sempre como uma **String** (texto puro). A função `jsonDecode` converte esse texto em uma estrutura de dados manipulável pelo Dart (geralmente um `Map<String, dynamic>` ou uma `List`), permitindo que você acesse os campos pelos nomes das chaves.


`
