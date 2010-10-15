class Product
	attr_accessor :id, :name

	def initialize(id, name)
		@id = id 
		@name = name
	end

	def alias
		@name.gsub(/ /,'').downcase
	end

	def self.all
		result = []
		File.open("data/products", "r") do |the_file|
			while (file_line = the_file.gets)
				fields = file_line.chomp().split(',')
				result << (Product.new fields[0], fields[1])
			end
		end

		result
	end

	def applications
		all_product_applications = Application.all
		current_products_applications = all_product_applications.find_all { |application| application.product_id == @id }

		current_products_applications
	end
end

