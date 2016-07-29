function shortlink(url)
return http.request('http://gs2.ir/api.php?url='..url)
end
function run(msg, matches)
  local hash = 'app:'..msg.to.id
  local hash2 = 'appicon:'..msg.to.id
  local hash3 = 'appcreator:'..msg.to.id
  if matches[1]:lower() == "appinfo" then
    local value = redis:hget(hash,matches[2])
  local photo = redis:hget(hash2,matches[2])
  local creator = redis:hget(hash3,matches[2])
    if not value then
      return 'نرم افزار مورد نظر یافت نشد.'
    else
  local data = http.request('http://api.magic-team.ir/plazza/info.php?key='..value)
  local db = json:decode(data)
  local needroot = 'خیر'
  local nroot = db.needroot
  if nroot then
  needroot = 'بله'
  end
  local size = db.size
  local exp = db.size.." / 1000000"
  local sizeurl = 'http://api.mathjs.org/v1/?expr='..URL.escape(exp)
    local b,c = http.request(sizeurl)
    local text = "عنوان : \n"..db.title.."\n نام پکیج :‌\n"..value.."\nسازنده :\n"..creator.."\n درباره : \n"..db.info.."\n ورژن : \n"..db.version.."\n نیاز به روت : \n"..needroot.."\n سایز : \n"..math.floor(b).." mb\n تصویر :\n"..photo.."\n لینک دانلود :\n"..shortlink(db.dlurl)
  send_large_msg(get_receiver(msg),text,ok_cb,false)
    return 
    end
    return
  elseif matches[1]:lower() == 'app' then
  local url = http.request('http://api.magic-team.ir/plazza/search.php?key='..URL.escape(matches[2]))
  local jdat = json:decode(url)
  local text = "نتایج برای "..URL.escape(matches[2]).." : \n"
  redis:del(hash)
  if #jdat < 1 then return "نرم افزار مورد نظر یافت نشد." end
    for i = 1, #jdat do
      text = text..i..'- 📦 '..jdat[i].title..'\n🔰 سازنده : '..(jdat[i].subtitle or 'نامشخص')..'\n\n'
    local l = shortlink(jdat[i].icon)
      redis:hset(hash,i,jdat[i].pack)
      redis:hset(hash2,i,l)
    redis:hset(hash3,i,""..(jdat[i].subtitle or 'نامشخص').."")
    end
    text = text..'برای دریافت اطلاعات برنامه از دستور زیر استفاده کنید\n/appinfo number\n(example): /appinfo 1'
  return text
end
end
return {
patterns = {
  "^[!/#]([Aa][Pp][Pp]) (.*)$",
  "^[!/#]([Aa][Pp][Pp][Ii][Nn][Ff][Oo]) (%d+)$",
  "^([Aa][Pp][Pp]) (.*)$",
  "^([Aa][Pp][Pp][Ii][Nn][Ff][Oo]) (%d+)$"
  }, 
  run = run 
}
