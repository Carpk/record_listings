class TerminalRecord < Record

  def self.load_listing(list_type)
    people_list = self.load_files

    SortList.load_by(list_type, people_list) if people_list.first.respond_to?(list_type)
  end

  def self.run
    TerminalDisplay.list_type_prompt
    list_type = gets.chomp.downcase

    sorted_list = self.load_listing(list_type)

    sorted_list ? TerminalDisplay.results(sorted_list) : TerminalDisplay.entry_error
  end
end
