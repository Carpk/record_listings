require_relative "../lib/record_list/console.rb"

RSpec.describe "Sort List" do


  before(:example) do
    @people_list = [Person.new(["Hicks", "Bill", "Male", "Green", ["12", "16", "1961"]]),
                    Person.new(["Schumer", "Amy", "Female", "Pink", ["6", "1", "1981"]])]
  end

  it "should sort list by gender" do
    expect(SortList.by_gender(@people_list).first.gender).to eq("Female")
  end

  it "should sort list by gender" do
    expect(SortList.by_gender(@people_list).last.gender).to eq("Male")
  end
end
