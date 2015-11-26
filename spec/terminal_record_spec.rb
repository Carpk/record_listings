require_relative "../lib/record_list/console.rb"

RSpec.describe "TerminalRecord" do

  before(:context) do
    test_data = "Kaku Michio Male Green 1 24 1947\nHopper Grace Female Red 12 9 1906\nFeynman Richard Male Blue 5 11 1918\n"
    File.open('spec/test_data_multiple_samples', 'w') {|f| f << test_data}

    test_files = "module RecordData\n  Location = ['spec/test_data_multiple_samples']\nend\n"
    File.open('config.rb', 'w') {|f| f << test_files}
    require_relative "../config.rb"
  end

  after(:context) do
    std_files = "module RecordData\n  Location = ['data/comma_listed', 'data/pipe_listed', 'data/space_listed']\nend\n"
    File.open('config.rb', 'w') {|f| f << std_files}
  end


  it "should not return a value" do
    expect(TerminalRecord.load_listing("nil")).to eq(nil)
  end

  it "should order list by gender" do
    expect(TerminalRecord.load_listing("gender").first.firstname).to eq("Grace")
  end

  it "should order list by gender" do
    expect(TerminalRecord.load_listing("gender").last.lastname).to eq("Feynman")
  end

  it "should order list by birthdate" do
    expect(TerminalRecord.load_listing("birthdate").first.firstname).to eq("Grace")
  end

  it "should order list by birthdate" do
    expect(TerminalRecord.load_listing("birthdate").last.lastname).to eq("Kaku")
  end

  it "should order list by lastname" do
    expect(TerminalRecord.load_listing("lastname").first.firstname).to eq("Richard")
  end

  it "should order list by lastname" do
    expect(TerminalRecord.load_listing("lastname").last.lastname).to eq("Kaku")
  end

end
