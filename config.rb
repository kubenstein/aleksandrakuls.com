require_all 'lib/'

## middleman config
set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :layouts_dir, 'views/layouts'
set :partials_dir, 'views/templates'
set :layout, 'application'

ignore 'views/*'
ignore 'helpers/*'
ignore 'pages/*'

## load helpers
helpers do
  load_all 'source/helpers/'
end


## configure routes
RoutesUtils::handle_custom_page_data_location!(self)


## extensions
activate :middleman_simple_thumbnailer
activate :directory_indexes

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :minify_html
  activate :asset_hash, ignore: [/images\/[^(layout)]/]
  activate :relative_assets
end
