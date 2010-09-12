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
  "<html>"
  "	<h1>Ted</h1>"
  "</html>"
end