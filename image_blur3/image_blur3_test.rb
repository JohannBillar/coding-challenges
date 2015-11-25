require './image_blur3'
require 'minitest/autorun'

class ImageTest < Minitest::Test

	def test_manhattan_neighboring_points
		image = Image.blank_image(5, 5)

		assert_equal(
			[
				[0, 2],
				[1, 1], [1, 2], [1, 3],
				[2, 0], [2, 1], [2, 3], [2, 4],
				[3, 1], [3, 2], [3, 3],
				[4, 2]
       ].sort,
       image.manhattan_neighboring_points(2, 2, 2).sort
       )

		image = Image.blank_image(5, 5)

		assert_equal(
			[
				[0, 1], [0, 2],
				[1, 0], [1, 1],
				[2, 0]
       ].sort,
       image.manhattan_neighboring_points(0, 0, 2).sort
       )

		image = Image.blank_image(7, 7)

		assert_equal(
			[
				[0, 3],
				[1, 2], [1, 3], [1, 4],
				[2, 1], [2, 2], [2, 3], [2, 4], [2, 5],
				[3, 0], [3, 1], [3, 2], [3, 4], [3, 5], [3, 6],
				[4, 1], [4, 2], [4, 3], [4, 4], [4, 5],
				[5, 2], [5, 3], [5, 4],
				[6, 3]
       ].sort,
       image.manhattan_neighboring_points(3, 3, 3).sort
       )

		image = Image.blank_image(5, 5)

		assert_equal(
			[
				[0, 1], [0, 2], [0, 3],
				[1, 0], [1, 1], [1, 2],
				[2, 0], [2, 1],
				[3, 0]
       ].sort,
       image.manhattan_neighboring_points(0, 0, 3).sort
       )

		image = Image.blank_image(5, 5)

		assert_equal(
			[
				[0, 1], [0, 2], [0, 3], [0, 4],
				[1, 0], [1, 1], [1, 2], [1, 3],
				[2, 0], [2, 1], [2, 2],
				[3, 0], [3, 1],
				[4, 0]
       ].sort,
       image.manhattan_neighboring_points(0, 0, 4).sort
       )

	end

	def test_manhattan_blur!
		image = Image.new(
      [
        [1, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0]
      ]
      )
    assert_equal(
     [
      [1, 1, 1, 1, 0, 0],
      [1, 1, 1, 0, 0, 0],
      [1, 1, 0, 0, 0, 0],
      [1, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0]
      ],
      image.manhattan_blur!(3)
      )

    image = Image.new(
      [
        [1, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0]
      ]
      )
    assert_equal(
     [
      [1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 0],
      [1, 1, 1, 1, 0, 0],
      [1, 1, 1, 0, 0, 0],
      [1, 1, 0, 0, 0, 0],
      [1, 0, 0, 0, 0, 0]
      ],
      image.manhattan_blur!(5)
      )

    image = Image.new(
      [
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 1],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0]
      ]
      )
    assert_equal(
     [
      [0, 0, 0, 0, 1, 1],
      [0, 0, 0, 1, 1, 1],
      [0, 0, 1, 1, 1, 1],
      [0, 1, 1, 1, 1, 1],
      [0, 0, 1, 1, 1, 1],
      [0, 0, 0, 1, 1, 1]
      ],
      image.manhattan_blur!(4)
      )

    image = Image.new(
      [
        [1, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 1]
      ]
      )
    assert_equal(
     [
      [1, 1, 1, 1, 0, 0],
      [1, 1, 1, 0, 0, 0],
      [1, 1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1, 1],
      [0, 0, 0, 1, 1, 1],
      [0, 0, 1, 1, 1, 1]
      ],
      image.manhattan_blur!(3)
      )

    image = Image.new(
      [
        [1, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 1]
      ]
      )
    assert_equal(
     [
      [1, 1, 1, 1, 1, 0],
      [1, 1, 1, 1, 0, 1],
      [1, 1, 1, 0, 1, 1],
      [1, 1, 0, 1, 1, 1],
      [1, 0, 1, 1, 1, 1],
      [0, 1, 1, 1, 1, 1]
      ],
      image.manhattan_blur!(4)
      )

    image = Image.new(
      [
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [1, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 1]
      ]
      )
    assert_equal(
     [
      [0, 0, 1, 0, 0, 0],
      [0, 1, 1, 1, 0, 0],
      [1, 1, 1, 1, 1, 0],
      [1, 1, 1, 1, 0, 1],
      [1 ,1, 1, 0, 1, 1],
      [1, 1, 0, 1, 1, 1]
      ],
      image.manhattan_blur!(2)
      )    

  end

end