require_relative "../lib/record_list/console.rb"

RSpec.describe "Display" do

  let(:dummy_class) { Class.new { extend Display } }


  it "should list display options" do
    person = Person.new(["Hicks", "Bill", "Male", "Green", Date.new(1961, 1, 16)])
    text = "Hicks, Bill, Male, Green, 1961-01-16"
    expect(dummy_class.create_text_of(person)).to eq(text)
  end

end
