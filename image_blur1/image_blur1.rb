class Image
	attr_accessor :data

	def self.blank_image(width, height)
		data = []
		height.times do
			data << Array.new(width) {0}
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

	def invert!
		@data.map! do |line|
			line.map do |element|
				if element == 0
					1
				else
					0
				end
			end
		end 
	end

	def border!
		@data.map! do |line|
			line[0] = 1
			line[-1] = 1
			line
		end
	end

end

image1 = Image.blank_random_image(4, 5)
image1.output_image
puts "======"

image2 = Image.blank_image(4, 4)
image2.output_image
puts "======"

image2.border!
image2.output_image

# image = Image.new ([
# 	[0,0,0,0],
# 	[0,1,0,0],
# 	[0,0,0,1],
# 	[0,0,0,0]
# ])

# image.output_image
# 0000
# 0100
# 0001
# 0000