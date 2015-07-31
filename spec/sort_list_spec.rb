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

  it "should sort list by day born" do
    matching_index = 0
    new_record = Person.new(["New_Hicks", "Bill", "Male", "Green", "12", "15", "1961"])
    ordered_array = SortList.day_ordering(@people_list, matching_index, new_record)
    expect(ordered_array[0].last_name).to eq("New_Hicks")
  end

  it "should sort list by day born" do
    matching_index = 0
    new_record = Person.new(["New_Hicks", "Bill", "Male", "Green", "12", "16", "1961"])
    ordered_array = SortList.day_ordering(@people_list, matching_index, new_record)
    expect(ordered_array[1].last_name).to eq("New_Hicks")
  end

  it "should sort list by day born" do
    matching_index = 0
    new_record = Person.new(["New_Hicks", "Bill", "Male", "Green", "12", "17", "1961"])
    ordered_array = SortList.day_ordering(@people_list, matching_index, new_record)
    expect(ordered_array[1].last_name).to eq("New_Hicks")
  end

  it "should sort list by month born" do
    matching_index = 1
    new_record = Person.new(["New_Schumer", "Amy", "Female", "Pink", "5", "1", "1981"])
    ordered_array = SortList.month_ordering(@people_list, matching_index, new_record)
    expect(ordered_array[1].last_name).to eq("New_Schumer")
  end

  it "should sort list by month born" do
    matching_index = 1
    new_record = Person.new(["New_Schumer", "Amy", "Female", "Pink", "7", "1", "1981"])
    ordered_array = SortList.month_ordering(@people_list, matching_index, new_record)
    expect(ordered_array[2].last_name).to eq("New_Schumer")
  end

  it "should sort list by day if month born is same" do
    matching_index = 1
    new_record = Person.new(["New_Schumer", "Amy", "Female", "Pink", "6", "2", "1981"])
    ordered_array = SortList.month_ordering(@people_list, matching_index, new_record)
    expect(ordered_array[2].last_name).to eq("New_Schumer")
  end

  it "should sort list by day if month born is same" do
    matching_index = 1
    new_record = Person.new(["New_Schumer", "Amy", "Female", "Pink", "6", "1", "1981"])
    ordered_array = SortList.month_ordering(@people_list, matching_index, new_record)
    expect(ordered_array[2].last_name).to eq("New_Schumer")
  end

  it "should sort list by day if month born is same" do
    matching_index = 0
    new_record = Person.new(["New_Hicks", "Bill", "Male", "Green", "12", "15", "1961"])
    ordered_array = SortList.month_ordering(@people_list, matching_index, new_record)
    expect(ordered_array[0].last_name).to eq("New_Hicks")
  end

  it "should add record in empty list" do
    new_record = Person.new(["Schumer", "Amy", "Female", "Pink", "5", "1", "1981"])
    list = Array.new(1, "empty")
    ordered_array = SortList.set_in_list(list, new_record)
    expect(ordered_array[0].last_name).to eq("Schumer")
  end

  it "should replace position of person having an earlier later year" do
    new_record = Person.new(["Black", "Lewis", "Male", "Black", "8", "30", "1948"])
    list = [Person.new(["Schumer", "Amy", "Female", "Pink", "7", "1", "1981"]),
            "empty"]
    ordered_array = SortList.set_in_list(list, new_record)
    expect(ordered_array.first.last_name).to eq("Black")
  end

  it "should position new record after person of earlier birth year" do
    new_record = Person.new(["Schumer", "Amy", "Female", "Pink", "7", "1", "1981"])
    list = [Person.new(["Black", "Lewis", "Male", "Black", "8", "30", "1948"]),
            "empty"]
    ordered_array = SortList.set_in_list(list, new_record)
    expect(ordered_array.last.last_name).to eq("Schumer")
  end

  it "should sort list by month if year born is same" do
    new_record = Person.new(["New_Black", "Lewis", "Male", "Black", "7", "30", "1948"])
    list = [Person.new(["Black", "Lewis", "Male", "Black", "8", "30", "1948"]),
            "empty"]
    ordered_array = SortList.set_in_list(list, new_record)
    expect(ordered_array.first.last_name).to eq("New_Black")
  end

  it "should sort list by month if year born is same" do
    new_record = Person.new(["New_Black", "Lewis", "Male", "Black", "9", "30", "1948"])
    list = [Person.new(["Black", "Lewis", "Male", "Black", "8", "30", "1948"]),
            "empty"]
    ordered_array = SortList.set_in_list(list, new_record)
    expect(ordered_array.last.last_name).to eq("New_Black")
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
