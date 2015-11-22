class Record

  def self.load_files
    parser = FileParser.new
    parser.load_listed
  end

  # Terminal methods
  def load_listing(list_type)
    people_list = Record.load_files

    SortList.load_by(list_type, people_list) if people_list.first.respond_to?(list_type)
  end

  def run
    ConsoleDisplay.list_type_prompt
    list_type = gets.chomp.downcase

    sorted_list = load_listing(list_type)

    sorted_list ? ConsoleDisplay.results(sorted_list) : ConsoleDisplay.entry_error
  end

end

