do
function run(msg, matches)
  return "════════════════════════\n👤"..msg.from.first_name.."━"..msg.from.last_name.."\n📶@"..msg.from.username.."\n🆔"..msg.from.id.."\n════════════════════════\n👥"..msg.to.title.."\n🆔"..msg.to.id.."\n════════════════════════"
end
return {
  description = "info", 
  usage = "info",
  patterns = {
    "^[!#/]([Ii][Dd][Ss])$",
  },
  run = run
}
end
