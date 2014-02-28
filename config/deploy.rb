set :application, 'library'
require "rvm/capistrano"
set :stages, %w(production)
set :default_stage, "production"
require 'capistrano/ext/multistage'
set :repository,  "."
set :deploy_via, :copy
set :scm, "none"

#fix no tty present and no askpass program specified
default_run_options[:pty] = true

set :deploy_to, "/var/www/library"
require 'capistrano-unicorn'
require 'bundler/capistrano'
after 'deploy:restart', 'unicorn:reload' # app IS NOT preloaded
after 'deploy:restart', 'unicorn:restart'  # app preloaded
before 'deploy:restart','deploy:link_it'
load 'deploy/assets'
#
#set :application, "set your application name here"
#set :repository,  "set your repository location here"
#
## set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
## Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
#
#role :web, "your web-server here"                          # Your HTTP server, Apache/etc
#role :app, "your app-server here"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
#namespace :deploy do
#  task :link_it do
#    run "rm -fr #{release_path}/tmp/photos"
#    run "rm -fr #{release_path}/tmp/profile"
#    run "ln -nfs #{shared_path}/tmp/profile/ #{release_path}/tmp/profile"
#    run "ln -nfs #{shared_path}/tmp/photos/ #{release_path}/tmp/photos"
#  end
##   task :start do ; end
##   task :stop do ; end
##   task :restart, :roles => :app, :except => { :no_release => true } do
##     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
##   end
#end
##
