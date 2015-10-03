# Module that can be included (mixin) to create and parse TSV data
module TsvBuddy
  require 'csv'
  # @data should be a data structure that stores information
  #  from TSV or Yaml files. For example, it could be an Array of Hashes.
  attr_accessor :data

  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    tsv_table = CSV.parse(tsv, col_sep: "\t", headers: true)
    @data = tsv_table.map do |row|
      row.to_h
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    #title
    str = @data[0].keys.reduce(""){ |tmp, item| tmp = tmp + item + "\t" }
    str = str[0..-2] + "\n" #del redundant \t and add line
    
    # ouput data
    str = @data.reduce(str) do |tmp ,item|
      new_line = item.values.reduce("") { |line, ele| line = line + ele + "\t" }
      tmp = tmp + new_line[0..-2] + "\n"
    end
  end
end
