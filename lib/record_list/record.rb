class Record
  class << self

    def load_files(filename_list = RecordData::Location)
      parser = FileParser.new(filename_list)      
      parser.load_listed
    end

    def load_listing(list_type)
      people_list = self.load_files
      valid_call = people_list.first.respond_to?(list_type)
      SortList.load_by(list_type, people_list) if valid_call
    end
  end
end

