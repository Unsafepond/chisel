# Take in the input file
#take the string from the input file
#pass the string into renderer.rb
#take output from renderer.rb
#write the output to the output file
require './renderer'

doc = File.read(ARGV[0])

renderer = Renderer.new.render(doc)