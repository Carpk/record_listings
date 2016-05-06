require_relative "../lib/record_list/console.rb"

RSpec.describe "BrowserRecord" do

  let(:test_file) {'spec/test_data'}
  before(:context) do
 #   test_data = "Kaku Michio Male Green 1 24 1947\nHopper Grace Female Red 12 9 1906\nFeynman Richard Male Blue 5 11 1918\n"
 #   purge_data = ""
 #   File.open('spec/test_data_multiple_sample', 'w') {|f| f << test_data}
 #   File.open('spec/test_data_single_sample', 'w') {|f| f << purge_data}

    require_relative "../config.rb"
  end

  it "should order list by gender" do
    first_listed = "Hopper, Grace, Female, Red, 1906-12-09"
    expect(BrowserRecord.sort_by("gender", test_file).first).to eq(first_listed)
  end

  it "should order list by gender" do
    last_listed = "Feynman, Richard, Male, Blue, 1918-05-11"
    expect(BrowserRecord.sort_by("gender", test_file).last).to eq(last_listed)
  end

  it "should order list by birthdate" do
    first_listed = "Hopper, Grace, Female, Red, 1906-12-09"
    expect(BrowserRecord.sort_by("birthdate", test_file).first).to eq(first_listed)
  end

  it "should order list by birthdate" do
    last_listed = "Kaku, Michio, Male, Green, 1947-01-24"
    expect(BrowserRecord.sort_by("birthdate", test_file).last).to eq(last_listed)
  end

  it "should order list by lastname" do
    first_listed = "Feynman, Richard, Male, Blue, 1918-05-11"
    expect(BrowserRecord.sort_by("lastname", test_file).first).to eq(first_listed)
  end

  it "should order list by lastname" do
    last_listed = "Kaku, Michio, Male, Green, 1947-01-24"
    expect(BrowserRecord.sort_by("lastname", test_file).last).to eq(last_listed)
  end

  xit "should add a new record" do
    record = "Turning Alan Male Yellow 6 23 1912"
    BrowserRecord.add_to_list(record)
    expect(BrowserRecord.sort_by("lastname").last).to eq("Turning, Alan, Male, Yellow, 1912-06-23")
  end
end
