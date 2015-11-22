require "csv"

class FileParser

  def initialize(files_list = RecordData::Location)
    @files_list = files_list
  end

  def remove_delimiters(data)
    data.scan(/[\d\w]*/)
  end

  def remove_whitespace(data_array)
    data_array.reject { |e| e.to_s.empty? }
  end

  def create_date(data_array)
    date_string = data_array[4..-1].join('-')
  end

  def extract_data(file)
    content = []
    file.each_line do |line|
      raw_array = remove_delimiters(line)
      data_array = remove_whitespace(raw_array)
      data_array[4..6] = create_date(data_array)
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

  def add_to_file(record)
    File.open(@files_list.last, 'a') {|f| f << record + "\n"}
  end
end
