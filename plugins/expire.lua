local function pre_process(msg)
	local timetoexpire = 'unknown'
	local expiretime = redis:hget ('expiretime', get_receiver(msg))
	local now = tonumber(os.time())
	if expiretime then    
		timetoexpire = math.floor((tonumber(expiretime) - tonumber(now)) / 86400) + 1
		if tonumber("0") > tonumber(timetoexpire) and not is_sudo(msg) then
		if msg.text:match('/') then
			return send_large_msg(get_receiver(msg), '📆This group is expired recharge it.\n@Ev_Cnt_Bot')
		else
			return
		end
	end
	if tonumber(timetoexpire) == 0 then
		if redis:hget('expires0',msg.to.id) then return msg end
		send_large_msg(get_receiver(msg), '🔆0 days left from group expire date\nRecharge your group soon')
		redis:hset('expires0',msg.to.id,'5')
	end
	if tonumber(timetoexpire) == 1 then
		if redis:hget('expires1',msg.to.id) then return msg end
		send_large_msg(get_receiver(msg), '🔆1 days left from group expire date\nRecharge your group soon')
		redis:hset('expires1',msg.to.id,'5')
	end
	if tonumber(timetoexpire) == 2 then
		if redis:hget('expires2',msg.to.id) then return msg end
		send_large_msg(get_receiver(msg), '🔆2 days left from group expire date\nRecharge your group soon')
		redis:hset('expires2',msg.to.id,'5')
	end
	if tonumber(timetoexpire) == 3 then
		if redis:hget('expires3',msg.to.id) then return msg end
		send_large_msg(get_receiver(msg), '🔆3 days left from group expire date\nRecharge your group soon')
		redis:hset('expires3',msg.to.id,'5')
	end
	if tonumber(timetoexpire) == 4 then
		if redis:hget('expires4',msg.to.id) then return msg end
		send_large_msg(get_receiver(msg), '🔆4 days left from group expire date\nRecharge your group soon')
		redis:hset('expires4',msg.to.id,'5')
	end
	if tonumber(timetoexpire) == 5 then
		if redis:hget('expires5',msg.to.id) then return msg end
		send_large_msg(get_receiver(msg), '🔆5 days left from group expire date\nRecharge your group soon')
		redis:hset('expires5',msg.to.id,'5')
	end
end
return msg
end
function run(msg, matches)
	if matches[1]:lower() == 'setexpire' then
		if not is_sudo(msg) then return end
		local time = os.time()
		local buytime = tonumber(os.time())
		local timeexpire = tonumber(buytime) + (tonumber(matches[2]) * 86400)
		redis:hset('expiretime',get_receiver(msg),timeexpire)
		return "🔋Group is #charged\n🔖For "..matches[2].." Days"
	end
	if matches[1]:lower() == 'expire' then
		local expiretime = redis:hget ('expiretime', get_receiver(msg))
		if not expiretime then return '📈Expire date is not set yet.' else
			local now = tonumber(os.time())
			return (math.floor((tonumber(expiretime) - tonumber(now)) / 86400) + 1) .. " Days left🔱"
		end
	end

end
return {
  patterns = {
    "^[!/#]([Ss]etexpire) (.*)$",
	"^[!/#]([Ee]xpire)$",
  },
  run = run,
  pre_process = pre_process
}
