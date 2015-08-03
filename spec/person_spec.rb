require_relative "../lib/record_list/console.rb"

RSpec.describe "Person" do

  before(:example) do
    @person = Person.new(["Hicks", "Bill", "Male", "Green", Date.new(1961,12,16)])
  end

  it "should create the correct class" do
    expect(@person.class).to eq(Person)
  end

  it "should create have correct last name" do
    expect(@person.last_name).to eq("Hicks")
  end

  it "should create have correct first name" do
    expect(@person.first_name).to eq("Bill")
  end

  it "should create have correct gender" do
    expect(@person.gender).to eq("Male")
  end

  it "should create have correct fovorite color" do
    expect(@person.fav_color).to eq("Green")
  end

  it "should create have correct birthmonth" do
    expect(@person.birthdate.month).to eq(12)
  end

  it "should create have correct birthday" do
    expect(@person.birthdate.day).to eq(16)
  end

  it "should create have correct birthyear" do
    expect(@person.birthdate.year).to eq(1961)
  end
end
