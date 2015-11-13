require_relative "../lib/record_list/console.rb"

RSpec.describe "File Parser" do

  before(:example) do
    File.open('spec/test_data_single_sample', 'w') {|f| f << "Hicks Bill Male Green 12 16 1961\n"}
    File.open('spec/test_data_multiple_samples', 'w') {|f| f << "Kaku Michio Male Green 1 24 1947\nFeynman Richard Male Blue 5 11 1918\n"}
    @parser = FileParser.new(['spec/test_data_single_sample', 'spec/test_data_multiple_samples'])
    @data = "Kaku Michio Male Green 1 24 1947\n"
  end

  it "should create object of the correct class" do
    expect(@parser.class).to eq(FileParser)
  end

  it "should return array from single spaced string" do
    raw_line = "Kaku Michio"
    finish_line = ["Kaku", "", "Michio", ""]
    expect(@parser.remove_delimiters(raw_line)).to eq(finish_line)
  end


  it "should return array from multiple spaced string" do
    raw_line = "Kaku Michio Green"
    finish_line = ["Kaku", "", "Michio", "", "Green", ""]
    expect(@parser.remove_delimiters(raw_line)).to eq(finish_line)
  end

  it "should remove pipe from string" do
    raw_line = "Kaku | Michio"
    finish_line = ["Kaku", "", "", "", "Michio", ""]
    expect(@parser.remove_delimiters(raw_line)).to eq(finish_line)
  end


  it "should remove multiple pipes from string" do
    raw_line = "Kaku | Michio | Green"
    finish_line = ["Kaku", "", "", "", "Michio", "", "", "", "Green", ""]
    expect(@parser.remove_delimiters(raw_line)).to eq(finish_line)
  end

  it "should remove comma from string" do
    raw_line = "Kaku, Michio"
    finish_line = ["Kaku", "", "", "Michio", ""]
    expect(@parser.remove_delimiters(raw_line)).to eq(finish_line)
  end

  it "should remove multiple commas from string" do
    raw_line = "Kaku, Michio, Green"
    finish_line = ["Kaku", "", "", "Michio", "", "", "Green", ""]
    expect(@parser.remove_delimiters(raw_line)).to eq(finish_line)
  end

  it "should remove single empty string from array" do
    data_array = ["Kaku", "", "Michio", "Green"]
    finished_array = ["Kaku", "Michio", "Green"]
    expect(@parser.remove_whitespace(data_array)).to eq(finished_array)
  end

  it "should remove multiple empty strings from array" do
    data_array = ["Kaku", "", "", "Michio", "", "", "Green", ""]
    finished_array = ["Kaku", "Michio", "Green"]
    expect(@parser.remove_whitespace(data_array)).to eq(finished_array)
  end

  it "should return single array with no new line" do
    person_array = @parser.extract_data(@data)
    expect(person_array.last.lastname).to eq("Kaku")
  end

  it "should break up data on new line" do
    data = "Kaku Michio Male Green 1 24 1947\n Feynman Richard Male Blue 5 11 1918"
    people_array = @parser.extract_data(data)
    expect(people_array.last.lastname).to eq("Feynman")
  end

  it "should read singe line test file" do
    filename = 'spec/test_data_single_sample'
    finished_array = @parser.read_file(filename)
    expect(finished_array.first.lastname).to eq("Hicks")
  end

  it "should read multiple line test file" do
    filename = 'spec/test_data_multiple_samples'
    finished_array = @parser.read_file(filename)
    expect(finished_array.last.lastname).to eq("Feynman")
  end

  it "should read test files from initialize" do
    finished_array = @parser.load_listed
    expect(finished_array.last.lastname).to eq("Feynman")
  end

  it "should add record to test file" do
    record = "Bohr Niels Male Blue 10 7 1885"
    @parser.add_to_file(record)
    expect(@parser.load_listed.last.lastname).to eq("Bohr")
  end
end
