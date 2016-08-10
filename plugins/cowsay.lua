function run(msg, matches)
text = io.popen("cowsay " .. matches[1]):read('*all')
  return text
end
return {
  patterns = {
    '^cowsay (.*)$'
  },
  run = run,
  moderated = true
}
