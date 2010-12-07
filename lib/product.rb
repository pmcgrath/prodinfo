require 'mongoid'


class Product
	include Mongoid::Document
	include Mongoid::Timestamps
  	include Mongoid::Versioning
	
	field :name
  	field :alias
	embeds_many :applications

	validates_presence_of :name
	validates_uniqueness_of :name	# Not sure about this ? - do we need to configure or go get err from db ?
	before_save :determine_alias

	protected
		def determine_alias
			self.alias = name.gsub(/ /,'').downcase
		end
end

