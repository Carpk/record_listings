class Person
  attr_reader :lastname, :firstname, :gender, :favcolor
  attr_accessor :birthdate

  def initialize(record_data)
    @lastname = record_data[0]
    @firstname = record_data[1]
    @gender = record_data[2]
    @favcolor = record_data[3]
    @birthdate = record_data[4]
  end
end
