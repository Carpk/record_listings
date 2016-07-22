require "csv"

class FileParser

  def initialize(file_names)
    @files_list = file_names
  end

  def load_listed
    data_files.map { |file| read_file(file) }.flatten
  end

  def add_to_file(record)
    open_file(data_files.last, 'a') {|f| f << record + "\n"}
  end

  private
  attr_reader :files_list

  def create_person(person_data)
    Person.new(person_data)
  end

  def create_date_object(date)
    Date.strptime(date, '%m-%d-%Y')
  end

  def open_file(name, mode)
    File.open(name, mode) {|f| yield(f) }
  end

  def data_files
    Dir.glob(files_list)
  end

  def read_file(name)
    open_file(name, "r") { |file| extract_data(file) }
  end

  def extract_data(file)
    content = []
    file.each_line do |line|
      raw_array = remove_delimiters(line)
      data_array = remove_whitespace(raw_array)
      data_array[4..6] = create_date(data_array)
      content << create_person(data_array)
    end
    content
  end

  def create_date(data_array)
    date_string = data_array[4..-1].join('-')
    create_date_object(date_string)
  end

  def remove_whitespace(data_array)
    data_array.reject { |e| e.to_s.empty? }
  end

  def remove_delimiters(data)
    data.scan(/[\d\w]*/)
  end
end

