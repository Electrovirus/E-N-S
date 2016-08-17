function run(msg, matches)
text = io.popen("cowsay " .. matches[2]):read('*all')
 if is_momod(msg) then
end
  return text
end
return {
  patterns = {
    '^[!/#](cowsay) (.*)$'
  },
  run = run,
  moderated = true
}
