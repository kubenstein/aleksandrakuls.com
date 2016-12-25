require_all 'lib/'

## middleman config
set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :partials_dir, 'localizable'
set :layout, 'application'

## load helpers
helpers do
  load_all 'source/helpers/'
end

## extensions
activate :middleman_simple_thumbnailer
activate :i18n, langs: [:pl, :en]
activate :directory_indexes

configure :development do
  unless ENV['MONGODB_URI']
    Adapters.remote_data_adapter = Adapters.local_data_adapter
  end
end


configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :minify_html
  activate :asset_hash, ignore: %r{/images\/[^(layout)]/}
  activate :relative_assets
end

#
# Suppress Slim warning:
# "Option :lang is not supported by Slim::Engine"
#
# https://github.com/middleman/middleman/issues/1077#issuecomment-29583949
::Slim::Engine.set_default_options lang: I18n.locale, locals: {}
