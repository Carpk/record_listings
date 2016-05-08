module TerminalDisplay
  extend Display
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
      data.each do |person|
        data_string = create_text_of(person)
        puts data_string
      end
    end
  end
end
