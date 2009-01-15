set :user, "deploy"
set :application, "nicholasschlueter"
 
set :repository, "git@github.com:schlueter/nicholasschlueter.com.git"
set :scm, :git
set :branch, "master"
 
set :use_sudo, false
set :deploy_to, "/u/apps/nicholasschlueter"
 
role :app, "nicholasschlueter.com"
role :web, "nicholasschlueter.com"
role :db, "nicholasschlueter.com", :primary => true
 
namespace :deploy do
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end
end