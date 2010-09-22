require 'rubygems'
require 'sinatra'


configure :production do
  	# Configure stuff here you'll want to
	# only be run at Heroku at boot

  	# TIP: You can get you database information
  	# from ENV['DATABASE_URI'] (see /env route below)
end

get '/' do
  	haml :index
end

get '/ted' do
	content = {
		'Url' 					=> request.url,
		'Your user agent is' 	=> @env['HTTP_USER_AGENT'],
		'Your IP is' 			=> @env['REMOTE_ADDR']
	}
	
	haml :ted, :locals => { :content => content }
end
