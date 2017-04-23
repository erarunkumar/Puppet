local function map_profile(record)
 -- Add username and password to returned map.
 -- Could add other record bins here as well.
 return map{tenantId=record.tenantId,
locId=record.locId,
startIP=record.startIP,
endIP=record.endIP,
city=record.city,
latitude=record.latitude,
longitude=record.longitude,
country=record.country,
regionCode=record.regionCode,
state=record.state,
countryCode=record.countryCode,
id=record.id
 }
end

function get_ip(stream,ip)
 local function filter_ipstart(record)
   return record.startIP <=ip 
 end
local function filter_ipend(record)
   return record.endIP >=ip 
 end
 return stream : filter(filter_ipstart):filter(filter_ipend): map(map_profile)
end
