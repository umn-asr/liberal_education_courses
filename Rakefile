# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path("../config/application", __FILE__)

Rails.application.load_tasks
require "rubocop/rake_task"

task default: [:rubocop, :spec]

desc "Run rubocop"
task :rubocop do
  RuboCop::RakeTask.new
end
