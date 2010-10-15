require 'rubygems'
require 'sinatra'
require 'lib/product'
require 'lib/application'


configure :production do
  	# Configure stuff here you'll want to
	# only be run at Heroku at boot

  	# TIP: You can get you database information
  	# from ENV['DATABASE_URI'] (see /env route below)
end

get '/' do
	products = Product.all
	
  	haml :index, :locals => { :page_title => 'PROD Information', :products => products }
end

get '/:product_alias' do
	products = Product.all
	product = products.find { |product| product.alias == params[:product_alias] }

	haml :product, :locals => { :page_title => product.name, :product => product }
end
