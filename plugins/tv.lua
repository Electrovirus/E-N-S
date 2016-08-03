do
 function run(msg, matches)
local text = [[ 
شبکه های آنلاین 📡
_________________________
پخش زنده شبکه یک سیما 1⃣
http://s11.telewebion.com:1935/devices/tv1-300k.stream/playlist.m3u8?wmsAuthSign=aXNfZnJlZT0xJnNlcnZlcl90aW1lPTgvMjAvMjAxNSA4OjM3OjQ5IEFNJmhhc2hfdmFsdWU9cVdWc0tzSTNITGhrbnRleWZHWnBmQT09JnZhbGlkbWludXRlcz02MDAw
_________________________
پخش زنده شبکه دو سیما 2⃣
http://s5.telewebion.com:1935/devices/tv2-300k.stream/playlist.m3u8?wmsAuthSign=aXNfZnJlZT0xJnNlcnZlcl90aW1lPTgvMjAvMjAxNSA4OjQxOjkgQU0maGFzaF92YWx1ZT1jcytURi9KSmFMaWhCY0ZUZUsxQWd3PT0mdmFsaWRtaW51dGVzPTYwMDA=
_________________________
پخش زنده شبکه سه سیما 3⃣
http://s9.telewebion.com:1935/devices/tv2-300k.stream/playlist.m3u8?wmsAuthSign=aXNfZnJlZT0xJnNlcnZlcl90aW1lPTgvMjAvMjAxNSA4OjQyOjQ5IEFNJmhhc2hfdmFsdWU9d1o5Y1BCZENYNjRpWS82cnhRbm11dz09JnZhbGlkbWludXRlcz02MDAw
_________________________
پخش زنده شبکه چهار سیما 4⃣
http://s11.telewebion.com:1935/devices/tv4-300k.stream/playlist.m3u8?wmsAuthSign=aXNfZnJlZT0xJnNlcnZlcl90aW1lPTgvMjAvMjAxNSA4OjQ0OjIgQU0maGFzaF92YWx1ZT1wcGRkUUZoVmtoUXZPSGVMOVhYWkxnPT0mdmFsaWRtaW51dGVzPTYwMDA=
_________________________
پخش زنده شبکه تهران 5⃣
http://s11.telewebion.com:1935/devices/tehran-300k.stream/playlist.m3u8?wmsAuthSign=aXNfZnJlZT0xJnNlcnZlcl90aW1lPTgvMjAvMjAxNSA4OjQ1OjQgQU0maGFzaF92YWx1ZT1yR2I3anRLSUNKMFIvTTBiVlRDbVd3PT0mdmFsaWRtaW51dGVzPTYwMDA=
_________________________
پخش زنده شبکه خبر 6⃣
http://s10.telewebion.com:1935/devices/amouzesh-300k.stream/playlist.m3u8?wmsAuthSign=aXNfZnJlZT0xJnNlcnZlcl90aW1lPTgvMjAvMjAxNSA4OjQ1OjU4IEFNJmhhc2hfdmFsdWU9UUVSWGNjMjI3OWQrU3BaVHlGMmZ5dz09JnZhbGlkbWludXRlcz02MDAw
_________________________
پخش زنده شبکه پویا 👾
 http://s9.telewebion.com:1935/devices/pooya-300k.stream/playlist.m3u8?wmsAuthSign=aXNfZnJlZT0xJnNlcnZlcl90aW1lPTgvMjAvMjAxNSA4OjQ3OjE2IEFNJmhhc2hfdmFsdWU9RkFIeU5nZUN5bDRqWGQvTXNrZ3hCUT09JnZhbGlkbWludXRlcz02MDAw
_________________________
پخش زنده شبکه آموزش 💡
http://s11.telewebion.com:1935/devices/amouzesh-300k.stream/playlist.m3u8?wmsAuthSign=aXNfZnJlZT0xJnNlcnZlcl90aW1lPTgvMjAvMjAxNSA4OjQ4OjE5IEFNJmhhc2hfdmFsdWU9dlJXKytia2VtQUFJZEg0YUR0clVZZz09JnZhbGlkbWludXRlcz02MDAw
_________________________
پخش زنده شبکه آیفیلم 🎞
http://s9.telewebion.com:1935/devices/ifilm-300k.stream/playlist.m3u8?wmsAuthSign=aXNfZnJlZT0xJnNlcnZlcl90aW1lPTgvMjAvMjAxNSA4OjQ5OjM3IEFNJmhhc2hfdmFsdWU9WWNIWjFlejA5NE4xMG5qdlVpZlJkUT09JnZhbGlkbWludXRlcz02MDAw
_________________________
پخش زنده شبکه نمایش 📽
 http://s8.telewebion.com:1935/devices/namayesh-300k.stream/playlist.m3u8?wmsAuthSign=aXNfZnJlZT0xJnNlcnZlcl90aW1lPTgvMjAvMjAxNSA4OjUxOjEzIEFNJmhhc2hfdmFsdWU9MzVwamJPN2YxVXFjWThmeVkvdFcvQT09JnZhbGlkbWludXRlcz02MDAw
_________________________
پخش زنده شبکه نسیم 🎭
http://s4.telewebion.com:1935/devices/nasim-300k.stream/playlist.m3u8?wmsAuthSign=aXNfZnJlZvT0xJnNlcnZlcl90aW1lPTgvMjAvMjAxNSA4OjUyOjIzIEFNJmhhc2hfdmFsdWU9bXFPV1ptb05hOGhqaE1XRm5FcmVyQT09JnZhbGlkbWludXRlcz02MDAw
_________________________
پخش زنده شبکه ورزش⚽️
http://s5.telewebion.com:1935/devices/bck2varzesh-300k.stream/playlist.m3u8?wmsAuthSign=aXNfZnJlZT0xJnNlcnZlcl90aW1lPTgvMjAvMjAxNSA4OjUzOjQ3IEFNJmhhc2hfdmFsdWU9akd6eHBHY3h2YnJ1TkRzdjlUWTZVQT09JnZhbGlkbWludXRlcz02MDAw
_________________________
پخش زنده شبکه اصفهان 💠
http://s11.telewebion.com:1935/devices/esfahan-300k.stream/playlist.m3u8?wmsAuthSign=aXNfZnJlZT0xJnNlcnZlcl90aW1lPTgvMjAvMjAxNSA4OjU0OjI2IEFNJmhhc2hfdmFsdWU9bGdzbFBXLzBEZVNjV3QyaWxOcnVTQT09JnZhbGlkbWludXRlcz02MDAw
Asimo Bot @AsimoTeam
]]
return text
end
return {
patterns = {
"^(tv)$",
"^[!/#](tv)$",
"^(تلوزیون)$",
},
run = run
}
end
