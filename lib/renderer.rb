#take input from chisel.rb
#separate file by chunks with no blank lines
#classify the chunks of text(if chunk starts with #, or ___, else its P)
#based of the chunk type, send it to its respective renderer
##
#html formatted text lines to output writer
#output writer combines all lines into one string.
#pass string back to chisel.rb


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
		strong = Strong.new
		strong_chunks = strong.render(assigned_chunks)
		print strong_chunks
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
				"<h34>#{string}</h4>"
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

	def render(assigned_chunks)

	end

end

class Strikethrough

	def render(input)

	end

end
