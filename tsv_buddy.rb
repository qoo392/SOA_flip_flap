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
      one_record = {}
      row.each_with_index do |col, i|
        one_record[tsv_table.headers[i]] = col
      end
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv

  end
end
