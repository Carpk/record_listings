require_relative "../lib/record_list/console.rb"

RSpec.describe "TerminalRecord" do

  let(:test_file) {'spec/test_db/test_data'}


  it "should order list by lastname" do
    expect(TerminalRecord.sort_by("lastname",test_file).first.lastname).to eq("Feynman")
  end

  it "should order list by gender" do
    expect(TerminalRecord.sort_by("gender", test_file)).to output("list").to_stdout
  end
end
