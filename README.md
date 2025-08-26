# **RobloxEconomyBot**

## Features:

Item Collection: Scans and collects items from Workspace.Items using a RemoteEvent (CollectItemEvent).
Inventory Analysis: Calculates the total value of items in the player’s inventory.
Automatic Trading: Initiates trades with a specific NPC when the inventory value reaches a configurable threshold.
Optional Logging: Sends logs to a webhook (e.g., Discord) to monitor actions.
Safety Limits: Restricts the number of items collected per cycle to prevent overload.

## Requirements:

Roblox Studio or Executor: To run the script, use Roblox Studio (as a LocalScript in StarterPlayerScripts) or an executor such as KRNL.

Game Structure: The game must have:
A folder Workspace.Items with item models.
RemoteEvents: CollectItemEvent and TradeEvent in ReplicatedStorage.
An NPC named "NPCTrader" in Workspace.
An "Inventory" folder in the local character with valued items.
Libraries: No external libraries required, but HttpService is used for logging (enable it in game settings if in Studio).

## Installation:

Create a Repository on GitHub (optional for versioning):
Go to github.com and create a new repository called "RobloxEconomyBot".
Clone the repo to your PC: git clone [https://github.com/hygark/RobloxEconomyBot.git](https://github.com/hygark/RobloxEconomyBot.git).
Add the Script:
Copy the content of RobloxEconomyBot.lua into a Lua file in your Roblox project or executor.

## Roblox Studio Setup:

Open your game in Roblox Studio.
Insert the script as a LocalScript in StarterPlayer > StarterPlayerScripts.
Enable HttpRequests in Game Settings > Security for webhook logging.

## Executor Setup:

Use an executor such as KRNL ([https://krnl.dev/](https://krnl.dev/)).
Load the script via loadstring(game\:HttpGet("[https://raw.githubusercontent.com/hygark/RobloxEconomyBot/main/RobloxEconomyBot.lua"))(](https://raw.githubusercontent.com/hygark/RobloxEconomyBot/main/RobloxEconomyBot.lua%22%29%29%28)).

## How to Make It Work?:

Adjust the Settings:
Open the script and edit the Settings table:
CollectInterval: Time between collections (in seconds).
TradeThreshold: Minimum value for trade.
LogWebhook: URL of a Discord webhook (create one in Discord > Server Settings > Integrations).
NPCTraderName: Name of the NPC for trading.
MaxItemsToCollect: Limit per cycle.

## Run the Script:

In Roblox Studio: Press Play and check the output console for logs.
In Executor: Inject and run it in-game. The bot will start collecting items automatically.

## Testing:

Spawn items in Workspace.Items.
Add values to the inventory manually or through game scripts.
Monitor the console or webhook for actions (e.g., "Items collected: 10").

## Stop the Bot:

The loop is infinite; to stop it, close the game or add an exit condition (e.g., while not stopFlag do).

## Usage Examples:

Basic Test: Run it in a game with scattered items. The bot will automatically collect and trade when the inventory reaches the threshold.
Advanced Logging: Configure a Discord webhook to receive real-time trade notifications.
Expansion: Add more RemoteEvents for specific games.

## Legal and Ethical Notice:

This script is for educational and private testing purposes only. Do not use in public games or for cheating, as it may result in bans.
Always respect Roblox’s Terms of Service.
For pentesting or ethical automation, adapt it to legal scenarios.
