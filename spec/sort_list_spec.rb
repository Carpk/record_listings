require_relative "../lib/record_list/console.rb"

RSpec.describe "Sort List" do


  before(:example) do
    @people_list = [Person.new(["Hicks", "Bill", "Male", "Green", "12", "16", "1961"]),
                    Person.new(["Schumer", "Amy", "Female", "Pink", "6", "1", "1981"]),
                    Person.new(["Black", "Lewis", "Male", "Black", "8", "30", "1948"])]
  end

  it "should sort list by gender" do
    ordered_array = SortList.by_gender(@people_list)
    expect(ordered_array.first.gender).to eq("Female")
  end

  it "should sort list by gender" do
    ordered_array = SortList.by_gender(@people_list)
    expect(ordered_array.last.gender).to eq("Male")
  end

  it "should sort list by birthdates" do
    ordered_array = SortList.by_birthdate(@people_list)
    expect(ordered_array.last.last_name).to eq("Schumer")
  end

  it "should sort list by birthdates" do
    ordered_array = SortList.by_birthdate(@people_list)
    expect(ordered_array.first.last_name).to eq("Black")
  end

  it "should sort list by last name" do
    ordered_array = SortList.by_lastname(@people_list)
    expect(ordered_array.first.last_name).to eq("Black")
  end
end
