#!/bin/bash
# git version:
git pull
# svn version:
#svn update
bundle install --deployment
rake db:migrate RAILS_ENV=production
# MongoDB indexes:
# rake db:mongoid:create_indexes RAILS_ENV=production
rake assets:precompile
touch tmp/restart.txt
