class TerminalDisplay
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
      attributes = data.first.instance_variables

      data.each do |line|
        str = ""
        attributes.each do |attribute|
          str << %Q!#{line.send(attribute[1..-1])} !
        end
        puts str
      end
    end
  end
end
