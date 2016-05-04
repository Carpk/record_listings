require_relative "../lib/record_list/console.rb"

RSpec.describe "Browser Display" do


  before(:example) do
    @single = [Person.new(["Hicks", "Bill", "Male", "Green", Date.new(1961, 1, 16)])]
    @multiple = [Person.new(["Hicks", "Bill", "Male", "Green", Date.new(1961, 1, 16)]),
                 Person.new(["Black", "Lewis", "Male", "Black", Date.new(1948, 8, 30)])]
  end

  it "should display single text line in array" do
    expect(BrowserDisplay.display_list(@single)).to eq(["Hicks, Bill, Male, Green, 1961-01-16"])
  end

  it "should display multiple text line in array" do
    multi = ["Hicks, Bill, Male, Green, 1961-01-16", "Black, Lewis, Male, Black, 1948-08-30"]
    expect(BrowserDisplay.display_list(@multiple)).to eq(multi)
  end
end
