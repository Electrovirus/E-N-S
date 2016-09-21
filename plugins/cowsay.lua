function run(msg, matches)
text = io.popen("cowsay " .. matches[2]):read('*all')
  return text
end
return {
  patterns = {
    '^[!/#](cowsay ) (.*)$'
  },
  run = run,
  moderated = true
}
