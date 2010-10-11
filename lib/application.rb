class Application
	attr_accessor :id, :product_id, :name

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

