require 'capistrano/ext/multistage'
set :default_stage, 'staging'
ENV_SET="RAILS_ENV=production"

=begin
task :package_assets do
  #Compile coffeescript and jammit
  run "cd #{deploy_to}/current && #{ENV_SET} rake barista:brew"
  run "cd #{deploy_to}/current && jammit"
end

task :tolk_sync do
  run "cd #{deploy_to}/current && #{ENV_SET} rake tolk:sync"
end
task :tolk_import do
  run "cd #{deploy_to}/current && #{ENV_SET} rake tolk:import"
end
task :tolk_dump_all do
  run "cd #{deploy_to}/current && #{ENV_SET} rake tolk:dump_all"
end
=end
