class Image
  attr_accessor :data

  def self.blank_image(width, height)
    data = []
    height.times do
      data << Array.new(width) { 0 }
    end 
    Image.new(data)  
  end

  def self.blank_random_image(width, height)
    data = []
    height.times do
      data << Array.new(width) {Random.rand(2)}
    end 
    Image.new(data)  
  end

  def initialize(data)
    @data = data
  end

  def output_image
    @data.each do |line|
      puts line.join
    end
  end

  # change if not square
  def width
    @data.size
  end

  # change if not square
  def height
    @data.size
  end

  # step 1
  def neighboring_points(x, y)
    possible_coords = [
      [x, (y-1)],
      [x, (y+1)],
      [(x-1), y],
      [(x+1), y]
    ]

    possible_coords.select do |coord|
      x = coord[0]
      y = coord[1]

      x >= 0 && (x <= (width - 1)) && y >= 0 && (y <= (height - 1))
    end
  end

  def manhattan_neighboring_points(x, y, n)
    possible_coords = []
    possible_coords += neighboring_points(x, y)

    (n-1).times do
      possible_coords.each do |x, y|
        possible_coords += neighboring_points(x, y)
      end
    end    
    possible_coords.uniq!

    one_coord = []
    one_coord << x << y

    possible_coords.select do |coord|
      possible_x = coord[0]
      possible_y = coord[1]

      (coord != one_coord) && possible_x >= 0 && (possible_x <= (width - 1)) && possible_y >= 0 && (possible_y <= (height - 1))
    end
  end

  # step 2
  def find_one_coordinates
    ones = []
    @data.each.with_index do |row, row_index|
      row.each.with_index do |pixel, column_index|
        y = column_index
        x = row_index
        if @data[y][x] > 0
         ones << [x, y]
       end
     end
   end
   ones
 end

  # step 3
  def set_to_one(x, y)
    @data[y][x] = 1
  end

  # step 4
  def blur!
    find_one_coordinates.each do |coord|
      x = coord[0]
      y = coord[1]
      found_points = neighboring_points(x, y)
      found_points.each do |point|
        x = point[0]
        y = point[1]
        set_to_one(x, y)
      end
    end
    @data
  end

  # step 4
  def manhattan_blur!(n)
    find_one_coordinates.each do |coord|
      x = coord[0]
      y = coord[1]
      found_points = manhattan_neighboring_points(x, y, n)
      found_points.each do |point|
        x = point[0]
        y = point[1]
        set_to_one(x, y)
      end
    end
    @data
  end

end

image = Image.new(
  [
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 1],
    [0, 0, 0, 0, 0],
  ]
  )
image.manhattan_blur!(3)
image.output_image