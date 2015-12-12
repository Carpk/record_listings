require_relative "../lib/record_list/console.rb"

RSpec.describe "Person" do

  before(:example) do
    @person = Person.new(["Hicks", "Bill", "Male", "Green", Date.new(1961,12,16)])
  end

  it "should create a class" do
    expect(@person.class).to eq(Person)
  end

  it "should create have a last name" do
    expect(@person.lastname).to eq("Hicks")
  end

  it "should create have a first name" do
    expect(@person.firstname).to eq("Bill")
  end

  it "should create have a gender" do
    expect(@person.gender).to eq("Male")
  end

  it "should create have a fovorite color" do
    expect(@person.favcolor).to eq("Green")
  end

  it "should have date for birthdate" do
    expect(@person.birthdate.class).to eq(Date)
  end

  it "should create have a birthmonth" do
    expect(@person.birthdate.month).to eq(12)
  end

  it "should create have a birthday" do
    expect(@person.birthdate.day).to eq(16)
  end

  it "should create have a birthyear" do
    expect(@person.birthdate.year).to eq(1961)
  end
end
