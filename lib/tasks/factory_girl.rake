namespace :db do
  namespace :factory_girl do
    desc "Load factory_girl into the current environment's database."
    task :load => :environment do
      require 'factory_girl'
      require 'spec/factories'
      #make sure id start with 1
      system "rake db:migrate:reset"
      
      20.times {|i| Factory(:cat_and_dog, :name => "猫狗大战#{i+1}") }
    end
  end
end
