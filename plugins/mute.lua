do
local function muteuser(user_id, channel_id)
  local hash = 'mute:'..channel_id
  redis:sadd(hash, user_id)
end
local function is_mute(user_id, channel_id)
  local hash = 'mute:'..channel_id
  local muted = redis:sismember(hash, user_id)
  return muted or false
end
local function muteuser_by_reply(extra, success, result)
  vardump(result)
    if result.to.peer_type == "channel" then
		local channel = "channel#"..result.to.peer_id
		if tonumber(result.from.peer_id) == tonumber(our_id) then -- Ignore bot
			return "I won't silent myself"
		end
		local name = user_print_name(result.from)
		local hash = 'mute:'..result.to.peer_id
		if is_mute(result.from.peer_id, result.to.peer_id) then
			send_large_msg(channel, name.." ["..result.from.peer_id.."] removed from muted user list")
			redis:srem(hash, result.from.peer_id)
		else
			send_large_msg(channel, name.." ["..result.from.peer_id.."] added to muted user list")
			redis:sadd(hash, result.from.peer_id)
		end
	end
end
local function show_mute(msg, target)
  local text = "Mutes for:[ID:"..msg.to.id.."]:\n\nMute Documents: "..(redis:get("mute:document"..target) or 'no').."\nMute Contacts: "..(redis:get("mute:contact"..target) or 'no').."\nMute Audio: "..(redis:get("mute:audio"..target) or 'no').."\nMute Text: "..(redis:get("mute:text"..target) or 'no').."\nMute Video: "..(redis:get("mute:video"..target) or 'no').."\nMute Photo: "..(redis:get("mute:photo"..target) or "no").."\nMute Gifs: "..(redis:get("mute:gif"..target) or 'no').."\nMute All: "..(redis:get("mute:all"..target) or "no")
  return text
end

local function clean_mute(channel_id)
  local hash = 'mute:'..channel_id
  local list = redis:smembers(hash)
  for k,v in pairs(list) do
    redis:srem(hash, v)
  end
  return "Mutelist Cleaned"
end
local function mute_list(channel_id)
  local hash =  'mute:'..channel_id
  local list = redis:smembers(hash)
  local text = "Muted Users for: [ID:"..channel_id.."]:\n\n"
  local i = 1
  for k,v in pairs(list) do
    text = text..k.." - "..v.." \n"
  end
  return text
end
local function mute_res(extra, success, result)
    local member_id = result.peer_id
	local member = result.username
	local channel_id = extra.channel_id
	local mute_cmd = extra.mute_cmd
	local receiver = "channel#id"..channel_id
	if mute_cmd == "muteuser" then
	    if is_mute(member_id, channel_id) then
			send_large_msg(receiver, "["..member_id.."] removed from muted user list")
			local hash = 'mute:'..channel_id
			redis:srem(hash, member_id)
		else
			send_large_msg(receiver, "["..member_id.."] added to muted user list")
			return muteuser(member_id, channel_id)
		end
	end
end
local function run(msg, matches)
  local target = msg.to.id
  if matches[1] == "muteuser" then
    if type(msg.reply_id)~= "nil" then
	  msgreply = get_message(msg.reply_id, muteuser_by_reply, false)
	end
	if string.match(matches[2], '^%d+$') then
	  local user_id = matches[2]
	  local channel_id = msg.to.id
	  muteuser(user_id, channel_id)
	else
	  local cb_extra = {
	    channel_id = msg.to.id,
        mute_cmd = 'muteuser',
	  }
	  local username = matches[2]
	  local username = string.gsub(matches[2], "@", "")
	  resolve_username(username, mute_res, cb_extra)
	end
  end
  if matches[1] == "mutelist" then
    local channel_id = msg.to.id
	return mute_list(channel_id)
  end
  if matches[1] == "mute" and is_momod(msg) then
    if matches[2]:lower() == "audio" then
      redis:set("mute:audio"..target, "yes")
      return "Mute Audio has been enabled"
    end
    if matches[2]:lower(0) == "text" then
      redis:set("mute:text"..target, "yes")
      return "Mute Text has been enabled"
    end
    if matches[2]:lower() == "video" then
      redis:set("mute:video"..target, "yes")
      return "Mute Video has been enabled"
    end
    if matches[2]:lower() == "photo" then 
      redis:set("mute:photo"..target, "yes")
      return "Mute Photo has been enabled"
    end
    if matches[2]:lower() == "all" then
      redis:set("mute:all"..target, "yes")
      return "Mute All has been enabled"
    end
	if matches[2]:lower() == "gifs" then
	  redis:set("mute:gif"..target, "yes")
	  return "Gifs posting has been muted"
	end
	if matches[2]:lower() == "contacts" then
	  redis:set("mute:contact"..target, "yes")
	  return "Share contacts has been muted"
	end
	if matches[2]:lower() == "document" then
	  redis:set("mute:document"..target, "yes")
	  return "Mute Documents has been enabled"
	end
  end
  if matches[1] == "unmute" and is_momod(msg) then
    if matches[2]:lower() == "audio" then
      redis:del("mute:audio"..msg.to.id)
      return "Mute Audio has been disabled"
    end
    if matches[2]:lower() == "text" then
      redis:del("mute:text"..msg.to.id)
      return "Mute Text has been disabled"
    end
    if matches[2]:lower() == "photo" then
      redis:del("mute:photo"..msg.to.id)
      return "Mute Photo has been disabled"
    end
    if matches[2]:lower() == "video" then
      redis:del("mute:video"..msg.to.id)
      return "Mute Video has been disabled"
    end
    if matches[2]:lower() == "all" then
      redis:del("mute:all"..msg.to.id)
      return "Mute All has been disabled"
    end
	if matches[2]:lower() == "gifs" and is_momod(msg) then
	  redis:del("mute:gif"..target)
	  return "Gifs posting has been unmuted"
	end
	if matches[2]:lower() == "contacts" and is_momod(msg) then
	  redis:del("mute:contact"..target)
	  return "Share contacts has been unmuted"
	end
	if matches[2]:lower() == "document" then
	  redis:del("mute:document"..target)
	  return "Mute Documents has been disabled"
	end
  end
  if matches[1] == "muteslist" and is_momod(msg) then
    return show_mute(msg, target)
  end
  if matches[1] == "clean" then
    local channel_id = msg.to.id
    return clean_mute(channel_id)
  end
end
local function pre_process(msg)
  if msg.service then
    return msg
  end
  if redis:get("mute:all"..msg.to.id) and not is_momod(msg) then
    delete_msg(msg.id, ok_cb, true)
  end
  if msg.text then
    if redis:get("mute:text"..msg.to.id) == "yes" then
      delete_msg(msg.id, ok_cb, false)
    end
  end
  if msg.media then
    if msg.media.type == "photo" then
      if redis:get("mute:photo"..msg.to.id) == "yes" then
        delete_msg(msg.id, ok_cb, false)
      end
    end
  end
  if msg.media then 
    if msg.media.type == "audio" then
	  if redis:get("mute:audio"..msg.to.id) == "yes" and not is_momod(msg) then
	    delete_msg(msg.id, ok_cb, true)
	  end
	end
  end
  if msg.media then
    if msg.media.type == "video" then
      if redis:get("mute:video"..msg.to.id) == "yes" then
        delete_msg(msg.id, ok_cb, false)
      end
    end
  end
  if msg.media then
    if msg.media.caption == "giphy.mp4" and not is_momod(msg) then
	  if redis:get("mute:gif"..msg.to.id) == "yes" then
	    delete_msg(msg.id, ok_cb, true)
	  end
	end
	if msg.media.type == "contact" and not is_momod(msg) then
	  if redis:get("mute:contact"..msg.to.id) == "yes" then
	    delete_msg(msg.id, ok_cb, true)
	  end
	end
  end
  if msg.media then
    if msg.media.type == "document" and not msg.media.caption and not is_momod(msg) then
	  if redis:get("mute:document"..msg.to.id) == "yes" then
	    delete_msg(msg.id, ok_cb, true)
	  end
	end
  end
  if is_mute(msg.from.id, msg.to.id) then
    delete_msg(msg.id, ok_cb, true)
  end
  return msg
end
return {
  patterns = {
    "^[/!#](muteuser)$",
    "^[!/#](mute) (.*)$",
    "^[/!#](unmute) (.*)$",
	"^[/!#](muteuser) (.*)$",
	"^[/!#](mutelist)$",
    "^[!/#](muteslist)$",
	"^[/!#](clean) mutelist$",
	'%[(audio)%]',
    '%[(photo)%]',
    '%[(video)%]',
    '%[(document)%]'
  },
  run = run,
  pre_process = pre_process
}

end
