fs = require 'fs'
{exec} = require 'child_process'

appFiles = [

  'Renderer'
  'Geometries'
  
]

task 'build', 'Build Vizz.js', ->

  appContents = new Array remaining = appFiles.length
  for file, index in appFiles then do (file, index) ->
    fs.readFile "src/#{file}.coffee", 'utf8', (err, fileContents) ->
      throw err if err
      appContents[index] = fileContents
      process() if --remaining is 0

  process = ->
    fs.writeFile 'compiled/Vizz.coffee', appContents.join('\n\n'), 'utf8', (err) ->
      throw err if err
      exec 'coffee --compile compiled/Vizz.coffee', (err, stdout, stderr) ->
        throw err if err
        console.log stdout + stderr
        fs.unlink 'compiled/Vizz.coffee', (err) ->
          throw err if err
          console.log 'Done.'


