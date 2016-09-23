do

function run(msg, matches)
  return "Bot is online 🔰 You are safe\n❄@Ens_Tg❄"
end

return {
  description = "test bot if is online", 
  usage = "!ison : test",
  patterns = {
    "^[!/#](ison)$",
    "^([Ii]son)$"
  }, 
  run = run 
}

end 
