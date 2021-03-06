require_relative "../lib/record_list/console.rb"

RSpec.describe "Sort List" do


  before(:example) do
    @people_list = [Person.new(["Hicks", "Bill", "Male", "Green", Date.new(1961, 1, 16)]),
                    Person.new(["Schumer", "Amy", "Female", "Pink", Date.new(1981, 6, 1)]),
                    Person.new(["Black", "Lewis", "Male", "Black", Date.new(1948, 8, 30)])]
  end

  it "should sort list by gender" do
    ordered_array = SortList.load_by(:gender, @people_list)
    expect(ordered_array.first.gender).to eq("Female")
  end

  it "should sort list by gender" do
    ordered_array = SortList.load_by(:gender, @people_list)
    expect(ordered_array.last.gender).to eq("Male")
  end

  it "should sort list by birthdates" do
    ordered_array = SortList.load_by(:birthdate, @people_list)
    expect(ordered_array.first.lastname).to eq("Black")
  end

  it "should sort list by birthdates" do
    ordered_array = SortList.load_by(:birthdate, @people_list)
    expect(ordered_array.last.lastname).to eq("Schumer")
  end

  it "should sort list by last name" do
    ordered_array = SortList.load_by(:lastname, @people_list)
    expect(ordered_array.first.lastname).to eq("Black")
  end

  it "should sort list by last name" do
    ordered_array = SortList.load_by(:lastname, @people_list)
    expect(ordered_array.last.lastname).to eq("Schumer")
  end
end
