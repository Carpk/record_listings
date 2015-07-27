class RecordList

  def initialize
    @parser = FileParser.new(['data/comma_listed', 'data/pipe_listed', 'data/space_listed'])
  end

  def run
    raw_data = @parser.load_listed
    people_list = []

    raw_data.each do |personel_data|
      people_list << Person.new(personel_data)
    end

    # SortRecord.by_gender
    # SortRecord.by_birthdate
    # SortRecord.by_last_name

    ListDisplay.show(SortList.by_gender(people_list))
  end
end
