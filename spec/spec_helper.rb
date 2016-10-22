Bundler.require
require 'capybara/poltergeist'
require 'capybara/rspec'

Capybara.app = Middleman::Application.server.inst do
  set :root, File.expand_path(File.join(File.dirname(__FILE__), '..'))
  set :show_exceptions, false
end

Capybara.javascript_driver = :poltergeist


require_all 'spec/features/support/'