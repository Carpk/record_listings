class PortalRecord < Record
  class << self
    def add_to_list(record)
      parser = FileParser.new
      parser.add_to_file(record)
    end

    def sort_by(sort_type)
      list = self.load_files
      sorted_list = SortList.load_by(sort_type, list)
      PortalDisplay.display_list(sorted_list)
    end
  end
end
