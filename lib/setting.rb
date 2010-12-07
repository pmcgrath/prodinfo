require 'mongoid'


class Setting
  	include Mongoid::Document
	include Mongoid::Timestamps
	include Mongoid::Versioning

	field :environment
	field :key
	field :value
	field :note
	embedded_in :application, :inverse_of => :settings

	validates_presence_of :environment
	validates_presence_of :key
	validates_presence_of :value
end

