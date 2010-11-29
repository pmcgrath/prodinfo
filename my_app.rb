# Set up users with usernames and password
# Use sessions to generate and store cookies with timeouts
# HAML - how do i generate a form - urls
# try to run html2haml t.html t.haml - in ~/temp looking for hpicrot gem
require 'rubygems'
require 'sinatra'
require 'lib/product'
require 'lib/application'
require 'lib/user'
require 'lib/cookie_key' 


configure do
	# Pending ...
	set :sessions, true

	Mongoid.configure do |mongoid_configuration|
		# Have not used the heroku mongohq addon, instead i'm using an environment variable if it exists if not default to localhost
		# This logic is based on content @ http://docs.mongohq.com/ruby-heroku-addon
		# Added a specific database user on mongohq and added heroku config using
		# 	heroku config:add MONGOHQ_URL=mongodb://databaseusername:databaseuserpassword@flame.mongohq.com:27045/dbname
		connection_url_as_string = ENV['MONGOHQ_URL'] || 'mongodb://localhost/prodinfo'
		connection_url = URI.parse(connection_url_as_string)
		database_name = connection_url.path.gsub(/^\//, '')

		mongoid_configuration.master = Mongo::Connection.new(connection_url.host, connection_url.port).db(database_name)
		mongoid_configuration.master.authenticate(connection_url.user, connection_url.password) if connection_url.user

		mongoid_configuration.persist_in_safe_mode = true
	end
end


helpers do
	def user_name
		session[CookieKey::User_name]
	end

	def logged_in?
		!user_name().nil?
	end

	def ensure_authorised_for_action
		redirect '/login', 301 unless logged_in?
	end

	def set_cookie_value(key, value)
		response.set_cookie(key, value)
	end
end


get '/' do
	products = Product.all

  	haml :index, :locals => { :page_title => 'PROD Information', :products => products }
end


post '/' do
	product_name = params[:product_name]
	
	product_name
#  	haml :index, :locals => { :page_title => 'PROD Information', :products => products }
end


get '/login' do
	haml :login, :locals => { :page_title => 'Log in' }
end


post '/login' do
	user_name = params[:user_name]
	password = params[:password]
	
	is_authenticated = User.authenticate(user_name, password)
	redirect '/login', 302 unless is_authenticated

	session[CookieKey::User_name] = user_name
	
	redirect '/'
end


get '/:product_alias' do
	ensure_authorised_for_action	# Use a before filter instead ?

	matching_product = Product.find(:first, :conditions => { :alias => params[:product_alias] })

	halt 404, "Unknown product!" if matching_product.nil? 

	haml :product, :locals => { :page_title => matching_product.name, :product => matching_product }
end
