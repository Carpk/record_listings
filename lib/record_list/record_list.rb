class RecordList

  def initialize
    @parser = FileParser.new(['data/comma_listed', 'data/pipe_listed', 'data/space_listed'])
    @view = ListDisplay.new
  end

  def run
    raw_data = @parser.load_listed
    people_list = []

    raw_data.each do |personel_data|
      people_list << Person.new(personel_data)
    end

    @view.show(people_list)
  end
end
