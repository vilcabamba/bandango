#!/bin/bash
# git version:
git pull
# svn version:
#svn update
bundle install --deployment
bundle exec rake db:migrate RAILS_ENV=production
# MongoDB indexes:
# rake db:mongoid:create_indexes RAILS_ENV=production
bundle exec rake assets:precompile RAILS_ENV=production
touch tmp/restart.txt
