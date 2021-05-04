/*
	
	by 0xymoron
	
	http://sidewaysgaming.net/portfolio/
	
	http://steamcommunity.com/profiles/76561198040553376
	
*/

geoip = geoip or {}

if SERVER then
	
	include( "geoip/config.lua" )
	include( "geoip/server.lua" )
	include( "geoip/api.lua" )
	include( "geoip/cvars.lua" )
	include( "geoip/hooks.lua" )
	include( "geoip/chat.lua" )
	
	AddCSLuaFile( "geoip/config.lua" )
	AddCSLuaFile( "geoip/chat.lua" )
	
end

if CLIENT then

	include( "geoip/config.lua" )
	include( "geoip/chat.lua" )
	
end