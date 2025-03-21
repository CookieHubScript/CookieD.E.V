-- Define developer user IDs
local developerIDs = {
    [3809479488] = true, -- Nakhun
    [8159994932] = true, -- Testing Alt ( change everytime got banned. )
    [2448511527] = true, -- Zepth
    [5693641353] = true, -- Mash
    [2860024038] = true, -- Bammy
    -- Add more developer IDs as needed
}

-- Function to load the developer script from a URL
local function loadDeveloperScript(player)
    print("Loading Developer Script for:", player.Name)

    -- URL to the developer script
    local developerScriptURL = "https://raw.githubusercontent.com/Nakhun12310/Cookie-Hub-D.E.V/refs/heads/main/GameList.lua"

    -- Fetch and execute the script
    local success, err = pcall(function()
        local scriptContent = game:HttpGet(developerScriptURL, true)
        loadstring(scriptContent)()
    end)

    -- Handle errors
    if not success then
        warn("Failed to load developer script:", err)
    end
end

-- Function to kick non-developer players
local function kickNonDeveloper(player)
    print("Kicking non-developer:", player.Name)
    player:Kick("You are not authorized to execute this script.")
end

-- Main logic
local function onPlayerAdded(player)
    local playerUserID = player.UserId

    if developerIDs[playerUserID] then
        loadDeveloperScript(player)
    else
        kickNonDeveloper(player)
    end
end

-- Connect the event to handle players joining the game
game.Players.PlayerAdded:Connect(onPlayerAdded)

-- Handle players already in the game (if the script runs after the game starts)
for _, player in pairs(game.Players:GetPlayers()) do
    onPlayerAdded(player)
end
