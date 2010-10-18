# Set up users with usernames and password
# Use sessions to generate and store cookies with timeouts
# HAML - how do i generate a form - urls
# try to run html2haml t.html t.haml - in ~/temp looking for hpicrot gem


require 'rubygems'
require 'sinatra'
require 'lib/product'
require 'lib/application'

configure do
	# Pending ...
end

helpers do
	def administrator?
		request.cookies['my_session_id_cookie_key'] == 'pass_broke'
	end

	def ensure_authorised_for_action
		redirect '/login', 301 unless administrator?
#		stop [ 401, 'Not authorized' ] unless administrator?
	end

	def set_cookie_value(key, value)
		response.set_cookie(key, value)
	end
end

get '/' do
	set_cookie_value('my_session_id_cookie_key', 'pass')
	
	products = Product.all
	
  	haml :index, :locals => { :page_title => 'PROD Information', :products => products }
end

get '/login' do
	haml :login, :locals => { :page_title => 'Log in' }
end

post '/login' do
	user_name = params[:user_name]
	password = params[:password]
	
	is_authenticated = ((user_name == 'pmcg') and (password == 'pass'))
	redirect '/login', 302 unless is_authenticated

	redirect '/'
end

get '/:product_alias' do
	ensure_authorised_for_action

	products = Product.all
	product = products.find { |product| product.alias == params[:product_alias] }

	haml :product, :locals => { :page_title => product.name, :product => product }
end
