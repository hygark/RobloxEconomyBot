-- RobloxEconomyBot.lua - Bot para automação de economia em Roblox
-- Criado por Inflavelle (2022)
-- Descrição: Este script automatiza a coleta de itens, análise de inventário e trocas com NPCs em jogos Roblox que possuem mecânicas de economia.
-- Nota: Use apenas em servidores privados ou para testes. Automação pode violar os Termos de Serviço do Roblox.

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local HttpService = game:GetService("HttpService")  -- Para logging opcional via webhooks (exemplo avançado)

-- Configurações (expanda conforme necessário)
local Settings = {
    CollectInterval = 1,            -- Intervalo em segundos para coleta de itens
    TradeThreshold = 100,           -- Valor mínimo do inventário para iniciar troca
    LogWebhook = "",                -- URL de webhook para logging (opcional, ex.: Discord webhook)
    NPCTraderName = "NPCTrader",    -- Nome do NPC para troca
    MaxItemsToCollect = 50,         -- Limite máximo de itens para evitar sobrecarga
}

-- Função para coletar itens
local function collectItems()
    local remote = ReplicatedStorage:FindFirstChild("CollectItemEvent")
    if not remote then
        warn("RemoteEvent 'CollectItemEvent' não encontrado!")
        return
    end
    
    local itemsCollected = 0
    for _, item in pairs(Workspace.Items:GetChildren()) do
        if item:IsA("Model") and itemsCollected < Settings.MaxItemsToCollect then
            remote:FireServer(item)
            itemsCollected = itemsCollected + 1
        end
    end
    print("Itens coletados: " .. itemsCollected)
end

-- Função para analisar inventário
local function analyzeInventory()
    local inventory = LocalPlayer:FindFirstChild("Inventory")
    if not inventory then
        warn("Inventário não encontrado no personagem!")
        return 0
    end
    
    local totalValue = 0
    for _, item in pairs(inventory:GetChildren()) do
        if item:IsA("IntValue") or item:IsA("NumberValue") then  -- Assumindo itens com valor numérico
            totalValue = totalValue + item.Value
        end
    end
    print("Valor total do inventário: " .. totalValue)
    return totalValue
end

-- Função para trocar itens
local function tradeItems(inventoryItems)
    local tradeRemote = ReplicatedStorage:FindFirstChild("TradeEvent")
    if not tradeRemote then
        warn("RemoteEvent 'TradeEvent' não encontrado!")
        return
    end
    
    local npc = Workspace:FindFirstChild(Settings.NPCTraderName)
    if not npc then
        warn("NPC '" .. Settings.NPCTraderName .. "' não encontrado!")
        return
    end
    
    tradeRemote:FireServer(npc, inventoryItems)
    print("Troca iniciada com " .. Settings.NPCTraderName)
end

-- Função para logging (opcional, via webhook)
local function logEvent(message)
    if Settings.LogWebhook == "" then return end
    
    local data = {
        content = "[EconomyBot] " .. message
    }
    local jsonData = HttpService:JSONEncode(data)
    
    local success, err = pcall(function()
        HttpService:PostAsync(Settings.LogWebhook, jsonData, Enum.HttpContentType.ApplicationJson)
    end)
    
    if not success then
        warn("Erro ao enviar log: " .. err)
    end
end

-- Loop principal
local function mainLoop()
    while true do
        collectItems()
        local totalValue = analyzeInventory()
        if totalValue >= Settings.TradeThreshold then
            local inventory = LocalPlayer:FindFirstChild("Inventory")
            local items = inventory and inventory:GetChildren() or {}
            tradeItems(items)
            logEvent("Troca realizada! Valor total: " .. totalValue)
        end
        task.wait(Settings.CollectInterval)
    end
end

-- Iniciar o bot
mainLoop()