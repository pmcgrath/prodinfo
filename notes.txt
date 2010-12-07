See 
	http://sinatra-book.gittr.com/			
	http://github.com/sinatra/heroku-sinatra-app 
	http://docs.heroku.com/bundler
	http://gembundler.com/sinatra.html
	http://docs.heroku.com/heroku-command
	http://github.com/guides/git-cheat-sheet
	http://haml-lang.com/   see also http://nex-3.com/posts/103-haml-and-sass-are-split
	http://blog.logeek.fr/2010/6/29/sinatra-heroku-mongodb-mongohq-notes
	http://docs.heroku.com/mongohq
	http://www.garrensmith.com/2010/09/11/Mongoid-sinatra.html

	http://www.mongodb.org/display/DOCS/Ruby+External+Resources


Stack
	Can see heroku stack using heroku stack
	I switched to bamboo-mri-1.9.1 using - heroku stack:migrate bamboo-mri-1.9.1


Config
	To see heroku config run - heroku config --long


Mongohq
	http://docs.heroku.com/config-vars
	http://support.mongohq.com/discussions/community-tips/2-logging-in-to-mongohq-for-heroku-users
		# Have not used the heroku mongohq addon, instead i'm using an environment variable if it exists if not default to localhost
		# This logic is based on content @ http://docs.mongohq.com/ruby-heroku-addon
		# Added a specific database user on mongohq and added heroku config using
		# 	heroku config:add MONGOHQ_URL=mongodb://databaseusername:databaseuserpassword@flame.mongohq.com:27045/dbname
	http://blog.heroku.com/archives/2010/4/30/mongohq_add_on_public_beta	Transfer data in and out
	
Debugging
	http://ruby.about.com/od/advancedruby/a/debugging.htm
	http://pivotallabs.com/users/chad/blog/articles/366-ruby-debug-in-30-seconds-we-don-t-need-no-stinkin-gui-


Git
	Installed git - sudo apt-get install git
	Installed gitk - sudo apt-get install git
	http://yehudakatz.com/2010/05/13/common-git-workflows/
	To reset to last commit - git reset head --hard
	To visually see diffs 
		install kompare or such tool using sudo apt-get install kompare
		then - git difftool --tool kompare 

To setup
	git init
	heroku create


To clone content use
	git clone git@heroku.com:blooming-sky-54.git


To see all git config
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
	haml (haml-3.0.18)
Can use to see versions
	gem which haml

	
Needed to create Gemfile in the root for bundler

Ran bundle install - would have taken care of the gems above i'm guessing - will need to test
	To update i found bundle update failed, so i had to delete the gemfile.lock and run bundle install again

Used git to push all including the Gemfile.lock
	git push heroku master


Pending
	git-wiki sinatra
	rifgraf   web service  Adam wiggins
	github-services  post recieve hooks
	scanty - blogging s/w
	sequel ORM
	Justin Gehtland - Relevance Small things looslely joined, written fast
	Net::HTTP use RestClient instead
	heroku-client 
	couchrest - ruby client	
	taps
	integrity
	remi rack screencast
	ruby-prof  - profiler
	couchpotato - ruby wrapper library for couchdb
	gem unpack heroku
	gibberish::simple -localisation library
