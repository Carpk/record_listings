class TerminalDisplay < Display
  class << self

    def list_type_prompt
      puts "Please choose listing type:"
      puts "- Gender"
      puts "- Birthdate"
      puts "- Lastname"
    end

    def entry_error
      puts "Sorry, but that was an invalid entry."
    end

    def results(data)
      data.each do |line|
        str = self.create_text_of(line)
        puts str
      end
    end
  end
end
