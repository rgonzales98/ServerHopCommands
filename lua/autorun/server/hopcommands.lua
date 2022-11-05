hop_advnum = 1
hop_getcurrentserverc = ""
hop_getcurrentserverip = ""
hop_serverinfo = {}
Hop_Com_Ver = "1.0";

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

Hop_AdTabL = tablelength(Hop_AdvertiseServers)
function CustomSendCommands( ply, text, public )
	if Hop_ServerSendCommands[text] then
		ply:SendLua("LocalPlayer():ConCommand('connect ".. Hop_ServerSendCommands[text] .."')")
    end	
end
hook.Add( "PlayerSay", "CustomSendCommandsh", CustomSendCommands );

if Hop_Adverts == true then
	timer.Create("hop_adverts", Hop_Delay, 0, function()
		hop_getcurrentserverc = Hop_AdvertiseServers[hop_advnum]
		hop_getcurrentserverip = Hop_ServerSendCommands[hop_getcurrentserverc] 
		http.Fetch( "http://5.152.206.182/serverinfoapi.php?server=".. hop_getcurrentserverip .."&version=".. Hop_Com_Ver .."",
			function( body, len, headers, code )
				hop_serverinfo = util.JSONToTable(body)
			end,
			function( error )
			end
		);
		if hop_advnum >= Hop_AdTabL then
			hop_advnum = 1
		else
			hop_advnum = hop_advnum + 1
		end
		for j,v in pairs(hop_serverinfo) do
            PrintMessage(HUD_PRINTTALK, "Type ".. hop_getcurrentserverc .." To Join ".. v["name"] .." **Players:".. v["players"] .."/".. v["maxplayers"] .." ** Map:".. v["map"] .."")	
        end
	end)
end