require 'rubygems'
require 'rack/contrib/try_static'
require 'www-redirect'

use WwwRedirect::Middleware
use Rack::TryStatic,
    root: 'build',
    urls: %w(/),
    try: ['.html', 'index.html', '/index.html']
run ->(_env) { [404, { 'Content-type' => 'text/plain' }, ['Not found']] }
