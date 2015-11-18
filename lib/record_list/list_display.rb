class ListDisplay
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
        puts "#{line.lastname}, #{line.firstname}, #{line.gender}, #{line.favcolor}, #{line.birthdate}"
      end
    end
  end
end
