class RecordList

  def initialize
    @parser = FileParser.new(['data/comma_listed', 'data/pipe_listed', 'data/space_listed'])
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

  def run
    people_list = @parser.load_listed

    ListDisplay.show(SortList.by_birthdate(people_list))
  end
end