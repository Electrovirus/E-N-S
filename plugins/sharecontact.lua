do

function run(msg, matches)
send_contact(get_receiver(msg), "+19122090223", "E N S", "", ok_cb, false)
end

return {
patterns = {
"^[!/#]share$"

},
run = run
}

end
