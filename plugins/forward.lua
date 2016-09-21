function run(msg, matches)
local hash = 'shield:ver:bot'
local num = redis:get(hash)
if matches[1]:lower() == 'msgid' and msg.reply_id then
return msg.reply_id
end
if matches[1]:lower() == 'fwd' then
num = matches[2]
      fwd_msg(get_receiver(msg), num, ok_cb, false)
end
if matches[1]:lower() == 'fwd' and msg.reply_id then
      fwd_msg(get_receiver(msg), msg.reply_id, ok_cb, false)
end
if matches[1]:lower() == 'setfwd' and is_sudo(msg) then
num = matches[2]
redis:set(hash, num)
return 'ver fwd set'
end 
if matches[1]:lower() == 'setfwd' and is_sudo(msg) and msg.reply_id then
redis:set(hash, msg.reply_id)
return 'ver fwd set'
end
if matches[1]:lower() == 'delfwd' and is_sudo(msg) then
redis:del(hash)
return 'ver fwd del'
end
if matches[1]:lower() == 'fmsg' then
fwd_msg(get_receiver(msg), num, ok_cb, false)
end
end
return {
  patterns = {
"^[!/#]([Dd]elfwd)$",
"^[!/#]([Mm]sgid)$",
"^[!/#]([Ff]wd) (.*)$",
"^[!/#]([Ff]wd)$",
"^[!/#]([Ss]etfwd) (.*)$",
"^[!/#]([Ss]etfwd)$",
"^[!/#]([Ff]msg)$"
  },
  run = run
  }
