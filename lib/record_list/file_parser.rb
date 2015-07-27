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
      data_array = remove_delimiters(line)
      content << remove_whitespace(data_array)
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
