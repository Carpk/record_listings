class PortalRecord < Record
  class << self

    def add_to_list(record)
      FileParser.new.add_to_file(record)
    end

    def sort_by(sort_type)
      sorted_list = self.load_listing(sort_type)

      PortalDisplay.display_list(sorted_list)
    end
  end
end
