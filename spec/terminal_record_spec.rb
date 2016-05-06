require_relative "../lib/record_list/console.rb"

RSpec.describe "TerminalRecord" do

  let(:test_file) {'spec/test_data'}


  it "should not return a value" do
    expect(TerminalRecord.load_listing("nil", test_file)).to eq(nil)
  end

  it "should order list by gender" do
    expect(TerminalRecord.load_listing("gender", test_file).first.firstname).to eq("Grace")
  end

  it "should order list by gender" do
    expect(TerminalRecord.load_listing("gender", test_file).last.lastname).to eq("Feynman")
  end

  it "should order list by birthdate" do
    expect(TerminalRecord.load_listing("birthdate", test_file).first.firstname).to eq("Grace")
  end

  it "should order list by birthdate" do
    expect(TerminalRecord.load_listing("birthdate", test_file).last.lastname).to eq("Kaku")
  end

  it "should order list by lastname" do
    expect(TerminalRecord.load_listing("lastname", test_file).first.firstname).to eq("Richard")
  end

  it "should order list by lastname" do
    expect(TerminalRecord.load_listing("lastname", test_file).last.lastname).to eq("Kaku")
  end

end
