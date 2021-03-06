# Take in the input file
#take the string from the input file
#pass the string into renderer.rb
#take output from renderer.rb
#write the output to the output file
require './renderer'

doc = File.read(ARGV[0])

renderer = Renderer.new.render(doc)

rendered = File.write(ARGV[1], renderer)
rendered
puts "Transformed \'my_input.markdown\' into \'my_output.html\'"