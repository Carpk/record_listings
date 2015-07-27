require_relative "../lib/record_list/console.rb"

RSpec.describe "Person" do

  before(:example) do
    @person = Person.new(["Hicks", "Bill", "Male", "Green", ["12", "16", "1961"]])
  end

  it "should create the correct class" do
    expect(@person.class).to eq(Person)
  end

end
