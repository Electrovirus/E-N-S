local function history(extra, suc, result)
  for i=1, #result do
    delete_msg(result[i].id, ok_cb, false)
  end
  if tonumber(extra.con) == #result then
    send_msg(extra.chatid, '"'..#result..'"Recent group messages have been cleared', ok_cb, false)
  else
    send_msg(extra.chatid, '☑Messages cleared', ok_cb, false)
  end
end
local function run(msg, matches)
  if matches[1] == 'clean' and is_owner(msg) then
    if msg.to.type == 'channel' then
      if tonumber(matches[2]) > 10000 or tonumber(matches[2]) < 1 then
        return "🎌Selected messages must be more than 1"
      end
      get_history(msg.to.peer_id, matches[2] + 1 , history , {chatid = msg.to.peer_id, con = matches[2]})
    else
      return "📌Only in supergroups"
    end
  else
    return "👻You do not have acces"
  end
end

return {
    patterns = {
        '^[!/#](clean) msg (%d*)$'
    },
    run = run
}
