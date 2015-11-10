require_relative "../lib/record_list/console.rb"

RSpec.describe "List Display" do


  before(:example) do
    @data = [Person.new(["Hicks", "Bill", "Male", "Green", Date.new(1961, 1, 16)])]
  end

  it "should display single text line" do
    expect(ListDisplay.html_display(@data)).to eq(["Hicks, Bill, Male, Green, 1961-01-16"])
  end

  it "should list display options" do
    text = "Please choose listing type:\n- Gender\n- Birthdate\n- Lastname\n"
    expect{ListDisplay.list_type_prompt}.to output(text).to_stdout
  end

  it "should notify user of error" do
    text = "Sorry, but that was an invalid entry.\n"
    expect{ListDisplay.entry_error}.to output(text).to_stdout
  end

  it "should display single text line" do
    text = "Hicks, Bill, Male, Green, 1961-01-16\n"
    expect{ListDisplay.results(@data)}.to output(text).to_stdout
  end
end
