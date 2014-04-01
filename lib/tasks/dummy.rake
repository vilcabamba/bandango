require "seed_dummy_data"

namespace :db do
  desc "Add system data"
  task dummy: :environment do
    SeedDummyData.run
  end
end
