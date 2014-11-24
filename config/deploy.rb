# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'liberal_education_courses'
set :repo_url, 'git@github.umn.edu:whit0694/liberal_education_courses.git'

# Default branch is :master
ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, '/swadm/apps/liberal_education_courses'
set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{log tmp}
set :keep_releases, 5
set :tmp_dir, File.join(fetch(:deploy_to), 'tmp')

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }


namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  desc 'Symlink to web directory'
  task :symlink_to_web_dir do
    on roles(:app), in: :sequence, wait: 5 do |server|
      execute "rm -f #{File.join(server.fetch(:web_root), fetch(:application))}"
      execute "ln  -s #{release_path.join('public')} #{File.join(server.fetch(:web_root), fetch(:application))}"
    end
  end

  after :publishing, :symlink_to_web_dir
  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
