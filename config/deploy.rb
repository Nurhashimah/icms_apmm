require 'capistrano/ext/multistage'
#require 'capistrano/rvm'
#require 'capistrano/bundler'
#require 'capistrano/rails'
 
set :application, "icms_apmm"
set :repository,  "git@github.com:maxcobmara/icms_apmm.git"

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

#role :web, "106.187.51.114"                          # Your HTTP server, Apache/etc
#role :app, "106.187.51.114"                          # This may be the same as your `Web` server
#role :db,  "106.187.51.114", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

set :user, "nurhashimah"
set :stages, ["staging", "production"]
set :default_stage, "staging"

set :branch, "master"
set :rails_env, "production"
set :deploy_via, :copy
set :ssh_options, {:forward_agent => true, :port => 4321}

set :rvm_type, :user                     # Defaults to: :auto
#set :rvm_ruby_version, '1.8.7-p374@icms_apmm'      # Defaults to: 'default'
set :rvm_ruby_string, '1.8.7-p374@icms_apmm' 
set :rvm_custom_path, '/home/nurhashimah/.rvm/'  # only needed if not detected

set :linked_files, fetch(:linked_files, []).push('config/database.yml')
# set path to application
#shared_path = "/opt/app/icms_apmm/current/shared"

# shall remove 'No such file or directory' error for Public subfolders
set :normalize_asset_timestamps, false

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

pid_file = "/opt/app/icms_apmm/tmp/pids/server.pid"

namespace :deploy do
   task :start do
     run "cd /opt/app/icms_apmm/current; script/server -p 4000 -e production"
   end
   task :stop do
     run "kill -s QUIT `cat #{pid_file}`" if File.exists?(pid_file)
   end
   task :restart do
     stop
     sleep 2
     start
   end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
end

