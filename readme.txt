See
	http://sinatra-book.gittr.com/			
	http://github.com/sinatra/heroku-sinatra-app 
	http://docs.heroku.com/bundler
	http://gembundler.com/sinatra.html


Can run locally with a specific port rather than a random port using
	rackup --port 5678
Open http://127.0.0.1:5678/ to see app


Needed to install Heroku
	gem install heroku


Need to install the following gems
	bundler (1.0.0)
	rack (1.2.1)
	sinatra (1.0)


Needed to create Gemfile in the root for bundler


Ran bundle install - would have taken care of the gems above i'm guessing - will need to test


Used git to push all including the Gemfile.lock
	git push heroku master
	