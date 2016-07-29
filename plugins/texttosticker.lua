local function run(msg, matches)
        local text = URL.escape(matches[2])
        local color = 'black'
        if matches[2] == 'red' then
            color = 'red'
        elseif matches[2] == 'black' then
            color = 'black'
      elseif matches[2] == 'blue' then
          color = 'blue'
    elseif matches[2] == 'green' then
        color = 'green'
    elseif matches[2] == 'yellow' then
        color = 'yellow'
    elseif matches[2] == 'pink' then
        color = 'magenta'
    elseif matches[2] == 'orange' then
        color = 'Orange'
    elseif matches[2] == 'brown' then
        color = 'DarkOrange'
        end
        local font = 'mathrm'
        if matches[3] == 'bold' then
            font = 'mathbf'
        elseif matches[3] == 'italic' then
            font = 'mathit'
        elseif matches[3] == 'fun' then
            font = 'mathfrak'
        elseif matches[1] == 'arial' then
            font = 'mathrm'
        end
        local size = '700'
        if matches[4] == 'small' then 
            size = '300'
        elseif matches[4] == 'larg' then
            size = '700'
            end
local url = 'http://latex.codecogs.com/png.latex?'..'\\dpi{'..size..'}%20\\huge%20\\'..font..'{{\\color{'..color..'}'..text..'}}'
local file = download_to_file(url,'file.webp')
if msg.to.type == 'channel' or msg.to.type == 'chat' then
send_document('channel#id'..msg.to.id,file,ok_cb,false)
send_document('chat#id'..msg.to.id,file,ok_cb,false)
end
end
return {
   patterns = {
       "^[/!#]([Ss]ticker) (.*) ([^%s]+) (small)$",
       "^[/!#]([Ss]ticker) (.*) ([^%s]+) (larg)$",
       "^[/!#]([Ss]ticker) (.*) ([^%s]+) (bold)$",
       "^[/!#]([Ss]ticker) (.*) (bold)$",
       "^[/!#]([Ss]ticker) (.*) ([^%s]+) (italic)$",
       "^[/!#]([Ss]ticker) (.*) ([^%s]+) (fun)$",
       "^[/!#]([Ss]ticker) (.*) ([^%s]+) (arial)$",
       "^[/!#]([Ss]ticker) (.*) (red)$",
       "^[/!#]([Ss]ticker) (.*) (black)$",
       "^[/!#]([Ss]ticker) (.*) (blue)$",
       "^[/!#]([Ss]ticker) (.*) (green)$",
       "^[/!#]([Ss]ticker) (.*) (yellow)$",
       "^[/!#]([Ss]ticker) (.*) (pink)$",
       "^[/!#]([Ss]ticker) (.*) (orange)$",
       "^[/!#]([Ss]ticker) (.*) (brown)$",
       "^[/!#]([Ss]ticker) +(.*)$",
       "^([Ss]ticker) (.*) ([^%s]+) (small)$",
       "^([Ss]ticker) (.*) ([^%s]+) (larg)$",
       "^([Ss]ticker) (.*) ([^%s]+) (bold)$",
       "^([Ss]ticker) (.*) (bold)$",
       "^([Ss]ticker) (.*) ([^%s]+) (italic)$",
       "^([Ss]ticker) (.*) ([^%s]+) (fun)$",
       "^([Ss]ticker) (.*) ([^%s]+) (arial)$",
       "^([Ss]ticker) (.*) (red)$",
       "^([Ss]ticker) (.*) (black)$",
       "^([Ss]ticker) (.*) (blue)$",
       "^([Ss]ticker) (.*) (green)$",
       "^([Ss]ticker) (.*) (yellow)$",
       "^([Ss]ticker) (.*) (pink)$",
       "^([Ss]ticker) (.*) (orange)$",
       "^([Ss]ticker) (.*) (brown)$",
       "^([Ss]ticker) +(.*)$",
       },
   run = run
}
