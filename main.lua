--!strict
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

-- Configuration
local DEFAULT_IMAGE_ID = "rbxassetid://103714063166368"
-- This points directly to your repository's raw JSON file
local JSON_URL = "https://raw.githubusercontent.com/Henrii202/Blox-Cup-Register/main/user.json"

-- Fetch and decode your user.json file
local function fetchUserImages(): { [string]: string }
	local success, result = pcall(function()
		return HttpService:GetAsync(JSON_URL)
	end)
	
	if success and result then
		local decodeSuccess, userTable = pcall(function()
			return HttpService:JSONDecode(result)
		end)
		if decodeSuccess then
			return userTable
		end
	end
	
	warn("Overhead Error: Failed to fetch or decode user.json from GitHub.")
	return {}
