## Generated with 'brightbox' on 2011-05-11 16:48:20 +0100
gem 'brightbox', '>=2.3.9'
require 'brightbox/recipes'
require 'brightbox/passenger'

# The name of your application.  Used for deployment directory and filenames
# and Apache configs. Should be unique on the Brightbox

set :application, "urmp"
set :server_name, "urmp.unepwcmc-011.vm.brightbox.net"
set :sudo_user, "rails"
set :app_port, "80"


set :default_environment, {
  'PATH' => "/home/rails/.rvm/gems/ruby-1.9.2-p320/bin:/home/rails/.rvm/bin:/home/rails/.rvm/rubies/ruby-1.9.2-p320/bin:$PATH",
  'RUBY_VERSION' => 'ruby-1.9.2-p320',
  'GEM_HOME' => '/home/rails/.rvm/gems/ruby-1.9.2-p320',
  'GEM_PATH' => '/home/rails/.rvm/gems/ruby-1.9.2-p320',
}

# Primary domain name of your application. Used in the Apache configs
set :domain, "unepwcmc-011.vm.brightbox.net"

## List of servers
role :app, "unepwcmc-011.vm.brightbox.net"
role :web, "unepwcmc-011.vm.brightbox.net"
role :db, 'unepwcmc-011.vm.brightbox.net', :primary => true
# Target directory for the application on the web and app servers.
set(:deploy_to) { File.join("", "home", user, application) }

# URL of your source repository. By default this will just upload
# the local directory.  You should probably change this if you use
# another repository, like git or subversion.
#set :deploy_via, :copy
set :repository, "git@github.com:unepwcmc/urmp"

set :scm, :git
set :branch, "master"
set :scm_username, "unepwcmc-read"
set :deploy_via, :remote_cache

desc "Configure VHost"
task :config_vhost do
vhost_config =<<-EOF
server {
  listen 80;
  
  client_max_body_size 4G;
  server_name #{application}.unepwcmc-011.vm.brightbox.net #{application}.sw01.matx.info;
  keepalive_timeout 5;
  root #{deploy_to}/public;
  passenger_enabled on;
  rails_env staging;
  gzip on;
  location ^~ /assets/ {
    expires max;
    add_header Cache-Control public;
  }
  
  if (-f $document_root/system/maintenance.html) {
    return 503;
  }

  error_page 500 502 504 /500.html;
  location = /500.html {
    root #{deploy_to}/public;
  }

  error_page 503 @maintenance;
  location @maintenance {
    rewrite  ^(.*)$  /system/maintenance.html break;
  }
}
EOF
put vhost_config, "/tmp/vhost_config"
sudo "mv /tmp/vhost_config /etc/nginx/sites-available/#{application}"
sudo "ln -s /etc/nginx/sites-available/#{application} /etc/nginx/sites-enabled/#{application}"
end


## Local Shared Area
# These are the list of files and directories that you want
# to share between the releases of your application on a particular
# server. It uses the same shared area as the log files.
#
# NOTE: local areas trump global areas, allowing you to have some
# servers using local assets if required.
#
# So if you have an 'upload' directory in public, add 'public/upload'
# to the :local_shared_dirs array.
# If you want to share the database.yml add 'config/database.yml'
# to the :local_shared_files array.
#
# The shared area is prepared with 'deploy:setup' and all the shared
# items are symlinked in when the code is updated.
# set :local_shared_dirs, %w(public/upload)
# set :local_shared_files, %w(config/database.yml)
set :global_shared_dirs, %w(public/system)
set :global_shared_files, %w(config/database.yml)

# SSH options. The forward agent option is used so that loopback logins
# with keys work properly
# ssh_options[:forward_agent] = true

# Forces a Pty so that svn+ssh repository access will work. You
# don't need this if you are using a different SCM system. Note that
# ptys stop shell startup scripts from running.
default_run_options[:pty] = true

## Logrotation
# Where the logs are stored. Defaults to <shared_path>/log
# set :log_dir, "central/log/path"
# The size at which to rotate a log. e.g 1G, 100M, 5M. Defaults to 100M
# set :log_max_size, "100M"
# How many old compressed logs to keep. Defaults to 10
# set :log_keep, "10"
task :setup_database_configuration do
  the_host = Capistrano::CLI.ui.ask("Database IP address: ")
  database_name = Capistrano::CLI.ui.ask("Database name: ")
  database_user = Capistrano::CLI.ui.ask("Database username: ")
  pg_password = Capistrano::CLI.password_prompt("Database user password: ")
  require 'yaml'
  spec = { "production" => {
                                   "adapter" => "postgresql",
                                   "database" => database_name,
                                   "username" => database_user,
                                   "host" => the_host,
                                   "password" => pg_password }}
  run "mkdir -p #{shared_path}/config"
  put(spec.to_yaml, "#{shared_path}/config/database.yml")
end

after "deploy:setup", :setup_database_configuration
after "deploy:setup", :config_vhost
after "deploy", "no_index_robots"
