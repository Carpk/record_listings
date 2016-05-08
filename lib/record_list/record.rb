module Record

  def load_listing(list_type, data_location = RecordData::Location)
    people_list = load_files_from(data_location)
    valid_call = people_list.first.respond_to?(list_type)
    SortList.load_by(list_type, people_list) if valid_call
  end

  private

  def load_files_from(file_location)
    parser = FileParser.new(file_location)
    parser.load_listed
  end
end

