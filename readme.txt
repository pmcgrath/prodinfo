See
	http://sinatra-book.gittr.com/			
	http://github.com/sinatra/heroku-sinatra-app 
	http://docs.heroku.com/bundler
	http://gembundler.com/sinatra.html
	http://docs.heroku.com/heroku-command
	http://github.com/guides/git-cheat-sheet
	*** Debugging http://ruby.about.com/od/advancedruby/a/debugging.htm

To setup
	git init
	heroku create


To clone content use
	git clone git@heroku.com:blooming-sky-54.git


To see all git config use 
	git config --list


Can run locally with a specific port rather than a random port using
	rackup --port 5678
	Open http://127.0.0.1:5678/ to see app


Needed to install Heroku
	gem install heroku
Other commands
	heroku info     --> Will show app info
	heroku info     --> Will open current app in browser
	heroku logs     --> Log info
	heroku config   --> Environment vars
	heroku stack    --> Shows current stack info - mri version etc
	heroku addons	--> Current addons installed if any


Need to install the following gems
	bundler (1.0.0)
	rack (1.2.1)
	sinatra (1.0)


Needed to create Gemfile in the root for bundler


Ran bundle install - would have taken care of the gems above i'm guessing - will need to test


Used git to push all including the Gemfile.lock
	git push heroku master
	