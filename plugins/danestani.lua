local database = 'http://vip.opload.ir/vipdl/95/1/amirhmz/'
local function run(msg)
	local res = http.request(database.."danestani.db")
	local danestani = res:split(",") 
	return danestani[math.random(#danestani)]
end
return {
	description = "500 Persian danestani",
	usage = "!danestani : send random danestani",
	patterns = {
		"^[/#!]danestani$",
		"^(danestani)$"
		},
	run = run
}
