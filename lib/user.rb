class User
	attr_accessor :user_name, :password

	def initialize(user_name, password)
		@user_name = user_name
		@password = password
	end

	def self.all
		result = []
		File.open("data/users", "r") do |the_file|
			while (file_line = the_file.gets)
				fields = file_line.chomp().split(',')
				result << (User.new fields[0], fields[1])
			end
		end

		result	
	end

	def self.authenticate(user_name, password)
		matching_user = User.all.find { |user| user.user_name == user_name }
		return false	unless matching_user

		return matching_user.password == password
	end
end

