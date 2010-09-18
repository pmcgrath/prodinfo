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

	page_source += "	<h2>Url is #{request.url}</h2>"
	page_source += "	<br/>"
	page_source += "	<h2>Your user agent is #{@env['HTTP_USER_AGENT']}</h2>"
	page_source += "	<br/>"
	page_source += "	<h2>Your IP is #{@env['REMOTE_ADDR']}</h2>"
	page_source += "	<br/>"
	page_source += "	#{ENV['DATABASE_URL']}<br/>"
	page_source += "</html>"

	page_source
end