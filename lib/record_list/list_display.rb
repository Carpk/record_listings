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
      puts "1) By gender"
      puts "2) By birthdate"
      puts "3) By lastname"
    end

    def entry_error
      puts "Sorry, but that was an invalid entry."
    end

    def terminal_display(data)
      data.each do |line|
        puts "#{line.last_name}, #{line.first_name}, #{line.gender}, #{line.fav_color}, #{line.birthdate}"
      end
    end
  end
end
