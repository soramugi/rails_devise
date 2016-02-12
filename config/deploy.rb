# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'my_app_name'

set :rbenv_type, :system
set :rbenv_ruby, '2.2.1'

set :deploy_to, '/var/www/my_app_name'
set :pty, true

set :scm, :copy
set :exclude_dir, %w|
vendor/bundle
.git/
.bundle/
log/*
test/
public/system/
tmp/*
coverage/
public/system/sitemap.xml
public/system/sitemap.xml.gz
|

set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/assets}

set :bundle_binstubs, -> { shared_path.join('bin') }
set :keep_releases, 5

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, "config/unicorn.rb"
set :unicorn_rack_env, 'deployment'


# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do

  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end
end
