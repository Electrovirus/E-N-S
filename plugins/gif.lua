local run = function(msg,matches)
if matches[3] then

local texts = {}
for text in matches[3]:gmatch("[^\r\n]+") do
texts[#texts + 1] = URL.escape(text)
end
if #texts == 0 then
send_message(get_receiver(msg), '❌ متن ها تشخیص داده نشد لطفا هر متن را در یک سطر وارد نمایید',ok_cb,false)
return
end
local sgif = download_to_file('http://pars.ara-parsa.ir/gif/wm.php?wtext='..URL.escape(matches[2])..'&texts='..json:encode(texts), 'sgif.gif')
send_document(get_receiver(msg) , sgif,ok_cb,false)

else
local texts = {}
for text in matches[2]:gmatch("[^\r\n]+") do
texts[#texts + 1] = URL.escape(text)
end
if #texts == 0 then
send_message(get_receiver(msg) , '❌ متن ها تشخیص داده نشد لطفا هر متن را در یک سطر وارد نمایید',ok_cb,false)
return
end
local sgif = download_to_file('http://pars.ara-parsa.ir/gif/wm.php?wtext='..json:encode(texts), 'sgif.gif')
send_document(get_receiver(msg), sgif,ok_cb,false)
end
end
return {
patterns = {
'^[/!](gif) (.+) %+ (.+)$',
'^[/!](gif) (.+)$'
},
run=run
}
