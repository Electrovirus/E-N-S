do
local function save_value(msg, name, value)
  if (not name or not value) then
    return 
  end
  local hash = nil
  if msg.to.type == 'chat' or 'channel' then
    hash = 'botcommand:variables'
  end
  if hash then
    redis:hdel(hash, name, value)
    return "CMD deleted"
  end
end
local function run(msg, matches)
if matches[1]:lower() == 'delcmd' then
  if not is_sudo(msg) then
    return "فقط برای مدیر!"
  end
  local name = string.sub(matches[2], 1, 50)
  local value = string.sub(matches[3], 1, 1000)
  local name1 = user_print_name(msg.from)
  local text = save_value(msg, name, value)
  return text
end
end
return {
  patterns = {
   "^[!/#](delcmd) ([^%s]+) (.+)$",
   "^[!/#](delcmd) ([^%s])$",
   "^([!/#])(.+)$",
  }, 
  run = run 
}
end
