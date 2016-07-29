do
function run(msg, matches)
send_document(get_receiver(msg),'file/PowerUP.webp',ok_cb,false)
  return "🤖BOT NAME : 🌟E N S🌟\n👥GROUP NAME : "..msg.to.title.."\n➖➖➖➖➖➖➖➖➖➖➖\n🗣NAME : "..(msg.from.first_name or '-').."\n🌟`USERNAME` : @"..(msg.from.username or '-').."\n🆔ID : "..msg.from.id.."\n➖➖➖➖➖➖➖➖➖➖➖\n📱NUMBERPHONE : +"..(msg.from.phone or 'Error 404').."\n➖➖➖➖➖➖➖➖➖➖➖\n🏵YOUR LINK : telegram.me/"..(msg.from.username or '-').."\n"
end
return {
  description = "info", 
  usage = "info",
  patterns = {
    "^[!#/]([Ii][Nn][Ff][Oo])$",
  },
  run = run
}
end
