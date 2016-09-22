local function openplugins(msg,matches)
if not is_admin1(msg) then
return false
end
local channel = "takween"..msg.from.id
if matches[1] =="setch" then
redis:set(channel, matches[2])
local reply = "😌Hi "..msg.from.first_name.."\n \n Your Channel 🖥 Has Been Saved 🙂🍃 \n "
    return reply_msg(msg.id, reply, ok_cb, false)
    end
    if matches[1] == "delch" then
    redis:del(channel)
    local reply = "🙇🏻Hi "..msg.from.first_name.."\n 👱🏻 Your Channel Has Been Removed 🍃😌"
        return reply_msg(msg.id, reply, ok_cb, false)
        end
        if matches[1] == "mych" then
        local reply = "👻Hi "..msg.from.first_name.."\n 🖥 Your Channel is : ("..redis:get(channel)..")\n"
            return reply_msg(msg.id, reply, ok_cb, false)
            end
            if matches[1] == "send" then
            local id = redis:get(channel)
            local text = matches[2]
       send_large_msg("channel#id"..id,text)
       local reply = "👻 Hi "..msg.from.first_name.."\n Your Msg "..matches[2].." Send To "..id.."\n"
                   return reply_msg(msg.id, reply, ok_cb, false)
                   end
                   end

  return {
  patterns = {
     "^[!/#](setch) (.+)",
     "^[!/#](delch)",
     "^[!/#](mych)",
     "^[!/#](send) (.+)"
  },
  run = openplugins,
}
