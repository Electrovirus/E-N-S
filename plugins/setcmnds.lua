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
    redis:hset(hash, name, value)
    return "Done!"
  end
end
local function get_variables_hash(msg)
  if msg.to.type == 'chat' or 'channel' then
    return 'botcommand:variables'
  end
end 

local function get_value(msg, var_name)
  local hash = get_variables_hash(msg)
  if hash then
    local value = redis:hget(hash, var_name)
    if not value then
      return
    else
      return value
    end
  end
end

local function run(msg, matches)
if matches[1]:lower() == 'setcommand' then
  if not is_momod(msg) then
    return "Moderators only!"
  end
  local name = string.sub(matches[2], 1, 50)
  local value = string.sub(matches[3], 1, 1000)
  local name1 = user_print_name(msg.from)
  local text = save_value(msg, name, value)
  return text
end
 if matches[1] == '!' or '/' or '#' then
    return get_value(msg, matches[2])
  else
    return
  end
end
return {
  patterns = {
   "^[!/#](setcommand) ([^%s]+) (.+)$",
   "^([!/#])(.+)$",
  }, 
  run = run 
}
end
