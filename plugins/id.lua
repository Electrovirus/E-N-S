do
function run(msg, matches)
  return "════════════《You》════════════\n👤"..msg.from.first_name.."\n📶@"..msg.from.username.."\n🆔"..msg.from.id.."\n════════════《Group》════════════\n👥"..msg.to.title.."\n🆔"..msg.to.id.."\n════════════════════════"
end
return {
  description = "info", 
  usage = "info",
  patterns = {
    "^[!#/]([Ii]dentify)$",
  },
  run = run
}
end
