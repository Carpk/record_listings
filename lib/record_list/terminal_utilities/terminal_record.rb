module TerminalRecord 
  class << self
    include Record

    def run
      TerminalDisplay.sort_style_request
      sort_type = gets.chomp.downcase

      sort_by(sort_type)
    end

    def sort_by(sort_style, file_location = RecordData::Location)
      sorted_list = load_listing(sort_style, file_location)
      sorted_list ? TerminalDisplay.results_of(sorted_list) : TerminalDisplay.entry_error
    end
  end
end
