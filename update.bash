#!/bin/bash
git pull
bundle install --deployment
bundle exec rake db:migrate RAILS_ENV=production
bundle exec rake db:seed RAILS_ENV=production
bundle exec rake assets:precompile RAILS_ENV=production
bundle exec whenever --update-crontab
touch tmp/restart.txt
