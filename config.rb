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

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :minify_html
  activate :asset_hash, ignore: [/images\/[^(layout)]/]
  activate :relative_assets
end
