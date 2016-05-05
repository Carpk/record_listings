class BrowserRecord < Record
  class << self

    def add_to_list(record)
      FileParser.new(RecordData::Location).add_to_file(record)
    end

    def sort_by(sort_type)
      sorted_list = self.load_listing(sort_type)

      BrowserDisplay.display_list(sorted_list)
    end
  end
end
