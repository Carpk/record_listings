require_relative "../lib/record_list/console.rb"

RSpec.describe "File Parser" do

  before(:context) do
    # test_files = "module RecordData\n  Location = 'spec/*_sample'\nend\n"
    # File.open('config.rb', 'w') {|f| f << test_files}

    #single_line = "Hicks Bill Male Green 12 16 1961\n"
    #multi_line = "Kaku Michio Male Green 1 24 1947\nFeynman Richard Male Blue 5 11 1918\n"
    #File.open('spec/test_data_single_sample', 'w') {|f| f << single_line}
    #File.open('spec/test_data_multiple_sample', 'w') {|f| f << multi_line}

    require_relative "../config.rb"
    @parser = FileParser.new
  end

  # after(:context) do
  #   std_files = "module RecordData\n  Location = 'data/*_listed'\nend\n"
  #   File.open('config.rb', 'w') {|f| f << std_files}
  # end

  it "should create object of the correct class" do
    expect(@parser.class).to eq(FileParser)
  end

  xit "should return array from single spaced string" do
    raw_line = "Kaku Michio"
    finish_line = ["Kaku", "", "Michio", ""]
    expect(@parser.remove_delimiters(raw_line)).to eq(finish_line)
  end

  xit "should return array from multiple spaced string" do
    raw_line = "Kaku Michio Green"
    finish_line = ["Kaku", "", "Michio", "", "Green", ""]
    expect(@parser.remove_delimiters(raw_line)).to eq(finish_line)
  end

  xit "should remove pipe from string" do
    raw_line = "Kaku | Michio"
    finish_line = ["Kaku", "", "", "", "Michio", ""]
    expect(@parser.remove_delimiters(raw_line)).to eq(finish_line)
  end


  xit "should remove multiple pipes from string" do
    raw_line = "Kaku | Michio | Green"
    finish_line = ["Kaku", "", "", "", "Michio", "", "", "", "Green", ""]
    expect(@parser.remove_delimiters(raw_line)).to eq(finish_line)
  end

  xit "should remove comma from string" do
    raw_line = "Kaku, Michio"
    finish_line = ["Kaku", "", "", "Michio", ""]
    expect(@parser.remove_delimiters(raw_line)).to eq(finish_line)
  end

  xit "should remove multiple commas from string" do
    raw_line = "Kaku, Michio, Green"
    finish_line = ["Kaku", "", "", "Michio", "", "", "Green", ""]
    expect(@parser.remove_delimiters(raw_line)).to eq(finish_line)
  end

  xit "should remove single empty string from array" do
    data_array = ["Kaku", "", "Michio", "Green"]
    finished_array = ["Kaku", "Michio", "Green"]
    expect(@parser.remove_whitespace(data_array)).to eq(finished_array)
  end

  xit "should remove multiple empty strings from array" do
    data_array = ["Kaku", "", "", "Michio", "", "", "Green", ""]
    finished_array = ["Kaku", "Michio", "Green"]
    expect(@parser.remove_whitespace(data_array)).to eq(finished_array)
  end

  xit "should create a date" do
    data_array = ["Kaku", "Michio", "Male", "Green", "1", "24", "1947"]
    expect(@parser.create_date(data_array).class).to eq(Date)
  end

  xit "should return single array with no new line" do
    data = "Kaku Michio Male Green 1 24 1947\n"
    person_array = @parser.extract_data(data)
    expect(person_array.last.lastname).to eq("Kaku")
  end

  xit "should break up data on new line" do
    data = "Kaku Michio Male Green 1 24 1947\n Feynman Richard Male Blue 5 11 1918"
    people_array = @parser.extract_data(data)
    expect(people_array.last.lastname).to eq("Feynman")
  end

  xit "should read singe line test file" do
    filename = 'spec/test_data_single_sample'
    finished_array = @parser.read_file(filename)
    expect(finished_array.first.lastname).to eq("Hicks")
  end

  xit "should read multiple line test file" do
    filename = 'spec/test_data_multiple_sample'
    finished_array = @parser.read_file(filename)
    expect(finished_array.last.lastname).to eq("Feynman")
  end

  it "should read test files from initialize" do
    finished_array = @parser.load_listed
    expect(finished_array.last.lastname).to eq("Feynman")
  end

  xit "should add record to test file" do
    record = "Bohr Niels Male Blue 10 7 1885"
    @parser.add_to_file(record)
    expect(@parser.load_listed.last.lastname).to eq("Bohr")
  end
end
