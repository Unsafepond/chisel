require_relative 'test_helper.rb'

class RendererTest < Minitest::Test

	def Test_it_splits_string
		assert_equal(chunk.separate_by_new_lines("aaa\n\nbbb\nccc\n\nddd"), ["aaa", "bbb", "ccc", "ddd"])
	end




	end