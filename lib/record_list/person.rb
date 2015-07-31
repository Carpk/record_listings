class Person
  attr_reader :last_name, :first_name, :gender, :fav_color, :birthdate

  def initialize(personel_data)
    @last_name = personel_data[0]
    @first_name = personel_data[1]
    @gender = personel_data[2]
    @fav_color = personel_data[3]
    @birthdate = personel_data[4..6]
  end

end
