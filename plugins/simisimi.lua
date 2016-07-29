local namefa = "ای ان اس"
local nameen = "[Ee][Nn][Ss]"
local function get_response(text)
if text:match(nameen) then
  text = text:gsub(nameen.." ","")
end
if text:match(namefa) then
  text = text:gsub(namefa.." ","")
end
local lang = redis:get('simsimi:lang')
local myurl = 'https://iteam-co.ir/simsimi.php?msg='..URL.escape(text)..'&lang='..lang
return https.request(myurl)
end
local function action_by_reply(extra, success, result)
if success then
  local bot = our_id
  if result.from.peer_id == tonumber(bot) then
    local msg2 = extra.msg
  local matn = msg2.text
    reply_msg(msg2.id, get_response(matn), ok_cb, true)
  end
  end
end
function run(msg, matches)
local text = msg.text
 if text:match("[#&][Ss]etlang (.*)") and is_sudo(msg) then
  local lang = text:match("[#&][Ss]etlang (.*)")
    redis:set('simsimi:lang',lang)
    return 'Lang Set To '..lang
  elseif text:match(nameen.." (.*)") then
  reply_msg(msg.id, get_response(text), ok_cb, true)
  elseif text:match(namefa.." (.*)") then
  reply_msg(msg.id, get_response(text), ok_cb, true)
  elseif msg.reply_id then
    get_message(msg.reply_id, action_by_reply, {msg=msg})
  end
  end
return {
   patterns = {
"(.*)"
},
   run = run
}
