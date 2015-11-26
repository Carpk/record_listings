require_relative "../lib/record_list/console.rb"

RSpec.describe "Record" do

  before(:context) do
    test_data = "Kaku Michio Male Green 1 24 1947\nHopper Grace Female Red 12 9 1906\nFeynman Richard Male Blue 5 11 1918\n"
    File.open('spec/test_data_multiple_samples', 'w') {|f| f << test_data}

    test_files = "module RecordData\n  Location = ['spec/test_data_multiple_samples']\nend\n"
    File.open('config.rb', 'w') {|f| f << test_files}
    load "config.rb"
  end

  after(:context) do
    std_files = "module RecordData\n  Location = ['data/comma_listed', 'data/pipe_listed', 'data/space_listed']\nend\n"
    File.open('config.rb', 'w') {|f| f << std_files}
  end

  it "should load the testing files" do
    expect(Record.load_files.first.firstname).to eq("Michio")
  end

  it "should load the testing files" do
    expect(Record.load_files.last.lastname).to eq("Feynman")
  end
end
