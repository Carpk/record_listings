module BrowserRecord
  class << self
    include Record
    
    def add_to_list(record, file_location = RecordData::Location)
      FileParser.new(file_location).add_to_file(record)
    end

    def sort_by(sort_type, file_location = RecordData::Location)
      sorted_list = load_listing(sort_type, file_location)

      BrowserDisplay.display_list(sorted_list)
    end
  end
end

