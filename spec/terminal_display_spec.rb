require_relative "../lib/record_list/console.rb"

RSpec.describe "List Display" do


  before(:example) do
    @data = [Person.new(["Hicks", "Bill", "Male", "Green", Date.new(1961, 1, 16)])]
    @multiple = [Person.new(["Hicks", "Bill", "Male", "Green", Date.new(1961, 1, 16)]),
                 Person.new(["Black", "Lewis", "Male", "Black", Date.new(1948, 8, 30)])]
  end

  it "should list display options" do
    text = "Please choose listing type:\n- Gender\n- Birthdate\n- Lastname\n"
    expect{TerminalDisplay.list_type_prompt}.to output(text).to_stdout
  end

  it "should notify user of error" do
    text = "Sorry, but that was an invalid entry.\n"
    expect{TerminalDisplay.entry_error}.to output(text).to_stdout
  end

  it "should display single text line" do
    text = "Hicks, Bill, Male, Green, 1961-01-16\n"
    expect{TerminalDisplay.results(@data)}.to output(text).to_stdout
  end

  it "should display multiple text line" do
    text = "Hicks, Bill, Male, Green, 1961-01-16\nBlack, Lewis, Male, Black, 1948-08-30\n"
    expect{TerminalDisplay.results(@multiple)}.to output(text).to_stdout
  end
end
