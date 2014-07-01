#
# RoutesUtils
# library containing all logic related with my fancy routing/file structure ideas

module RoutesUtils

  #
  # This method creates proxies for sites located in specific folder,
  # so they can be accessible under differend url (in this case root url)
  #
  def self.handle_custom_page_data_location!(config_rb_context)
    file_paths.each do |path|
      config_rb_context.proxy(path, '/pages/' + path) { @current_lang = :pl }
      config_rb_context.proxy('en/' + path, '/pages/' + path) { @current_lang = :en }
    end
  end

  #
  # This method return hash with named paths for all sites
  #
  # for example:
  # main_path => /
  # warszawa_path => /warszawa/
  # warszawa_trasy_path => /warszawa/trasy/
  # warszawa_trasy_stare_miasto_path => /warszawa/trasy/stare_miasto/
  #
  def self.paths
    file_paths.each_with_object({}) do |path, hsh|
      path_helper_name = "#{path_to_name(path)}_path"
      route = '/' + path.remove('index', '.html')
      route += '/' if route[-1] != '/'
      hsh[path_helper_name] = route
    end
  end

  #
  # This method return named path for file_path
  #
  # for example:
  # index.html => main
  # warszawa/index.html => warszawa
  # warszawa/trasy/index.html => warszawa_trasy
  # warszawa/trasy/stare_miasto.html => warszawa_trasy_stare_miasto
  #
  def self.path_to_name(path)
    route = path.remove('index', '.html')
    route = 'main' if route.empty?
    route.split('/').join('_')
  end


  #
  # This method return file_path for named path
  #
  # for example:
  # main => /
  # warszawa => warszawa/
  # warszawa_trasy => warszawa/trasy/
  # warszawa_trasy_stare_miasto => warszawa/trasy/stare_miasto
  #
  def self.name_to_path(name)
    name.remove!('_path')
    paths["#{name}_path"]
  end


  private

  def self.file_paths
    Dir["source/pages/**/*.html*"].map { |p| p.gsub(/(html)(.*)/, '\1').remove!('source/pages/') }
  end

end