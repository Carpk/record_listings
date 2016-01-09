class TerminalRecord < Record
  class << self

    def run
      TerminalDisplay.list_type_prompt
      list_type = gets.chomp.downcase

      sorted_list = self.load_listing(list_type)

      sorted_list ? TerminalDisplay.results(sorted_list) : TerminalDisplay.entry_error
    end
  end
end
