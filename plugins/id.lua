do
function run(msg,match)
if matches[1] == "id" then
 return "════════════════════════\n👤"..msg.from.first_name.."━"..msg.from.last_name.."\n📶"..msg.from.username.."\n🆔"..msg.from.id.."\n════════════════════════\n👥"..msg.to.title.."\n🆔"..msg.to.id.."\n════════════════════════"
end
return {
  description = "id", 
  usage = "id",
  patterns = {
    "^[!#/](.*)$",
  },
  run = run
}
end
