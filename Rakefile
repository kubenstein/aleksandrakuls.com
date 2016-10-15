#!/usr/bin/env rake

#
# deployment on heroku
namespace :assets do
  task :precompile do
    puts `middleman build --clean --verbose`
  end
end


#
# specs
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)
task default: :spec