# config valid for current version and patch releases of Capistrano
lock "~> 3.13.0"

# TODO change me!
set :application, "skeleton"
set :repo_url, "git@github.com:oLeVanNghia/skeleton.git"

# Default branch is :master
set :branch, if ENV["BRANCH"]
               set :branch, ENV["BRANCH"]
             else
               ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
             end
# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/#{fetch(:application)}"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
set :settings, YAML.load_file(ENV["SETTING_FILE"] || "config/deploy/settings.yml")

set :linked_files, fetch(:linked_files, []).push(
  "config/database.yml", "config/application.yml", "config/credentials.yml.enc", "config/master.key"
)
set :linked_dirs, fetch(:linked_dirs, []).push(
  "log", "tmp/pids", "tmp/cache", "tmp/sockets",
  "vendor/bundle", "public/system", "public/uploads", "storage"
)

set :rbenv_type, :user
set :rbenv_ruby, File.read(".ruby-version").strip

namespace :deploy do
  task :notify do
    run_locally do
      settings = fetch(:settings)
      if settings["notifier"]
        application = fetch(:application)
        env = fetch(:rails_env)
        branch = fetch(:branch)
        hash = fetch(:current_revision)
        previous_revision = fetch(:previous_revision)
        execute "#{settings['notifier']} #{env} #{branch} #{application} #{hash} #{previous_revision}"
      end
    end
  end

  after :publishing, :restart
  after :finished, :cleanup
  after :finished, :notify
end