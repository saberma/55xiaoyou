require 'deprec'

set :domain, "55xiaoyou.com"
set :application, "55xiaoyou"
set :repository,  "git://github.com/saberma/55xiaoyou.git"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git
set :deploy_via, :remote_cache
set :git_shallow_clone, 1

set :ruby_vm_type, :mri
set :web_server_type, :nginx
set :app_server_type, :mongrel
set :db_server_type, :mysql

role :app, domain
role :web, domain
role :db,  domain, :primary => true
set :database_yml_in_scm, false

set :user, "saberma"
set :runner, nil

#set :packages_for_project, %w(libxslt1-dev libxml2-dev memcached)
#set :gems_for_project, %w(rspec hoe haml mislav-will_paginate mysql aslakhellesoy-cucumber webrat request-log-analyzer)
set :shared_dirs, %w(public/swfs)

namespace :deploy do
  task :restart, :roles => :app, :except => {:no_release => true } do
    top.deprec.app.restart
  end
end

after :deploy do
  puts 'refresh sitemap'
  run("cd #{deploy_to}/current; #{fetch(:rake, "rake")} sitemap:refresh:no_ping RAILS_ENV=#{fetch(:rails_env, "production")}")

  puts 'get swfs'
  run("cd #{deploy_to}/current; script/swf_get #{fetch(:rails_env, "production")}")
end
