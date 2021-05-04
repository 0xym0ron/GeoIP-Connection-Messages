/*
	
	by 0xymoron
	
	http://sidewaysgaming.net/portfolio/
	
	http://steamcommunity.com/profiles/76561198040553376
	
*/

if SERVER then

	util.AddNetworkString( "chat.AddText" )
	
	chat = {}
	
	function chat.AddText( ... )
	
		local args = { ... }
	
		if type( args[1] ) == "Player" then

			local ply = args[1]
			
			args[1] = nil

			net.Start( "chat.AddText" )
			
				net.WriteTable( args )
				
			net.Send( ply )
			
		else
		
			net.Start( "chat.AddText" )
			
				net.WriteTable( args )
				
			net.Broadcast()
		
		end
		
	end

end

if CLIENT then

	net.Receive( "chat.AddText", function( len )
		
		local args = net.ReadTable()

		chat.AddText( unpack( args ) )
		
	end )

end