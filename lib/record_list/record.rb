class Record

  def initialize(files= RecordData::Location)
    @parser = FileParser.new(files)
  end

  def load_display
    people_list = @parser.load_listed
    sorted_list = yield people_list
    ListDisplay.html_display(sorted_list)
  end

  def load_by_gender
    load_display {|list| SortList.by_gender(list)}
  end

  def load_by_birthdate
    load_display {|list| SortList.by_birthdate(list)}
  end

  def load_by_lastname
    load_display {|list| SortList.by_lastname(list)}
  end

  def add_to_list(record)
    @parser.add_to_file(record)
  end

  def load_listing_type(list_type)
    people_list = @parser.load_listed
    if list_type == 1
      SortList.by_gender(people_list)
    elsif list_type == 2
      SortList.by_birthdate(people_list)
    elsif list_type == 3
      SortList.by_lastname(people_list)
    else
      ListDisplay.entry_error
      []
    end
  end

  def run
    ListDisplay.list_type_prompt
    list_type = gets.chomp.to_i

    sorted_list = load_listing_type(list_type)

    ListDisplay.terminal_display(sorted_list)
  end
end
