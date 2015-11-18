class Record

  def initialize(files= RecordData::Location)
    @parser = FileParser.new(files)
  end

  def add_to_list(record)
    @parser.add_to_file(record)
  end

  def load_listing(list_type)
    people_list = @parser.load_listed
    method_type = "by_" + list_type

    SortList.send(method_type, people_list) if people_list.first.respond_to?(list_type)
  end

  def run
    ListDisplay.list_type_prompt
    list_type = gets.chomp.downcase

    sorted_list = load_listing(list_type)

    sorted_list ? ListDisplay.results(sorted_list) : ListDisplay.entry_error
  end

  def load_display
    people_list = @parser.load_listed
    sorted_list = yield people_list
    ScreenUtility.display_list(sorted_list)
  end

  def method_missing(name, *args)
    method_name = name.to_s
    return super unless method_name =~ /^by_\w+/

    load_display {|list| SortList.send(method_name, list)}
  end
end
