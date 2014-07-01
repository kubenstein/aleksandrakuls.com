#
# Monkey Patch String
# add remove! and remove methods

class String
  def remove!(*substrings)
    Array(substrings).each { |substring| self.gsub!(substring, '') }
    self
  end

  def remove(*substrings)
    self.dup.remove!(*substrings)
  end
end