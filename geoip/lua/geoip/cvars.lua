/*
	
	by 0xymoron
	
	http://sidewaysgaming.net/portfolio/
	
	http://steamcommunity.com/profiles/76561198040553376
	
*/

local function getSources()

	local sources = geoip.api.sources
	
	local str = ""
	
	local tab = {}
	
	for k, v in pairs( sources ) do
	
		table.insert( tab, k )
	
	end
	
	str = table.concat( tab, "\n" )
	
	return str

end

CreateConVar( "geoip_api", 
	geoip.config.default_api, 
	FCVAR_ARCHIVE, 
	"Choose which API the GeoIP system will use \n\nCurrent API list:\n\n" .. getSources() .. "\n\nUsage: geoip_api 'name'" 
)