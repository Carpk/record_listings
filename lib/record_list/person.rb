class Person
  attr_reader :last_name, :first_name, :gender, :fav_color
  attr_accessor :birthdate

  def initialize(record_data)
    @last_name = record_data[0]
    @first_name = record_data[1]
    @gender = record_data[2]
    @fav_color = record_data[3]
    @birthdate = record_data[4]
  end
end
