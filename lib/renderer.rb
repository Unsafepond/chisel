#take input from chisel.rb
#separate file by chunks with no blank lines
#classify the chunks of text(if chunk starts with #, or ___, else its P)
#based of the chunk type, send it to its respective renderer
##
#html formatted text lines to output writer
#output writer combines all lines into one string.
#pass string back to chisel.rb
require 'pry'

class Renderer

	attr_reader :doc

	def initialize
		@doc = doc
	end

	def render(doc)
		chunk = ChunkMaker.new
		split_chunks = chunk.separate_by_new_lines(doc)
		phsplitter = ParagraphHeaderSplitter.new
		assigned_chunks = phsplitter.splitter(split_chunks)
		lists = Lists.new
		listed_chunks = lists.render(assigned_chunks)
		strong = Strong.new.render(listed_chunks)
		strong.join("\n")
	end
end

class ChunkMaker
	# attr_reader :doc

	# def initialize
	# 	@doc = doc
	# end
	
	def separate_by_new_lines(doc)
		line_split_doc = doc.split("\n\n")
	end

end

class ParagraphHeaderSplitter
	# 	attr_reader :split_chunks

	# def initialize
	# 	@split_chunks = split_chunks
	# end

	def splitter(split_chunks)
		split_chunks.map do |string|
			if string[0..4] == "#####"
				string.delete!('#')
				"<h5>#{string}</h5>"
			elsif string[0..3] == "####"
				string.delete!('#')
				"<h4>#{string}</h4>"
			elsif string[0..2] == "###"
				string.delete!('#')
				"<h3>#{string}</h3>"
			elsif string[0..1] == "##"
				string.delete!('#')
				"<h2>#{string}</h2>"
			elsif string[0] == "#"
				string.delete!('#')
				"<h1>#{string}</h1>"
			else
				"<p>#{string}</p>"
			end
		end
	end

end

class Strong

	def render(listed_chunks)
		listed_chunks.each do |string|
			while string.include?("**") == true
				string.sub!("**", "<strong>")
				string.sub!("**", "</strong>")
			break
			end
			while string.include?("*") == true
				string.sub!("*", "<em>")
				string.sub!("*", "</em>")
			break
			end
		end
	end

end

class Lists

	def render(assigned_chunks)
			listed_chunks = assigned_chunks.map do |string|
				if string.include?("* ") && string.include?(":")
					list_items = string.split("\n")
					strings = list_items.map do |chunk|
						"#{chunk.sub!("* ", "<li>")} </li>"
					end
					"<ul>\n#{strings.join("\n")}\n</ul>"
				else
					string
				end
			end

			listed_chunks = listed_chunks.map do |string|
				if string.include?("1.") && string.include?(":")
					list_items = string.split("\n")
					strings = list_items.map do |chunk|
						"#{chunk.sub!("1.", "<li>")} </li>"
						"#{chunk.sub!("2.", "<li>")} </li>"
						"#{chunk.sub!("3.", "<li>")} </li>"
						"#{chunk.sub!("4.", "<li>")} </li>"
						"#{chunk.sub!("5.", "<li>")} </li>"
					end
					"<ol>\n#{strings.join("\n")}\n</ol>"
				else
					string
				end
			end
	return listed_chunks
	end
end

class Strikethrough

	def render(input)

	end

end
