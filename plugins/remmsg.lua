local function history(extra, suc, result)
for i=1, #result do
delete_msg(result[i].id, ok_cb, false)
end
if tonumber(extra.con) == #result then
send_msg(extra.chatid, ''..#result..'Massages has been removed', ok_cb, false)
else
send_msg(extra.chatid, 'All selected massages has been removed', ok_cb, false)
end
end
local function run(msg, matches)
if matches[1] == 'rem' and is_owner(msg) then
            if msg.to.type == 'channel' then
            if tonumber(matches[2]) > 999 or tonumber(matches[2]) < 1 then
            return "خطا عدد انتخاب شده باید زیر 1000 باشد"
            end
            get_history(msg.to.peer_id, matches[2] + 1 , history , {chatid = msg.to.peer_id, con = matches[2]})
        else
                         return "فقط مخصوص سوپرگروه می باشد"
        end
else
return "فقط مخصوص مدیران گروه می باشد"
end
end
return {
    patterns = {
        '^[!/#](rem) (%d*)$'
    },
    run = run
}
