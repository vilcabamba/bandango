# Learn more: http://github.com/javan/whenever

job_type :bandango, "cd /home/pi/bandango && :task"

# every 1.hour do
every :day, :at => '01:00pm' do
  bandango "git pull"
  bandango "bundle install --deployment"
  rake "db:migrate"
  rake "db:seed"
  rake "assets:precompile"
  command "sudo service bandango restart"
  command "sudo service sidekiq stop"
  command "sudo service sidekiq start"
end
