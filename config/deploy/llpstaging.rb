ssh_options[:forward_agent] = true

require "rvm/capistrano"
require 'bundler/capistrano'
require 'capistrano/ext/multistage'
require 'capistrano_colors'

set :rvm_ruby_string, 'ruby-1.9.2'
set :rvm_type, :system
set :rvm_path,     "/usr/local/rvm"
set :rvm_bin_path, "#{rvm_path}/bin"
set :rvm_lib_path, "#{rvm_path}/lib"

set :application,   'un-redd'
set :domain,        "#{application}.llpdemo.com"
set :branch,        ENV['BRANCH'] || "master"
set :rails_env,     :staging
set :user,          "rubydev"
set :deploy_to,     "/var/www/#{application}"
set :use_sudo,      false
set :deploy_via,    :remote_cache
set :keep_releases, 4

set :bundle_cmd, "LANG='en_US.UTF-8' LC_ALL='en_US.UTF-8' bundle"

set :default_environment, {
  'PATH' => "/usr/local/bin:$PATH",
}

server domain, :app, :web, :db, :primary => true

namespace :deploy do
  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

namespace :db do
  desc <<-DESC
    Updates the symlink for database.yml file to the just deployed release.
  DESC
  task :symlink, :except => { :no_release => true } do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end

after 'deploy:finalize_update', 'db:symlink'
