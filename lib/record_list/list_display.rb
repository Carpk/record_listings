class ListDisplay

  def self.show(data)
    data.each do |line|
      puts line.inspect
    end
  end

  def self.html_display(data)
    string_array = []
    data.each do |line|
      string_array << "#{line.last_name}, #{line.first_name}, #{line.gender}, #{line.fav_color}, #{line.birthdate}"
    end
    string_array
  end
end
