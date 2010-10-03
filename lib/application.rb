class Application
	# Heroku would not allow me to place all in a single line, even though it works fine locally
	attr :id
	attr :product_id
	attr :name

	def initialize(id, product_id, name)
		@id = id 
		@product_id = product_id
		@name = name
	end

	def self.all
		result = []
		File.open("data/applications", "r") do |the_file|
			while (file_line = the_file.gets)
				fields = file_line.chomp().split(',')
				result << (Application.new fields[0], fields[1], fields[2])
			end
		end

		result	
	end
end

