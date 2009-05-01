# encoding: utf-8

module Slug
  def slugify
    trans_table = YAML.load_file("#{RAILS_ROOT}/config/trans_table.yml")
    self.mb_chars.each_char.map {|c| trans_table[c] || c }.join
  end
  alias :to_slug :slugify
end

class String
  include Slug
end
