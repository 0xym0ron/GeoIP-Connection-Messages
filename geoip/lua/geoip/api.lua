/*
	
	by 0xymoron
	
	http://sidewaysgaming.net/portfolio/
	
	http://steamcommunity.com/profiles/76561198040553376
	
*/

geoip.api = {}

geoip.api.sources = {

	["ipstack"] = {
	
		url = "http://api.ipstack.com/",
		key = "be4bdb22dd3f5e32b0500cef5760414e",
		
		func = 	function( api, ip )
		
			local tab = geoip.api.sources[api]

			local url = tab.url .. ip .. "?access_key=" .. tab.key
		
			return tostring( url )
		
		end,
		
		vars = function( cache, data )
			
			local tab = table.Copy( cache )
			
			tab.country_name = data.country_name or tab.country_name
			tab.country_code = data.country_code or tab.country_code
			tab.region_name = data.region_name or tab.region_name
			tab.region_code = data.region_code or tab.region_code
			tab.city = data.city or tab.city
			tab.zip = data.zip or tab.zip
			
			return tab
		
		end,
	
	},
	
	["ip-api"] = {
	
		url = "http://ip-api.com/json/",

		func = 	function( api, ip )
		
			local tab = geoip.api.sources[api]

			local url = tab.url .. ip
		
			return tostring( url )
		
		end,
		
		vars = function( cache, data )
			
			local tab = table.Copy( cache )
			
			tab.country_name = data.country or tab.country_name
			tab.country_code = data.countryCode or tab.country_code
			tab.region_name = data.regionName or tab.region_name
			tab.region_code = data.region or tab.region_code
			tab.city = data.city or tab.city
			tab.zip = data.zip or tab.zip
			
			return tab
		
		end,
	
	},	
	
	["nekudo"] = {
	
		url = "http://geoip.nekudo.com/api/",

		func = 	function( api, ip )
		
			local tab = geoip.api.sources[api]

			local url = tab.url .. ip
		
			return tostring( url )
		
		end,
		
		vars = function( cache, data )
			
			local tab = table.Copy( cache )

			if data.country == nil then return tab end
			
			tab.country_name = data.country.name or tab.country_name
			tab.country_code = data.country.code or tab.country_code
			tab.city = data.city or cache.city or tab.city
			
			return tab
		
		end,
	
	},		
	
	["geoiptools"] = {
	
		url = "https://geoip.tools/v1/json/",
		
		func = 	function( api, ip )
		
			local tab = geoip.api.sources[api]

			local url = tab.url .. "?q=" .. ip

			return tostring( url )
		
		end,
		
		vars = function( cache, data )
			
			local tab = table.Copy( cache )
			
			tab.country_name = data.country_name or tab.country_name
			tab.country_code = data.country_code or tab.country_code
			tab.region_name = data.region_name or tab.region_name
			tab.region_code = data.region_code or tab.region_code
			tab.city = data.city or tab.city
			tab.zip = data.zip_code or tab.zip
			
			return tab
		
		end,
	
	},	
	
	["ipsb"] = {
	
		url = "https://api.ip.sb/geoip/",
		
		func = 	function( api, ip )
		
			local tab = geoip.api.sources[api]

			local url = tab.url .. ip

			return tostring( url )
		
		end,
		
		vars = function( cache, data )
			
			local tab = table.Copy( cache )
			
			tab.country_name = data.country or tab.country_name
			tab.country_code = data.country_code or tab.country_code
			tab.region_name = data.region or tab.region_name
			tab.region_code = data.region_code or tab.region_code
			tab.city = data.city or tab.city
			tab.zip = data.postal_code or tab.zip
			
			return tab
		
		end,
	
	},	
	
	["geoplugin"] = {
	
		url = "http://www.geoplugin.net/json.gp",
		
		func = 	function( api, ip )
		
			local tab = geoip.api.sources[api]

			local url = tab.url .. "?ip=" .. ip

			return tostring( url )
		
		end,
		
		vars = function( cache, data )
			
			local tab = table.Copy( cache )
			
			tab.country_name = data.geoplugin_countryName or tab.country_name
			tab.country_code = data.geoplugin_countryCode or tab.country_code
			tab.region_name = data.geoplugin_regionName or tab.region_name
			tab.region_code = data.geoplugin_regionCode or tab.region_code
			tab.city = data.geoplugin_city or tab.city
			
			return tab
		
		end,
	
	},		
	
	["extremeiplookup"] = {
	
		url = "https://extreme-ip-lookup.com/json/",
		
		func = 	function( api, ip )
		
			local tab = geoip.api.sources[api]

			local url = tab.url .. ip

			return tostring( url )
		
		end,
		
		vars = function( cache, data )
			
			local tab = table.Copy( cache )
			
			tab.country_name = data.country or tab.country_name
			tab.country_code = data.countryCode or tab.country_code
			tab.region_name = data.region or tab.region_name
			tab.city = data.city or tab.city
			
			return tab
		
		end,
	
	},		
	
	["ipapi"] = {
	
		url = "https://ipapi.co/",
		
		func = 	function( api, ip )
		
			local tab = geoip.api.sources[api]

			local url = tab.url .. ip .. "/json/"

			return tostring( url )
		
		end,
		
		vars = function( cache, data )
			
			local tab = table.Copy( cache )
			
			tab.country_name = data.country_name or tab.country_name
			tab.country_code = data.country or tab.country_code
			tab.region_name = data.region or tab.region_name
			tab.region_code = data.region_code or tab.region_code
			tab.city = data.city or tab.city
			tab.zip = data.postal or tab.zip
			
			return tab
		
		end,
	
	},	

	["petabyet"] = {
	
		url = "http://api.petabyet.com/geoip/",
		
		func = 	function( api, ip )
		
			local tab = geoip.api.sources[api]

			local url = tab.url .. ip

			return tostring( url )
		
		end,
		
		vars = function( cache, data )
			
			local tab = table.Copy( cache )
			
			tab.country_name = data.country or tab.country_name
			tab.country_code = data.country_code or tab.country_code
			tab.region_name = data.region or tab.region_name
			tab.region_code = data.region_code or tab.region_code
			tab.city = data.city or tab.city
			tab.zip = data.postal_code or tab.zip
			
			return tab
		
		end,
	
	},		
	
	["ipinfo"] = {
	
		url = "https://ipinfo.io/",
		
		func = 	function( api, ip )
		
			local tab = geoip.api.sources[api]

			local url = tab.url .. ip .. "/json"

			return tostring( url )
		
		end,
		
		vars = function( cache, data )
			
			local tab = table.Copy( cache )
			
			tab.country_name = data.country or tab.country_name
			tab.country_code = data.country or tab.country_code
			tab.region_name = data.region or tab.region_name
			tab.city = data.city or tab.city
			tab.zip = data.postal or tab.zip
			
			return tab
		
		end,
	
	},	

}

function geoip.api.Format( ip )
	
	local api = GetConVarString( "geoip_api" ) or geoip.config.default_api
	
	if geoip.api.sources[api] == nil then 
	
		api = geoip.config.default_api 
		
	end
	
	local tab = geoip.api.sources[api]

	local func = tab.func
	
	local url = func( api, ip )
	
	return url
	
end

function geoip.api.Query( ply, func )
	
	local ip = "192.168.0.1"
	
	if type( ply ) == "string" then
		
		ip = ply
		
	elseif ply:IsPlayer() then
	
		ip = ply:IPAddress()
		
	end
	
	ip = ip:Split( ":" )[1]
	
	if !geoip.config.devmode then
	
		if geoip.hooks.data[ip] != nil then
		
			return ( func && func( geoip.hooks.data[ip] ) ) or geoip.hooks.data[ip]
	
		end
		
	end
	
	local api = GetConVarString( "geoip_api" ) or geoip.config.default_api
	
	if geoip.api.sources[api] == nil then 
	
		api = geoip.config.default_api 
		
	end	
	
	local format = geoip.api.Format( ip )
	
	local source = geoip.api.sources[api]
	
	local data = {}
	data.country_name = "Unknown"
	data.country_code = "Unknown"
	data.region_name = "Unknown"
	data.region_code = "Unknown"
	data.city = "Unknown"
	data.zip = "Unknown"

	if ( isstring( ip ) && ip == "none" ) or ( !isstring( ip ) && ( ply:IsPlayer() && ply:IsBot() ) ) then
		
		return ( func && func( data ) ) or data
	
	end
	
	if string.StartWith( ip, "192.168." ) then
		
		for k, v in pairs( data ) do
		
			data[k] = "localhost"
			
		end

		return ( func && func( data ) ) or data
	
	end

	http.Fetch( format, 
		
		function( body )
		
			local tab = util.JSONToTable( body )

			if !istable( tab ) then
				
				return ( func && func( data ) ) or data

			end
			
			data = source.vars( data, tab )
			
			geoip.hooks.data[ip] = data
			
			return ( func && func( data ) ) or data
			
		end,
		
		function( err )

			return ( func && func( data ) ) or data
		
		end
		
	)

end
