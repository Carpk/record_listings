require_relative "../lib/record_list/console.rb"

RSpec.describe "List Display" do


  before(:example) do
    @data = [Person.new(["Hicks", "Bill", "Male", "Green", Date.new(1961, 1, 16)])]
  end

  it "should display single text line" do
    expect(PortalDisplay.display_list(@data)).to eq(["Hicks, Bill, Male, Green, 1961-01-16"])
  end
end
