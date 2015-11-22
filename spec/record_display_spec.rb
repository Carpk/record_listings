require_relative "../lib/record_list/console.rb"

RSpec.describe "Record Display" do


  before(:example) do
    @data = Person.new(["Hicks", "Bill", "Male", "Green", Date.new(1961, 1, 16)])
  end

  it "should list display options" do
    text = "Hicks Bill Male Green 1961-01-16 "
    expect(RecordDisplay.create_string(@data)).to eq(text)
  end

end
