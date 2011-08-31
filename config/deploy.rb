require 'capistrano/ext/multistage'
set :default_stage, 'staging'
ENV_SET="RAILS_ENV=production"

task :split_refs do
  #Compile coffeescript and jammit
  run "cd #{deploy_to}/current && #{ENV_SET} rake urmp:split_ref"
end

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
33bmqeqf3xsttask :tolk_dump_all do
  run "cd #{deploy_to}/current && #{ENV_SET} rake tolk:dump_all"
end
=end
