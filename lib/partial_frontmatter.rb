#
# PartialFrontmatter is a class that provides frontmatter vars from all partials
# inspired by: https://gist.github.com/vernonk/4969096

require 'yaml'

class PartialFrontmatter
  
  def collect_data
    sorted_path_to_partials.each_with_object({}) do |path, hsh|
      vars = parse_frontmatter_vars(path)
      hsh.deep_merge!(vars) if vars
    end
  end


  private

  def path_to_partials
    Dir['source/views/**/_*']
  end

  def sorted_path_to_partials
    path_to_partials.sort_by { |path| path.split('/').count }.reverse
  end

  def parse_frontmatter_vars(path)
    yaml_regex = /\A(---\s*\n.*?\n?)^(---\s*$\n?)/m
    content = File.read(path).sub(yaml_regex, '')
    YAML.load($1 || '')
  end

end