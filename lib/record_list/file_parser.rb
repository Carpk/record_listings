require "csv"

class FileParser

  def initialize(files_list)
    @files_list = files_list
  end

  def remove_delimiters(data)
    data.scan(/[\d\w]*/)
  end

  def remove_whitespace(data_array)
    data_array.reject { |e| e.to_s.empty? }
  end

  def extract_data(file)
    content = []
    file.each_line do |line|
      raw_array = remove_delimiters(line)
      data_array = remove_whitespace(raw_array)
      date = data_array[4..6]
      data_array[4..6] = Date.new(date[2].to_i,date[0].to_i,date[1].to_i)
      content << Person.new(data_array)
    end
    content
  end

  def read_file(file)
    File.open(file, "r") do |file|
      extract_data(file)
    end
  end

  def load_listed
    data = []
    @files_list.each do |file|
      data.concat(read_file(file))
    end
    data
  end
end
