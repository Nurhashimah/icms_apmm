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

set :default_environment, {
  'PATH' => "/home/nurhashimah/.rvm/rubies/ruby-1.8.7-p374/bin:/home/nurhashimah/.rvm/gems/ruby-1.8.7-p374@icms_apmm/bin:/home/nurhashimah/.rvm/gems/ruby-1.8.7-p374@global:/home/nurhashimah/.rvm/bin:$PATH",
  'RUBY_VERSION' => 'ruby-1.8.7-p374',
  'GEM_HOME' => '/home/nurhashimah/.rvm/gems/ruby-1.8.7-p374@icms_apmm',
  'GEM_PATH' => '/home/nurhashimah/.rvm/gems/ruby-1.8.7-p374@icms_apmm:/home/nurhashimah/.rvm/gems/ruby-1.8.7-p374@global' 
}

set :linked_files, fetch(:linked_files, []).push('config/database.yml')

# shall remove 'No such file or directory' error for Public subfolders
set :normalize_asset_timestamps, false

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

#pid_file = "/opt/app/icms_apmm/current/tmp/pids/server.pid"
#pid_file = "/opt/app/icms_apmm/current/tmp/pids/thin.pid"

namespace :deploy do
   task :start do
     #run "cd /opt/app/icms_apmm/current; script/server -p 4000 -e production"   #webrick
     run "cd /opt/app/icms_apmm/current; thin -d start -p 4000 -e production"       #thin
     #REMARK : thin -d start -> Run daemonized in the background (capistrano shall exit, but server still running)
     #daemon - also remove stale PID file if exist
   end
   task :stop do
     #run "kill -s QUIT `cat #{pid_file}`" if File.exists?(pid_file)
     #run "kill -9 $(ps -aux | grep ruby | grep -v grep |  awk '{print $2}' )"
     #run "ps -aux | grep ruby | grep -v grep |  awk '{print $2}' | xargs --no-run-if-empty kill -9"   #webrick
     run "ps -aux | grep thin | grep -v grep |  awk '{print $2}' | xargs --no-run-if-empty kill -9"      #thin - only process stop, PID file still exist - start thin by daemonized resolved this
   end
   task :restart do
     stop
     sleep 2
     start
   end
end

