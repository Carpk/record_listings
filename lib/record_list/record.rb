module Record

  def load_files(filenames)
    parser = FileParser.new(filenames)      
    parser.load_listed
  end

  def load_listing(list_type, data_location = RecordData::Location)
    people_list = self.load_files(data_location)
    valid_call = people_list.first.respond_to?(list_type)
    SortList.load_by(list_type, people_list) if valid_call
  end
end

