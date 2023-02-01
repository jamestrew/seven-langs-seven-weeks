class RubyRow
  def initialize(row)
    @row = row
  end

  def method_missing(method_name, *args)
    @row[method_name]
  end
end

class RubyCsv
  attr_accessor :headers, :rows

  def initialize
    file = File.new(self.class.to_s.downcase + '.txt')
    headers = file.gets.chomp.split(',')
    @headers = headers.map {|header| header.strip.to_sym}

    rows = []
    file.each do |row|
      cols = row.chomp.split(',')
      cols = cols.map {|col| col.strip}
      zipped = Hash[@headers.zip(cols)]
      rows << RubyRow.new(zipped)
    end
    @rows = rows
  end

  def each
    @rows.each {|row| yield row}
  end
end

csv = RubyCsv.new
csv.each {|row| puts row.some}

