require 'minitest/autorun'
require 'minitest/pride'
require './lib/renderer'
require './test/test_helper'

class StrikethroughTest < Test::Minitest

	def test_it_renders_a_pre_rendered_string
		input = "<del>Mistaken text.</del>"
		expected = 
		strikethrough = Strikethrough.new(input)
		assert_equal strikethrough, expected
	end
end