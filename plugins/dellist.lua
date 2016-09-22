do
function run(msg, matches)
if matches[1] == 'del' then 
      if not is_sudo(msg) then
        return "Sudo only!🚨"
      end
if matches[2] == 'gbanlist' then 
local hash = 'gbanned'
redis:del(hash)
send_large_msg(get_receiver(msg), "Globalban list was deleted🚧")
     end
if matches[2] == 'banlist' and is_owner(msg) then
local hash = 'banned:'..msg.to.id
redis:del(hash) 
send_large_msg(get_receiver(msg), "Ban list was deleted🚧")
         end
    end
 end

return {
  patterns = {
  "[!/#]([Dd]el) (.*)$",
  },
  run = run
}
end
