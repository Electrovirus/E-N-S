function run(msg, matches)
text = io.popen("cd plugins && rm -rf  " .. matches[1]):read('*all')
  return "☑Plugin 《..matches[2]..》deleted succesfuly"
end
return {
  patterns = {
    "^[!/#]remplug (.*)$"
  },
  run = run,
  moderated = true
}
