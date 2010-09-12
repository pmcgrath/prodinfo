require 'rubygems'
require 'sinatra'


configure :production do
  	# Configure stuff here you'll want to
	# only be run at Heroku at boot

  	# TIP: You can get you database information
  	# from ENV['DATABASE_URI'] (see /env route below)
end

get '/' do
  	"We're in !"
end

get '/ted' do
	page_source = "<html>"
	page_source += "	<h1>Your user agent is #{@env[HTTP_USER_AGENT'] and IP is @env['REMOTE_ADDR']}</h1>"
	page_source += "</html>"

	page_source
end