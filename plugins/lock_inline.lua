do
local function pre_process(msg)

    local inline = 'mate:'..msg.to.id
    if msg.text == '[unsupported]' and redis:get(inline) and not is_momod(msg) then
            delete_msg(msg.id, ok_cb, true)
end
    return msg
    end
    
 local function run(msg, matches)
if is_momod(msg) and matches[1] == "u" and matches[2] == "inline" then
local inline = 'mate:'..msg.to.id
redis:set(inline, true)
return "🔓Inline is unlocked in this group By : @"..(msg.from.username)
end
if is_momod(msg) and matches[1] == "l" and matches[2] == "inline" then
    local inline = 'mate:'..msg.to.id
    redis:del(inline)
    return = "🔒Inline is locked in this group By : @"..(msg.from.username)
  end
end
return {
    patterns ={
        '^[/!#](u)(inline)$',
        '^[/!#](l)(inline)$',
    },
run = run,
pre_process = pre_process 
}
end
