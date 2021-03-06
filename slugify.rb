# encoding: utf-8

class String
  def slugify(spacer="-")
    trans_table = YAML.load_file("#{RAILS_ROOT}/config/trans_table.yml")
    str = self.mb_chars.downcase
    str.each_char.map {|c| trans_table[c] || c }.join.gsub(/[\W_]+/, spacer)
  end
  alias :to_slug :slugify
end
