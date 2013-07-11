require 'capistrano/ext/multistage'
set :rake, 'rake'

set :default_stage, 'staging'
set :repository,  "git@github.com:unepwcmc/urmp.git"
set :scm, :git

set :generate_webserver_config, false

set(:pub_key) { Capistrano::CLI.ui.ask ("Enter Name of Public key: ") }
ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", pub_key)]



ENV_SET="RAILS_ENV=production"

task :split_refs do
  #Compile coffeescript and jammit
  #run "cd #{deploy_to}/current && #{ENV_SET} rake urmp:split_ref"
end


## Robots.txt to prevent google from indexing the app (for use in staging)
task :no_index_robots do
  run "echo 'User-Agent: *' >> #{current_path}/public/robots.txt"
  run "echo 'Disallow: /' >> #{current_path}/public/robots.txt"
end

