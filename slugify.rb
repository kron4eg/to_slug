# encoding: utf-8

class String
  def slugify
    trans_table = YAML.load_file("#{RAILS_ROOT}/config/trans_table.yml")
    str = self.mb_chars.downcase
    str.each_char.map {|c| trans_table[c] or c == " " ? "-" : c }.join.gsub(/[\W_]+/, "-")
  end
  alias :to_slug :slugify
end
