# **RobloxEconomyBot**

## Funcionalidades:
Coleta de Itens: Escaneia e coleta itens do Workspace.Items usando um RemoteEvent (CollectItemEvent).
Análise de Inventário: Calcula o valor total dos itens no inventário do jogador.
Troca Automática: Inicia trocas com um NPC específico quando o valor do inventário atinge um limiar configurável.
Logging Opcional: Envia logs para um webhook (ex.: Discord) para monitorar ações.
Limites de Segurança: Limita o número de itens coletados por ciclo para evitar sobrecarga.

## Requisitos:
Roblox Studio ou Executor: Para executar o script, use Roblox Studio (como LocalScript em StarterPlayerScripts) ou um executor como KRNL.

Estrutura do Jogo: O jogo deve ter:
Um folder Workspace.Items com modelos de itens.
RemoteEvents: CollectItemEvent e TradeEvent em ReplicatedStorage.
Um NPC chamado "NPCTrader" em Workspace.
Um folder "Inventory" no personagem local com itens valorizados.
Bibliotecas: Nenhuma externa necessária, mas HttpService é usado para logging (habilite nas configurações do jogo se for no Studio).

## Instalação:

Crie um Repositório no GitHub (opcional para versionamento):
Vá para github.com e crie um novo repositório chamado "RobloxEconomyBot".
Clone o repo para o seu PC: git clone https://github.com/hygark/RobloxEconomyBot.git.
Adicione o Script:
Copie o conteúdo de RobloxEconomyBot.lua para um arquivo Lua no seu projeto Roblox ou executor.

## Configuração no Roblox Studio:
Abra seu jogo no Roblox Studio.
Insira o script como LocalScript em StarterPlayer > StarterPlayerScripts.
Habilite HttpRequests em Game Settings > Security para o webhook de logging.

## Configuração em Executor:
Use um executor como KRNL (https://krnl.dev/).
Carregue o script via loadstring(game:HttpGet("https://raw.githubusercontent.com/inflavelle/RobloxEconomyBot/main/RobloxEconomyBot.lua"))().

## Como Fazer Funcionar?:
Ajuste as Configurações:
Abra o script e edite a tabela Settings:
CollectInterval: Tempo entre coletas (em segundos).
TradeThreshold: Valor mínimo para troca.
LogWebhook: URL de um webhook Discord (crie um em Discord > Server Settings > Integrations).
NPCTraderName: Nome do NPC para troca.
MaxItemsToCollect: Limite por ciclo.

## Execute o Script:
No Roblox Studio: Pressione Play e verifique o output console para logs.
No Executor: Injete e execute no jogo. O bot começará a coletar itens automaticamente.

## Teste:
Spawne itens em Workspace.Items.
Adicione valores ao inventário manualmente ou via scripts do jogo.
Monitore o console ou webhook para ações (ex.: "Itens coletados: 10").

## Parar o Bot:
O loop é infinito; para parar, feche o jogo ou adicione uma condição de saída (ex.: while not stopFlag do).

## Exemplos de Uso:
Teste Básico: Rode em um jogo com itens espalhados. O bot coletará automaticamente e trocará quando o inventário atingir o threshold.
Logging Avançado: Configure um webhook Discord para receber notificações em tempo real de trocas.
Expansão: Adicione mais RemoteEvents para jogos específicos.

## Aviso Legal e Ético:
Este script é para fins educativos e testes privados. Não use em jogos públicos ou para cheating, pois pode resultar em banimentos.
Sempre respeite os Termos de Serviço do Roblox.
Para pentest ou automação ética, adapte para cenários legais.

## Contribuições:
Sinta-se livre para fork o repositório no GitHub e contribuir com melhorias, como suporte a mais eventos ou integração com GUIs.
