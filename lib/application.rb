require 'mongoid'


class Application
  	include Mongoid::Document
	include Mongoid::Timestamps
  	field :name
	embedded_in :product, :inverse_of => :applications

	validates_presence_of :name
	validates_uniqueness_of :name	# Not sure about this ? - do we need to configure or go egt err from db ?
end

