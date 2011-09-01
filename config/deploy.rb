require 'capistrano/ext/multistage'
set :default_stage, 'staging'
ENV_SET="RAILS_ENV=production"

task :split_refs do
  #Compile coffeescript and jammit
  run "cd #{deploy_to}/current && #{ENV_SET} rake urmp:split_ref"
end


## Robots.txt to prevent google from indexing the app (for use in staging)
task :no_index_robots do
  run "echo 'User-Agent: *' >> #{current_path}/public/robots.txt"
  run "echo 'Disallow: /' >> #{current_path}/public/robots.txt"
end
