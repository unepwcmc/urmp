require 'capistrano/ext/multistage'
set :rake, 'rake'

require 'rvm/capistrano'
set :rvm_ruby_string, '1.9.3'

set :default_stage, 'staging'
set :repository,  "git@github.com:unepwcmc/urmp.git"
set :scm, :git

set :generate_webserver_config, false

ssh_options[:forward_agent] = true

# ENV_SET="RAILS_ENV=production"

task :split_refs do
  #Compile coffeescript and jammit
  #run "cd #{deploy_to}/current && #{ENV_SET} rake urmp:split_ref"
end


## Robots.txt to prevent google from indexing the app (for use in staging)
task :no_index_robots do
  run "echo 'User-Agent: *' >> #{current_path}/public/robots.txt"
  run "echo 'Disallow: /' >> #{current_path}/public/robots.txt"
end

