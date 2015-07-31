class RecordList

  def initialize
    @parser = FileParser.new(['data/comma_listed', 'data/pipe_listed', 'data/space_listed'])
  end

  def load_data
    raw_data = @parser.load_listed
    people_list = []

    raw_data.each do |personel_data|
      people_list << Person.new(personel_data)
    end

    people_list
  end

  def load_by_gender
    people_list = load_data
    sorted_list = SortList.by_gender(people_list)
    ListDisplay.html_display(sorted_list)
  end

  def load_by_birthdate
    people_list = load_data
    sorted_list = SortList.by_birthdate(people_list)
    ListDisplay.html_display(sorted_list)
  end

  def load_by_lastname
    people_list = load_data
    sorted_list = SortList.by_lastname(people_list)
    ListDisplay.html_display(sorted_list)
  end

  def run
    people_list = load_data

    ListDisplay.show(SortList.by_birthdate(people_list))
  end
end
