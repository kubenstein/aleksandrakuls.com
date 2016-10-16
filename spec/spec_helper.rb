Bundler.require
require_all 'spec/features/support/'
require 'capybara/rspec'
require 'capybara/poltergeist'

Capybara.app = Middleman::Application.server.inst do
  set :root, File.expand_path(File.join(File.dirname(__FILE__), '..'))
  set :environment, :test
  set :show_exceptions, false
end

Capybara.javascript_driver = :poltergeist