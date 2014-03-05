# Learn more: http://github.com/javan/whenever
require 'dotenv'
Dotenv.load

set :output, "log/cron.log"
set :environment, ENV["RAILS_ENV"] if ENV["RAILS_ENV"]

job_type :bandango, "cd #{Dir.pwd} && :task"

every 15.minutes do
  runner "SaniGetWorker.schedule"
end

every :day, at: "02:30am" do
  bandango "git pull"
end

every :day, at: "02:35am" do
  bandango "bundle install --deployment"
end

every :day, at: "02:50am" do
  bandango "bundle exec whenever --update-crontab"
end

every :day, at: "03:00am" do
  rake "db:migrate"
end

every :day, at: "03:10am" do
  rake "db:seed"
end

every :day, at: "03:20am" do
  rake "assets:precompile"
end

if ENV["DUMMY_DB"]
  every :day, at: "01:00am" do
    rake "db:dummy"
  end
end
