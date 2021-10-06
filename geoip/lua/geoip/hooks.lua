/*
	
	by 0xymoron
	
	http://sidewaysgaming.net/portfolio/
	
	http://steamcommunity.com/profiles/76561198040553376
	
*/

geoip.hooks = {}

geoip.hooks.store = geoip.hooks.store or {}

geoip.hooks.data = geoip.hooks.data or {}

function geoip.hooks.Add( typ, func )

	local str = tostring( math.Rand( 0, math.huge ) )

	geoip.hooks.store[typ] = str
	
	return hook.Add( typ, str, func )

end

geoip.hooks.Add( "PlayerConnect", function( name, ip )

	geoip.api.Query( ip, function( data )
	
		if ip == "none" then
			
			ip = name
		
		else 
		
			ip = ip:Split( ":" )[1]
		
		end
		
		geoip.hooks.data[ip] = data

		geoip.hooks.data[ip].connect_time = CurTime()
		
		chat.AddText( 
			
			Color( 0, 148, 255 ), name,
			color_white, " connected from ",
			Color( 0, 148, 255 ), data.country_name
			
		)
		
		geoip.MsgN( name .. " connected from " .. data.country_name )
	
	end )
	
end )

geoip.hooks.Add( "PlayerInitialSpawn", function( ply )

	local ip = ply:IPAddress()
	
	if ply:IsBot() then 
	
		ip = ply:Nick() 
	
	else
	
		ip = ip:Split( ":" )[1]
	
	end
	
	local data = geoip.hooks.data[ip]
	
	if data == nil then return end

	geoip.hooks.data[ip].spawn_time = CurTime()
	
	local time = string.NiceTime( CurTime() - data.connect_time )
	
	chat.AddText( 
		
		Color( 0, 148, 255 ), ply:Nick(),
		color_white, " has finished joining the server ",
		Color( 180, 180, 180 ), "(took " .. time .. ")"
		
	)
	
	geoip.MsgN( ply:Nick() .. " has finished joining the server (took " .. time .. ")" )

end )

geoip.hooks.Add( "PlayerDisconnected", function( ply )

	local ip = ply:IPAddress()
	
	if ply:IsBot() then 
	
		ip = ply:Nick()
	
	else
	
		ip = ip:Split( ":" )[1]
	
	end
	
	local data = geoip.hooks.data[ip]	
	
	if data == nil then return end

	local time = string.NiceTime( CurTime() - data.spawn_time )
	
	chat.AddText( 
		
		Color( 0, 148, 255 ), ply:Nick(),
		color_white, " has disconnected ",
		Color( 180, 180, 180 ), "(stayed for " .. time .. ")"
		
	)
	
	geoip.MsgN( ply:Nick() .. " has disconnected (stayed for " .. time .. ")" )

end )