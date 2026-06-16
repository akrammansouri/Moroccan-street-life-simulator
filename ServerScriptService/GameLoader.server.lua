-- Morocco Street Hustle Simulator
-- GameLoader.server.lua

local DataStoreManager = require(script.DataStoreManager)
local Config = require(script.Parent.Parent.ReplicatedStorage.Config)

-- Create ReplicatedStorage folders
local replicatedStorage = game:GetService("ReplicatedStorage")

local shared = Instance.new("Folder")
shared.Name = "Shared"
shared.Parent = replicatedStorage

local events = Instance.new("Folder")
events.Name = "Events"
events.Parent = shared

-- Create remote events
local remoteNames = {"Notify", "UpdateCash", "UpdateLevel", "JobComplete"}
for _, name in ipairs(remoteNames) do
	local remote = Instance.new("RemoteEvent")
	remote.Name = name
	remote.Parent = events
end

-- Start systems
DataStoreManager:Init()

print("========================================")
print("🇲🇦 MOROCCO STREET HUSTLE SIMULATOR")
print("✅ Game loaded successfully!")
print("📊 Version: 1.0.0")
print("========================================")
