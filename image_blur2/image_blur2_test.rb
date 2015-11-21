require './image_blur2'
require 'minitest/autorun'

class ImageTest < Minitest::Test

  def test_neighboring_points
    image = Image.blank_image(4,4)

    assert_equal(
      [
        [1, 0], [0, 1], [2, 1], [1, 2]
      ].sort,
      image.neighboring_points(1, 1).sort
    )

    assert_equal(
      [[0, 1], [1, 0]].sort,
      image.neighboring_points(0, 0)
    )

    assert_equal(
      [[2, 0], [3, 1]].sort,
      image.neighboring_points(3, 0).sort
    )

    assert_equal(
      [[0, 2], [1, 3]].sort,
      image.neighboring_points(0, 3).sort
    )

    assert_equal(
      [[3,2], [2, 3]].sort,
      image.neighboring_points(3, 3).sort
    )
  end

  def test_find_one_coordinates
    image = Image.new(
      [
        [1, 1, 1, 1],
        [1, 1, 1, 1],
        [1, 1, 1, 1],
        [1, 1, 1, 1]
      ]
    )

    assert_equal(
      [
        [0, 0], [3, 0], [1, 1], [0, 3], 
        [3, 3], [2, 2], [1, 0], [1, 3], 
        [2, 3], [3, 1], [0, 2], [0, 1], 
        [2, 0], [3, 2], [2, 1], [1, 2]
      ].sort,
      image.find_one_coordinates.sort
    )
  end

  def test_set_to_one
    image = Image.new(
      [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]
    )
    image.set_to_one(1, 3)

    assert_equal(
      [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 1, 0, 0]
      ],
    image.data
    )
  end

  def test_blur
    image = Image.new(
      [
        [0, 0, 0, 1, 0, 0],
        [0, 0, 0, 0, 0, 1],
        [1, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 1],
        [0, 0, 1, 0, 0, 0]
      ]
    )

    assert_equal(
      [
        [0, 0, 1, 1, 1, 1],
        [1, 0, 0, 1, 1, 1],
        [1, 1, 0, 0, 0, 1],
        [1, 0, 0, 0, 0, 1],
        [0, 0, 1, 0, 1, 1],
        [0, 1, 1, 1, 0, 1]
      ],
      image.blur!
    )

    image = Image.new(
      [
        [1, 0, 0, 0, 0, 1],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 1, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [1, 0, 0, 0, 0, 1]
      ]
    )

    assert_equal(
      [
        [1, 1, 0, 0, 1, 1],
        [1, 0, 0, 0, 0, 1],
        [0, 0, 0, 1, 0, 0],
        [0, 0, 1, 1, 1, 0],
        [1, 0, 0, 1, 0, 1],
        [1, 1, 0, 0, 1, 1]
      ],
      image.blur!
    )

    image = Image.new(
      [
        [0, 1, 0, 0, 0, 1],
        [0, 0, 1, 0, 0, 0],
        [1, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
        [1, 0, 0, 0, 1, 1]
      ]
    )

    assert_equal(
      [
        [1, 1, 1, 0, 1, 1],
        [1, 1, 1, 1, 0, 1],
        [1, 1, 1, 0, 0, 0],
        [1, 0, 1, 0, 0, 0],
        [1, 1, 1, 1, 1, 1],
        [1, 1, 1, 1, 1, 1]
      ],
      image.blur!
    )
  end

end