class Record

  def initialize(files=['data/comma_listed', 'data/pipe_listed', 'data/space_listed'])
    @parser = FileParser.new(files)
  end

  def load_by_gender
    people_list = @parser.load_listed
    sorted_list = SortList.by_gender(people_list)
    ListDisplay.html_display(sorted_list)
  end

  def load_by_birthdate
    people_list = @parser.load_listed
    sorted_list = SortList.by_birthdate(people_list)
    ListDisplay.html_display(sorted_list)
  end

  def load_by_lastname
    people_list = @parser.load_listed
    sorted_list = SortList.by_lastname(people_list)
    ListDisplay.html_display(sorted_list)
  end

  def add_to_list(record)
    @parser.add_to_file(record)
  end

  def run
    ListDisplay.list_type_prompt
    people_list = @parser.load_listed
    list_type = gets.chomp.to_i

    if list_type == 1
      sorted_list = SortList.by_gender(people_list)
    elsif list_type == 2
      sorted_list = SortList.by_birthdate(people_list)
    elsif list_type == 3
      sorted_list = SortList.by_lastname(people_list)
    else
      sorted_list = []
      ListDisplay.entry_error
    end

    ListDisplay.terminal_display(sorted_list)
  end
end
