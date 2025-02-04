-- Configurable option
local ShowName = true  -- Set to false to hide player name and server ID

Citizen.CreateThread(function()
    while true do
        local PlayerName = GetPlayerName(PlayerId())
        local id = GetPlayerServerId(PlayerId())

        SetDiscordAppId(YourApplicationIDHere) --- Discord Application ID (found on Discord Dev Portal)
        
        -- Show or hide player name and server ID based on the ShowName variable
        if ShowName then
            SetRichPresence(PlayerName.." ["..id.."]") --- Shows player name and server ID
        else
            SetRichPresence("") --- Hides player name and server ID
        end

        SetDiscordRichPresenceAsset('LargeIcon') --- This has too be set dev portal on the Application you used on line 6, add image in "Rich Presence" on Discord Dev Portal.

        SetDiscordRichPresenceAssetText('Arctic Development') --- Name on the Rich Presence (What shows up as the Title)

        SetDiscordRichPresenceAction(0, "Join", "fivem://connect/YourIpHere") --- First button (example: Join allows them to join the Server directly from discord.)
        SetDiscordRichPresenceAction(1, "Visit Website", "http://yourwebsitehere.com") --- Second button (example: Visit Website opens a link to your website.)

        Citizen.Wait(60000)
    end
end)
