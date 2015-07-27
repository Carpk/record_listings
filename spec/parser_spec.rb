require_relative "../lib/record_list/console.rb"

RSpec.describe "File Parser" do

  before(:example) do
    @parser = FileParser.new(['spec/test_data_single_sample', 'spec/test_data_multiple_samples'])
  end

  it "should create the correct class" do
    expect(@parser.class).to eq(FileParser)
  end

  it "should return array from string" do
    raw_line = "Kaku Michio"
    finish_line = ["Kaku", "", "Michio", ""]
    expect(@parser.remove_delimiters(raw_line)).to eq(finish_line)
  end


  it "should return array from string" do
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
    data = "Kaku Michio Green"
    finished_array = [["Kaku", "Michio", "Green"]]
    expect(@parser.extract_data(data)).to eq(finished_array)
  end

  it "should break up data on new line" do
    data = "Kaku Michio Green \n Feynman Richard Blue"
    finished_array = [["Kaku", "Michio", "Green"], ["Feynman", "Richard", "Blue"]]
    expect(@parser.extract_data(data)).to eq(finished_array)
  end

  it "should read singe line test file" do
    filename = 'spec/test_data_single_sample'
    finished_array = [["Hicks", "Bill", "Male", "Green", "12", "16", "1961"]]
    expect(@parser.read_file(filename)).to eq(finished_array)
  end

  it "should read multiple line test file" do
    filename = 'spec/test_data_multiple_samples'
    finished_array = [["Kaku", "Michio", "Male", "Green", "1", "24", "1967"],
                      ["Feynman", "Richard", "Male", "Blue", "5", "11", "1918"]]
    expect(@parser.read_file(filename)).to eq(finished_array)
  end

  it "should read test files from initialize" do
    finished_array = [["Hicks", "Bill", "Male", "Green", "12", "16", "1961"],
                      ["Kaku", "Michio", "Male", "Green", "1", "24", "1967"],
                      ["Feynman", "Richard", "Male", "Blue", "5", "11", "1918"]]
    expect(@parser.load_listed).to eq(finished_array)
  end
end
