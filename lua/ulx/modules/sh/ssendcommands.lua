if SendCommandUlx == true then
	function ulx.forcehopip( calling_ply, target_plys, servernameip )

		for k,v in pairs( target_plys ) do
			v:SendLua("LocalPlayer():ConCommand('connect ".. servernameip .."')")
		end
		ulx.fancyLogAdmin( calling_ply, "#A sent #T to another server", target_ply )
	end
	local forcehopip = ulx.command( "SendCommands", "ulx forcehopip", ulx.forcehopip, "!forcehopip" )
	forcehopip:addParam{ type=ULib.cmds.PlayersArg }
	forcehopip:addParam{ type=ULib.cmds.StringArg, hint="" }
	forcehopip:defaultAccess( ULib.ACCESS_SUPERADMIN )
	forcehopip:help( "Enter Other Servers IP." )
end