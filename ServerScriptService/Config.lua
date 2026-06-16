-- Morocco Street Hustle Simulator
-- Config.lua

local Config = {}

Config.GameName = "Morocco Street Hustle Simulator"
Config.MaxPlayers = 50
Config.StartCash = 500
Config.XPPerLevel = 100
Config.MaxLevel = 100

Config.Jobs = {
	{id = 1, name = "Street Food Seller", pay = 80, xp = 10, level = 1},
	{id = 2, name = "Package Runner", pay = 120, xp = 15, level = 3},
	{id = 3, name = "Taxi Driver", pay = 250, xp = 25, level = 10},
	{id = 4, name = "Electronics Repair", pay = 400, xp = 35, level = 15},
	{id = 5, name = "Delivery Driver", pay = 800, xp = 50, level = 25},
	{id = 6, name = "Premium Courier", pay = 2500, xp = 100, level = 50}
}

Config.Vehicles = {
	Scooter = {name = "Marrakesh Scooter", price = 5000, speed = 60},
	Sedan = {name = "Casablanca Sedan", price = 25000, speed = 100},
	Sports = {name = "Desert Falcon", price = 150000, speed = 180},
	Luxury = {name = "Sultan's Royale", price = 500000, speed = 250}
}

Config.Houses = {
	Tier1 = {name = "Medina Studio", price = 50000},
	Tier2 = {name = "Modern Loft", price = 250000},
	Tier3 = {name = "Strip Penthouse", price = 1000000}
}

Config.DailyRewards = {
	{day = 1, cash = 500}, {day = 2, cash = 750}, {day = 3, cash = 1000},
	{day = 4, cash = 1500}, {day = 5, cash = 2000}, 
	{day = 6, cash = 3000}, {day = 7, cash = 5000}
}

return Config
