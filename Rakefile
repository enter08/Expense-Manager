# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

if Raile.env.test?
	require 'ci/reporter/rake/rspec'     # use this if you're using RSpec
	require 'ci/reporter/rake/cucumber'  # use this if you're using Cucumber
end

Expman::Application.load_tasks
