# encoding: utf-8

module Slug
  def slugify
    trans_table = YAML.load_file("#{RAILS_ROOT}/config/trans_table.yml")
    str = self.mb_chars.downcase
    str.each_char.map do |c|
      c = "-" if c == " "
      trans_table[c] || c
    end.join
  end
  alias :to_slug :slugify
end

class String
  include Slug
end
