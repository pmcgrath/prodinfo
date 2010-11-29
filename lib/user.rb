require 'mongoid'


class User
	include Mongoid::Document
	include Mongoid::Timestamps
	field :name
	field :user_name
	field :password_salt
  	field :password_hash

	validates_presence_of :name, :user_name, :password_salt, :password_hash
	validates_uniqueness_of :user_name	# Not sure about this ? - do we need to configure or go egt err from db ?

	def	self.create_new(name, user_name, clear_password)
		result = User.new

		result.name = name
		result.user_name = user_name
		result.password_salt = result.generate_salt
		result.password_hash = result.encrypt_password(clear_password)

		result
	end

	def self.authenticate(user_name, clear_password)
		matching_user = User.find(:first, :conditions => { :user_name => user_name })
		return false	unless matching_user

		return matching_user.password_match?(clear_password)
	end

	def password_match?(clear_password)
		password_hash == encrypt_password(clear_password)
  	end

	def generate_salt
		Digest::SHA1.hexdigest([Time.now, rand].join)
  	end

	def encrypt_password(password)
		Digest::SHA1.hexdigest([password, password_salt].join)
  	end
end

