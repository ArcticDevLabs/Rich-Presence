# FiveM Discord Rich Presence

Enhance your FiveM server's presence on Discord with custom rich presence features! This script allows you to display real-time server details, including player count, server name, and more, in a stylish Discord status.

## Features
- Display server name, player count, and game mode
- Customizable rich presence text
- Automatically updates presence in real-time
- Easy to install and configure

## Installation
### Requirements
- A FiveM server
- FXServer (latest version)
- Basic knowledge of FiveM resource installation

### Steps
1. **Download the script**
   - Clone this repository or download the ZIP file and extract it into your FiveM resources folder.
   ```sh
   git clone https://github.com/ArcticDevLabs/Rich-Presence
   ```
2. **Move the resource**
   - Place the extracted folder in your server's `resources` directory.
3. **Add to server.cfg**
   - Open your `server.cfg` file and add the following line:
   ```cfg
   ensure AD_RichPres
   ```
4. **Update Config**
   - Edit everything in config too your liking.    
5. **Restart the server**
   - Restart your FiveM server and check if the rich presence is working.

## Configuration
To customize your rich presence:
1. Navigate to the `config.lua` file.
2. Modify the values as needed. Example:
   ```lua
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

           SetDiscordRichPresenceAsset('LargeIcon') --- This has to be set in the Discord Dev Portal, add image in "Rich Presence".
           SetDiscordRichPresenceAssetText('Astra Development') --- Name on the Rich Presence (What shows up as the Title)

           SetDiscordRichPresenceAction(0, "Join", "fivem://connect/YourIpHere") --- First button (Join allows direct server connection).
           SetDiscordRichPresenceAction(1, "Visit Website", "http://yourwebsitehere.com") --- Second button (Visit Website opens a link to your website).

           Citizen.Wait(60000)
       end
   end)
   ```
3. Save the file and restart the server.

## Troubleshooting
- Ensure you have set up a Discord Developer Application and copied the correct `ApplicationID`.
- Verify the `ensure AD_RichPres` line is in your `server.cfg`.
- Check your FiveM console for any errors related to the script.
- Make sure your images for rich presence are uploaded on Discord Developer Portal.

## Contributing
Pull requests are welcome! If you find an issue or have a feature request, feel free to open an issue on GitHub.

## License
This project is licensed under the MIT License.

## Credits
Developed by Astra Development

---
Feel free to customize this README as needed! 🚀
