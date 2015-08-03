require_relative "../lib/record_list/console.rb"

RSpec.describe "Record" do

  before(:example) do
    string = "Kaku Michio Male Green 1 24 1947\nHopper Grace Female Red 12 9 1906\nFeynman Richard Male Blue 5 11 1918\n"
    File.open('spec/test_data_multiple_samples', 'w') {|f| f << string}
    @record = Record.new(['spec/test_data_multiple_samples'])
  end

  it "should create the correct class" do
    expect(@record.class).to eq(Record)
  end

  it "should order list by gender" do
    first_listed = "Hopper, Grace, Female, Red, 1906-12-09"
    expect(@record.load_by_gender.first).to eq(first_listed)
  end

  it "should order list by gender" do
    last_listed = "Feynman, Richard, Male, Blue, 1918-05-11"
    expect(@record.load_by_gender.last).to eq(last_listed)
  end

  it "should order list by birthdate" do
    first_listed = "Hopper, Grace, Female, Red, 1906-12-09"
    expect(@record.load_by_birthdate.first).to eq(first_listed)
  end

  it "should order list by birthdate" do
    last_listed = "Kaku, Michio, Male, Green, 1947-01-24"
    expect(@record.load_by_birthdate.last).to eq(last_listed)
  end

  it "should order list by lastname" do
    first_listed = "Feynman, Richard, Male, Blue, 1918-05-11"
    expect(@record.load_by_lastname.first).to eq(first_listed)
  end

  it "should order list by lastname" do
    last_listed = "Kaku, Michio, Male, Green, 1947-01-24"
    expect(@record.load_by_lastname.last).to eq(last_listed)
  end

  it "should add a new record" do
    record = "Turning Alan Male Yellow 6 23 1912"
    @record.add_to_list(record)
    expect(@record.load_by_lastname.last).to eq("Turning, Alan, Male, Yellow, 1912-06-23")
  end
end
