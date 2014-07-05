#!/usr/bin/env rake

namespace :assets do
  task :precompile do
    puts `middleman build --clean --verbose`
    `echo '{}' > composer.json`
  end
end