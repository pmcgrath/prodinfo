require 'mongoid'


class Application
  	include Mongoid::Document
	include Mongoid::Timestamps
	include Mongoid::Versioning

	field :name
	embeds_many :settings

	embedded_in :product, :inverse_of => :applications

	validates_presence_of :name		
end

