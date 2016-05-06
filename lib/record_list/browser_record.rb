module BrowserRecord
  extend Record
  class << self

    def add_to_list(record, location = RecordData::Location)
      FileParser.new(location).add_to_file(record)
    end

    def sort_by(sort_type, location = RecordData::Location)
      sorted_list = self.load_listing(sort_type, location)

      BrowserDisplay.display_list(sorted_list)
    end
  end
end
