local function electrovirus(msg,matches)
local receiver = get_receiver(msg)
local kfwd = "on"..msg.to.id
if matches[1] == "kickfwd" then
redis:set(kfwd,true)
send_large_msg(receiver,"Send me forward msg from who want me to kick him ☑")
end
-- @Ev_official
if redis:get(kfwd) and msg.fwd_from then
    local kfwd = "on"..msg.to.id
    redis:del(kfwd)
channel_kick(receiver, 'user#id'..msg.fwd_from.peer_id, ok_cb, false)
return "☑done kicked "..msg.fwd_from.first_name.." from "..msg.to.title.."\n"
end
end
return {
    patterns = {
        "(.+)$",
        "(kickfwd)$",
        "(.*)"
    },
    run = electrovirus
}
