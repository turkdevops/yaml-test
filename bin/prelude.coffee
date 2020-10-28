_ = require 'lodash'

_.extend global,
  _: _
  fs: require 'fs'
  out: (string)->
    process.stdout.write String string
  err: (string)->
    process.stderr.write String string
  say: (string...)->
    out "#{string.join ' '}\n"
  warn: (string...)->
    err "#{string.join ' '}\n"
  exit: process.exit
  die: (msg)->
    say msg
    exit 1
  read: (path)->
    fs.readFileSync(path).toString()
  write: (path, text)->
    fs.writeFileSync(path, text)
  print: (text)->
    out text
  exists: (path)->
    fs.existsSync path
  mkdir: (path)->
    fs.mkdirSync path unless exists path
  link: (source, target)->
    fs.unlinkSync source if exists source
    fs.symlinkSync target, source
  compiler: require('testml-compiler/lib/testml-compiler/compiler')
  xxx: (o...)->
    yaml = require 'yaml'
    for n in o
      err "---\n#{warn yaml.stringify o}...\n"
    exit 1

# vim: sw=2:
