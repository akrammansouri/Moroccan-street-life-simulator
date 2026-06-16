-- Morocco Street Hustle Simulator
-- DataStoreManager.lua

local DataStoreService = game:GetService("DataStoreService")
local Players = game:GetService("Players")

local DataStore = DataStoreService:GetDataStore("MoroccoHustleData")

local DEFAULT_DATA = {
	Cash = 500,
	Level = 1,
	XP = 0,
	OwnedVehicles = {},
	OwnedHouses = {},
	JobsCompleted = 0,
	LastDaily = 0,
	DailyStreak = 0
}

local DataStoreManager = {}

function DataStoreManager:Load(player)
	local userId = player.UserId
	local success, data = pcall(function()
		return DataStore:GetAsync(userId)
	end)
	
	local playerData = {}
	
	if success and data then
		for k, v in pairs(DEFAULT_DATA) do
			playerData[k] = data[k] or v
		end
	else
		for k, v in pairs(DEFAULT_DATA) do
			playerData[k] = v
		end
	end
	
	-- Leaderstats
	local ls = Instance.new("Folder")
	ls.Name = "leaderstats"
	
	local cash = Instance.new("NumberValue")
	cash.Name = "Cash"
	cash.Value = playerData.Cash
	cash.Parent = ls
	
	local level = Instance.new("NumberValue")
	level.Name = "Level"
	level.Value = playerData.Level
	level.Parent = ls
	
	ls.Parent = player
	player:SetAttribute("Data", playerData)
	
	print(player.Name .. " loaded! Cash: $" .. playerData.Cash)
end

function DataStoreManager:Save(player)
	local data = player:GetAttribute("Data")
	if not data then return end
	
	local success = pcall(function()
		DataStore:SetAsync(player.UserId, data)
	end)
	
	if success then
		print(player.Name .. " saved!")
	end
end

function DataStoreManager:AddCash(player, amount)
	local data = player:GetAttribute("Data")
	if data then
		data.Cash = data.Cash + amount
		local ls = player:FindFirstChild("leaderstats")
		if ls then
			local cash = ls:FindFirstChild("Cash")
			if cash then cash.Value = data.Cash end
		end
	end
end

function DataStoreManager:Init()
	Players.PlayerAdded:Connect(function(p)
		self:Load(p)
	end)
	
	Players.PlayerRemoving:Connect(function(p)
		self:Save(p)
	end)
	
	task.spawn(function()
		while true do
			task.wait(60)
			for _, p in ipairs(Players:GetPlayers()) do
				pcall(function() self:Save(p) end)
			end
		end
	end)
end

return DataStoreManager
