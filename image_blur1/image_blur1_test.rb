require 'minitest/autorun'
require './image_blur1'

class TestImage < Minitest::Test

  def test_invert
  	image = Image.new([[0,0],[0,0]])
  	image.invert!
  	expected = [[1,1],[1,1]]
  	actual = image.data
  	assert_equal expected, actual
  end

end