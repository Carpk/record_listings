require_relative "../lib/record_list/console.rb"

RSpec.describe "PortalRecord" do

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

  it "should order list by gender" do
    first_listed = "Hopper, Grace, Female, Red, 1906-12-09"
    expect(PortalRecord.sort_by("gender").first).to eq(first_listed)
  end

  it "should order list by gender" do
    last_listed = "Feynman, Richard, Male, Blue, 1918-05-11"
    expect(PortalRecord.sort_by("gender").last).to eq(last_listed)
  end

  it "should order list by birthdate" do
    first_listed = "Hopper, Grace, Female, Red, 1906-12-09"
    expect(PortalRecord.sort_by("birthdate").first).to eq(first_listed)
  end

  it "should order list by birthdate" do
    last_listed = "Kaku, Michio, Male, Green, 1947-01-24"
    expect(PortalRecord.sort_by("birthdate").last).to eq(last_listed)
  end

  it "should order list by lastname" do
    first_listed = "Feynman, Richard, Male, Blue, 1918-05-11"
    expect(PortalRecord.sort_by("lastname").first).to eq(first_listed)
  end

  it "should order list by lastname" do
    last_listed = "Kaku, Michio, Male, Green, 1947-01-24"
    expect(PortalRecord.sort_by("lastname").last).to eq(last_listed)
  end

  it "should add a new record" do
    record = "Turning Alan Male Yellow 6 23 1912"
    PortalRecord.add_to_list(record)
    expect(PortalRecord.sort_by("lastname").last).to eq("Turning, Alan, Male, Yellow, 1912-06-23")
  end
end
