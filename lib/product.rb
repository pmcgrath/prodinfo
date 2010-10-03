class Product
	attr :id, :name1

	def initialize(id, name1)
		@id = id 
		@name1 = name1
	end

	def alias
		@name.gsub(/ /,'').downcase
	end

	def self.all
		products = []
		File.open("data/products", "r") do |the_file|
			while (file_line = the_file.gets)
				fields = file_line.chomp().split(',')
				products << (Product.new fields[0], fields[1])
			end
		end

		products	
	end
end

