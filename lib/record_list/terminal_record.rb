module TerminalRecord 
  class << self
    include Record

    def run
      TerminalDisplay.list_type_prompt
      sort_type = gets.chomp.downcase

      sorted_list = load_listing(sort_type)

      sorted_list ? TerminalDisplay.results(sorted_list) : TerminalDisplay.entry_error
    end
  end
end
