class ListDisplay
  class << self

    def html_display(data)
      string_array = []
      data.each do |line|
        string_array << "#{line.last_name}, #{line.first_name}, #{line.gender}, #{line.fav_color}, #{line.birthdate}"
      end
      string_array
    end

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
        puts "#{line.last_name}, #{line.first_name}, #{line.gender}, #{line.fav_color}, #{line.birthdate}"
      end
    end
  end
end
