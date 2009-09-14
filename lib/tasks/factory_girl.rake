namespace :db do
  namespace :factory_girl do
    desc "Load factory_girl into the current environment's database."
    task :load => :environment do
      require 'factory_girl'
      require 'spec/factories'

      [Game].map(&:delete_all)
      Factory(:game)
    end
  end
end
