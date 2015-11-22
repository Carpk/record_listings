class PortalDisplay

  def self.display_list(data)
    string_array = []
    data.each do |line|
      string_array << "#{line.lastname}, #{line.firstname}, #{line.gender}, #{line.favcolor}, #{line.birthdate}"
    end
    string_array
  end
end
